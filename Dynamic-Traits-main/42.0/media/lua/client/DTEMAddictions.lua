-- SMOKER TRAIT
function DTEMsmokerTrait(player)
    --print("DT Logger: running smokerTrait function");
    local currentTimeSinceLastSmoke = player:getTimeSinceLastSmoke();
    if currentTimeSinceLastSmoke == 10 then
        player:getModData().DTEMdaysSinceLastSmoke = player:getModData().DTEMdaysSinceLastSmoke + 1;
        if ZombRand(25) == 0 then
            player:getModData().DTEMdaysSinceLastSmoke = player:getModData().DTEMdaysSinceLastSmoke + DTEMluckyUnluckyModifier(player, 7);
        end
    else
        player:getModData().DTEMdaysSinceLastSmoke = player:getModData().DTEMdaysSinceLastSmoke - 5;
        if ZombRand(25) == 0 then
            player:getModData().DTEMdaysSinceLastSmoke = player:getModData().DTEMdaysSinceLastSmoke + DTEMluckyUnluckyModifier(player, 7);
        end
    end
    -- CHECK THE VALUE TO KEEP IT INTO THE LIMITS
    if player:getModData().DTEMdaysSinceLastSmoke < 0 then
        player:getModData().DTEMdaysSinceLastSmoke = 0;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE SMOKER
    if player:getModData().DTEMdaysSinceLastSmoke >= 1080 then
        player:setTimeSinceLastSmoke(0);
        player:getStats():setStressFromCigarettes(0);
        player:getTraits():remove("Smoker");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Smoker"), false, HaloTextHelper.getColorGreen());
    end
    --print("DT Logger: DTdaysSinceLastSmoke value is " .. player:getModData().DTEMdaysSinceLastSmoke);
end

function DTEMsmokerCough(player)
    --print("DT Logger: running smokerCough function");
    local currentTimeSinceLastSmoke = player:getTimeSinceLastSmoke();
    local currentEndurance = player:getStats():getEndurance();
    if (currentEndurance < 0.5 or currentTimeSinceLastSmoke < 2) and ZombRand(10) == 0 then
        player:Say(getText("IGUI_PlayerText_Cough"));
        player:playEmote("dtcough");
        addSound(player, player:getX(), player:getY(), player:getZ(), 10, 10);
    end
end

-- ALCOHOLIC TRAIT
function DTEMalcoholicTrait(player)
    --print("DT Logger: running DTEMalcoholicTrait function");
    if player:getMoodles():getMoodleLevel(MoodleType.Drunk) == 0 then
        player:getModData().DTEMalcoholicTrait = player:getModData().DTEMalcoholicTrait + 1;
        player:getModData().DTEMtimeSinceLastDrink = player:getModData().DTEMtimeSinceLastDrink + 1;
        -- Checks if the player has the Alcoholic trait
        if player:HasTrait("Alcoholic") then
            -- Checks if the player haven't drink for at least 24 hours
            if player:getModData().DTEMtimeSinceLastDrink > 1440 then
                --print("Apply effects for more than 24 hours")
                -- ANGER
                DTEMincreaseAnger(player, ZombRand(60), 0.20);
                -- STRESS
                DTEMincreaseStress(player, ZombRand(55), 0.10);
                -- UNHAPPYNESS
                DTEMincreaseUnhappiness(player, ZombRand(60), 3);
            end
            -- Checks if the player haven't drink for at least 48 hours
            if player:getModData().DTEMtimeSinceLastDrink > 2880 then
                --print("Apply effects for more than 48 hours")
                -- FATIGUE
                DTEMincreaseFatigue(player, ZombRand(70), 0.05);
                -- HEADACHE
                DTEMapplyPain(player, ZombRand(180), "Head", ZombRand(75));
            end
            -- Checks if the player haven't drink for at least 72 hours
            if player:getModData().DTEMtimeSinceLastDrink > 4320 then
                --print("Apply effects for more than 72 hours")
                -- POISON
                DTEMincreaseFoodSickness(player, ZombRand(70), ZombRand(15));
            end
        end
    else
        player:getModData().DTEMalcoholicTrait = player:getModData().DTEMalcoholicTrait - (player:getMoodles():getMoodleLevel(MoodleType.Drunk) * 3);
        player:getModData().DTEMtimeSinceLastDrink = 0;
    end
    if ZombRand(30) == 0 then
        player:getModData().DTEMalcoholicTrait = player:getModData().DTEMalcoholicTrait + DTEMluckyUnluckyModifier(player, 30);
    end

    -- Checks the value too keep it between the limits
    if player:getModData().DTEMtimeSinceLastDrink > 4500 then
        player:getModData().DTEMtimeSinceLastDrink = 4500;
    end
    if player:getModData().DTEMalcoholicTrait > 50000 then
        player:getModData().DTEMalcoholicTrait = 50000;
    elseif player:getModData().DTEMalcoholicTrait < -50000 then
        player:getModData().DTEMalcoholicTrait = -50000;
    end
    -- Checks if the player achieved the requirements to remove/obtain Alcoholic
    if player:HasTrait("Alcoholic") and player:getModData().DTEMalcoholicTrait > 44640 then
        player:getTraits():remove("Alcoholic");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Alcoholic"), false, HaloTextHelper.getColorGreen());
    elseif not player:HasTrait("Alcoholic") and player:getModData().DTEMalcoholicTrait < -44640 then
        player:getTraits():add("Alcoholic");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Alcoholic"), true, HaloTextHelper.getColorRed());
    end
    --print("DT Logger: DTEMalcoholicTrait value is " .. player:getModData().DTEMalcoholicTrait);
    --print("DT Logger: DTEMtimeSinceLastDrink value is " .. player:getModData().DTEMtimeSinceLastDrink);
