-- OUTDOORSMAN TRAIT
function DTEMoutdoorsmanTrait(player)
    --print("DT Logger: running DTEMoutdoorsmanTrait function");
    local climateManager = getClimateManager();
    local rainIntensity = climateManager:getRainIntensity();
    local snowIntensity = climateManager:getSnowIntensity();
    local windIntensity = climateManager:getWindIntensity();
    local fogIntensity = climateManager:getFogIntensity();
    local isThunderstorming = climateManager:getIsThunderStorming();
    if player:isOutside() and player:getVehicle() == nil then
        -- THE PLAYER IS OUTSIDE AND NOT IN A VEHICLE SO IS GETTING THE OUTDOORSMAN TRAIT
        --print("Player is outside and not in a vehicle, obtaining Outdoorsman");
        player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + (rainIntensity * 10);
        player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + (snowIntensity * 10);
        player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + (windIntensity * 10);
        player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + (fogIntensity * 10);

        if isThunderstorming then
            player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + 10;
        end

        -- BUFFS/DEBUFFS BY OTHER TRAITS
        if player:HasTrait("Pluviophile") then
            --print("Buff by Pluviophile");
            player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + (rainIntensity * 10);
        elseif player:HasTrait("Pluviophobia") then
            --print("Debuff by Pluviophobe");
            player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait - (rainIntensity * 10);
        end
        if player:HasTrait("Hiker") then
            --print("Buff by Hiker");
            player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + (snowIntensity * 10);
            player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + (windIntensity * 10);
        end
        if player:HasTrait("Formerscout") then
            --print("Buff by Formerscout");
            player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + 5;
        end

        -- EXTRA POINTS WHEN BEING OUTSIDE AND HAVING ONE OF THE NEXT PROFESSIONS
        if player:getDescriptor():getProfession() == "parkranger" then
            player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + 5;
        elseif player:getDescriptor():getProfession() == "farmer" or player:getDescriptor():getProfession() == "fisherman" then
            player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + 3;
        elseif player:getDescriptor():getProfession() == "lumberjack" then
            player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait + 1;
        end

        if player:HasTrait("Outdoorsman") then
            --print("Player has Outdoorsman, decreasing stress, unhappiness and anger");
            -- IF THE TRAIT IS PRESENT WHILE THE PLAYER IS OUTSIDE AND NOT IN A VEHICLE THE STRESS, UNHAPPINESS AND ANGER DECREASES WITH RAIN AND SNOW.
            DTEMdecreaseStress(player, rainIntensity / 100);
            DTEMdecreaseStress(player, snowIntensity / 100);
            DTEMdecreaseStressFromCigarettes(player, 1);
            DTEMdecreaseStressFromCigarettes(player, 1);
            DTEMdecreaseUnhappiness(player, rainIntensity);
            DTEMdecreaseUnhappiness(player, snowIntensity);
            DTEMdecreaseAnger(player, rainIntensity / 100);
            DTEMdecreaseAnger(player, snowIntensity / 100);
        end
    else
        if not player:isAsleep() then
            --print("Player is either inside or in a vehicle and not sleeping, removing Outdoorsman");
            player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait - 1;
            if player:HasTrait("Outdoorsman") then
                player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait - rainIntensity;
                player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait - snowIntensity;
                player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait - windIntensity;
                player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait - fogIntensity;
            end
            if player:HasTrait("Pluviophile") and rainIntensity > 0 then
                --print("Player is either inside or in a vehicle and it is raining, removing Outdoorsman");
                player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait - rainIntensity;
            end
            if player:HasTrait("Hiker") then
                --print("Debuff by Hiker");
                player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait - snowIntensity;
                player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait - windIntensity;
            end
            if player:HasTrait("Formerscout") then
                --print("Debuff by Formerscout");
                player:getModData().DTOutdoorsmanTrait = player:getModData().DTOutdoorsmanTrait - 1;
            end
        end
    end
    -- CHECK THE VALUES TO KEEP IT BETWEEN THE LIMITS
    if player:getModData().DTOutdoorsmanTrait > 600000 then
        player:getModData().DTOutdoorsmanTrait = 600000;
    elseif player:getModData().DTOutdoorsmanTrait < 0 then
        player:getModData().DTOutdoorsmanTrait = 0;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO WIN OUTDOORSMAN
    if not player:HasTrait("Outdoorsman") and player:getModData().DTOutdoorsmanTrait >= 500000 then
        player:getTraits():add("Outdoorsman");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_outdoorsman"), true, HaloTextHelper.getColorGreen());
    elseif player:HasTrait("Outdoorsman") and player:getModData().DTOutdoorsmanTrait < 500000 then
        player:getTraits():remove("Outdoorsman");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_outdoorsman"), false, HaloTextHelper.getColorRed());
    end
    --print("DT Logger: DTOutdoorsCounter value is " .. player:getModData().DTOutdoorsmanTrait);
