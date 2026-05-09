DTEMCompat = DTEMCompat or {}

DTEMCompat.TraitAliases = DTEMCompat.TraitAliases or {
    ["Claustophobic"] = "base:claustrophobic",
    ["HeartyAppitite"] = "base:heartyappetite",
    ["Thinskinned"] = "base:thinskinned",
    ["ThinSkinned"] = "base:thinskinned",
    ["Out of Shape"] = "base:out of shape",
    ["Very Underweight"] = "base:very underweight",
}

local resolvedTraits = {}

local function getTraitResourceName(trait)
    if not trait then
        return nil
    end

    if string.find(trait, ":", 1, true) then
        return string.lower(trait)
    end

    local alias = DTEMCompat.TraitAliases[trait]
    if alias then
        return alias
    end

    return "base:" .. string.lower(trait)
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

function DTEMAddTrait(player, trait)
    if not player or not trait then
        return false
    end

    if DTEMHasTrait(player, trait) then
        return true
    end

    local characterTrait = DTEMResolveTrait(trait)
    if characterTrait and player.getCharacterTraits then
        player:getCharacterTraits():add(characterTrait)
        return true
    end

    if not CharacterTrait and player.getTraits then
        player:getTraits():add(trait)
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
        player:getCharacterTraits():remove(characterTrait)
        return true
    end

    if not CharacterTrait and player.getTraits then
        player:getTraits():remove(trait)
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