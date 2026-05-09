-- Table containing the XP required for each level
-- DTEMXPPerLevel[1] = XP required for level 1
-- DTEMXPPerLevel[2] = XP required for level 2, and so on

-- Function to save the current XP level for Strength
-- @param player - the player object whose Strength XP level is to be saved
-- The function calculates the XP required to reach the current level and stores it in the player's mod data

-- Function to save the current XP level for Fitness
-- @param player - the player object whose Fitness XP level is to be saved
-- The function calculates the XP required to reach the current level and stores it in the player's mod data
DTEMXPPerLevel = {
    1500,
    3000,
    6000,
    9000,
    18000,
    30000,
    60000,
    90000,
    120000,
    150000
}

-- Save current XP level for Strength
function DTEMsaveCurrentStrXPLevel(player)
    local currentLevel = player:getPerkLevel(Perks.Strength)
    local currentTotalXP = player:getXp():getXP(Perks.Strength)
    local currentLevelXP = currentTotalXP
    for i = 1, currentLevel do
        currentLevelXP = currentLevelXP - DTEMXPPerLevel[i]
    end
    player:getModData().DTEMcurrentStrXPLevel = currentLevelXP
end

-- Save current XP level for Fitness
function DTEMsaveCurrentFitXPLevel(player)
    local currentLevel = player:getPerkLevel(Perks.Fitness)
    local currentTotalXP = player:getXp():getXP(Perks.Fitness)
    local currentLevelXP = currentTotalXP
    for i = 1, currentLevel do
        currentLevelXP = currentLevelXP - DTEMXPPerLevel[i]
    end
    player:getModData().DTEMcurrentFitXPLevel = currentLevelXP
end

-- Handle traits for Emaciated condition
function DTEMhandleEmaciatedTraits(player)
    -- Add your logic here
end

--[[
    Handles the traits for a player with the Very Underweight condition.

    This function modifies the player's traits based on their current traits and moodles.
    It removes or adds specific traits to reflect the Very Underweight condition.

    @param player The player object whose traits are being handled.

    Traits handled:
    - Removes "Flimsy" and adds "Frail".
    - If the player has the "Athletic" trait, removes "Asthmatic". Otherwise, adds "Asthmatic".
    - If the player has the "Strong" or "Stout" trait, removes "LightEater". Otherwise, adds "LightEater" if the player does not already have it and their stress and unhappiness moodles are below level 3.
    - If the player has the "Athletic" or "Fit" trait, removes "LowThirst". Otherwise, adds "LowThirst".
    - Adds "Thinskinned", "ProneToIllness", and "SlowHealer".

    @see DTEMremoveTrait
    @see DTEMaddTrait
]]
-- Handle traits for Very Underweight condition
function DTEMhandleVeryUnderweightTraits(player)
    DTEMremoveTrait(player, "Flimsy", "UI_trait_Flimsy", HaloTextHelper.getColorGreen())
    DTEMaddTrait(player, "Frail", "UI_trait_Frail", HaloTextHelper.getColorRed())

    if DTEMHasTrait(player, "Athletic") then
        DTEMremoveTrait(player, "Asthmatic", "UI_trait_Asthmatic", HaloTextHelper.getColorGreen())
    else
        DTEMaddTrait(player, "Asthmatic", "UI_trait_Asthmatic", HaloTextHelper.getColorRed())
    end

    if DTEMHasTrait(player, "Strong") or DTEMHasTrait(player, "Stout") then
        DTEMremoveTrait(player, "LightEater", "UI_trait_lighteater", HaloTextHelper.getColorRed())
    else
        if not DTEMHasTrait(player, "LightEater") and player:getMoodles():getMoodleLevel(MoodleType.Stress) < 3 and
        player:getMoodles():getMoodleLevel(MoodleType.Unhappy) < 3 then
            DTEMaddTrait(player, "LightEater", "UI_trait_lighteater", HaloTextHelper.getColorRed())
        end
    end

    if DTEMHasTrait(player, "Athletic") or DTEMHasTrait(player, "Fit") then
        DTEMremoveTrait(player, "LowThirst", "UI_trait_LowThirst", HaloTextHelper.getColorRed())
    else
        DTEMaddTrait(player, "LowThirst", "UI_trait_LowThirst", HaloTextHelper.getColorRed())
    end

    DTEMaddTrait(player, "Thinskinned", "UI_trait_ThinSkinned", HaloTextHelper.getColorRed())
    DTEMaddTrait(player, "ProneToIllness", "UI_trait_pronetoillness", HaloTextHelper.getColorRed())
    DTEMaddTrait(player, "SlowHealer", "UI_trait_SlowHealer", HaloTextHelper.getColorRed())
