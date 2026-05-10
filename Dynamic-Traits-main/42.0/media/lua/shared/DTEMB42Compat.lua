DTEMCompat = DTEMCompat or {}

DTEMCompat.TraitAliases = DTEMCompat.TraitAliases or {
    ["Claustophobic"] = "base:claustrophobic",
    ["HeartyAppitite"] = "base:heartyappetite",
    ["Thinskinned"] = "base:thinskinned",
    ["ThinSkinned"] = "base:thinskinned",
    ["Out of Shape"] = "base:out of shape",
    ["Very Underweight"] = "base:very underweight",
}

DTEMCompat.DynamicTraitIds = DTEMCompat.DynamicTraitIds or {
    addictedtocaffeine = true,
    alcoholic = true,
    amateurelectrician = true,
    amateurelectrician2 = true,
    amcarpenter = true,
    amcook = true,
    amelectrician = true,
    amforager = true,
    ammechanic = true,
    ammetalworker = true,
    amtrapper = true,
    anorexy = true,
    bigorexia = true,
    bloodlust = true,
    brittleknees = true,
    cutter = true,
    dextrous2 = true,
    durabile = true,
    fibromyalgia = true,
    flabby = true,
    flimsy = true,
    frail = true,
    gunfan = true,
    handy2 = true,
    herbalist2 = true,
    lightfooted = true,
    lucky = true,
    melancholic = true,
    nervouswreck = true,
    nightmares = true,
    nimble = true,
    physicallyactive = true,
    physicallyactive2 = true,
    pillsallergy = true,
    pluviophile = true,
    pluviophobia = true,
    poorpassenger = true,
    prodigy = true,
    sedentary = true,
    shortbladefan = true,
    shortbluntfan = true,
    sneaky = true,
    spearman = true,
    swordsman = true,
    unlucky = true,
    wildplantsallergy = true,
}

local resolvedTraits = {}

local function getMoreTraitsLuckAlias(trait)
    if not trait or not ToadTraitsRegistries then
        return nil
    end

    local normalizedTrait = string.lower(tostring(trait))
    if normalizedTrait == "lucky" or normalizedTrait == "base:lucky" or normalizedTrait == "dynamictraits:lucky" then
        return ToadTraitsRegistries.lucky
    end
    if normalizedTrait == "unlucky" or normalizedTrait == "base:unlucky" or normalizedTrait == "dynamictraits:unlucky" then
        return ToadTraitsRegistries.unlucky
    end

    return nil
end

local function getDynamicTraitResourceName(traitId)
    if DTEMCompat.DynamicTraitIds[traitId] then
        return "DynamicTraits:" .. traitId
    end
    return nil
end

local function getTraitResourceName(trait)
    if not trait then
        return nil
    end

    local alias = DTEMCompat.TraitAliases[trait]
    if alias then
        return alias
    end

    local value = tostring(trait)
    local lowerValue = string.lower(value)

    if string.find(value, ":", 1, true) then
        local namespace, traitId = string.match(lowerValue, "^([^:]+):(.+)$")
        if (namespace == "base" or namespace == "dynamictraits") and traitId then
            return getDynamicTraitResourceName(traitId) or lowerValue
        end
        return value
    end

    local compactTraitId = string.gsub(lowerValue, "%s+", "")
    return getDynamicTraitResourceName(compactTraitId) or "base:" .. lowerValue
end

local function getCharacterStat(statName)
    if not CharacterStat then
        return nil
    end

    if statName == "ANGER" then return CharacterStat.ANGER end
    if statName == "BOREDOM" then return CharacterStat.BOREDOM end
    if statName == "ENDURANCE" then return CharacterStat.ENDURANCE end
    if statName == "FATIGUE" then return CharacterStat.FATIGUE end
    if statName == "FOOD_SICKNESS" then return CharacterStat.FOOD_SICKNESS end
    if statName == "INTOXICATION" then return CharacterStat.INTOXICATION end
    if statName == "NICOTINE_WITHDRAWAL" then return CharacterStat.NICOTINE_WITHDRAWAL end
    if statName == "PAIN" then return CharacterStat.PAIN end
    if statName == "PANIC" then return CharacterStat.PANIC end
    if statName == "SICKNESS" then return CharacterStat.SICKNESS end
    if statName == "STRESS" then return CharacterStat.STRESS end
    if statName == "UNHAPPINESS" or statName == "UNHAPPYNESS" then return CharacterStat.UNHAPPINESS end
    if statName == "WETNESS" then return CharacterStat.WETNESS end
    return nil
end

function DTEMGetStatValue(stats, statName, legacyGetter, defaultValue)
    if not stats then
        return defaultValue or 0
    end

    local characterStat = getCharacterStat(statName)
    if characterStat then
        local ok, value = pcall(function()
            return stats:get(characterStat)
        end)
        if ok and value ~= nil then
            return value
        end
    end

    local legacyMethod = legacyGetter and stats[legacyGetter] or nil
    if legacyMethod then
        local ok, value = pcall(function()
            return legacyMethod(stats)
        end)
        if ok and value ~= nil then
            return value
        end
    end

    return defaultValue or 0
end

function DTEMSetStatValue(stats, statName, legacySetter, value)
    if not stats then
        return false
    end

    local characterStat = getCharacterStat(statName)
    if characterStat then
        local ok = pcall(function()
            stats:set(characterStat, value)
        end)
        if ok then
            return true
        end
    end

    local legacyMethod = legacySetter and stats[legacySetter] or nil
    if legacyMethod then
        local ok = pcall(function()
            legacyMethod(stats, value)
        end)
        return ok == true
    end

    return false
end

