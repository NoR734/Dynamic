require "MF_ISMoodle"
MF.createMoodle("dtemoverdose");
MF.createMoodle("dtembloodlust");
MF.createMoodle("dtemcaffeine");
MF.createMoodle("dtemallergy");

-- OVERDOSE MOODLE
function DTEMoverdoseMoodleUpdate(player)
    --print("DT Logger: running DTEMoverdoseMoodleUpdate function")
    --print("Player overdose: " .. player:getModData().DTEMoverdose)
    local moodle = MF.getMoodle("dtemoverdose", player:getPlayerNum())
    if moodle ~= nil then
        if player:getModData().DTEMoverdose > 50 and player:getModData().DTEMoverdose <= 70 then
            moodle:setValue(0.3);
            --print("Moodle 2")
        elseif player:getModData().DTEMoverdose > 70 and player:getModData().DTEMoverdose <= 85 then
            moodle:setValue(0.2);
            --print("Moodle 3")
        elseif player:getModData().DTEMoverdose > 85 and player:getModData().DTEMoverdose <= 100 then
            moodle:setValue(0.1);
            --print("Moodle 4")
        else
            moodle:setValue(0.5);
            --print("No Moodle")
        end
    end
end

-- BLOODLUST MOODLE
function DTEMbloodlustMoodleUpdate(player)
    --print("Player bloodlust: " .. player:getModData().DTEMtimeSinceLastKill)
    local moodle = MF.getMoodle("dtembloodlust", player:getPlayerNum())
    if moodle ~= nil then
        if player:getModData().DTEMstressIntelligence == true and player:getModData().DTEMunhappynessIntelligence == true and
        player:getModData().DTEMboredomIntelligence == true and player:getModData().DTEMangerIntelligence == true then
            --print("All books")
            if player:getModData().DTEMtimeSinceLastKill >= 24 and player:getModData().DTEMtimeSinceLastKill <= 48 then
                moodle:setValue(0.4);
                --print("Moodle 1")
            elseif player:getModData().DTEMtimeSinceLastKill > 48 and player:getModData().DTEMtimeSinceLastKill <= 72 then
                moodle:setValue(0.3);
                --print("Moodle 2")
            elseif player:getModData().DTEMtimeSinceLastKill > 72 and player:getModData().DTEMtimeSinceLastKill <= 120 then
                moodle:setValue(0.2);
                --print("Moodle 3")
            elseif player:getModData().DTEMtimeSinceLastKill > 120 then
                moodle:setValue(0.1);
                --print("Moodle 4")
            else
                moodle:setValue(0.5);
                --print("No Moodle")
            end
        else
            --print("Not all books")
            if player:getModData().DTEMtimeSinceLastKill >= 12 and player:getModData().DTEMtimeSinceLastKill <= 24 then
                moodle:setValue(0.4);
                --print("Moodle 1")
            elseif player:getModData().DTEMtimeSinceLastKill > 24 and player:getModData().DTEMtimeSinceLastKill <= 48 then
                moodle:setValue(0.3);
                --print("Moodle 2")
            elseif player:getModData().DTEMtimeSinceLastKill > 48 and player:getModData().DTEMtimeSinceLastKill <= 72 then
                moodle:setValue(0.2);
                --print("Moodle 3")
            elseif player:getModData().DTEMtimeSinceLastKill > 72 then
                moodle:setValue(0.1);
                --print("Moodle 4")
            else
                moodle:setValue(0.5);
                --print("No Moodle")
            end
        end
    end
end

-- CAFFEINE MOODLE
function DTEMcaffeineMoodleUpdate(player)
    --print("Player caffeine: " .. player:getModData().DTEMcaffeineOnBody)
    --print("Player time since last caffeine: " .. player:getModData().DTEMtimeSinceLastCaffeine)
    local moodle = MF.getMoodle("dtemcaffeine", player:getPlayerNum())
    if moodle ~= nil then
        if player:getModData().DTEMcaffeineOnBody > 0 and player:HasTrait("AddictedToCaffeine") then
            moodle:setValue(0.6);
            --print("Moodle 1 positive")
        elseif player:getModData().DTEMtimeSinceLastCaffeine > 1440 and player:HasTrait("AddictedToCaffeine") then
            moodle:setValue(0.4);
            --print("Moodle 1 negative")
        else
            moodle:setValue(0.5);
            --print("No Moodle")
        end
    end
end

-- FOOD ALLERGY MOODLE
function DTEMallergyMoodleUpdate(player)
    --print("Player food allergy: " .. player:getModData().DTEMallergy)
    local moodle = MF.getMoodle("dtemallergy", player:getPlayerNum())
    if moodle ~= nil then
        if player:getModData().DTEMallergy > 20 and player:getModData().DTEMallergy <= 40 then
            moodle:setValue(0.4);
            --print("Moodle 1")
        elseif player:getModData().DTEMallergy > 40 and player:getModData().DTEMallergy <= 60 then
            moodle:setValue(0.3);
            --print("Moodle 2")
        elseif player:getModData().DTEMallergy > 60 and player:getModData().DTEMallergy <= 80 then
            moodle:setValue(0.2);
            --print("Moodle 3")
        elseif player:getModData().DTEMallergy > 80 and player:getModData().DTEMallergy <= 100 then
            moodle:setValue(0.1);
            --print("Moodle 4")
        else
            moodle:setValue(0.5);
            --print("No Moodle")
        end
    end
end