end
--[[
    Function: DTEMhandleUnderweightTraits
    Description: Handles the traits for a player with the Underweight condition. This function removes and adds specific traits based on the player's current traits and moodles.
    Parameters:
    player (IsoPlayer): The player object whose traits are being managed.

    Trait Handling:
    - Removes the "Frail" trait.
    - If the player has the "HeartyAppitite" trait and their Stress and Unhappy moodles are less than level 3, removes the "HeartyAppitite" trait.
    - Removes the "HighThirst", "Asthmatic", "Thinskinned", and "ThickSkinned" traits.
    - Adds the "Flimsy" trait.
    - If the player has the "Strong" or "Stout" trait, removes the "LightEater" trait. Otherwise, if the player does not have the "LightEater" trait and their Stress and Unhappy moodles are less than level 3, adds the "LightEater" trait.
    - If the player has the "Athletic" or "Fit" trait, removes the "LowThirst" trait. Otherwise, adds the "LowThirst" trait.
    - If the player has the "Athletic" or "Fit" trait, removes the "SlowHealer" and "FastHealer" traits. Otherwise, adds the "SlowHealer" trait.
    - If the player has the "Athletic" trait, removes the "ProneToIllness" and "Resilient" traits. Otherwise, adds the "ProneToIllness" trait.
]]
-- Handle traits for Underweight condition
function DTEMhandleUnderweightTraits(player)
    DTEMremoveTrait(player, "Frail", "UI_trait_Frail", HaloTextHelper.getColorGreen())

    if DTEMHasTrait(player, "HeartyAppitite") and player:getMoodles():getMoodleLevel(MoodleType.Stress) < 3 and
    player:getMoodles():getMoodleLevel(MoodleType.Unhappy) < 3 then
        DTEMremoveTrait(player, "HeartyAppitite", "UI_trait_heartyappetite", HaloTextHelper.getColorGreen())
    end

    DTEMremoveTrait(player, "HighThirst", "UI_trait_HighThirst", HaloTextHelper.getColorGreen())
    DTEMremoveTrait(player, "Asthmatic", "UI_trait_Asthmatic", HaloTextHelper.getColorGreen())
    DTEMremoveTrait(player, "Thinskinned", "UI_trait_ThinSkinned", HaloTextHelper.getColorGreen())
    DTEMremoveTrait(player, "ThickSkinned", "UI_trait_thickskinned", HaloTextHelper.getColorRed())

    DTEMaddTrait(player, "Flimsy", "UI_trait_Flimsy", HaloTextHelper.getColorRed())


    if DTEMHasTrait(player, "Strong") or DTEMHasTrait(player, "Stout") then
        DTEMremoveTrait(player, "LightEater", "UI_trait_lighteater", HaloTextHelper.getColorRed())
    else
        if not DTEMHasTrait(player, "LightEater") and player:getMoodles():getMoodleLevel(MoodleType.Stress) < 3 and
        player:getMoodles():getMoodleLevel(MoodleType.Unhappy) < 3 then
            DTEMaddTrait(player, "LightEater", "UI_trait_lighteater", HaloTextHelper.getColorGreen())
        end
    end

    if DTEMHasTrait(player, "Athletic") or DTEMHasTrait(player, "Fit") then
        DTEMremoveTrait(player, "LowThirst", "UI_trait_LowThirst", HaloTextHelper.getColorRed())
    else
        DTEMaddTrait(player, "LowThirst", "UI_trait_LowThirst", HaloTextHelper.getColorGreen())
    end

    if DTEMHasTrait(player, "Athletic") or DTEMHasTrait(player, "Fit") then
        DTEMremoveTrait(player, "SlowHealer", "UI_trait_SlowHealer", HaloTextHelper.getColorRed())
        DTEMremoveTrait(player, "FastHealer", "UI_trait_FastHealer", HaloTextHelper.getColorRed())
    else
        DTEMaddTrait(player, "SlowHealer", "UI_trait_SlowHealer", HaloTextHelper.getColorRed())
    end

    if DTEMHasTrait(player, "Athletic") then
        DTEMremoveTrait(player, "ProneToIllness", "UI_trait_pronetoillness", HaloTextHelper.getColorRed())
        DTEMremoveTrait(player, "Resilient", "UI_trait_resilient", HaloTextHelper.getColorRed())
    else
        DTEMaddTrait(player, "ProneToIllness", "UI_trait_pronetoillness", HaloTextHelper.getColorRed())
    end