local function normalizeProfessionName(profession)
    if not profession then
        return nil
    end

    local value = string.lower(tostring(profession))
    if string.sub(value, 1, 5) == "base:" then
        value = string.sub(value, 6)
    end
    return value
end

function DTEMResolveTrait(trait)
    if not trait then
        return nil
    end

    if resolvedTraits[trait] ~= nil then
        return resolvedTraits[trait] or nil
    end

    if not CharacterTrait or not CharacterTrait.get or not ResourceLocation or not ResourceLocation.of then
        resolvedTraits[trait] = false
        return nil
    end

    local resourceName = getTraitResourceName(trait)
    if not resourceName then
        resolvedTraits[trait] = false
        return nil
    end

    local resource = ResourceLocation.of(resourceName)
    local characterTrait = CharacterTrait.get(resource)
    resolvedTraits[trait] = characterTrait or false
    return characterTrait
end

function DTEMHasTrait(player, trait)
    if not player or not trait then
        return false
    end

    local moreTraitsLuckAlias = getMoreTraitsLuckAlias(trait)
    if moreTraitsLuckAlias and player.hasTrait and player:hasTrait(moreTraitsLuckAlias) then
        return true
    end

    local characterTrait = DTEMResolveTrait(trait)
    if characterTrait and player.hasTrait then
        return player:hasTrait(characterTrait) == true
    end

    if characterTrait and player.getCharacterTraits then
        local characterTraits = player:getCharacterTraits()
        if characterTraits and characterTraits.contains then
            return characterTraits:contains(characterTrait) == true
        end
    end

    if not CharacterTrait and player.getTraits then
        local traits = player:getTraits()
        if traits and traits.contains then
            return traits:contains(trait) == true
        end
    end

    return false
end

local function setMutualExclusiveIfPossible(firstTrait, secondTrait)
    if CharacterTraitDefinition and CharacterTraitDefinition.setMutualExclusive and firstTrait and secondTrait then
        CharacterTraitDefinition.setMutualExclusive(firstTrait, secondTrait)
    end
end

function DTEMApplyMoreTraitsCompatibility()
    if not ToadTraitsRegistries then
        return
    end

    local baseLucky = DTEMResolveTrait("Lucky")
    local baseUnlucky = DTEMResolveTrait("Unlucky")
    local toadLucky = ToadTraitsRegistries.lucky
    local toadUnlucky = ToadTraitsRegistries.unlucky

    setMutualExclusiveIfPossible(baseLucky, toadLucky)
    setMutualExclusiveIfPossible(baseLucky, toadUnlucky)
    setMutualExclusiveIfPossible(baseUnlucky, toadLucky)
    setMutualExclusiveIfPossible(baseUnlucky, toadUnlucky)
end

if Events and Events.OnGameBoot then
    Events.OnGameBoot.Add(DTEMApplyMoreTraitsCompatibility)
end

local function DTEMSyncTraitChange(player, trait, command)
    if isClient and isClient() and sendClientCommand then
        sendClientCommand("DynamicTraits", command, { trait = trait })
    end
    if isClient and isClient() and sendPlayerStatsChange and player then
        pcall(function()
            sendPlayerStatsChange(player)
        end)
    end
end

function DTEMAddTrait(player, trait)
    if not player or not trait then
        return false
    end

    if DTEMHasTrait(player, trait) then
        return true
    end

    local characterTrait = DTEMResolveTrait(trait)
    if characterTrait and player.getCharacterTraits then
        local characterTraits = player:getCharacterTraits()
        if characterTraits then
            local ok = pcall(function()
                characterTraits:add(characterTrait)
            end)
            if ok then
                DTEMSyncTraitChange(player, trait, "addTrait")
                return true
            end
        end
    end

    if not CharacterTrait and player.getTraits then
        player:getTraits():add(trait)
        DTEMSyncTraitChange(player, trait, "addTrait")
        return true
    end

    return false
end

function DTEMRemoveTrait(player, trait)
    if not player or not trait then
        return false
    end

    if not DTEMHasTrait(player, trait) then
        return true
    end

    local characterTrait = DTEMResolveTrait(trait)
    if characterTrait and player.getCharacterTraits then
        local characterTraits = player:getCharacterTraits()
        if characterTraits then
            local ok = pcall(function()
                characterTraits:remove(characterTrait)
            end)
            if ok then
                DTEMSyncTraitChange(player, trait, "removeTrait")
                return true
            end
        end
    end

    if not CharacterTrait and player.getTraits then
        player:getTraits():remove(trait)
        DTEMSyncTraitChange(player, trait, "removeTrait")
        return true
    end

    return false
end

function DTEMGetModDataNumber(player, key, defaultValue)
    local modData = player and player.getModData and player:getModData() or nil
    if not modData then
        return defaultValue or 0
    end

    local value = tonumber(modData[key])
    if value == nil then
        value = defaultValue or 0
        modData[key] = value
    end
    return value
end

function DTEMHasProfession(player, profession)
    if not player or not profession or not player.getDescriptor then
        return false
    end

    local wantedProfession = normalizeProfessionName(profession)
    local descriptor = player:getDescriptor()
    if not descriptor then
        return false
    end

    if descriptor.getProfession and normalizeProfessionName(descriptor:getProfession()) == wantedProfession then
        return true
    end

    if descriptor.getCharacterProfession then
        local characterProfession = descriptor:getCharacterProfession()
        if characterProfession then
            if characterProfession.getName and normalizeProfessionName(characterProfession:getName()) == wantedProfession then
                return true
            end
            if characterProfession.getType and normalizeProfessionName(characterProfession:getType()) == wantedProfession then
                return true
            end
            if characterProfession.getId and normalizeProfessionName(characterProfession:getId()) == wantedProfession then
                return true
            end
        end
    end

    return false
end
