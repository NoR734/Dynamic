-- MAIN FILE WHERE ALL THE DIFFERENT FUNCTIONS WILL BE CALLED BASED ON THE DIFFERENT EVENTS

local function DTEMMainHasTrait(player, trait)
    if DTEMHasTrait then
        return DTEMHasTrait(player, trait)
    end

    local traits = player and player.getTraits and player:getTraits() or nil
    if traits and traits.contains then
        local ok, result = pcall(function()
            return traits:contains(trait)
        end)
        if ok then
            return result == true
        end
    end

    if player then
        local ok, result = pcall(function()
            return player:HasTrait(trait)
        end)
        if ok then
            return result == true
        end
    end

    return false
end

local function DTEMGetSandboxOption(optionName, defaultValue)
    if SandboxVars and SandboxVars.DTEM and SandboxVars.DTEM[optionName] ~= nil then
        return SandboxVars.DTEM[optionName]
    end
    return defaultValue
end

-- OnPlayerUpdate Main Method to call others
function DTEMOnPlayerUpdateMain(player)
    -- INITIALIZATIONS FOR AN EXISTING CHARACTER
    DTEMBaseGameCharacterDetails.DoExistingCharacterInitializations(player);
end
Events.OnPlayerUpdate.Add(DTEMOnPlayerUpdateMain);

-- EveryOneMinutes Main Method to call others
function DTEMEveryOneMinuteMain()

    -- SANDBOX
    local overdoseMechanic = DTEMGetSandboxOption("EnableOverdoseMechanic", true)

    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if player ~= nil then
            -- CALL TO OTHER METHODS THAT RUNS BASED ON THE EveryOneMinute EVENT

        -- MOODLE DISPLAY MANAGEMENT
        if overdoseMechanic then 
            --print("Overdose Sandbox is enabled")
            DTEMoverdoseMoodleUpdate(player)
        end
        DTEMbloodlustMoodleUpdate(player);
        DTEMcaffeineMoodleUpdate(player);
        DTEMallergyMoodleUpdate(player);

        DTEMtraitsGainsByBodyConditions(player);
        DTEMtraitsByMoods(player);
        DTEMtraitsByRecipes(player);

        if not DTEMMainHasTrait(player, "Dextrous") or not DTEMMainHasTrait(player, "Organized") then
            DTEMtraitsByMovingObjects(player);
        end
        DTEMrainTraits(player);

        if DTEMMainHasTrait(player, "Agoraphobic") or DTEMMainHasTrait(player, "Claustophobic") then
            DTEMagoraphobicClaustrophobicTraits(player);
        end

        DTEMcatsEyes(player);
        DTEMoutdoorsmanTrait(player);
        DTEMalcoholicTrait(player);
        --[[ if getActivatedMods():contains("LeGourmetRevolution") then
            addictedToCaffeineTrait(player);
        end ]]
        DTEMaddictedToCaffeineTrait(player);

        DTEMexpandedMoodlesCheckStats(player);
        DTEMcheckReduceInfectionPower(player);

        DTEMallergyDecrease(player);
        DTEMallergyMoodleLv1(player);
        DTEMallergyMoodleLv2(player);
        DTEMallergyMoodleLv3(player);
        DTEMallergyMoodleLv4(player);

        DTEMfracturesIfHeavyLoad(player);

            DTEMonPlayerMoving(player)
        end
    end
end
Events.EveryOneMinute.Add(DTEMEveryOneMinuteMain);

-- EveryTenMinutes Main Method to call others
function DTEMEveryTenMinutesMain()

    -- SANDBOX
    local overdoseMechanic = DTEMGetSandboxOption("EnableOverdoseMechanic", true)

    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if player ~= nil then
            -- CALL TO OTHER METHODS THAT RUNS BASED ON THE EveryTenMinutes EVENT
            if type(DTEMluckyUnluckyEffectsForAgoraClaustroTraits) == "function" and
                    (DTEMMainHasTrait(player, "Agoraphobic") or DTEMMainHasTrait(player, "Claustophobic")) then
                DTEMluckyUnluckyEffectsForAgoraClaustroTraits(player);
            end
            if DTEMMainHasTrait(player, "Anorexy") then
                DTEManorexyTraitHungerSymptoms(player);
            end
            DTEMactiveSedentaryTraits(player);
            DTEMnightmaresTrait(player);
               
            DTEMexpandedWetnessMoodle(player);
            DTEMexpandedHasAColdMoodle(player);
            DTEMexpandedSicknessMoodle(player);

            if overdoseMechanic then 
                --print("Overdose Sandbox is enabled")
                DTEMoverdoseMoodleEffects(player)
            end

            if DTEMMainHasTrait(player, "Smoker") then
                DTEMsmokerCough(player);
            end

            if DTEMMainHasTrait(player, "Bloodlust") then
                DTEMbloodlustTraitEffects(player);
            end
        end
    end
