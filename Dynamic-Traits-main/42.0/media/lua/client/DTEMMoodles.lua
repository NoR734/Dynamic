require "MF_ISMoodle"
MF.createMoodle("dtemoverdose");
MF.createMoodle("dtembloodlust");
MF.createMoodle("dtemcaffeine");
MF.createMoodle("dtemallergy");

local function DTEMMoodleHasTrait(player, trait)
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

-- OVERDOSE MOODLE
function DTEMoverdoseMoodleUpdate(player)
    --print("DT Logger: running DTEMoverdoseMoodleUpdate function")
    --print("Player overdose: " .. player:getModData().DTEMoverdose)
    if not MF or not MF.getMoodle then
        return
    end
    local moodle = MF.getMoodle("dtemoverdose", player:getPlayerNum())
    if moodle ~= nil then
        local overdoseLevel = DTEMGetModDataNumber and DTEMGetModDataNumber(player, "DTEMoverdose", 0) or (tonumber(player:getModData().DTEMoverdose) or 0)
        if overdoseLevel > 50 and overdoseLevel <= 70 then
            moodle:setValue(0.3);
            --print("Moodle 2")
        elseif overdoseLevel > 70 and overdoseLevel <= 85 then
            moodle:setValue(0.2);
            --print("Moodle 3")
        elseif overdoseLevel > 85 and overdoseLevel <= 100 then
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
    if not MF or not MF.getMoodle then
        return
    end
    local moodle = MF.getMoodle("dtembloodlust", player:getPlayerNum())
    if moodle ~= nil then
        local timeSinceLastKill = DTEMGetModDataNumber and DTEMGetModDataNumber(player, "DTEMtimeSinceLastKill", 0) or (tonumber(player:getModData().DTEMtimeSinceLastKill) or 0)
        if player:getModData().DTEMstressIntelligence == true and player:getModData().DTEMunhappynessIntelligence == true and
        player:getModData().DTEMboredomIntelligence == true and player:getModData().DTEMangerIntelligence == true then
            --print("All books")
            if timeSinceLastKill >= 24 and timeSinceLastKill <= 48 then
                moodle:setValue(0.4);
                --print("Moodle 1")
            elseif timeSinceLastKill > 48 and timeSinceLastKill <= 72 then
                moodle:setValue(0.3);
                --print("Moodle 2")
            elseif timeSinceLastKill > 72 and timeSinceLastKill <= 120 then
                moodle:setValue(0.2);
                --print("Moodle 3")
            elseif timeSinceLastKill > 120 then
                moodle:setValue(0.1);
                --print("Moodle 4")
            else
                moodle:setValue(0.5);
                --print("No Moodle")
            end
        else
            --print("Not all books")
            if timeSinceLastKill >= 12 and timeSinceLastKill <= 24 then
                moodle:setValue(0.4);
                --print("Moodle 1")
            elseif timeSinceLastKill > 24 and timeSinceLastKill <= 48 then
                moodle:setValue(0.3);
                --print("Moodle 2")
            elseif timeSinceLastKill > 48 and timeSinceLastKill <= 72 then
                moodle:setValue(0.2);
                --print("Moodle 3")
            elseif timeSinceLastKill > 72 then
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
    if not MF or not MF.getMoodle then
        return
    end
    local moodle = MF.getMoodle("dtemcaffeine", player:getPlayerNum())
    if moodle ~= nil then
        local caffeineOnBody = DTEMGetModDataNumber and DTEMGetModDataNumber(player, "DTEMcaffeineOnBody", 0) or (tonumber(player:getModData().DTEMcaffeineOnBody) or 0)
        local timeSinceLastCaffeine = DTEMGetModDataNumber and DTEMGetModDataNumber(player, "DTEMtimeSinceLastCaffeine", 0) or (tonumber(player:getModData().DTEMtimeSinceLastCaffeine) or 0)
        if caffeineOnBody > 0 and DTEMMoodleHasTrait(player, "AddictedToCaffeine") then
            moodle:setValue(0.6);
            --print("Moodle 1 positive")
        elseif timeSinceLastCaffeine > 1440 and DTEMMoodleHasTrait(player, "AddictedToCaffeine") then
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
    if not MF or not MF.getMoodle then
        return
    end
    local moodle = MF.getMoodle("dtemallergy", player:getPlayerNum())
    if moodle ~= nil then
        local allergy = DTEMGetModDataNumber and DTEMGetModDataNumber(player, "DTEMallergy", 0) or (tonumber(player:getModData().DTEMallergy) or 0)
        if allergy > 20 and allergy <= 40 then
            moodle:setValue(0.4);
            --print("Moodle 1")
        elseif allergy > 40 and allergy <= 60 then
            moodle:setValue(0.3);
            --print("Moodle 2")
        elseif allergy > 60 and allergy <= 80 then
            moodle:setValue(0.2);
            --print("Moodle 3")
        elseif allergy > 80 and allergy <= 100 then
            moodle:setValue(0.1);
            --print("Moodle 4")
        else
            moodle:setValue(0.5);
            --print("No Moodle")
        end
    end
end
