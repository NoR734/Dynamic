-- EMOTIONAL INTELLIGENCE RECIPES CHECK
function DTEMemotionalIntelligenceRecipes(player)
    local playerRecipes = player:getKnownRecipes();
    if player:getModData().DTEMstressIntelligence == false and playerRecipes:contains("Stress management volume 1") and 
    playerRecipes:contains("Stress management volume 2") and playerRecipes:contains("Stress management volume 3") and 
    playerRecipes:contains("Stress management volume 4") and playerRecipes:contains("Stress management volume 5") then
        player:getModData().DTEMstressIntelligence = true;
    end
    if player:getModData().DTEMunhappynessIntelligence == false and playerRecipes:contains("Unhappyness management volume 1") and 
    playerRecipes:contains("Unhappyness management volume 2") and playerRecipes:contains("Unhappyness management volume 3") and 
    playerRecipes:contains("Unhappyness management volume 4") and playerRecipes:contains("Unhappyness management volume 5") then
        player:getModData().DTEMunhappynessIntelligence = true;
    end
    if player:getModData().DTEMboredomIntelligence == false and playerRecipes:contains("Boredom management volume 1") and 
    playerRecipes:contains("Boredom management volume 2") and playerRecipes:contains("Boredom management volume 3") and 
    playerRecipes:contains("Boredom management volume 4") and playerRecipes:contains("Boredom management volume 5") then
        player:getModData().DTEMboredomIntelligence = true;
    end
    if player:getModData().DTEMangerIntelligence == false and playerRecipes:contains("Anger management volume 1") and 
    playerRecipes:contains("Anger management volume 2") and playerRecipes:contains("Anger management volume 3") and 
    playerRecipes:contains("Anger management volume 4") and playerRecipes:contains("Anger management volume 5") then
        player:getModData().DTEMangerIntelligence = true;
    end
end

-- BLOODLUST TRAIT
function DTEMbloodlustTrait(player)
    --print("DT Logger: running DTEMbloodlustTrait function");
    if not player:isAsleep() then
        player:getModData().DTEMtimeSinceLastKill = player:getModData().DTEMtimeSinceLastKill + 1;
    end
    --print("DT Logger: DTtimesinceLastKill value is " .. player:getModData().DTEMtimeSinceLastKill);
end

function DTEMbloodlustTraitEffects(player)
    --print("DT Logger: running DTEMbloodlustTraitEffects function");
    -- CHECKS IF THE PLAYER READ ALL THE BOOKS TO LEARN HOW TO CONTROL THE EMOTIONS
    if player:getModData().DTEMstressIntelligence == true and player:getModData().DTEMunhappynessIntelligence == true and 
    player:getModData().DTEMboredomIntelligence == true and player:getModData().DTEMangerIntelligence == true then
        if player:getModData().DTEMtimeSinceLastKill > 72 then
            --print("DT Logger: All the books were read and 72 hours without a kill passed");
            -- STRESS
            DTEMincreaseStress(player, ZombRand(5), 0.30);
            -- BOREDOM
            DTEMincreaseBoredom(player, ZombRand(5), 25);
            -- UNHAPPYNESS
            DTEMincreaseUnhappiness(player, ZombRand(5), 20);
            -- ANGER
            DTEMincreaseAnger(player, ZombRand(5), 0.45);

            if player:getModData().DTEMtimeSinceLastKill > 120 then
                DTEMpillsTraitsDevelopment(player);
            end
        elseif player:getModData().DTEMtimeSinceLastKill > 48 then
            --print("DT Logger: All the books were read and 48 hours without a kill passed");
            -- STRESS
            DTEMincreaseStress(player, ZombRand(5), 0.20);
            -- BOREDOM
            DTEMincreaseBoredom(player, ZombRand(5), 15);
            -- UNHAPPYNESS
            DTEMincreaseUnhappiness(player, ZombRand(5), 10);
            -- ANGER
            DTEMincreaseAnger(player, ZombRand(5), 0.30);
        end
    else
        if player:getModData().DTEMtimeSinceLastKill > 48 then
            --print("DT Logger: Not all the books were read and 48 hours without a kill passed");
            -- STRESS
            DTEMincreaseStress(player, ZombRand(5), 0.30);
            -- BOREDOM
            DTEMincreaseBoredom(player, ZombRand(5), 25);
            -- UNHAPPYNESS
            DTEMincreaseUnhappiness(player, ZombRand(5), 20);
            -- ANGER
            DTEMincreaseAnger(player, ZombRand(5), 0.45);

            if player:getModData().DTEMtimeSinceLastKill > 72 then
                DTEMpillsTraitsDevelopment(player);
            end
        -- IF PLAYER HAVEN'T KILLED ZOMBIES FOR 24 HOURS, THEN THE MOOD WILL BE AFFECTED EVERY HOUR
        elseif player:getModData().DTEMtimeSinceLastKill > 24 then
            --print("DT Logger: Not all the books were read and 24 hours without a kill passed");
            -- STRESS
            DTEMincreaseStress(player, ZombRand(5), 0.20);
            -- BOREDOM
            DTEMincreaseBoredom(player, ZombRand(5), 15);
            -- UNHAPPYNESS
            DTEMincreaseUnhappiness(player, ZombRand(5), 10);
            -- ANGER
            DTEMincreaseAnger(player, ZombRand(5), 0.30);
        end


    end
end

function DTEMbloodlustTraitOnZombieKill(player)
    --print("DT Logger: running DTEMbloodlustTraitOnZombieKill function");
    -- IF THE PLAYER KILLED A ZOMBIE THE NEGATIVE MOODS ARE REDUCED
    if player:getZombieKills() > player:getModData().DTEMKillscheck then
        -- STRESS
        DTEMdecreaseStress(player, 0.05);
        DTEMdecreaseStressFromCigarettes(player, 0.10);
        -- BOREDOM
        DTEMdecreaseBoredom(player, 5);
        -- UNHAPPYNESS
        DTEMdecreaseUnhappiness(player, 10);
        -- ANGRY
        DTEMdecreaseAnger(player, 0.05);
        player:getModData().DTEMKillscheck = player:getZombieKills();
        player:getModData().DTEMtimeSinceLastKill = 0;
    end
end