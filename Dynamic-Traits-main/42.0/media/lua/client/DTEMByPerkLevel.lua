-- Traits gains based on skills levels are going to be handled in this function.
function DTEMtraitsGainsByLevel(player, perk, perkLevel)
    --print("DT Logger: running traitsGainsByLevel function");
    -- CALL TO INITIALIZATIONS METHOD TO PREVENT LUA ERRORS WHEN A CHARACTER IS CREATED AND HAS PERK LEVELS (THE LEVEL PERK EVENT IS CALLED WHEN THE ASSIGNING THE STARTING PERK LEVELS)
    if player:getModData().DTEMslowFastLearnerTraits == nil or player:getModData().DTEMkeenHearingHardOfHearingTraits == nil then
        DTEMBaseGameCharacterDetails.DoExistingCharacterInitializations(player);
    end

    if perk == Perks.Sprinting then

    elseif perk == Perks.Sneak then
        player:getModData().DTEMkeenHearingHardOfHearingTraits = player:getModData().DTEMkeenHearingHardOfHearingTraits + 1;
    elseif perk == Perks.Lightfoot then
        player:getModData().DTEMkeenHearingHardOfHearingTraits = player:getModData().DTEMkeenHearingHardOfHearingTraits + 1;
    elseif perk == Perks.Nimble then
        player:getModData().DTEMkeenHearingHardOfHearingTraits = player:getModData().DTEMkeenHearingHardOfHearingTraits + 1;
    elseif perk == Perks.Aiming then
        player:getModData().DTEMkeenHearingHardOfHearingTraits = player:getModData().DTEMkeenHearingHardOfHearingTraits + 1;
    elseif perk == Perks.Reloading then

    elseif perk == Perks.Maintenance then

    elseif perk == Perks.Axe then
        player:getModData().DTEMkeenHearingHardOfHearingTraits = player:getModData().DTEMkeenHearingHardOfHearingTraits + 1;
    elseif perk == Perks.Blunt then
        player:getModData().DTEMkeenHearingHardOfHearingTraits = player:getModData().DTEMkeenHearingHardOfHearingTraits + 1;
    elseif perk == Perks.SmallBlunt then
        player:getModData().DTEMkeenHearingHardOfHearingTraits = player:getModData().DTEMkeenHearingHardOfHearingTraits + 1;
    elseif perk == Perks.LongBlade then
        player:getModData().DTEMkeenHearingHardOfHearingTraits = player:getModData().DTEMkeenHearingHardOfHearingTraits + 1;
    elseif perk == Perks.SmallBlade then
        player:getModData().DTEMkeenHearingHardOfHearingTraits = player:getModData().DTEMkeenHearingHardOfHearingTraits + 1;
    elseif perk == Perks.Spear then
        player:getModData().DTEMkeenHearingHardOfHearingTraits = player:getModData().DTEMkeenHearingHardOfHearingTraits + 1;
    elseif perk == Perks.Woodwork then
        player:getModData().DTEMslowFastLearnerTraits = player:getModData().DTEMslowFastLearnerTraits + 1;
    elseif perk == Perks.Cooking then
        player:getModData().DTEMslowFastLearnerTraits = player:getModData().DTEMslowFastLearnerTraits + 1;
    elseif perk == Perks.Farming then
        player:getModData().DTEMslowFastLearnerTraits = player:getModData().DTEMslowFastLearnerTraits + 1;
    elseif perk == Perks.Doctor then
        player:getModData().DTEMslowFastLearnerTraits = player:getModData().DTEMslowFastLearnerTraits + 1;
    elseif perk == Perks.Electricity then
        player:getModData().DTEMslowFastLearnerTraits = player:getModData().DTEMslowFastLearnerTraits + 1;
    elseif perk == Perks.MetalWelding then
        player:getModData().DTEMslowFastLearnerTraits = player:getModData().DTEMslowFastLearnerTraits + 1;
    elseif perk == Perks.Mechanics then
        player:getModData().DTEMslowFastLearnerTraits = player:getModData().DTEMslowFastLearnerTraits + 1;
    elseif perk == Perks.Tailoring then
        player:getModData().DTEMslowFastLearnerTraits = player:getModData().DTEMslowFastLearnerTraits + 1;
    elseif perk == Perks.Fishing then
        player:getModData().DTEMslowFastLearnerTraits = player:getModData().DTEMslowFastLearnerTraits + 1;
    elseif perk == Perks.Trapping then
        player:getModData().DTEMslowFastLearnerTraits = player:getModData().DTEMslowFastLearnerTraits + 1;
    elseif perk == Perks.PlantScavenging then
        player:getModData().DTEMkeenHearingHardOfHearingTraits = player:getModData().DTEMkeenHearingHardOfHearingTraits + 1;
        player:getModData().DTEMslowFastLearnerTraits = player:getModData().DTEMslowFastLearnerTraits + 1;
    end

    if DTEMHasProfession(player, "unemployed") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "fireofficer") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 5);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 5);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 5);
            DTEMaddBrawlerTrait(player, 5, 7);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 5, 7);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 5);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 6);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 6);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "policeofficer") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 4);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 5);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 5);
            DTEMaddGunFanTrait(player, 4, 2);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 4, 2);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 4);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 6);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 6);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "parkranger") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 5);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 5, 5, 5, 5);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 5);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 5, 5, 5, 5);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 5);
            DTEMaddBrawlerTrait(player, 6, 8);
            DTEMaddAxemanTrait(player, 7);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 6, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 5);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 5, 5, 5, 5);
            DTEMaddPiercerTrait(player, 4);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 5);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 6);
            DTEMaddHandyTrait(player, 8);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 7);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 5);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 5, 5, 5, 5);
            DTEMaddFormerScoutTrait(player, 2, 4);
            DTEMaddHikerTrait(player, 3, 6);
            DTEMaddTrapperTrait(player, 4);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 2, 4);
            DTEMaddHikerTrait(player, 3, 6);
            DTEMaddForagerTrait(player, 5);
        end
    elseif DTEMHasProfession(player, "constructionworker") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 5);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 4);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 5);
            DTEMaddHandyTrait(player, 7);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 3);
            DTEMaddElectricalTechnicianTrait(player, 5);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 6);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 6);
            DTEMaddAmateurMechanicTrait(player, 8);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "securityguard") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 4);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 5);
            DTEMaddGunFanTrait(player, 4, 2);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 4, 2);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 4);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 6);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "carpenter") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 5);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 4);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 6);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 5);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 3);
            DTEMaddElectricalTechnicianTrait(player, 5);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 6);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "burglar") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 4);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 5);
            DTEMaddSneakyTrait(player, 6);
            DTEMaddInconspicuousTrait(player, 8);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 5);
            DTEMaddLightfootedTrait(player, 6);
            DTEMaddGymnastTrait(player, 6, 4);
            DTEMaddGracefulTrait(player, 8);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 6, 4);
            DTEMaddNimbleTrait(player, 4);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 4);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 4);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "chef") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 4);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 5);
            DTEMaddCookTrait(player, 6);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 7);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "repairman") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 4);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 4);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 5);
            DTEMaddHandyTrait(player, 7);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "farmer") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 5);
            DTEMaddBrawlerTrait(player, 6, 8);
            DTEMaddAxemanTrait(player, 7);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 6, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 6);
            DTEMaddCookTrait(player, 7);
            DTEMaddNutritionistTrait(player, 8);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 6);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 5);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMaddFormerScoutTrait(player, 2, 4);
            DTEMaddHikerTrait(player, 3, 6);
            DTEMaddTrapperTrait(player, 4);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 2, 4);
            DTEMaddHikerTrait(player, 3, 6);
            DTEMaddForagerTrait(player, 5);
        end
    elseif DTEMHasProfession(player, "fisherman") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 5);
            DTEMaddBrawlerTrait(player, 6, 8);
            DTEMaddAxemanTrait(player, 7);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 6, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMaddPiercerTrait(player, 5);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 5);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 6);
            DTEMaddCookTrait(player, 7);
            DTEMaddNutritionistTrait(player, 8);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 5);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMaddFormerScoutTrait(player, 2, 4);
            DTEMaddHikerTrait(player, 3, 6);
            DTEMaddTrapperTrait(player, 4);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 2, 4);
            DTEMaddHikerTrait(player, 3, 6);
            DTEMaddForagerTrait(player, 5);
        end
    elseif DTEMHasProfession(player, "doctor") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 5);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 5);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "veteran") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 5);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 5, 5, 5, 5);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 5);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 5, 5, 5, 5);
            DTEMaddEagleEyeTrait(player, 5);
            DTEMaddGunFanTrait(player, 4, 2);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 4, 2);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 5);
            DTEMaddBrawlerTrait(player, 6, 8);
            DTEMaddAxemanTrait(player, 7);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 6, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 5);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 6);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 5, 5, 5, 5);
            DTEMaddPiercerTrait(player, 5);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 6);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 6);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 5, 5, 5, 5);
            DTEMaddFormerScoutTrait(player, 3, 5);
            DTEMaddHikerTrait(player, 4, 7);
            DTEMaddTrapperTrait(player, 5);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 3, 5);
            DTEMaddHikerTrait(player, 4, 7);
            DTEMaddForagerTrait(player, 6);
        end
    elseif DTEMHasProfession(player, "nurse") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 5);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 5);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "lumberjack") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 5);
            DTEMaddBrawlerTrait(player, 5, 7);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 5, 7);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 6);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 6);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 6);
            DTEMaddHandyTrait(player, 8);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 6);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 6, 6, 6, 6);
            DTEMaddFormerScoutTrait(player, 3, 5);
            DTEMaddHikerTrait(player, 4, 7);
            DTEMaddTrapperTrait(player, 5);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 3, 5);
            DTEMaddHikerTrait(player, 4, 7);
            DTEMaddForagerTrait(player, 6);
        end
    elseif DTEMHasProfession(player, "fitnessInstructor") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 4);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 5);
            DTEMaddCookTrait(player, 6);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 5);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "burgerflipper") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 4);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 5);
            DTEMaddCookTrait(player, 6);
            DTEMaddNutritionistTrait(player, 7);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 7);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "electrician") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 6);
            DTEMaddHandyTrait(player, 8);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddElectricalTechnicianTrait(player, 4);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 6);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 6);
            DTEMaddAmateurMechanicTrait(player, 8);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "engineer") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 5);
            DTEMaddHandyTrait(player, 7);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 2);
            DTEMaddElectricalTechnicianTrait(player, 4);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 5);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 5);
            DTEMaddAmateurMechanicTrait(player, 7);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "metalworker") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 6);
            DTEMaddHandyTrait(player, 8);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 3);
            DTEMaddElectricalTechnicianTrait(player, 5);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 5);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 5);
            DTEMaddAmateurMechanicTrait(player, 7);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    elseif DTEMHasProfession(player, "mechanics") then
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 6);
            DTEMaddHandyTrait(player, 8);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 3);
            DTEMaddElectricalTechnicianTrait(player, 5);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 5);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 5);
            DTEMaddAmateurMechanicTrait(player, 7);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    else
        if perk == Perks.Sprinting then
            DTEMaddJoggerTrait(player, 6);
        elseif perk == Perks.Sneak then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMremoveConspicuousTrait(player, 7);
            DTEMaddSneakyTrait(player, 8);
            DTEMaddInconspicuousTrait(player, 10);
        elseif perk == Perks.Lightfoot then
            DTEMremoveClumsyTrait(player, 7);
            DTEMaddLightfootedTrait(player, 8);
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddGracefulTrait(player, 10);
        elseif perk == Perks.Nimble then
            DTEMaddGymnastTrait(player, 8, 5);
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddNimbleTrait(player, 7);
        elseif perk == Perks.Aiming then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddEagleEyeTrait(player, 7);
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Reloading then
            DTEMaddGunFanTrait(player, 6, 4);
        elseif perk == Perks.Maintenance then
            DTEMaddDurabileTrait(player, 7);
        elseif perk == Perks.Axe then
            DTEMaddCutterTrait(player, 7);
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddAxemanTrait(player, 10);
        elseif perk == Perks.Blunt then
            DTEMaddBrawlerTrait(player, 7, 8);
            DTEMaddBaseballPlayerTrait(player, 6);
        elseif perk == Perks.SmallBlunt then
            DTEMaddCrusherTrait(player, 6);
        elseif perk == Perks.LongBlade then
            DTEMaddSwordsmanTrait(player, 7);
        elseif perk == Perks.SmallBlade then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddPiercerTrait(player, 6);
        elseif perk == Perks.Spear then
            DTEMaddSpearmanTrait(player, 7);
        elseif perk == Perks.Woodwork then
            DTEMaddCarpentryTrait(player, 7);
            DTEMaddHandyTrait(player, 10);
        elseif perk == Perks.Cooking then
            DTEMaddScullionTrait(player, 7);
            DTEMaddCookTrait(player, 8);
            DTEMaddNutritionistTrait(player, 10);
        elseif perk == Perks.Farming then
            DTEMaddGardenerTrait(player, 8);
        elseif perk == Perks.Doctor then
            DTEMaddFirstAidTrait(player, 7);
        elseif perk == Perks.Electricity then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAmateurElectricianTrait(player, 4);
            DTEMaddElectricalTechnicianTrait(player, 6);
        elseif perk == Perks.MetalWelding then
            DTEMaddMetalwelderTrait(player, 7);
        elseif perk == Perks.Mechanics then
            DTEMaddBurglarTrait(player, 1, 1, 2);
            DTEMaddAutoMechanicTrait(player, 7);
            DTEMaddAmateurMechanicTrait(player, 9);
        elseif perk == Perks.Tailoring then
            DTEMaddSewerTrait(player, 6);
        elseif perk == Perks.Fishing then
            DTEMaddAnglerTrait(player, 7);
        elseif perk == Perks.Trapping then
            DTEMaddHunterTrait(player, 7, 7, 7, 7);
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddTrapperTrait(player, 6);
        elseif perk == Perks.PlantScavenging then
            DTEMaddFormerScoutTrait(player, 4, 6);
            DTEMaddHikerTrait(player, 5, 8);
            DTEMaddForagerTrait(player, 7);
        end
    end

    -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE SLOW LEARNER OR OBTAIN FAST LEARNER
    if player:getModData().DTEMslowFastLearnerTraits >= 30 and DTEMHasTrait(player, "SlowLearner") then
        DTEMRemoveTrait(player, "SlowLearner");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowLearner"), false, HaloTextHelper.getColorGreen());
    end
    if player:getModData().DTEMslowFastLearnerTraits >= 50 and not DTEMHasTrait(player, "FastLearner") then
        DTEMAddTrait(player, "FastLearner");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastLearner"), true, HaloTextHelper.getColorGreen());
    end
    -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE HARD OF HEARING OR OBTAIN KEEN HEARING
    if player:getModData().DTEMkeenHearingHardOfHearingTraits >= 30 and DTEMHasTrait(player, "HardOfHearing") then
        DTEMRemoveTrait(player, "HardOfHearing");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_hardhear"), false, HaloTextHelper.getColorGreen());
    end
    if player:getModData().DTEMkeenHearingHardOfHearingTraits >= 50 and not DTEMHasTrait(player, "KeenHearing") and not DTEMHasTrait(player, "Deaf") then
        DTEMAddTrait(player, "KeenHearing");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_keenhearing"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddJoggerTrait(player, sprintingExpectedLevel)
    if not DTEMHasTrait(player, "Jogger") and player:getPerkLevel(Perks.Sprinting) >= sprintingExpectedLevel then
        DTEMAddTrait(player, "Jogger");
        DTEMapplyXPBoost(player, Perks.Sprinting, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Jogger"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddHunterTrait(player, sneakExpectedLevel, aimingExpectedLevel, trappingExpectedLevel, smallBladeExpectedLevel)
    if not DTEMHasTrait(player, "Hunter") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel and
    player:getPerkLevel(Perks.Aiming) >= aimingExpectedLevel and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel and
    player:getPerkLevel(Perks.SmallBlade) >= smallBladeExpectedLevel then
        DTEMAddTrait(player, "Hunter");
        DTEMapplyXPBoost(player, Perks.Sneak, 1);
        DTEMapplyXPBoost(player, Perks.Aiming, 1);
        DTEMapplyXPBoost(player, Perks.Trapping, 1);
        DTEMapplyXPBoost(player, Perks.SmallBlade, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hunter"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMremoveConspicuousTrait(player, sneakExpectedLevel)
    if DTEMHasTrait(player, "Conspicuous") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel then
        DTEMRemoveTrait(player, "Conspicuous");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Conspicuous"), false, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddSneakyTrait(player, sneakExpectedLevel)
    if not DTEMHasTrait(player, "Sneaky") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel then
        DTEMAddTrait(player, "Sneaky");
        DTEMapplyXPBoost(player, Perks.Sneak, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_sneaky"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddInconspicuousTrait(player, sneakExpectedLevel)
    if not DTEMHasTrait(player, "Inconspicuous") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel then
        DTEMAddTrait(player, "Inconspicuous");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Inconspicuous"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMremoveClumsyTrait(player, lightfootExpectedLevel)
    if DTEMHasTrait(player, "Clumsy") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel then
        DTEMRemoveTrait(player, "Clumsy");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_clumsy"), false, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddLightfootedTrait(player, lightfootExpectedLevel)
    if not DTEMHasTrait(player, "Lightfooted") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel then
        DTEMAddTrait(player, "Lightfooted");
        DTEMapplyXPBoost(player, Perks.Lightfoot, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lightfooted"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddGymnastTrait(player, lightfootExpectedLevel, nimbleExpectedLevel)
    if not DTEMHasTrait(player, "Gymnast") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel and player:getPerkLevel(Perks.Nimble) >= nimbleExpectedLevel then
        DTEMAddTrait(player, "Gymnast");
        DTEMapplyXPBoost(player, Perks.Lightfoot, 1);
        DTEMapplyXPBoost(player, Perks.Nimble, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Gymnast"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddGracefulTrait(player, lightfootExpectedLevel)
    if not DTEMHasTrait(player, "Graceful") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel then
        DTEMAddTrait(player, "Graceful");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_graceful"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddBurglarTrait(player, nimbleExpectedLevel, electricityExpectedLevel, mechanicsExpectedLevel)
    if not DTEMHasTrait(player, "Burglar") and player:getPerkLevel(Perks.Nimble) >= nimbleExpectedLevel and
    player:getPerkLevel(Perks.Electricity) >= electricityExpectedLevel and player:getPerkLevel(Perks.Mechanics) >= mechanicsExpectedLevel then
        DTEMAddTrait(player, "Burglar");
        HaloTextHelper.addTextWithArrow(player, getText("UI_prof_Burglar"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddNimbleTrait(player, nimbleExpectedLevel)
    if not DTEMHasTrait(player, "Nimble") and player:getPerkLevel(Perks.Nimble) >= nimbleExpectedLevel then
        DTEMAddTrait(player, "Nimble");
        DTEMapplyXPBoost(player, Perks.Nimble, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_nimble"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddEagleEyeTrait(player, aimingExpectedLevel)
    if not DTEMHasTrait(player, "EagleEyed") and not DTEMHasTrait(player, "ShortSighted") and
    player:getPerkLevel(Perks.Aiming) >= aimingExpectedLevel then
        DTEMAddTrait(player, "EagleEyed");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_eagleeyed"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddGunFanTrait(player, aimingExpectedLevel, reloadingExpectedLevel)
    if not DTEMHasTrait(player, "Gunfan") and player:getPerkLevel(Perks.Aiming) >= aimingExpectedLevel and
    player:getPerkLevel(Perks.Reloading) >= reloadingExpectedLevel then
        DTEMAddTrait(player, "Gunfan");
        DTEMapplyXPBoost(player, Perks.Aiming, 1);
		DTEMapplyXPBoost(player, Perks.Reloading, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_gunfan"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddDurabileTrait(player, maintenanceExpectedLevel)
    if not DTEMHasTrait(player, "Durabile") and player:getPerkLevel(Perks.Maintenance) >= maintenanceExpectedLevel then
        DTEMAddTrait(player, "Durabile");
        DTEMapplyXPBoost(player, Perks.Maintenance, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_durabile"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddCutterTrait(player, axeExpectedLevel)
    if not DTEMHasTrait(player, "Cutter") and player:getPerkLevel(Perks.Axe) >= axeExpectedLevel then
        DTEMAddTrait(player, "Cutter");
        DTEMapplyXPBoost(player, Perks.Axe, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_cutter"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddBrawlerTrait(player, axeExpectedLevel, longBluntExpectedLevel)
    if not DTEMHasTrait(player, "Brawler") and player:getPerkLevel(Perks.Axe) >= axeExpectedLevel and
    player:getPerkLevel(Perks.Blunt) >= longBluntExpectedLevel then
        DTEMAddTrait(player, "Brawler");
        DTEMapplyXPBoost(player, Perks.Axe, 1);
        DTEMapplyXPBoost(player, Perks.Blunt, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_BarFighter"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddAxemanTrait(player, axeExpectedLevel)
    if not DTEMHasTrait(player, "Axeman") and player:getPerkLevel(Perks.Axe) >= axeExpectedLevel then
        DTEMAddTrait(player, "Axeman");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_axeman"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddBaseballPlayerTrait(player, longBluntExpectedLevel)
    if not DTEMHasTrait(player, "BaseballPlayer") and player:getPerkLevel(Perks.Blunt) >= longBluntExpectedLevel then
        DTEMAddTrait(player, "BaseballPlayer");
        DTEMapplyXPBoost(player, Perks.Blunt, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_PlaysBaseball"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddCrusherTrait(player, shortBluntExpectedLevel)
    if not DTEMHasTrait(player, "Shortbluntfan") and player:getPerkLevel(Perks.SmallBlunt) >= shortBluntExpectedLevel then
        DTEMAddTrait(player, "Shortbluntfan");
        DTEMapplyXPBoost(player, Perks.SmallBlunt, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_shortbluntfan"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddSwordsmanTrait(player, longBladeExpectedLevel)
    if not DTEMHasTrait(player, "Swordsman") and player:getPerkLevel(Perks.LongBlade) >= longBladeExpectedLevel then
        DTEMAddTrait(player, "Swordsman");
        DTEMapplyXPBoost(player, Perks.LongBlade, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_swordsman"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddPiercerTrait(player, smallBladeExpectedLevel)
    if not DTEMHasTrait(player, "Shortbladefan") and player:getPerkLevel(Perks.SmallBlade) >= smallBladeExpectedLevel then
        DTEMAddTrait(player, "Shortbladefan");
        DTEMapplyXPBoost(player, Perks.SmallBlade, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_shortbladefan"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddSpearmanTrait(player, spearExpectedLevel)
    if not DTEMHasTrait(player, "Spearman") and player:getPerkLevel(Perks.Spear) >= spearExpectedLevel then
        DTEMAddTrait(player, "Spearman");
        DTEMapplyXPBoost(player, Perks.Spear, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_spearman"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddCarpentryTrait(player, carpentryExpectedLevel)
    if not DTEMHasTrait(player, "AMCarpenter") and player:getPerkLevel(Perks.Woodwork) >= carpentryExpectedLevel then
        DTEMAddTrait(player, "AMCarpenter");
        DTEMapplyXPBoost(player, Perks.Woodwork, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amcarpenter"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddHandyTrait(player, carpentryExpectedLevel)
    if not DTEMHasTrait(player, "Handy") and not DTEMHasTrait(player, "Handy2") and
    player:getPerkLevel(Perks.Woodwork) >= carpentryExpectedLevel then
        DTEMAddTrait(player, "Handy");
        DTEMapplyXPBoost(player, Perks.Woodwork, 1);
        DTEMapplyXPBoost(player, Perks.Maintenance, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_handy"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddScullionTrait(player, cookingExpectedLevel)
    if not DTEMHasTrait(player, "AMCook") and player:getPerkLevel(Perks.Cooking) >= cookingExpectedLevel then
        DTEMAddTrait(player, "AMCook");
        DTEMapplyXPBoost(player, Perks.Cooking, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amcook"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddCookTrait(player, cookingExpectedLevel)
    if not DTEMHasTrait(player, "Cook") and player:getPerkLevel(Perks.Cooking) >= cookingExpectedLevel then
        DTEMAddTrait(player, "Cook");
        DTEMapplyXPBoost(player, Perks.Cooking, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Cook"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddNutritionistTrait(player, cookingExpectedLevel)
    if not DTEMHasTrait(player, "Nutritionist") and not DTEMHasTrait(player, "Nutritionist2") and
    player:getPerkLevel(Perks.Cooking) >= cookingExpectedLevel then
        DTEMAddTrait(player, "Nutritionist");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_nutritionist"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddGardenerTrait(player, farmingExpectedLevel)
    if not DTEMHasTrait(player, "Gardener") and player:getPerkLevel(Perks.Farming) >= farmingExpectedLevel then
        DTEMAddTrait(player, "Gardener");
        DTEMapplyXPBoost(player, Perks.Farming, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Gardener"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddFirstAidTrait(player, firstAidExpectedLevel)
    if not DTEMHasTrait(player, "FirstAid") and player:getPerkLevel(Perks.Doctor) >= firstAidExpectedLevel then
        DTEMAddTrait(player, "FirstAid");
        DTEMapplyXPBoost(player, Perks.Doctor, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FirstAid"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddAmateurElectricianTrait(player, electricityExpectedLevel)
    if not DTEMHasTrait(player, "AmateurElectrician") and not DTEMHasTrait(player, "AmateurElectrician2") and
    player:getPerkLevel(Perks.Electricity) >= electricityExpectedLevel then
        DTEMAddTrait(player, "AmateurElectrician");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AmateurElectrician"), true, HaloTextHelper.getColorGreen());
        local playerRecipes = player:getKnownRecipes();
        if not playerRecipes:contains("Generator") then
            playerRecipes:add("Generator");
        end
    end
end

function DTEMaddElectricalTechnicianTrait(player, electricityExpectedLevel)
    if not DTEMHasTrait(player, "AMElectrician") and player:getPerkLevel(Perks.Electricity) >= electricityExpectedLevel then
        DTEMAddTrait(player, "AMElectrician");
        DTEMapplyXPBoost(player, Perks.Electricity, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amelectrician"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddMetalwelderTrait(player, metalweldingExpectedLevel)
    if not DTEMHasTrait(player, "AMMetalworker") and player:getPerkLevel(Perks.MetalWelding) >= metalweldingExpectedLevel then
        DTEMAddTrait(player, "AMMetalworker");
        DTEMapplyXPBoost(player, Perks.MetalWelding, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_ammetalworker"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddAutoMechanicTrait(player, mechanicsExpectedLevel)
    if not DTEMHasTrait(player, "AMMechanic") and player:getPerkLevel(Perks.Mechanics) >= mechanicsExpectedLevel then
        DTEMAddTrait(player, "AMMechanic");
        DTEMapplyXPBoost(player, Perks.Mechanics, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_ammechanic"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddAmateurMechanicTrait(player, mechanicsExpectedLevel)
    if not DTEMHasTrait(player, "Mechanics") and player:getPerkLevel(Perks.Mechanics) >= mechanicsExpectedLevel then
        DTEMAddTrait(player, "Mechanics");
        DTEMapplyXPBoost(player, Perks.Mechanics, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Mechanics"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddSewerTrait(player, tailoringExpectedLevel)
    if not DTEMHasTrait(player, "Tailor") and player:getPerkLevel(Perks.Tailoring) >= tailoringExpectedLevel then
        DTEMAddTrait(player, "Tailor");
        DTEMapplyXPBoost(player, Perks.Tailoring, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Tailor"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddAnglerTrait(player, fishingExpectedLevel)
    if not DTEMHasTrait(player, "Fishing") and player:getPerkLevel(Perks.Fishing) >= fishingExpectedLevel then
        DTEMAddTrait(player, "Fishing");
        DTEMapplyXPBoost(player, Perks.Fishing, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Fishing"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddFormerScoutTrait(player, trappingExpectedLevel, foragingExpectedLevel)
    if not DTEMHasTrait(player, "Formerscout") and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel and
    player:getPerkLevel(Perks.PlantScavenging) >= foragingExpectedLevel then
        DTEMAddTrait(player, "Formerscout");
        DTEMapplyXPBoost(player, Perks.Trapping, 1);
        DTEMapplyXPBoost(player, Perks.PlantScavenging, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Scout"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddHikerTrait(player, trappingExpectedLevel, foragingExpectedLevel)
    if not DTEMHasTrait(player, "Hiker") and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel and
    player:getPerkLevel(Perks.PlantScavenging) >= foragingExpectedLevel then
        DTEMAddTrait(player, "Hiker");
        DTEMapplyXPBoost(player, Perks.Trapping, 1);
        DTEMapplyXPBoost(player, Perks.PlantScavenging, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hiker"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddTrapperTrait(player, trappingExpectedLevel)
    if not DTEMHasTrait(player, "AMTrapper") and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel then
        DTEMAddTrait(player, "AMTrapper");
        DTEMapplyXPBoost(player, Perks.Trapping, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amtrapper"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddForagerTrait(player, foragingExpectedLevel)
    if not DTEMHasTrait(player, "AMForager") and player:getPerkLevel(Perks.PlantScavenging) >= foragingExpectedLevel then
        DTEMAddTrait(player, "AMForager");
        DTEMapplyXPBoost(player, Perks.PlantScavenging, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amforager"), true, HaloTextHelper.getColorGreen());
    end
end