end

function DTEMcatsEyes(player)
    --print("DT Logger: running catsEyes function");
    if not player:isAsleep() then
        local playerSquare = player:getCurrentSquare();
        if playerSquare == nil then
            return
        end
        local lightLevel = playerSquare:getLightLevel(player:getPlayerNum());
        --print("Square light level: " .. lightLevel);
        if lightLevel <= 0.5 then
            if player:getDescriptor():getProfession() == "securityguard" then
                player:getModData().DTEMCatsEyesTrait = player:getModData().DTEMCatsEyesTrait + 5 + (lightLevel * 4);
            elseif player:getDescriptor():getProfession() == "burglar" then
                player:getModData().DTEMCatsEyesTrait = player:getModData().DTEMCatsEyesTrait + 4 + (lightLevel * 3);
            elseif player:getDescriptor():getProfession() == "fireofficer" or player:getDescriptor():getProfession() == "policeofficer" then
                player:getModData().DTEMCatsEyesTrait = player:getModData().DTEMCatsEyesTrait + 3 + (lightLevel * 2);
            else
                player:getModData().DTEMCatsEyesTrait = player:getModData().DTEMCatsEyesTrait + 2 + lightLevel;
            end
        else
            player:getModData().DTEMCatsEyesTrait = player:getModData().DTEMCatsEyesTrait - 0.3;
            if player:HasTrait("NightVision") then
                player:getModData().DTEMCatsEyesTrait = player:getModData().DTEMCatsEyesTrait - (0.3 * lightLevel);
            end
        end
    end
    -- CHECK THE VALUES TO KEEP IT BETWEEN THE LIMITS
    if player:getModData().DTEMCatsEyesTrait > 150000 then
        player:getModData().DTEMCatsEyesTrait = 150000;
    elseif player:getModData().DTEMCatsEyesTrait < 0 then
        player:getModData().DTEMCatsEyesTrait = 0;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO WIN CATS EYES
    if not player:HasTrait("NightVision") and player:getModData().DTEMCatsEyesTrait >= 100000 then
        player:getTraits():add("NightVision");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_NightVision"), true, HaloTextHelper.getColorGreen());
    elseif player:HasTrait("NightVision") and player:getModData().DTEMCatsEyesTrait < 100000 then
        player:getTraits():remove("NightVision");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_NightVision"), false, HaloTextHelper.getColorRed());
    end
    --print("DT Logger: DTCatsEyesCounter value is " .. player:getModData().DTEMCatsEyesTrait);
end

-- RAIN TRAITS
function DTEMrainTraits(player)
    --print("DT Logger: running rainTraits function");
    local climateManager = getClimateManager();
    local rainIntensity = climateManager:getRainIntensity();
    --print("Rain Intensity: " .. rainIntensity)
    if player:isOutside() and player:getVehicle() == nil and rainIntensity > 0 then
        -- THE PLAYER NEEDS TO BE OUTSIDE, NOT IN A VEHICLE AND IT MUST BE RAINING

        if player:HasTrait("Pluviophile") then
            DTEMpluviophileTrait(player, rainIntensity / 100, rainIntensity, rainIntensity / 100);
        elseif player:HasTrait("Pluviophobia") then
            DTEMpluviophobiaTrait(player, rainIntensity / 100, rainIntensity, rainIntensity / 100);
            player:getModData().DTEMRainTraits = player:getModData().DTEMRainTraits + (rainIntensity * 10);
        else
            player:getModData().DTEMRainTraits = player:getModData().DTEMRainTraits + (rainIntensity * 10);
        end

        -- IF THE PLAYER HAVEN'T OBTAINED PLUVIOPHILE, THEN SOME EXTRA POINTS ARE ADDED IF "Outdoorsman", "Former Scout" AND/OR "Hiker" ARE PRESENT
        if not player:HasTrait("Pluviophile") then
            if player:HasTrait("Outdoorsman") then
                player:getModData().DTEMRainTraits = player:getModData().DTEMRainTraits + 3;
            end
            if player:HasTrait("Formerscout") then
                player:getModData().DTEMRainTraits = player:getModData().DTEMRainTraits + 3;
            end
            if player:HasTrait("Hiker") then
                player:getModData().DTEMRainTraits = player:getModData().DTEMRainTraits + 3;
            end
        end
    end

    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE/GAIN THE TRAITS
    if player:getModData().DTEMRainTraits >= 0 and player:HasTrait("Pluviophobia") then
        player:getTraits():remove("Pluviophobia");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pluviophobia"), false, HaloTextHelper.getColorGreen());
    elseif player:getModData().DTEMRainTraits >= 40000 and not player:HasTrait("Pluviophile") then
        player:getTraits():add("Pluviophile");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pluviophile"), true, HaloTextHelper.getColorGreen());
    end
    --print("DT Logger: DTRainTraits value is " .. player:getModData().DTEMRainTraits);
