require "TimedActions/ISTakePillAction"

local og_ISTakePillAction_perform = ISTakePillAction.perform
function ISTakePillAction:perform()
    og_ISTakePillAction_perform(self)
    --print("DT Logger: running ISTakePillAction:perform function")
    --print("DT Logger: Just took a " .. self.item:getType() .. " pill")
    local player = self.character
    local pill = self.item
    -- ANTIDEPRESSANTS
    if pill:getType() == "PillsAntiDep" then
        DTEMhandleAntidepressantsConsumption(player)
    -- BETABLOCKERS
    elseif pill:getType() == "PillsBeta" then
        DTEMhandleBetaBlockersConsumption(player)
    elseif pill:getType() == "PillsVitamins" then
        DTEMhandleVitaminsConsumption(player)
    end
    --print("DT Logger: DTEMoverdose value is " .. player:getModData().DTEMoverdose);
    --print("DT Logger: DTEMallergy value is " .. player:getModData().DTEMallergy);
end

function DTEMcheckReduceInfectionPower(player)
    --print("DT Logger: running DTEMcheckReduceInfectionPower function");
    if player:getReduceInfectionPower() > 0 and DTEMHasTrait(player, "PillsAllergy") then
        if ZombRand(9) == 0 then
            DTEMallergyIncrease(player, (player:getReduceInfectionPower() / 4));
        end
    end
end

function DTEMhandleAntidepressantsConsumption(player)
    --print("DT Logger: running DTEMhandleAntidepressantsConsumption function")
    -- Set recentlyConsumedAntidepressants to true
    player:getModData().DTEMrecentlyConsumedAntidepressants = 72
    if player:getModData().DTEMisMelancholic then
        player:getModData().DTEMmelancholicTrait = player:getModData().DTEMmelancholicTrait - 48
    end

    -- If counter is lower than 0, remove Melancholic trait
    if player:getModData().DTEMmelancholicTrait <= 0 then
        DTEMremoveTrait(player, "Melancholic", "UI_trait_Melancholic", HaloTextHelper.getColorGreen())
    end

    -- Overdose increase
    DTEMoverdoseIncrease(player, 12)
    -- If player has the PillsAllergy trait, increase allergy
    if DTEMHasTrait(player, "PillsAllergy") then
        DTEMallergyIncrease(player, 30)
    end
end

function DTEMmelancholicTrait(player)
    --print("DT Logger: running DTEMmelancholicTrait function")
    if player:getModData().DTEMrecentlyConsumedAntidepressants == 0 then
        --print("DT Logger: haven't consumed antidepressants recently")
        -- If haven't consumed antidepressants recently, increase counter
        if player:getModData().DTEMisMelancholic then
            --print("DT Logger: is Melancholic")
            player:getModData().DTEMmelancholicTrait = player:getModData().DTEMmelancholicTrait + 1

            -- If counter is greater than 0, add Melancholic trait
            if player:getModData().DTEMmelancholicTrait > 0 then
                DTEMaddTrait(player, "Melancholic", "UI_trait_Melancholic", HaloTextHelper.getColorRed())
            end

            if player:getModData().DTEMmelancholicTrait > 720 then
                player:getModData().DTEMmelancholicTrait = 720
            end

        end
    else
        --print("DT Logger: have consumed antidepressants recently")
        --print("DT Logger: DTEMrecentlyConsumedAntidepressants value is " .. player:getModData().DTEMrecentlyConsumedAntidepressants)
        if player:getModData().DTEMisMelancholic == true then
            --print("DT Logger: is Melancholic")
            -- Decreases counter by 1
            player:getModData().DTEMmelancholicTrait = player:getModData().DTEMmelancholicTrait - 1

            -- If counter is lower than 0, remove Melancholic trait
            if player:getModData().DTEMmelancholicTrait <= 0 then
                DTEMremoveTrait(player, "Melancholic", "UI_trait_Melancholic", HaloTextHelper.getColorGreen())
            end

            if player:getModData().DTEMmelancholicTrait < -720 then
                player:getModData().DTEMmelancholicTrait = -720
            end
        end
    end

    -- Every hour reduces the antidepressants effect by 1
    player:getModData().DTEMrecentlyConsumedAntidepressants = player:getModData().DTEMrecentlyConsumedAntidepressants - 1
    if player:getModData().DTEMrecentlyConsumedAntidepressants < 0 then
        player:getModData().DTEMrecentlyConsumedAntidepressants = 0
    end

    if DTEMHasTrait(player, "Melancholic") then
        DTEMincreaseUnhappiness(player, 0, 3);
    end

    --print("DT Logger: DTEMmelancholicTrait value is " .. player:getModData().DTEMmelancholicTrait);
end

function DTEMhandleBetaBlockersConsumption(player)
    --print("DT Logger: running DTEMhandleBetaBlockersConsumption function")
    -- Set recentlyConsumedAntidepressants to true
    player:getModData().DTEMrecentlyConsumedBetaBlockers = 72
    if player:getModData().DTEMisNervousWreck then
        player:getModData().DTEMnervousWreckTrait = player:getModData().DTEMnervousWreckTrait - 48
    end
    -- If counter is lower than 0, remove Nervous Wreck trait
    if player:getModData().DTEMnervousWreckTrait <= 0 then
        DTEMremoveTrait(player, "NervousWreck", "UI_trait_NervousWreck", HaloTextHelper.getColorGreen())
    end

    -- Overdose increase
    DTEMoverdoseIncrease(player, 12)
    -- If player has the PillsAllergy trait, increase allergy
    if DTEMHasTrait(player, "PillsAllergy") then
        DTEMallergyIncrease(player, 30)
    end
