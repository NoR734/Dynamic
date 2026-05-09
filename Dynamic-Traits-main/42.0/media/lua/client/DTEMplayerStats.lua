function DTEMincreaseFoodSickness(player, chance, poison)
    --print("DT Logger: running DTEMincreaseFoodSickness function");
    --print("DT Logger: Chance: " .. chance);
    --print("DT Logger: Poison: " .. poison);
    local currentFoodPoison = player:getBodyDamage():getFoodSicknessLevel();
    if chance == 0 then
        if ZombRand(2) == 0 then
            player:playEmote("dtpoisonvomit");
        else
            player:playEmote("dtsmellgag");
        end

        if DTEMHasTrait(player, "SlowHealer") then
            poison = poison * 1.1;
            --print("DT Logger: player has trait SlowHealer");
            --print("DT Logger: Poison: " .. poison);
        elseif DTEMHasTrait(player, "FastHealer") then
            poison = poison * 0.9;
            --print("DT Logger: player has trait FastHealer");
            --print("DT Logger: Poison: " .. poison);
        end
        if DTEMHasTrait(player, "WeakStomach") then
            poison = poison * 1.2;
            --print("DT Logger: player has trait WeakStomach");
            --print("DT Logger: Poison: " .. poison);
        elseif DTEMHasTrait(player, "IronGut") then
            poison = poison * 0.8;
            --print("DT Logger: player has trait IronGut");
            --print("DT Logger: Poison: " .. poison);
        end
        if DTEMHasTrait(player, "ProneToIllness") then
            poison = poison * 1.3;
            --print("DT Logger: player has trait ProneToIllness");
            --print("DT Logger: Poison: " .. poison);
        elseif DTEMHasTrait(player, "Resilient") then
            poison = poison * 0.7;
            --print("DT Logger: player has trait Resilient");
            --print("DT Logger: Poison: " .. poison);
        end

        player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + poison);

        if player:getBodyDamage():getFoodSicknessLevel() > 100 then
            player:getBodyDamage():setFoodSicknessLevel(100);
        end
    end
end

function DTEMincreaseFoodSicknessByWounds(player, chance, poison)
    --print("DT Logger: Chance: " .. chance);
    --print("DT Logger: Poison: " .. poison);
    --print("DT Logger: running DTEMincreaseFoodSicknessByWounds function");
    local currentFoodPoison = player:getBodyDamage():getFoodSicknessLevel();
    if chance == 0 then
        if ZombRand(2) == 0 then
            player:playEmote("dtpoisonvomit");
        else
            player:playEmote("dtsmellgag");
        end

        if DTEMHasTrait(player, "Thinskinned") then
            poison = poison * 1.2;
            --print("DT Logger: player has trait Thinskinned");
            --print("DT Logger: Poison: " .. poison);
        elseif DTEMHasTrait(player, "ThickSkinned") then
            poison = poison * 0.8;
            --print("DT Logger: player has trait ThickSkinned");
            --print("DT Logger: Poison: " .. poison);
        end

        if DTEMHasTrait(player, "ProneToIllness") then
            poison = poison * 1.3;
            --print("DT Logger: player has trait ProneToIllness");
            --print("DT Logger: Poison: " .. poison);
        elseif DTEMHasTrait(player, "Resilient") then
            poison = poison * 0.7;
            --print("DT Logger: player has trait Resilient");
            --print("DT Logger: Poison: " .. poison);
        end

        player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + poison);

        if player:getBodyDamage():getFoodSicknessLevel() > 100 then
            player:getBodyDamage():setFoodSicknessLevel(100);
        end
    end
end

function DTEMincreaseStress(player, chance, stress)
    --print("DT Logger: running DTEMincreaseStress function");
    --print("DT Logger: chance: " .. chance);
    if chance == 0 then
        -- Stress only increases if the player is not sleeping.
        if not player:isAsleep() then
            --print("DT Logger: player is not sleeping, increasing stress");
            local currentStress = player:getStats():getStress();
            -- If the books set for Stress is all read, the stress gained is reduced in 30%.
            if player:getModData().DTEMstressIntelligence == true then
                stress = stress * 0.7;
            end
            -- If Nervous Wreck trait is present the stress gained increases in 30%.
            if DTEMHasTrait(player, "NervousWreck") then
                player:getStats():setStress(currentStress + (stress * 1.3));
            else
                player:getStats():setStress(currentStress + stress);
            end
            if player:getStats():getStress() > 1 then
                player:getStats():setStress(1);
            end
        end
    end
end

function DTEMdecreaseStress(player, stress)
    --print("DT Logger: running DTEMdecreaseStress function");
    local currentStress = player:getStats():getStress();
    player:getStats():setStress(currentStress - stress);
    if player:getStats():getStress() < 0 then
        player:getStats():setStress(0);
    end