end

function DTEMpluviophileTrait(player, stress, unhappyness, anger)
    --print("DT Logger: running pluviophileTrait function");
    local wornItems = player:getWornItems();
    local wearingPoncho = false;
    local primaryItem = player:getPrimaryHandItem();
    local secondaryItem = player:getSecondaryHandItem();
    local umbrellaPrimary = primaryItem and primaryItem:isProtectFromRainWhileEquipped();
    local umbrellaSecondary = secondaryItem and secondaryItem:isProtectFromRainWhileEquipped();

    -- FIRST FOR
    for i = 0, wornItems:size() - 1 do
        local item = wornItems:get(i):getItem();
        if string.find(item:getClothingItemName(), "Poncho") then
            wearingPoncho = true;
        end
    end

    if umbrellaPrimary or umbrellaSecondary then
        if wearingPoncho == true then
            -- Very high protection.
        else
            -- High protection.
            DTEMdecreaseStress(player, stress / 3);
            DTEMdecreaseStressFromCigarettes(player, 1);
            DTEMdecreaseUnhappiness(player, unhappyness / 3);
            DTEMdecreaseAnger(player, anger / 3);
        end
    else
        if wearingPoncho == true then
            -- Medium protection. 
            DTEMdecreaseStress(player, stress / 2);
            DTEMdecreaseStressFromCigarettes(player, 1);
            DTEMdecreaseUnhappiness(player, unhappyness / 2);
            DTEMdecreaseAnger(player, anger / 2);
        else
            -- Low protection.
            DTEMdecreaseStress(player, stress);
            DTEMdecreaseStressFromCigarettes(player, 1);
            DTEMdecreaseUnhappiness(player, unhappyness);
            DTEMdecreaseAnger(player, anger);
        end
    end
end

function DTEMpluviophobiaTrait(player, stress, unhappyness, anger)
    --print("DT Logger: running pluviophobiaTrait function");
    local wornItems = player:getWornItems();
    local wearingPoncho = false;
    local primaryItem = player:getPrimaryHandItem();
    local secondaryItem = player:getSecondaryHandItem();
    local umbrellaPrimary = primaryItem and primaryItem:isProtectFromRainWhileEquipped();
    local umbrellaSecondary = secondaryItem and secondaryItem:isProtectFromRainWhileEquipped();

    -- FIRST FOR
    for i = 0, wornItems:size() - 1 do
        local item = wornItems:get(i):getItem();
        if string.find(item:getClothingItemName(), "Poncho") then
            wearingPoncho = true;
        end
    end

    if umbrellaPrimary or umbrellaSecondary then
        if wearingPoncho == true then
            -- Very high protection.
        else
            -- High protection.
            DTEMincreaseStress(player, 0, stress / 3);
            DTEMincreaseUnhappiness(player, 0, unhappyness / 3);
            DTEMincreaseAnger(player, 0, anger / 3);
        end
    else
        if wearingPoncho == true then
            -- Medium protection. 
            DTEMincreaseStress(player, 0, stress / 2);
            DTEMincreaseUnhappiness(player, 0, unhappyness / 2);
            DTEMincreaseAnger(player, 0, anger / 2);
        else
            -- Low protection.
            DTEMincreaseStress(player, 0, stress);
            DTEMincreaseUnhappiness(player, 0, unhappyness);
            DTEMincreaseAnger(player, 0, anger)
        end
    end
