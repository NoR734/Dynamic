function DTEMtraitsByMoods(player)
    --print("DT Logger: running traitsByMoods function");
    if player:getMoodles():getMoodleLevel(MoodleType.BORED) == 0 and player:getMoodles():getMoodleLevel(MoodleType.UNHAPPY) == 0 and
    player:getMoodles():getMoodleLevel(MoodleType.STRESS) == 0 and player:getMoodles():getMoodleLevel(MoodleType.HUNGRY) == 0 then
        if not DTEMHasTrait(player, "NeedsLessSleep") then
            DTEMAddTrait(player, "NeedsLessSleep");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LessSleep"), true, HaloTextHelper.getColorGreen());
        end
    else
        if DTEMHasTrait(player, "NeedsLessSleep") then
            DTEMRemoveTrait(player, "NeedsLessSleep");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LessSleep"), false, HaloTextHelper.getColorRed());
        end
    end
    -- Gain trait "Needs More Sleep" when Bored Moodle is Lv2 or more and remove it otherwise.
    if player:getMoodles():getMoodleLevel(MoodleType.BORED) >= 2 then
        if not DTEMHasTrait(player, "NeedsMoreSleep") then
            DTEMAddTrait(player, "NeedsMoreSleep");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_MoreSleep"), true, HaloTextHelper.getColorRed());
        end
    else
        if DTEMHasTrait(player, "NeedsMoreSleep") then
            DTEMRemoveTrait(player, "NeedsMoreSleep");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_MoreSleep"), false, HaloTextHelper.getColorGreen());
        end
    end
    -- Gain trait "Insomniac" when Unhappy or Hungry Moodles are at Lv3 or more and remove it otherwise.
    if player:getMoodles():getMoodleLevel(MoodleType.UNHAPPY) >= 3 or player:getMoodles():getMoodleLevel(MoodleType.HUNGRY) >= 3 then
        if not DTEMHasTrait(player, "Insomniac") then
            DTEMAddTrait(player, "Insomniac");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Insomniac"), true, HaloTextHelper.getColorRed());
        end
    else
        if DTEMHasTrait(player, "Insomniac") then
            DTEMRemoveTrait(player, "Insomniac");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Insomniac"), false, HaloTextHelper.getColorGreen());
        end
    end
    -- Gain trait "Nightmares" when Stress Moodle is Lv3 or more and remove it otherwise.
    if player:getMoodles():getMoodleLevel(MoodleType.STRESS) >= 3 and not DTEMHasTrait(player, "Desensitized") then
        if not DTEMHasTrait(player, "Nightmares") then
            DTEMAddTrait(player, "Nightmares");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Nightmares"), true, HaloTextHelper.getColorRed());
        end
    else
        if DTEMHasTrait(player, "Nightmares") then
            DTEMRemoveTrait(player, "Nightmares");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Nightmares"), false, HaloTextHelper.getColorGreen());
        end
    end
    -- Gain trait "Hearty Appitite" when Stress or Unhappy Moodles are Lv3 or more and remove it otherise.
    if player:getMoodles():getMoodleLevel(MoodleType.STRESS) >= 3 or player:getMoodles():getMoodleLevel(MoodleType.UNHAPPY) >= 3 then
        if not DTEMHasTrait(player, "HeartyAppitite") then
            if DTEMHasTrait(player, "LightEater") then
                DTEMRemoveTrait(player, "LightEater");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lighteater"), false, HaloTextHelper.getColorRed());
            end
            DTEMAddTrait(player, "HeartyAppitite");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_heartyappetite"), true, HaloTextHelper.getColorRed());
        end
    else
        if DTEMHasTrait(player, "HeartyAppitite") and not (DTEMHasTrait(player, "Overweight") or DTEMHasTrait(player, "Obese") or
        DTEMHasTrait(player, "Strong") or DTEMHasTrait(player, "Stout")) then
            DTEMRemoveTrait(player, "HeartyAppitite");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_heartyappetite"), false, HaloTextHelper.getColorGreen());
        end
    end
end

-- NIGHTMARES TRAITS
function DTEMnightmaresTrait(player)
    --print("DT Logger: running nightmaresTrait function");
    if DTEMHasTrait(player, "Nightmares") and player:isAsleep() and ZombRand(100) == 0 then
        player:forceAwake();
        DTEMSetStatValue(player:getStats(), "PANIC", "setPanic", 95);
        DTEMincreaseStress(player, 0, 0.5);
        DTEMincreaseWetness(player, 0, ZombRand(99));
    end
end
