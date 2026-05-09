-- ADDITIONAL EFFECTS TO HEAVY LOAD MOODLE
-- If the player is with a Heavy Load there are minimum chances of getting a fracture.
function DTEMfracturesIfHeavyLoad(player)
    --print("DT Logger: running DTEMfracturesIfHeavyLoad function");

    -- The player has Heavy Load and is not in a vehicle
    if player:getMoodles():getMoodleLevel(MoodleType.HeavyLoad) == 4 and player:getVehicle() == nil then
        --print("Heavy load is Lv4, running chances");
        local baseChance = 15000;
        --print("baseChance: " .. baseChance);

        -- Increase the fracture chance if Flimsy or Frail are present
        if DTEMHasTrait(player, "Flimsy") then
            baseChance = baseChance - 1000;
        elseif DTEMHasTrait(player, "Frail") then
            baseChance = baseChance - 2000;
        end
        --print("baseChance: " .. baseChance);

        -- Increase the fracture chance if Anorexia is present
        if DTEMHasTrait(player, "Anorexy") then
            baseChance = baseChance - 2000;
        end
        --print("baseChance: " .. baseChance);

        -- Increase/Decrease the fracture chance based on the Strength trait present
        if DTEMHasTrait(player, "Weak") then
            baseChance = baseChance - 2000;
        elseif DTEMHasTrait(player, "Feeble") then
            baseChance = baseChance - 1000;
        elseif DTEMHasTrait(player, "Stout") then
            baseChance = baseChance + 1000;
        elseif DTEMHasTrait(player, "Strong") then
            baseChance = baseChance + 2000;
        end
        --print("baseChance: " .. baseChance);

        -- Decrease/Increase the fracture chance if Lucky/Unlucky are present
        if DTEMHasTrait(player, "Lucky") then
            baseChance = baseChance + 1000;
        elseif DTEMHasTrait(player, "Unlucky") then
            baseChance = baseChance - 1000;
        end
        --print("baseChance: " .. baseChance);

        -- Decrease the fracture chance if Strong back or Metal strong back from Snake's modpack are present
        if getActivatedMods():contains("AliceSPack") then
            if DTEMHasTrait(player, "Strongback") or DTEMHasTrait(player, "Strongback2") then
                baseChance = baseChance + 1000;
            elseif DTEMHasTrait(player, "Metalstrongback") or DTEMHasTrait(player, "Metalstrongback2") then
                baseChance = baseChance + 2000;
            end
        end
        --print("baseChance: " .. baseChance);

        -- Increase the fracture chance if the player is moving, running or sprinting
        if player:isPlayerMoving() and not player:isRunning() and not player:isSprinting() then
            --print("Player is walking");
            -- Player is walking
            baseChance = baseChance - 500;
        elseif player:isRunning() then
            --print("Player is running");
            -- Player is running
            baseChance = baseChance - 1000;
        elseif player:isSprinting() then
            --print("Player is sprinting");
            -- Player is sprinting
            baseChance = baseChance - 2000;
        end
        --print("baseChance: " .. baseChance);

        if ZombRand(baseChance) == 0 then
            --print("Fracturing the player");
            local fracturesBodyPart = {"Hand_L", "Hand_R", "ForeArm_L", "ForeArm_R", "UpperArm_L", "UpperArm_R", "Torso_Lower", "Groin", "UpperLeg_L", "UpperLeg_R", "LowerLeg_L", "LowerLeg_R", "Foot_L", "Foot_R"};
	        local randNumber = ZombRand(1, 15);
	        local bodyPart = BodyPartType.FromString(fracturesBodyPart[randNumber]);
	        local playerBodyPart = player:getBodyDamage():getBodyPart(bodyPart);
            playerBodyPart:setFractureTime(ZombRand(30, 50));
        end
    end
end

