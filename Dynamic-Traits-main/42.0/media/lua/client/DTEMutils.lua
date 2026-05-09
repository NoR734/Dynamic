-- Helper functions to add and remove traits

function DTEMHasTrait(player, trait)
    if not player or not trait then
        return false
    end

    local traits = player.getTraits and player:getTraits() or nil
    if traits and traits.contains then
        local ok, result = pcall(function()
            return traits:contains(trait)
        end)
        if ok then
            return result == true
        end
    end

    local ok, result = pcall(function()
        return player:HasTrait(trait)
    end)
    return ok and result == true
end

function DTEMGetModDataNumber(player, key, defaultValue)
    local value = player and player:getModData() and player:getModData()[key] or nil
    value = tonumber(value)
    if value == nil then
        value = defaultValue or 0
        if player and player:getModData() then
            player:getModData()[key] = value
        end
    end
    return value
end

--[[
    Adds a trait to the player if they do not already have it, and performs specific actions based on the trait added.
    
    @param player The player object to which the trait will be added.
    @param trait The trait to be added to the player.
    @param text The text to be displayed when the trait is added.
    @param color The color of the text to be displayed.
    
    Specific trait actions:
    - "Flimsy": Saves the current Strength XP level, reduces the player's Strength level by 1, and restores the saved XP level.
    - "Frail": Saves the current Strength XP level, reduces the player's Strength level by 2, and restores the saved XP level.
    - "Flabby": Saves the current Fitness XP level, reduces the player's Fitness level by 1, and restores the saved XP level.
    - "BrittleKnees": Saves the current Fitness XP level, reduces the player's Fitness level by 2, and restores the saved XP level.
    
    Helper functions used:
    - DTEMsaveCurrentStrXPLevel(player): Saves the player's current Strength XP level.
    - DTEMsaveCurrentFitXPLevel(player): Saves the player's current Fitness XP level.
    - HaloTextHelper.addTextWithArrow(player, text, arrowUp, color): Displays a text with an arrow for the player.
    - getText(text): Retrieves the localized text for the given key.
]]
function DTEMaddTrait(player, trait, text, color)
    if not DTEMHasTrait(player, trait) then
        player:getTraits():add(trait)
        HaloTextHelper.addTextWithArrow(player, getText(text), true, color)
        if trait == "Flimsy" then
            if player:getModData().DTEMcurrentStrXPLevel == 0 then
                DTEMsaveCurrentStrXPLevel(player)
            end
            player:LoseLevel(Perks.Strength)
            player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength))
            player:getXp():AddXP(Perks.Strength, player:getModData().DTEMcurrentStrXPLevel)
            player:getModData().DTEMcurrentStrXPLevel = 0
        elseif trait == "Frail" then 
            if player:getModData().DTEMcurrentStrXPLevel == 0 then
                DTEMsaveCurrentStrXPLevel(player)
            end
            player:LoseLevel(Perks.Strength)
            player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength))
            player:LoseLevel(Perks.Strength)
            player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength))
            player:getXp():AddXP(Perks.Strength, player:getModData().DTEMcurrentStrXPLevel)
            player:getModData().DTEMcurrentStrXPLevel = 0
        elseif trait == "Flabby" then 
            if player:getModData().DTEMcurrentFitXPLevel == 0 then
                DTEMsaveCurrentFitXPLevel(player)
            end
            player:LoseLevel(Perks.Fitness)
            player:getXp():setXPToLevel(Perks.Fitness, player:getPerkLevel(Perks.Fitness))
            player:getXp():AddXP(Perks.Fitness, player:getModData().DTEMcurrentFitXPLevel)
            player:getModData().DTEMcurrentFitXPLevel = 0
        elseif trait == "BrittleKnees" then 
            if player:getModData().DTEMcurrentFitXPLevel == 0 then
                DTEMsaveCurrentFitXPLevel(player)
            end
            player:LoseLevel(Perks.Fitness)
            player:getXp():setXPToLevel(Perks.Fitness, player:getPerkLevel(Perks.Fitness))
            player:LoseLevel(Perks.Fitness)
            player:getXp():setXPToLevel(Perks.Fitness, player:getPerkLevel(Perks.Fitness))
            player:getXp():AddXP(Perks.Fitness, player:getModData().DTEMcurrentFitXPLevel)
            player:getModData().DTEMcurrentFitXPLevel = 0
        end
    end
end

--[[
    Removes a specified trait from the player and updates their perks accordingly.
    
    @param player The player object from which the trait will be removed.
    @param trait The trait to be removed from the player.
    @param text The text to be displayed when the trait is removed.
    @param color The color of the text to be displayed.
    
    If the trait is "Flimsy" or "Frail", the player's Strength perk will be leveled up.
    If the trait is "Flabby" or "BrittleKnees", the player's Fitness perk will be leveled up.
    The function also ensures that the player's current Strength or Fitness XP level is saved before leveling up.
]]

function DTEMremoveTrait(player, trait, text, color)
    if DTEMHasTrait(player, trait) then
        player:getTraits():remove(trait)
        HaloTextHelper.addTextWithArrow(player, getText(text), false, color)
        if trait == "Flimsy" or trait == "Frail" then
            if player:getModData().DTEMcurrentStrXPLevel == 0 then
                DTEMsaveCurrentStrXPLevel(player)
            end
            player:LevelPerk(Perks.Strength)
            player:getXp():setXPToLevel(Perks.Strength, player:getPerkLevel(Perks.Strength))
        elseif trait == "Flabby" or trait == "BrittleKnees" then
            if player:getModData().DTEMcurrentFitXPLevel == 0 then
                DTEMsaveCurrentFitXPLevel(player)
            end
            player:LevelPerk(Perks.Fitness)
            player:getXp():setXPToLevel(Perks.Fitness, player:getPerkLevel(Perks.Fitness))
        end
    end
end

function DTEMluckyUnluckyModifier(player, randomRange)
    --print("DT Logger: running DTEMluckyUnluckyModifier function");
    if DTEMHasTrait(player, "Lucky") then
        print("Player has Lucky")
        return ZombRand(randomRange)
    elseif DTEMHasTrait(player, "Unlucky") then
        print("Player has Unlucky")
        return (ZombRand(randomRange) * -1)
    else
        return 0
    end
end

function DTEMrandomNumberForKills(player, range)
    --print("DT Logger: running DTEMrandomNumberForKills function");
    local randNum = ZombRand(range - player:getZombieKills() - player:getHoursSurvived() + (DTEMluckyUnluckyModifier(player, (range / 10)) * -1));
    if randNum < 0 then
        randNum = 0;
    end
    return randNum;
end

function DTEMrandomNumberForKills2(player, range)
    --print("DT Logger: running DTEMrandomNumberForKills2 function");
    local randNum = ZombRand(range - player:getZombieKills() + DTEMluckyUnluckyModifier(player, (range / 10)));
    if randNum < 0 then
        randNum = 0;
    end
    return randNum;
end