end
--[[
    Function: DTEMhandleHealthyCharacterTraits
    Description: Handles the dynamic traits for a healthy character based on their current traits and moodles.
    Parameters:
    player (IsoPlayer): The player character whose traits are being managed.
    --
    The function performs the following actions:
    1. Removes the traits "Flimsy", "Flabby", "ProneToIllness", and "SlowHealer" from the player.
    2. If the player has the "Weak" or "Feeble" trait and does not have the "LightEater" trait, and their stress and unhappiness moodles are below level 3:
        - Removes the "HeartyAppitite" trait.
        - Adds the "LightEater" trait.
    3. If the player has the "Strong" trait and does not have the "HeartyAppitite" trait:
        - Removes the "LightEater" trait.
        - Adds the "HeartyAppitite" trait.
    4. If the player does not have the "Weak", "Feeble", or "Strong" traits:
        - Removes the "LightEater" trait.
        - If the player has the "HeartyAppitite" trait and their stress and unhappiness moodles are below level 3, removes the "HeartyAppitite" trait.
    5. If the player has the "Unfit" or "Out of Shape" trait and does not have the "LowThirst" trait:
        - Removes the "HighThirst" trait.
        - Adds the "LowThirst" trait.
    6. If the player has the "Athletic" trait and does not have the "HighThirst" trait:
        - Removes the "LowThirst" trait.
        - Adds the "HighThirst" trait.
    7. If the player does not have the "Unfit", "Out of Shape", or "Athletic" traits:
        - Removes the "LowThirst" and "HighThirst" traits.
    8. If the player has the "Strong" trait:
        - Adds the "ThickSkinned" trait.
        - Otherwise, removes the "ThickSkinned" trait.
    9. If the player has the "Athletic" trait:
        - Adds the "Resilient" trait.
        - Otherwise, removes the "Resilient" trait.
    10. If the player has the "Athletic" or "Fit" trait:
        - Adds the "FastHealer" trait.
        - Otherwise, removes the "FastHealer" trait.
]]
-- Handle traits for a healthy character
function DTEMhandleHealthyCharacterTraits(player)
    DTEMremoveTrait(player, "Flimsy", "UI_trait_Flimsy", HaloTextHelper.getColorGreen())
    DTEMremoveTrait(player, "Flabby", "UI_trait_Flabby", HaloTextHelper.getColorGreen())
    DTEMremoveTrait(player, "ProneToIllness", "UI_trait_pronetoillness", HaloTextHelper.getColorGreen())
    DTEMremoveTrait(player, "SlowHealer", "UI_trait_SlowHealer", HaloTextHelper.getColorGreen())

    if DTEMHasTrait(player, "Weak") or DTEMHasTrait(player, "Feeble") then
        if not DTEMHasTrait(player, "LightEater") and player:getMoodles():getMoodleLevel(MoodleType.Stress) < 3 and
        player:getMoodles():getMoodleLevel(MoodleType.Unhappy) < 3 then
            DTEMremoveTrait(player, "HeartyAppitite", "UI_trait_heartyappetite", HaloTextHelper.getColorGreen())
            DTEMaddTrait(player, "LightEater", "UI_trait_lighteater", HaloTextHelper.getColorGreen())
        end
    elseif DTEMHasTrait(player, "Strong") then
        if not DTEMHasTrait(player, "HeartyAppitite") then
            DTEMremoveTrait(player, "LightEater", "UI_trait_lighteater", HaloTextHelper.getColorGreen())
            DTEMaddTrait(player, "HeartyAppitite", "UI_trait_heartyappetite", HaloTextHelper.getColorRed())
        end
    else
        DTEMremoveTrait(player, "LightEater", "UI_trait_lighteater", HaloTextHelper.getColorRed())
        if DTEMHasTrait(player, "HeartyAppitite") and player:getMoodles():getMoodleLevel(MoodleType.Stress) < 3 and
        player:getMoodles():getMoodleLevel(MoodleType.Unhappy) < 3 then
            DTEMremoveTrait(player, "HeartyAppitite", "UI_trait_heartyappetite", HaloTextHelper.getColorGreen())
        end
    end

    if DTEMHasTrait(player, "Unfit") or DTEMHasTrait(player, "Out of Shape") then
        if not DTEMHasTrait(player, "LowThirst") then
            DTEMremoveTrait(player, "HighThirst", "UI_trait_HighThirst", HaloTextHelper.getColorGreen())
            DTEMaddTrait(player, "LowThirst", "UI_trait_LowThirst", HaloTextHelper.getColorGreen())
        end
    elseif DTEMHasTrait(player, "Athletic") then
        if not DTEMHasTrait(player, "HighThirst") then
            DTEMremoveTrait(player, "LowThirst", "UI_trait_LowThirst", HaloTextHelper.getColorGreen())
            DTEMaddTrait(player, "HighThirst", "UI_trait_HighThirst", HaloTextHelper.getColorRed())
        end
    else
        DTEMremoveTrait(player, "LowThirst", "UI_trait_LowThirst", HaloTextHelper.getColorRed())
        DTEMremoveTrait(player, "HighThirst", "UI_trait_HighThirst", HaloTextHelper.getColorGreen())
    end

    if DTEMHasTrait(player, "Strong") then
        DTEMaddTrait(player, "ThickSkinned", "UI_trait_thickskinned", HaloTextHelper.getColorGreen())
    else
        DTEMremoveTrait(player, "ThickSkinned", "UI_trait_thickskinned", HaloTextHelper.getColorRed())
    end

    if DTEMHasTrait(player, "Athletic") then
        DTEMaddTrait(player, "Resilient", "UI_trait_resilient", HaloTextHelper.getColorGreen())
    else
        DTEMremoveTrait(player, "Resilient", "UI_trait_resilient", HaloTextHelper.getColorRed())
    end

    if DTEMHasTrait(player, "Athletic") or DTEMHasTrait(player, "Fit") then
        DTEMaddTrait(player, "FastHealer", "UI_trait_FastHealer", HaloTextHelper.getColorGreen())
    else
        DTEMremoveTrait(player, "FastHealer", "UI_trait_FastHealer", HaloTextHelper.getColorRed())
    end