end

-- CLAUSTROPHOBIC AND AGORAPHOBIC TRAITS
function DTEMagoraphobicClaustrophobicTraits(player)
    --print("DT Logger: running agoraphobicClaustrophobicTraits function");
    if player:isOutside() and player:HasTrait("Agoraphobic") then
        player:getModData().DTEMagoraphobicClaustrophobicTraits = player:getModData().DTEMagoraphobicClaustrophobicTraits + 1;
    elseif not player:isOutside() and player:HasTrait("Claustophobic") then
        player:getModData().DTEMagoraphobicClaustrophobicTraits = player:getModData().DTEMagoraphobicClaustrophobicTraits + 1;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO REMOVE CLAUSTROPHOBIC OR AGORAPHOBIC TRAITS
    if player:getModData().DTEMagoraphobicClaustrophobicTraits >= 175000 then
        if player:HasTrait("Agoraphobic") then
            player:getTraits():remove("Agoraphobic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_agoraphobic"), false, HaloTextHelper.getColorGreen());
        elseif player:HasTrait("Claustophobic") then
            player:getTraits():remove("Claustophobic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_claustro"), false, HaloTextHelper.getColorGreen());
        end
    end
    --print("DT Logger: DTagoraClaustroCounter value is " .. player:getModData().DTEMagoraphobicClaustrophobicTraits);
end
function DTEMluckyUnluckyEffectsForAgoraClaustroTraits(player)
    --print("DT Logger: running DTEMluckyUnluckyEffectsForAgoraClaustroTraits function");
    if ZombRand(10) == 0 then
        player:getModData().DTEMagoraphobicClaustrophobicTraits = player:getModData().DTEMagoraphobicClaustrophobicTraits + DTEMluckyUnluckyModifier(player, 10);
    end
end

-- ANOREXIA TRAIT
function DTEManorexyTrait(player)
    --print("DT Logger: running anorexyTrait function");
    if player:HasTrait("Emaciated") or player:HasTrait("Very Underweight") then
        -- Based on the Unhapyness the rate to obtain Anorexia is lower/higher.
        if player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 1 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait - 2;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 2 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait - 3;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 3 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait - 4;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 4 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait - 5;
        else
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait - 1;
        end
        -- Based on the Stress the rate to obtain Anorexia is lower/higher.
        if player:getMoodles():getMoodleLevel(MoodleType.Stress) == 1 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait - 2;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Stress) == 2 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait - 3;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Stress) == 3 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait - 4;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Stress) == 4 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait - 5;
        else
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait - 1;
        end
        -- Being Lucky or Unlucky may increase/decrease the counter to obtain/remove Anorexia.
        if ZombRand(10) == 0 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait + DTEMluckyUnluckyModifier(player, 7);
        end
    elseif player:HasTrait("Underweight") then
        if player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 0 and player:getMoodles():getMoodleLevel(MoodleType.Stress) == 0 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait + 2;
        else
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait + 1;
        end
        -- Being Lucky or Unlucky may increase/decrease the counter to obtain/remove Anorexia.
        if ZombRand(10) == 0 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait + DTEMluckyUnluckyModifier(player, 7);
        end
    else
        if player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 0 and player:getMoodles():getMoodleLevel(MoodleType.Stress) == 0 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait + 3;
        else
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait + 2;
        end
        -- Being Lucky or Unlucky may increase/decrease the counter to obtain/remove Anorexia.
        if ZombRand(10) == 0 then
            player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait + DTEMluckyUnluckyModifier(player, 7);
        end
    end
    -- CHECK THE VALUE TO KEEP IT INTO THE LIMITS
    if player:getModData().DTEManorexyTrait < -1080 then
        player:getModData().DTEManorexyTrait = -1080;
    elseif player:getModData().DTEManorexyTrait > 1080 then
        player:getModData().DTEManorexyTrait = 1080;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO OBTAIN OR REMOVE ANOREXIA TRAIT
    if player:getModData().DTEManorexyTrait >= 720 and player:HasTrait("Anorexy") then
        player:getTraits():remove("Anorexy");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Anorexy"), false, HaloTextHelper.getColorGreen());
    elseif player:getModData().DTEManorexyTrait <= -720 and not player:HasTrait("Anorexy") then
        player:getTraits():add("Anorexy");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Anorexy"), true, HaloTextHelper.getColorRed());
    end
    --print("DT Logger: DTthresholdToObtainLoseAnorexy value is " .. player:getModData().DTEManorexyTrait);