end
Events.EveryTenMinutes.Add(DTEMEveryTenMinutesMain);

-- EveryHours Main Method to call others
function DTEMEveryHoursMain()

    -- SANDBOX
    local overdoseMechanic = DTEMGetSandboxOption("EnableOverdoseMechanic", true)
    local pillsTraitsDevelopment = DTEMGetSandboxOption("EnablePillsTraitsDevelopmentInGame", true)

    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if player ~= nil then
            -- CALL TO OTHER METHODS THAT RUNS BASED ON THE EveryHours EVENT
            if DTEMMainHasTrait(player, "Smoker") then
                DTEMsmokerTrait(player);
            end

            DTEManorexyTrait(player);
            if DTEMMainHasTrait(player, "Anorexy") then
                DTEManorexyTraitPassiveSymptoms(player);
            end

            if not getActivatedMods():contains("FWOFitnessWorkoutOverhaul") then
                DTEMexerciseMultiplierIfMaxRegularity(player);
            end

            if DTEMMainHasTrait(player, "Bloodlust") then
                DTEMbloodlustTrait(player);
            end

            DTEMmelancholicTrait(player)
            DTEMnervousWreckTrait(player)
            
            if pillsTraitsDevelopment then
                DTEMpillsTraitsDevelopment(player)
            end

            if overdoseMechanic then 
                --print("Overdose Sandbox is enabled")
                DTEMoverdoseDecrease(player)
            end
        end
    end
end
Events.EveryHours.Add(DTEMEveryHoursMain);

-- EveryDays Main Method to call others
function DTEMEveryDaysMain()
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);

        -- CALL TO OTHER METHODS THAT RUNS BASED ON THE EveryDays EVENT
        if player ~= nil then
            DTEMemotionalIntelligenceRecipes(player);
        end
    end
end
Events.EveryDays.Add(DTEMEveryDaysMain);

-- OnZombieDead Main Method to call others
function DTEMOnZombieDeadMain(zombie)

    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        -- CALL TO OTHER METHODS THAT RUNS BASED ON THE OnZombieDead EVENT
        if player ~= nil and not DTEMMainHasTrait(player, "Bloodlust") then
            DTEMtraitsGainsByKills(player);
        end
        if player ~= nil and DTEMMainHasTrait(player, "Bloodlust") then
            DTEMbloodlustTraitOnZombieKill(player);
        end
    end
end
Events.OnZombieDead.Add(DTEMOnZombieDeadMain);

-- LevelPerk Main Method to call others
function DTEMLevelPerkMain(player, perk, perkLevel, addBuffer)

    -- CALL TO OTHER METHODS THAT RUNS BASED ON THE LevelPerk EVENT
    DTEMtraitsGainsByLevel(player, perk, perkLevel);
    --recipesByPerksLevel(player, perk, perkLevel);

end
Events.LevelPerk.Add(DTEMLevelPerkMain);

-- OnWeaponHitTree Main Method to call others
function DTEMOnWeaponHitTreeMain(player, weapon)

    -- CALL TO OTHER METHODS THAT RUNS BASED ON THE OnWeaponHitTree EVENT
    DTEMonHitTree(player, weapon);
end
Events.OnWeaponHitTree.Add(DTEMOnWeaponHitTreeMain);

-- OnWeaponSwingHitPoint Main Method to call others
function DTEMOnWeaponSwingHitPointMain(player, weapon)

    -- CALL TO OTHER METHODS THAT RUNS BASED ON THE OnWeaponSwingHitPoint EVENT
    DTEMonSwingWeapon(player, weapon);
end
Events.OnWeaponSwingHitPoint.Add(DTEMOnWeaponSwingHitPointMain);

-- OnWeaponHitCharacter Method to call others
function DTEMOnWeaponHitCharacterMain(player, target, weapon, damage)

    -- CALL TO OTHER METHODS THAT RUNS BASED ON THE DTEMonPlayerHittingAZombie EVENT
    DTEMonPlayerHittingAZombie(player, target, weapon, damage);
end
Events.OnWeaponHitCharacter.Add(DTEMOnWeaponHitCharacterMain);