end

function DTEMdecreaseStressFromCigarettes(player, stress)
    --print("DT Logger: running DTEMdecreaseStressFromCigarettes function");
    local currentStressByCigarettes = player:getStats():getStressFromCigarettes();
    player:getStats():setStressFromCigarettes(currentStressByCigarettes - stress);
    if player:getStats():getStressFromCigarettes() < 0 then
        player:getStats():setStressFromCigarettes(0);
    end
end

function DTEMincreaseUnhappiness(player, chance, unhappyness)
    --print("DT Logger: running DTEMincreaseUnhappiness function");
    --print("DT Logger: chance: " .. chance);
    if chance == 0 then
        -- Unhappyness only increases if the player is not sleeping.
        if not player:isAsleep() then
            --print("DT Logger: player is not sleeping, increasing unhappyness");
            local currentUnhappyness = player:getBodyDamage():getUnhappynessLevel();
            -- If the books set for Unhappyness is all read, the unhappyness gained is reduced in 30%.
            if player:getModData().DTEMunhappynessIntelligence == true then
                unhappyness = unhappyness * 0.7;
            end
            -- If Melancholic trait is present the Unhappyness gained increases in 30%.
            if DTEMHasTrait(player, "Melancholic") then
                player:getBodyDamage():setUnhappynessLevel(currentUnhappyness + (unhappyness * 1.3));
            else
                player:getBodyDamage():setUnhappynessLevel(currentUnhappyness + unhappyness);
            end
            if player:getBodyDamage():getUnhappynessLevel() > 100 then
                player:getBodyDamage():setUnhappynessLevel(100);
            end
        end
    end
end

function DTEMdecreaseUnhappiness(player, unhappyness)
    --print("DT Logger: running DTEMdecreaseUnhappiness function");
    local currentUnhappyness = player:getBodyDamage():getUnhappynessLevel();
    player:getBodyDamage():setUnhappynessLevel(currentUnhappyness - unhappyness);
    if player:getBodyDamage():getUnhappynessLevel() < 0 then
        player:getBodyDamage():setUnhappynessLevel(0);
    end
end

function DTEMincreaseBoredom(player, chance, boredom)
    --print("DT Logger: running DTEMincreaseBoredom function");
    --print("DT Logger: chance: " .. chance);
    if chance == 0 then
        -- Boredom only increases if the player is not sleeping.
        if not player:isAsleep() then
            --print("DT Logger: player is not sleeping, increasing boredom");
            local currentBoredom = player:getBodyDamage():getBoredomLevel();
            -- If the books set for Boredom is all read, the boredom gained is reduced in 30%.
            if player:getModData().DTEMboredomIntelligence == true then
                boredom = boredom * 0.7;
            end
            player:getBodyDamage():setBoredomLevel(currentBoredom + boredom);
            if player:getBodyDamage():getBoredomLevel() > 100 then
                player:getBodyDamage():setBoredomLevel(100);
            end
        end
    end
end

function DTEMdecreaseBoredom(player, boredom)
    --print("DT Logger: running DTEMdecreaseBoredom function");
    local currentBoredom = player:getBodyDamage():getBoredomLevel();
    player:getBodyDamage():setBoredomLevel(currentBoredom - boredom);
    if player:getBodyDamage():getBoredomLevel() < 0 then
        player:getBodyDamage():setBoredomLevel(0);
    end
end

function DTEMincreaseFatigue(player, chance, fatigue)
    --print("DT Logger: running DTEMincreaseFatigue function");
    if chance == 0 then
        if not player:isAsleep() then
            --print("DT Logger: player is not sleeping, increasing fatigue");
            local currentFatigue = player:getStats():getFatigue();
            player:getStats():setFatigue(currentFatigue + fatigue);
            if player:getStats():getFatigue() > 1 then
                player:getStats():setFatigue(1);
            end
        end
    end
end

function DTEMdecreaseFatigue(player, chance, fatigue)
    --print("DT Logger: running DTEMdecreaseFatigue function");
    if chance == 0 then
        local currentFatigue = player:getStats():getFatigue();
        player:getStats():setFatigue(currentFatigue - fatigue);
        if player:getStats():getFatigue() < 0 then
            player:getStats():setFatigue(0);
        end
    end
end

function DTEMdecreaseEndurance(player, chance, endurance)
    --print("DT Logger: running DTEMdecreaseEndurance function");
    if chance == 0 then
        if not player:isAsleep() then
            --print("DT Logger: player is not sleeping, decreasing endurance");
            local currentEndurance = player:getStats():getEndurance();
            player:getStats():setEndurance(currentEndurance - endurance);
            if player:getStats():getEndurance() < 0 then
                player:getStats():setEndurance(0);
            end
        end
    end
end