end

--[[
    Handles the traits for a player with the Overweight condition.

    This function adjusts the player's traits based on their current traits and the Overweight condition.

    @param player The player object whose traits are being managed.

    The function performs the following actions:
    - Removes the "BrittleKnees" trait.
    - Removes the "LightEater" trait.
    - Removes the "LowThirst" trait.
    - Removes the "Asthmatic" trait.
    - Adds the "Flabby" trait.
    - Adds the "HeartyAppitite" trait.
    - Adds the "HighThirst" trait.

    Additionally, it checks for specific traits and adjusts accordingly:
    - If the player has the "Athletic" or "Fit" trait:
        - Removes the "SlowHealer" trait.
        - Removes the "FastHealer" trait.
    - Otherwise:
        - Adds the "SlowHealer" trait.

    - If the player has the "Athletic" trait:
        - Removes the "ProneToIllness" trait.
        - Removes the "Resilient" trait.
    - Otherwise:
        - Adds the "ProneToIllness" trait.

    - If the player has the "Strong" trait:
        - Adds the "ThickSkinned" trait.
    - Otherwise:
        - Removes the "ThickSkinned" trait.
]]
-- Handle traits for Overweight condition
function DTEMhandleOverweightTraits(player)
    DTEMremoveTrait(player, "BrittleKnees", "UI_trait_BrittleKnees", HaloTextHelper.getColorGreen())


    DTEMremoveTrait(player, "LightEater", "UI_trait_lighteater", HaloTextHelper.getColorRed())
    DTEMremoveTrait(player, "LowThirst", "UI_trait_LowThirst", HaloTextHelper.getColorRed())
    DTEMremoveTrait(player, "Asthmatic", "UI_trait_Asthmatic", HaloTextHelper.getColorGreen())

    DTEMaddTrait(player, "Flabby", "UI_trait_Flabby", HaloTextHelper.getColorRed())


    DTEMaddTrait(player, "HeartyAppitite", "UI_trait_heartyappetite", HaloTextHelper.getColorRed())
    DTEMaddTrait(player, "HighThirst", "UI_trait_HighThirst", HaloTextHelper.getColorRed())

    if DTEMHasTrait(player, "Athletic") or DTEMHasTrait(player, "Fit") then
        DTEMremoveTrait(player, "SlowHealer", "UI_trait_SlowHealer", HaloTextHelper.getColorRed())
        DTEMremoveTrait(player, "FastHealer", "UI_trait_FastHealer", HaloTextHelper.getColorRed())
    else
        DTEMaddTrait(player, "SlowHealer", "UI_trait_SlowHealer", HaloTextHelper.getColorRed())
    end

    if DTEMHasTrait(player, "Athletic") then
        DTEMremoveTrait(player, "ProneToIllness", "UI_trait_pronetoillness", HaloTextHelper.getColorRed())
        DTEMremoveTrait(player, "Resilient", "UI_trait_resilient", HaloTextHelper.getColorRed())
    else
        DTEMaddTrait(player, "ProneToIllness", "UI_trait_pronetoillness", HaloTextHelper.getColorRed())
    end

    if DTEMHasTrait(player, "Strong") then
        DTEMaddTrait(player, "ThickSkinned", "UI_trait_thickskinned", HaloTextHelper.getColorGreen())
    else
        DTEMremoveTrait(player, "ThickSkinned", "UI_trait_thickskinned", HaloTextHelper.getColorRed())
    end