end

function DTEMnervousWreckTrait(player)
    --print("DT Logger: running DTEMnervousWreckTrait function")
    if player:getModData().DTEMrecentlyConsumedBetaBlockers == 0 then
        --print("DT Logger: haven't consumed betablockers recently")
        -- If haven't consumed antidepressants recently, increase counter
        if player:getModData().DTEMisNervousWreck == true then
            --print("DT Logger: is Nervous Wreck")
            player:getModData().DTEMnervousWreckTrait = player:getModData().DTEMnervousWreckTrait + 1

            -- If counter is greater than 0, add Melancholic trait
            if player:getModData().DTEMnervousWreckTrait > 0 then
                DTEMaddTrait(player, "NervousWreck", "UI_trait_NervousWreck", HaloTextHelper.getColorRed())
            end

            if player:getModData().DTEMnervousWreckTrait > 720 then
                player:getModData().DTEMnervousWreckTrait = 720
            end

        end
    else
        --print("DT Logger: have consumed betablockers recently")
        --print("DT Logger: DTEMrecentlyConsumedBetaBlockers value is " .. player:getModData().DTEMrecentlyConsumedBetaBlockers)
        if player:getModData().DTEMisNervousWreck == true then
            --print("DT Logger: is Nervous Wreck")
            -- Decreases counter by 1
            player:getModData().DTEMnervousWreckTrait = player:getModData().DTEMnervousWreckTrait - 1



            -- If counter is lower than 0, remove Nervous Wreck trait
            if player:getModData().DTEMnervousWreckTrait <= 0 then
                DTEMremoveTrait(player, "NervousWreck", "UI_trait_NervousWreck", HaloTextHelper.getColorGreen())
            end

            if player:getModData().DTEMnervousWreckTrait < -720 then
                player:getModData().DTEMnervousWreckTrait = -720
            end
        end
    end

    -- Every hour reduces the betablockers effect by 1
    player:getModData().DTEMrecentlyConsumedBetaBlockers = player:getModData().DTEMrecentlyConsumedBetaBlockers - 1
    if player:getModData().DTEMrecentlyConsumedBetaBlockers < 0 then
        player:getModData().DTEMrecentlyConsumedBetaBlockers = 0
    end

    if DTEMHasTrait(player, "NervousWreck") then
        DTEMincreaseStress(player, 0, 0.1)
    end

    --print("DT Logger: DTEMnervousWreckTrait value is " .. player:getModData().DTEMnervousWreckTrait)
end

function DTEMpillsTraitsDevelopment(player)
    --print("DT Logger: running DTEMpillsTraitsDevelopment function")
    --print("DT Logger: DTEMisMelancholic value is: " .. tostring(player:getModData().DTEMisMelancholic))
    --print("DT Logger: DTEMisNervousWreck value is: " .. tostring(player:getModData().DTEMisNervousWreck))

    -- Earn the traits (only after the first week of survival)
    if player:getHoursSurvived() > 168 then
        --print("DT Logger: player has survived more than a week")
        if player:getModData().DTEMisMelancholic == false and player:getMoodles():getMoodleLevel(MoodleType.Unhappy) ~= 0 then
            local range = player:getHoursSurvived() / player:getMoodles():getMoodleLevel(MoodleType.Unhappy)
            --print("Hours survived: " .. player:getHoursSurvived());
            --print("Unhappy moodle level: " .. player:getMoodles():getMoodleLevel(MoodleType.Unhappy));
            --print("Range: " .. range);
            if ZombRand(range) == 0 then
                player:getModData().DTEMisMelancholic = true
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Melancholic"), true, HaloTextHelper.getColorRed())
            end
        end
        if player:getModData().DTEMisNervousWreck == false and player:getMoodles():getMoodleLevel(MoodleType.Stress) ~= 0 then
            local range = player:getHoursSurvived() / player:getMoodles():getMoodleLevel(MoodleType.Stress)
            --print("Hours survived: " .. player:getHoursSurvived());
            --print("Stress moodle level: " .. player:getMoodles():getMoodleLevel(MoodleType.Stress));
            --print("Range: " .. range);
            if ZombRand(range) == 0 then
                player:getModData().DTEMisNervousWreck = true
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_NervousWreck"), true, HaloTextHelper.getColorRed())
            end
        end
    end

    -- Remove the traits
    if player:getModData().DTEMmelancholicTrait == -150 then
        player:getModData().DTEMisMelancholic = false
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Melancholic"), false, HaloTextHelper.getColorGreen())
        player:getModData().DTEMmelancholicTrait = 0
    end
    if player:getModData().DTEMnervousWreckTrait == -150 then
        player:getModData().DTEMisNervousWreck = false
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_NervousWreck"), false, HaloTextHelper.getColorGreen())
        player:getModData().DTEMnervousWreckTrait = 0
    end
end

function DTEMhandleVitaminsConsumption(player)
    -- Overdose increase
    DTEMoverdoseIncrease(player, 10)
    -- If player has the PillsAllergy trait, increase allergy
    if DTEMHasTrait(player, "PillsAllergy") then
        DTEMallergyIncrease(player, 15)
    end
    player:getModData().DTEMtimeSinceLastCaffeine = 0
    player:getModData().DTEMcaffeineOnBody = player:getModData().DTEMcaffeineOnBody + 50
    player:getModData().DTEMaddictedToCaffeineTrait = player:getModData().DTEMaddictedToCaffeineTrait - 100
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTEMtimeSinceLastCaffeine)
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTEMcaffeineOnBody)
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTEMaddictedToCaffeineTrait)
end