end

function DTEManorexyTraitHungerSymptoms(player)
    --print("DT Logger: running anorexyTraitHungerSymptoms function");
    if player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 1 then
        -- UNHAPPYNESS
        DTEMincreaseUnhappiness(player, 0, 0.5);
        -- STRESS
        DTEMincreaseStress(player, 0, 0.05);
        -- POISON
        DTEMincreaseFoodSickness(player, ZombRand(8), ZombRand(10));
    elseif player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 2 then
        -- UNHAPPYNESS
        DTEMincreaseUnhappiness(player, 0, 0.6);
        -- STRESS
        DTEMincreaseStress(player, 0, 0.06);
        -- POISON
        DTEMincreaseFoodSickness(player, ZombRand(7), ZombRand(15));
    elseif player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 3 then
        -- UNHAPPYNESS
        DTEMincreaseUnhappiness(player, 0, 0.7);
        -- STRESS
        DTEMincreaseStress(player, 0, 0.07);
        -- POISON
        DTEMincreaseFoodSickness(player, ZombRand(6), ZombRand(20));
    elseif player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 4 then
        -- UNHAPPYNESS
        DTEMincreaseUnhappiness(player, 0, 0.8);
        -- STRESS
        DTEMincreaseStress(player, 0, 0.08);
        -- POISON
        DTEMincreaseFoodSickness(player, ZombRand(5), ZombRand(25));
    end
end

function DTEManorexyTraitPassiveSymptoms(player)
    --print("DT Logger: running anorexyTraitPassiveSymptoms function");
    if not player:isAsleep() then
        -- While the player is not sleeping the stats are negatively affected every hour.
        -- FATIGUE
        DTEMincreaseFatigue(player, ZombRand(3), 0.10);
        -- ENDURANCE
        DTEMdecreaseEndurance(player, ZombRand(3), 0.10);
        -- IF ANOREXIA AND MORE THAN 65KG's
        if not player:HasTrait("Emaciated") and not player:HasTrait("Very Underweight") then
            -- UNHAPPYNESS
            DTEMincreaseUnhappiness(player, ZombRand(5), 10);
            -- STRESS
            DTEMincreaseStress(player, ZombRand(3), 0.15);
        end
    end
end

-- PHYSICALLY ACTIVE AND SEDENTARY TRAITS
function DTEMactiveSedentaryTraits(player)
    --print("DT Logger: running activeSedentaryTraits function");
    player:getModData().DTEMphysicallyActiveSedentaryTraits = player:getModData().DTEMphysicallyActiveSedentaryTraits - 0.5;
    if player:getModData().DTEMphysicallyActiveSedentaryTraits < -70000 then
        player:getModData().DTEMphysicallyActiveSedentaryTraits = -70000;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO OBTAIN/REMOVE THE TRAITS
    if player:getModData().DTEMphysicallyActiveSedentaryTraits <= -20000 and not player:HasTrait("Sedentary") then
        player:getTraits():add("Sedentary");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Sedentary"), true, HaloTextHelper.getColorRed());
    elseif player:getModData().DTEMphysicallyActiveSedentaryTraits > -20000 and player:getModData().DTEMphysicallyActiveSedentaryTraits < 40000 and
            (player:HasTrait("PhysicallyActive") or player:HasTrait("Sedentary")) then
        if player:HasTrait("PhysicallyActive") then
            player:getTraits():remove("PhysicallyActive");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_PhysicallyActive"), false, HaloTextHelper.getColorRed());
        elseif player:HasTrait("Sedentary") then
            player:getTraits():remove("Sedentary");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Sedentary"), false, HaloTextHelper.getColorGreen());
        end
    elseif player:getModData().DTEMphysicallyActiveSedentaryTraits >= 40000 and not player:HasTrait("PhysicallyActive") then
        player:getTraits():add("PhysicallyActive");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_PhysicallyActive"), true, HaloTextHelper.getColorGreen());
    end
    --print("DT Logger: DTObtainLoseActiveSedentary value is " .. player:getModData().DTEMphysicallyActiveSedentaryTraits);
end