end

-- ADDICTED TO CAFFEINE TRAIT
function DTEMaddictedToCaffeineTrait(player)
    --print("DT Logger: running DTEMaddictedToCaffeineTrait function");
    player:getModData().DTEMtimeSinceLastCaffeine = player:getModData().DTEMtimeSinceLastCaffeine + 1;
    player:getModData().DTEMcaffeineOnBody = player:getModData().DTEMcaffeineOnBody - 1;
    -- Caffeine on body, progressing to obtain the trait
    if player:getModData().DTEMcaffeineOnBody > 0 then
        --print("Caffeine on body")
        player:getModData().DTEMaddictedToCaffeineTrait = player:getModData().DTEMaddictedToCaffeineTrait - 1;
        -- Caffeine on body and the trait is present, decreasing stress, anger and fatigue.
        if player:HasTrait("AddictedToCaffeine") then
            --print("The trait is present, positively affecting the player")
            DTEMdecreaseStress(player, 0.01);
            DTEMdecreaseAnger(player, 0.01);
            DTEMdecreaseFatigue(player, ZombRand(10), 0.01);
        end
    -- 24 hours without caffeine, progressing to remove the trait
    elseif player:getModData().DTEMtimeSinceLastCaffeine > 1440 then
        --print("More than 24 hours without caffeine")
        player:getModData().DTEMaddictedToCaffeineTrait = player:getModData().DTEMaddictedToCaffeineTrait + 1;
        -- 24 hours without caffeine and the trait is present, increasing stress, anger and fatigue.
        if player:HasTrait("AddictedToCaffeine") then
            --print("Trait is present, negatively affecting the player")
            DTEMincreaseStress(player, ZombRand(90),0.15);
            DTEMincreaseAnger(player, ZombRand(90),0.15);
            -- During the day the fatigue increases
            if getGameTime():getHour() > 6 and getGameTime():getHour() < 20 and
            player:getModData().DTEMtimeSinceLastCaffeine > 1440 and player:getModData().DTEMtimeSinceLastCaffeine < 7200 then
                --print("Day hour, increasing fatigue")
                DTEMincreaseFatigue(player, ZombRand(45), 0.01);
            end
            DTEMapplyPain(player, ZombRand(360), "Head", ZombRand(75));
        end
    end

    -- Between 24 and 120 hours without caffeine being an addicted. During the night the fatigue decreases (Insomnia).
    if player:HasTrait("AddictedToCaffeine") then
        if (getGameTime():getHour() <= 6 or getGameTime():getHour() >= 20) and
        player:getModData().DTEMtimeSinceLastCaffeine > 1440 and player:getModData().DTEMtimeSinceLastCaffeine < 7200 then
            --print("Night hour, decreasing fatigue")
            DTEMdecreaseFatigue(player, ZombRand(30), 0.01);
        end
    end

    -- Checks the values too keep them between the limits
    if player:getModData().DTEMcaffeineOnBody < 0 then
        player:getModData().DTEMcaffeineOnBody = 0;
    elseif player:getModData().DTEMcaffeineOnBody > 2500 then
        player:getModData().DTEMcaffeineOnBody = 2500;
    end
    if player:getModData().DTEMtimeSinceLastCaffeine > 7500 then
        player:getModData().DTEMtimeSinceLastCaffeine = 7500;
    end
    if player:getModData().DTEMaddictedToCaffeineTrait > 28800 then
        player:getModData().DTEMaddictedToCaffeineTrait = 28800;
    elseif player:getModData().DTEMaddictedToCaffeineTrait < -28800 then
        player:getModData().DTEMaddictedToCaffeineTrait = -28800;
    end

    -- Checks the values to see if the player can obtain or remove the trait
    if player:HasTrait("AddictedToCaffeine") and player:getModData().DTEMaddictedToCaffeineTrait > 20160 then
        player:getTraits():remove("AddictedToCaffeine");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AddictedToCaffeine"), false, HaloTextHelper.getColorGreen());
    elseif not player:HasTrait("AddictedToCaffeine") and player:getModData().DTEMaddictedToCaffeineTrait < -20160 then
        player:getTraits():add("AddictedToCaffeine");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AddictedToCaffeine"), true, HaloTextHelper.getColorRed());
    end

    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTEMcaffeineOnBody);
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTEMtimeSinceLastCaffeine);
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTEMaddictedToCaffeineTrait);
end