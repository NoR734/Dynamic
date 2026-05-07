require "MF_ISMoodle"
MF.createMoodle("dtoverdose");
MF.createMoodle("dtbloodlust");
MF.createMoodle("dtcaffeine");
MF.createMoodle("dtpillsallergy");
MF.createMoodle("dtfoodallergy");

-- OVERDOSE MOODLE
function overdoseMoodleUpdate(player)
    --print("Player overdose: " .. player:getModData().DTOverdose)
    if MF.getMoodle("dtoverdose") ~= nil then
        if player:getModData().DTOverdose > 50 and player:getModData().DTOverdose <= 70 then
            MF.getMoodle("dtoverdose"):setValue(0.3);
            --print("Moodle 2")
        elseif player:getModData().DTOverdose > 70 and player:getModData().DTOverdose <= 85 then
            MF.getMoodle("dtoverdose"):setValue(0.2);
            --print("Moodle 3")
        elseif player:getModData().DTOverdose > 85 and player:getModData().DTOverdose <= 100 then
            MF.getMoodle("dtoverdose"):setValue(0.1);
            --print("Moodle 4")
        else
            MF.getMoodle("dtoverdose"):setValue(0.5);
            --print("No Moodle")
        end
    end
end

-- BLOODLUST MOODLE
function bloodlustMoodleUpdate(player)
    --print("Player bloodlust: " .. player:getModData().DTtimesinceLastKill)
    if MF.getMoodle("dtbloodlust") ~= nil then
        if player:getModData().DTstressIntelligence == true and player:getModData().DTunhappynessIntelligence == true and
        player:getModData().DTboredomIntelligence == true and player:getModData().DTangerIntelligence == true then
            --print("All books")
            if player:getModData().DTtimesinceLastKill >= 24 and player:getModData().DTtimesinceLastKill <= 48 then
                MF.getMoodle("dtbloodlust"):setValue(0.4);
                --print("Moodle 1")
            elseif player:getModData().DTtimesinceLastKill > 48 and player:getModData().DTtimesinceLastKill <= 72 then
                MF.getMoodle("dtbloodlust"):setValue(0.3);
                --print("Moodle 2")
            elseif player:getModData().DTtimesinceLastKill > 72 and player:getModData().DTtimesinceLastKill <= 120 then
                MF.getMoodle("dtbloodlust"):setValue(0.2);
                --print("Moodle 3")
            elseif player:getModData().DTtimesinceLastKill > 120 then
                MF.getMoodle("dtbloodlust"):setValue(0.1);
                --print("Moodle 4")
            else
                MF.getMoodle("dtbloodlust"):setValue(0.5);
                --print("No Moodle")
            end
        else
            --print("Not all books")
            if player:getModData().DTtimesinceLastKill >= 12 and player:getModData().DTtimesinceLastKill <= 24 then
                MF.getMoodle("dtbloodlust"):setValue(0.4);
                --print("Moodle 1")
            elseif player:getModData().DTtimesinceLastKill > 24 and player:getModData().DTtimesinceLastKill <= 48 then
                MF.getMoodle("dtbloodlust"):setValue(0.3);
                --print("Moodle 2")
            elseif player:getModData().DTtimesinceLastKill > 48 and player:getModData().DTtimesinceLastKill <= 72 then
                MF.getMoodle("dtbloodlust"):setValue(0.2);
                --print("Moodle 3")
            elseif player:getModData().DTtimesinceLastKill > 72 then
                MF.getMoodle("dtbloodlust"):setValue(0.1);
                --print("Moodle 4")
            else
                MF.getMoodle("dtbloodlust"):setValue(0.5);
                --print("No Moodle")
            end
        end
    end
end

-- CAFFEINE MOODLE
function caffeineMoodleUpdate(player)
    --print("Player caffeine: " .. player:getModData().DTcaffeineOnBody)
    --print("Player time since last caffeine: " .. player:getModData().DTtimeSinceLastCaffeine)
    if MF.getMoodle("dtcaffeine") ~= nil then
        if player:getModData().DTcaffeineOnBody > 0 and player:HasTrait("AddictedToCaffeine") then
            MF.getMoodle("dtcaffeine"):setValue(0.6);
            --print("Moodle 1 positive")
        elseif player:getModData().DTtimeSinceLastCaffeine > 1440 and player:HasTrait("AddictedToCaffeine") then
            MF.getMoodle("dtcaffeine"):setValue(0.4);
            --print("Moodle 1 negative")
        else
            MF.getMoodle("dtcaffeine"):setValue(0.5);
            --print("No Moodle")
        end
    end
end

-- FOOD ALLERGY MOODLE
function foodAllergyMoodleUpdate(player)
    --print("Player food allergy: " .. player:getModData().DTFoodAllergy);
    if player:getModData().DTFoodAllergy > 20 and player:getModData().DTFoodAllergy <= 40 then
        MF.getMoodle("dtfoodallergy"):setValue(0.4);
        --print("Moodle 1")
    elseif player:getModData().DTFoodAllergy > 40 and player:getModData().DTFoodAllergy <= 60 then
        MF.getMoodle("dtfoodallergy"):setValue(0.3);
        --print("Moodle 2")
    elseif player:getModData().DTFoodAllergy > 60 and player:getModData().DTFoodAllergy <= 80 then
        MF.getMoodle("dtfoodallergy"):setValue(0.2);
        --print("Moodle 3")
    elseif player:getModData().DTFoodAllergy > 80 and player:getModData().DTFoodAllergy <= 100 then
        MF.getMoodle("dtfoodallergy"):setValue(0.1);
        --print("Moodle 4")
    else
        MF.getMoodle("dtfoodallergy"):setValue(0.5);
        --print("No Moodle")
    end
end

-- PILLS ALLERGY MOODLE
function pillsAllergyMoodleUpdate(player)
    --print("Player pills allergy: " .. player:getModData().DTDrugsAllergy);
    if player:getModData().DTDrugsAllergy > 20 and player:getModData().DTDrugsAllergy <= 40 then
        MF.getMoodle("dtpillsallergy"):setValue(0.4);
        --print("Moodle 1")
    elseif player:getModData().DTDrugsAllergy > 40 and player:getModData().DTDrugsAllergy <= 60 then
        MF.getMoodle("dtpillsallergy"):setValue(0.3);
        --print("Moodle 2")
    elseif player:getModData().DTDrugsAllergy > 60 and player:getModData().DTDrugsAllergy <= 80 then
        MF.getMoodle("dtpillsallergy"):setValue(0.2);
        --print("Moodle 3")
    elseif player:getModData().DTDrugsAllergy > 80 and player:getModData().DTDrugsAllergy <= 100 then
        MF.getMoodle("dtpillsallergy"):setValue(0.1);
        --print("Moodle 4")
    else
        MF.getMoodle("dtpillsallergy"):setValue(0.5);
        --print("No Moodle")
    end
end