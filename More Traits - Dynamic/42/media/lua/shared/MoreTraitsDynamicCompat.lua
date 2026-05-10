MTDCompat = MTDCompat or {}

local resolvedTraits = {}

function MTDResolveTrait(traitName)
    if not traitName then
        return nil
    end

    local key = string.lower(tostring(traitName))
    if resolvedTraits[key] then
        return resolvedTraits[key]
    end

    local trait = ToadTraitsRegistries and ToadTraitsRegistries[key] or nil
    if trait then
        resolvedTraits[key] = trait
        return trait
    end

    if CharacterTrait and CharacterTrait.get and ResourceLocation and ResourceLocation.of then
        trait = CharacterTrait.get(ResourceLocation.of("ToadTraits:" .. key))
        if not trait then
            trait = CharacterTrait.get(ResourceLocation.of("base:" .. key))
        end
    end

    if trait then
        resolvedTraits[key] = trait
    end
    return trait
end

function MTDHasTrait(player, traitName)
    if not player or not traitName then
        return false
    end

    local trait = MTDResolveTrait(traitName)
    if trait and player.hasTrait then
        return player:hasTrait(trait) == true
    end

    if not CharacterTrait and player.HasTrait then
        return player:HasTrait(traitName) == true
    end

    if not CharacterTrait and player.getTraits then
        local traits = player:getTraits()
        if traits and traits.contains then
            return traits:contains(traitName) == true
        end
    end

    return false
end

function MTDAddTrait(player, traitName)
    if not player or not traitName then
        return false
    end

    if MTDHasTrait(player, traitName) then
        return true
    end

    local trait = MTDResolveTrait(traitName)
    if trait and player.getCharacterTraits then
        player:getCharacterTraits():add(trait)
        return true
    end

    if not CharacterTrait and player.getTraits then
        player:getTraits():add(traitName)
        return true
    end

    return false
end

function MTDRemoveTrait(player, traitName)
    if not player or not traitName then
        return false
    end

    if not MTDHasTrait(player, traitName) then
        return true
    end

    local trait = MTDResolveTrait(traitName)
    if trait and player.getCharacterTraits then
        player:getCharacterTraits():remove(trait)
        return true
    end

    if not CharacterTrait and player.getTraits then
        player:getTraits():remove(traitName)
        return true
    end

    return false
end