-- ADDITIONAL EFFECTS TO WETNESS MOODLE
function DTEMexpandedWetnessMoodle(player)
    --print("DT Logger: running DTEMexpandedWetnessMoodle function");
    if player:getMoodles():getMoodleLevel(MoodleType.Wet) == 1 then
        player:getModData().DTEMgenerateAColdChance = player:getModData().DTEMgenerateAColdChance + 1;
    elseif player:getMoodles():getMoodleLevel(MoodleType.Wet) == 2 then
        player:getModData().DTEMgenerateAColdChance = player:getModData().DTEMgenerateAColdChance + 2;
    elseif player:getMoodles():getMoodleLevel(MoodleType.Wet) == 3 then
        player:getModData().DTEMgenerateAColdChance = player:getModData().DTEMgenerateAColdChance + 3;
        DTEMgenerateACold(player, 500, ZombRand(25, 50));
    elseif player:getMoodles():getMoodleLevel(MoodleType.Wet) == 4 then
        player:getModData().DTEMgenerateAColdChance = player:getModData().DTEMgenerateAColdChance + 4;
        DTEMgenerateACold(player, 300, ZombRand(25, 50));
    else
        player:getModData().DTEMgenerateAColdChance = player:getModData().DTEMgenerateAColdChance - 1;
        if player:getModData().DTEMgenerateAColdChance < 0 then
            player:getModData().DTEMgenerateAColdChance = 0;
        end
    end
end

-- ADDITIONAL EFFECTS TO HASACOLD MOODLE
function DTEMexpandedHasAColdMoodle(player)
    --print("DT Logger: running DTEMexpandedHasAColdMoodle function");
    if player:getMoodles():getMoodleLevel(MoodleType.HasACold) == 1 then
        -- HEADACHE
        DTEMapplyPain(player, ZombRand(20), "Head", ZombRand(30));
    elseif player:getMoodles():getMoodleLevel(MoodleType.HasACold) == 2 then
        -- HEADACHE
        DTEMapplyPain(player, ZombRand(15), "Head", ZombRand(45));
        -- FATIGUE
        DTEMincreaseFatigue(player, ZombRand(15), 0.05);
    elseif player:getMoodles():getMoodleLevel(MoodleType.HasACold) == 3 then
        -- HEADACHE
        DTEMapplyPain(player, ZombRand(10), "Head", ZombRand(60));
        -- FATIGUE
        DTEMincreaseFatigue(player, ZombRand(13), 0.10);
        -- POISON
        DTEMincreaseFoodSickness(player, ZombRand(7), ZombRand(15));
    elseif player:getMoodles():getMoodleLevel(MoodleType.HasACold) == 4 then
        -- HEADACHE
        DTEMapplyPain(player, ZombRand(5), "Head", ZombRand(75));
        -- FATIGUE
        DTEMincreaseFatigue(player, ZombRand(9), 0.13);
        -- ENDURANCE
        DTEMdecreaseEndurance(player, ZombRand(9), 0.13);
        -- POISON
        DTEMincreaseFoodSickness(player, ZombRand(5), ZombRand(20));
    end
end

-- ADDITIONAL EFFECTS TO SICK MOODLE
function DTEMexpandedSicknessMoodle(player)
    --print("DT Logger: running DTEMexpandedSicknessMoodle function");
    for i = 0, player:getBodyDamage():getBodyParts():size() - 1 do
        local bodyPart = player:getBodyDamage():getBodyParts():get(i);
        if bodyPart:getWoundInfectionLevel() > 0 then
            --print("bodyPart:getWoundInfectionLevel(): " .. bodyPart:getWoundInfectionLevel())
            DTEMincreaseFoodSicknessByWounds(player, ZombRand(3), ZombRand(bodyPart:getWoundInfectionLevel()));
            if bodyPart:getDeepWoundTime() > 0 then
                --print("Deep Wound Time: " .. bodyPart:getDeepWoundTime())
                DTEMincreaseFoodSicknessByWounds(player, ZombRand(3), ZombRand(bodyPart:getDeepWoundTime()));
            elseif bodyPart:getStitchTime() > 0 then
                --print("Stitch Time: " .. bodyPart:getStitchTime())
                DTEMincreaseFoodSicknessByWounds(player, ZombRand(3), ZombRand(bodyPart:getStitchTime() / 2));
            end
            if bodyPart:getCutTime() > 0 then
                --print("Cut Time: " .. bodyPart:getCutTime())
                DTEMincreaseFoodSicknessByWounds(player, ZombRand(3), ZombRand(bodyPart:getCutTime()));
            end
            if bodyPart:getScratchTime() > 0 then
                --print("Scratch Time: " .. bodyPart:getScratchTime())
                DTEMincreaseFoodSicknessByWounds(player, ZombRand(3), ZombRand(bodyPart:getScratchTime()));
            end
            -- For those that plays without infection
            if bodyPart:getBiteTime() > 0 then
                --print("Bite Time: " .. bodyPart:getBiteTime())
                DTEMincreaseFoodSicknessByWounds(player, ZombRand(3), ZombRand(bodyPart:getBiteTime()));
            end
        end
        if bodyPart:getDeepWoundTime() > 0 or bodyPart:getStitchTime() > 0 then
            DTEMincreaseStress(player, ZombRand(5), 0.15);
        end
        if bodyPart:getCutTime() > 0 then
            DTEMincreaseStress(player, ZombRand(5), 0.13);
        end
        if bodyPart:getScratchTime() > 0 then
            DTEMincreaseStress(player, ZombRand(5), 0.10);
        end
        -- For those that plays without infection
        if bodyPart:getBiteTime() > 0 then
            DTEMincreaseStress(player, ZombRand(5), 0.15);
        end
    end