end

--[[
    Handles the traits for a player with the Obese condition.

    This function performs the following actions:
    - Removes the "Flabby" trait from the player.
    - Adds the "BrittleKnees" trait to the player.
    - Adds the "HeartyAppitite" trait to the player.
    - Adds the "HighThirst" trait to the player.
    - Adds the "ProneToIllness" trait to the player.
    - Adds the "SlowHealer" trait to the player.
    - If the player has the "Athletic" trait, removes the "Asthmatic" trait; otherwise, adds the "Asthmatic" trait.
    - If the player has the "Strong" trait, adds the "ThickSkinned" trait; otherwise, removes the "ThickSkinned" trait.

    @param player The player object whose traits are being handled.
]]
-- Handle traits for Obese condition
function DTEMhandleObeseTraits(player)
    DTEMremoveTrait(player, "Flabby", "UI_trait_Flabby", HaloTextHelper.getColorGreen())


    DTEMaddTrait(player, "BrittleKnees", "UI_trait_BrittleKnees", HaloTextHelper.getColorRed())


    DTEMaddTrait(player, "HeartyAppitite", "UI_trait_heartyappetite", HaloTextHelper.getColorRed())
    DTEMaddTrait(player, "HighThirst", "UI_trait_HighThirst", HaloTextHelper.getColorRed())
    DTEMaddTrait(player, "ProneToIllness", "UI_trait_pronetoillness", HaloTextHelper.getColorRed())
    DTEMaddTrait(player, "SlowHealer", "UI_trait_SlowHealer", HaloTextHelper.getColorRed())

    if DTEMHasTrait(player, "Athletic") then
        DTEMremoveTrait(player, "Asthmatic", "UI_trait_Asthmatic", HaloTextHelper.getColorGreen())
    else
        DTEMaddTrait(player, "Asthmatic", "UI_trait_Asthmatic", HaloTextHelper.getColorRed())
    end

    if DTEMHasTrait(player, "Strong") then
        DTEMaddTrait(player, "ThickSkinned", "UI_trait_thickskinned", HaloTextHelper.getColorGreen())
    else
        DTEMremoveTrait(player, "ThickSkinned", "UI_trait_thickskinned", HaloTextHelper.getColorRed())
    end
end

--[[
    Function: DTEMtraitsGainsByBodyConditions
    Description: This function handles the trait gains for a player based on their body conditions.
                 It checks for specific traits such as "Emaciated", "Very Underweight", "Underweight",
                 "Overweight", and "Obese", and calls the corresponding handler functions for each trait.
                 If the player does not have any of these traits, it calls the handler for healthy character traits.
    Parameters:
        player - The player object whose traits are being evaluated.
    Returns: None
--]]
function DTEMtraitsGainsByBodyConditions(player)
    if DTEMHasTrait(player, "Emaciated") then
        DTEMhandleEmaciatedTraits(player)
    elseif DTEMHasTrait(player, "Very Underweight") then
        DTEMhandleVeryUnderweightTraits(player)
    elseif DTEMHasTrait(player, "Underweight") then
        DTEMhandleUnderweightTraits(player)
    elseif not DTEMHasTrait(player, "Emaciated") and not DTEMHasTrait(player, "Very Underweight") and
           not DTEMHasTrait(player, "Underweight") and not DTEMHasTrait(player, "Overweight") and
           not DTEMHasTrait(player, "Obese") then
        DTEMhandleHealthyCharacterTraits(player)
    elseif DTEMHasTrait(player, "Overweight") then
        DTEMhandleOverweightTraits(player)
    elseif DTEMHasTrait(player, "Obese") then
        DTEMhandleObeseTraits(player)
    end
end