function DTEMincreaseWetness(player, chance, wetness)
    --print("DT Logger: running DTEMincreaseWetness function");
    --print("DT Logger: chance: " .. chance);
    if chance == 0 then
        local currentWetness = player:getBodyDamage():getWetness();
        player:getBodyDamage():setWetness(currentWetness + wetness);
        if player:getBodyDamage():getWetness() > 100 then
            player:getBodyDamage():setWetness(100);
        end
    end
end

function DTEMincreaseAnger(player, chance, anger)
    --print("DT Logger: running DTEMincreaseAnger function");
    --print("DT Logger: chance: " .. chance);
    --print("DT Logger: anger: " .. anger);
    if chance == 0 then
        if not player:isAsleep() then
            --print("DT Logger: player is not sleeping, increasing anger");
            local currentAnger = player:getStats():getAnger();
            -- If the books set for Anger is all read, the Anger gained is reduced in 30%.
            if player:getModData().DTEMangerIntelligence == true then
                anger = anger * 0.7;
            end
            player:getStats():setAnger(currentAnger + anger);
            if player:getStats():getAnger() > 1 then
                player:getStats():setAnger(1);
            end
        end
    end
end

function DTEMdecreaseAnger(player, anger)
    --print("DT Logger: running DTEMdecreaseAnger function");
    --print("DT Logger: anger: " .. anger);
    local currentAnger = player:getStats():getAnger();
    player:getStats():setAnger(currentAnger - anger);
    if player:getStats():getAnger() < 0 then
        player:getStats():setAnger(0);
    end
end

function DTEMapplyPain(player, chance, bodyPart, pain)
    --print("DT Logger: running DTEMapplyPain function");
    if chance == 0 then
        local bodyPartAux = BodyPartType.FromString(bodyPart);
        local playerBodyPart = player:getBodyDamage():getBodyPart(bodyPartAux);
        local currentPain = playerBodyPart:getPain();
        playerBodyPart:setAdditionalPain(currentPain + pain);
        if playerBodyPart:getPain() > 100 then
            playerBodyPart:setAdditionalPain(100);
        end
    end
end

-- Decreases the health of a random body part of the player by a specified amount if the chance condition is met.
-- @param player The player object.
-- @param chance The chance condition to be met (0 to apply the effect).
-- @param health The amount of health to decrease from the body part.
function DTEMdecreaseBodyPartHealth(player, chance, health)
    --print("DT Logger: running DTEMdecreaseBodyPartHealth function");
    --print("DT Logger: chance: " .. chance);
    --print("DT Logger: health: " .. health);
    if chance == 0 then
        local allBodyPart = {"Head", "Neck", "Hand_L", "Hand_R", "ForeArm_L", "ForeArm_R", "UpperArm_L", "UpperArm_R", "Torso_Lower", "Torso_Upper", "Groin", "UpperLeg_L", "UpperLeg_R", "LowerLeg_L", "LowerLeg_R", "Foot_L", "Foot_R"};
	    local randNumber = ZombRand(1, 18);
	    local bodyPart = BodyPartType.FromString(allBodyPart[randNumber]);
	    local playerBodyPart = player:getBodyDamage():getBodyPart(bodyPart);
        local currentHealth = playerBodyPart:getHealth();
        playerBodyPart:SetHealth(currentHealth - health);
    end
end

function DTEMapplyXPBoost(player, perk, boostLevel)
    --print("DT Logger: running DTEMapplyXPBoost function");
    local currentXPBoost = player:getXp():getPerkBoost(perk);
    local newBoost = currentXPBoost + boostLevel;
    if newBoost > 3 then
        player:getXp():setPerkBoost(perk, 3);
    else
        player:getXp():setPerkBoost(perk, newBoost);
    end
end

function DTEMgenerateACold(player, baseRange, coldStrength)
    --print("DT Logger: running DTEMgenerateACold function");
    local currentColdStrength = player:getBodyDamage():getColdStrength();
    local auxRange = baseRange;
    -- Increases the range if Outdoorsman is present
    if DTEMHasTrait(player, "Outdoorsman") then
        auxRange = auxRange * 1.3;
    end
    -- Increases the range if Resilient is present
    if DTEMHasTrait(player, "Resilient") then
        auxRange = auxRange * 1.5;
    -- Decreases the range if ProneToIllness is present
    elseif DTEMHasTrait(player, "ProneToIllness") then
        auxRange = auxRange * 0.5;
    end
    local range = auxRange - player:getModData().DTEMgenerateAColdChance;
    if range < 0 then
        range = 0;
    end
    if ZombRand(range) == 0 then
        player:getBodyDamage():setHasACold(true);
        player:getBodyDamage():setColdStrength(currentColdStrength + coldStrength);
        player:getModData().DTEMgenerateAColdChance = 0;
    end
end