end

function DTEMexpandedMoodlesCheckStats(player)
    --print("DT Logger: running DTEMexpandedMoodlesCheckStats function");

    -- GETTING CURRENT STATS
    local currentDrunkeness = player:getStats():getDrunkenness();
    local currentAnger = player:getStats():getAnger();
    local currentPanic = player:getStats():getPanic();
    local currentStress = player:getStats():getStress();

    -- INCREASING ANGRY WHEN BEING DRUNK
    DTEMincreaseAnger(player, ZombRand(30), currentDrunkeness / 100);

    -- INCREASING STRESS & UNHAPPYNESS WHEN BEING ANGRY
    DTEMincreaseStress(player, ZombRand(20), currentAnger / 10);
    DTEMincreaseUnhappiness(player, ZombRand(30), currentAnger * 10);

    -- INCREASING WETNESS WHEN BEING PANICKED
    DTEMincreaseWetness(player, ZombRand(30), currentPanic / 10);

    -- INCREASING WETNESS WHEN BEING STRESSED
    DTEMincreaseWetness(player, ZombRand(30), currentStress * 10);

    -- PASSING OUT MECHANIC
    if player:getMoodles():getMoodleLevel(MoodleType.Tired) == 4 and player:getMoodles():getMoodleLevel(MoodleType.Panic) == 0 and
            not player:isAsleep() and player:getMoodles():getMoodleLevel(MoodleType.Hypothermia) < 3 then
        if (ZombRand(3)) == 0 then
            player:getModData().DTEMpassingOut = player:getModData().DTEMpassingOut + ZombRand(3) + (DTEMluckyUnluckyModifier(player, 3) * -1) + 1;
        end
        --print("player:getModData().DTEMpassingOut: " .. player:getModData().DTEMpassingOut);
        if player:getModData().DTEMpassingOut >= 125 then
            --print("Player reached the Pass out threshold");
            -- If the player player is not Running, Sprinting or Walking, then force to sleep
            if not player:isPlayerMoving() and not player:isRunning() and not player:isSprinting() and not player:isAiming() then
                --print("Player is not moving or aiming, increasing quiet time");
                --ISWorldObjectContextMenu.onSleepWalkToComplete(player:getPlayerNum(), nil)
                player:getModData().DTEMpassingOutQuietTime = player:getModData().DTEMpassingOutQuietTime + 1;
                --print("player:getModData().DTEMpassingOutQuietTime: " .. player:getModData().DTEMpassingOutQuietTime);
                if player:getModData().DTEMpassingOutQuietTime > 7 then
                    --print("Player is not moving or aiming, and was quiet for a while. Forcing player to sleep");
                    player:setAsleep(true);
                    UIManager.setFadeBeforeUI(player:getPlayerNum(), true)
                    UIManager.FadeOut(player:getPlayerNum(), 1)
                    player:getModData().DTEMpassingOut = 0;
                    player:getModData().DTEMpassingOutQuietTime = 0;
                end
            else
                --print("The player is not quiet, can't fall asleep");
                player:getModData().DTEMpassingOutQuietTime = 0;
                --print("player:getModData().DTEMpassingOutQuietTime: " .. player:getModData().DTEMpassingOutQuietTime);
            end
        end
    else
        --print("player:getModData().DTEMpassingOut: " .. player:getModData().DTEMpassingOut);
        player:getModData().DTEMpassingOut = player:getModData().DTEMpassingOut - 1 - player:getMoodles():getMoodleLevel(MoodleType.Panic);
        if player:getModData().DTEMpassingOut < 0 then
            player:getModData().DTEMpassingOut = 0;
        end
    end
end