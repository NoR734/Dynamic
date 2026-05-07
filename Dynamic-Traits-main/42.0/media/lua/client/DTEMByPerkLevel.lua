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

    if player:getDescriptor():getProfession() == "unemployed" then
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
    elseif player:getDescriptor():getProfession() == "fireofficer" then
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
    elseif player:getDescriptor():getProfession() == "policeofficer" then
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
    elseif player:getDescriptor():getProfession() == "parkranger" then
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
    elseif player:getDescriptor():getProfession() == "constructionworker" then
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
    elseif player:getDescriptor():getProfession() == "securityguard" then
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
    elseif player:getDescriptor():getProfession() == "carpenter" then
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
    elseif player:getDescriptor():getProfession() == "burglar" then
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
    elseif player:getDescriptor():getProfession() == "chef" then
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
    elseif player:getDescriptor():getProfession() == "repairman" then
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
    elseif player:getDescriptor():getProfession() == "farmer" then
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
    elseif player:getDescriptor():getProfession() == "fisherman" then
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
    elseif player:getDescriptor():getProfession() == "doctor" then
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
    elseif player:getDescriptor():getProfession() == "veteran" then
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
    elseif player:getDescriptor():getProfession() == "nurse" then
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
    elseif player:getDescriptor():getProfession() == "lumberjack" then
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
    elseif player:getDescriptor():getProfession() == "fitnessInstructor" then
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
    elseif player:getDescriptor():getProfession() == "burgerflipper" then
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
    elseif player:getDescriptor():getProfession() == "electrician" then
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
    elseif player:getDescriptor():getProfession() == "engineer" then
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
    elseif player:getDescriptor():getProfession() == "metalworker" then
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
    elseif player:getDescriptor():getProfession() == "mechanics" then
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
    if player:getModData().DTEMslowFastLearnerTraits >= 30 and player:HasTrait("SlowLearner") then
        player:getTraits():remove("SlowLearner");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowLearner"), false, HaloTextHelper.getColorGreen());
    end
    if player:getModData().DTEMslowFastLearnerTraits >= 50 and not player:HasTrait("FastLearner") then
        player:getTraits():add("FastLearner");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastLearner"), true, HaloTextHelper.getColorGreen());
    end
    -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE HARD OF HEARING OR OBTAIN KEEN HEARING
    if player:getModData().DTEMkeenHearingHardOfHearingTraits >= 30 and player:HasTrait("HardOfHearing") then
        player:getTraits():remove("HardOfHearing");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_hardhear"), false, HaloTextHelper.getColorGreen());
    end
    if player:getModData().DTEMkeenHearingHardOfHearingTraits >= 50 and not player:HasTrait("KeenHearing") and not player:HasTrait("Deaf") then
        player:getTraits():add("KeenHearing");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_keenhearing"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddJoggerTrait(player, sprintingExpectedLevel)
    if not player:HasTrait("Jogger") and player:getPerkLevel(Perks.Sprinting) >= sprintingExpectedLevel then
        player:getTraits():add("Jogger");
        DTEMapplyXPBoost(player, Perks.Sprinting, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Jogger"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddHunterTrait(player, sneakExpectedLevel, aimingExpectedLevel, trappingExpectedLevel, smallBladeExpectedLevel)
    if not player:HasTrait("Hunter") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel and 
    player:getPerkLevel(Perks.Aiming) >= aimingExpectedLevel and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel and 
    player:getPerkLevel(Perks.SmallBlade) >= smallBladeExpectedLevel then
        player:getTraits():add("Hunter");
        DTEMapplyXPBoost(player, Perks.Sneak, 1);
        DTEMapplyXPBoost(player, Perks.Aiming, 1);
        DTEMapplyXPBoost(player, Perks.Trapping, 1);
        DTEMapplyXPBoost(player, Perks.SmallBlade, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hunter"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMremoveConspicuousTrait(player, sneakExpectedLevel)
    if player:HasTrait("Conspicuous") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel then
        player:getTraits():remove("Conspicuous");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Conspicuous"), false, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddSneakyTrait(player, sneakExpectedLevel)
    if not player:HasTrait("Sneaky") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel then
        player:getTraits():add("Sneaky");
        DTEMapplyXPBoost(player, Perks.Sneak, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_sneaky"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddInconspicuousTrait(player, sneakExpectedLevel)
    if not player:HasTrait("Inconspicuous") and player:getPerkLevel(Perks.Sneak) >= sneakExpectedLevel then
        player:getTraits():add("Inconspicuous");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Inconspicuous"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMremoveClumsyTrait(player, lightfootExpectedLevel)
    if player:HasTrait("Clumsy") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel then
        player:getTraits():remove("Clumsy");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_clumsy"), false, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddLightfootedTrait(player, lightfootExpectedLevel)
    if not player:HasTrait("Lightfooted") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel then
        player:getTraits():add("Lightfooted");
        DTEMapplyXPBoost(player, Perks.Lightfoot, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_lightfooted"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddGymnastTrait(player, lightfootExpectedLevel, nimbleExpectedLevel)
    if not player:HasTrait("Gymnast") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel and player:getPerkLevel(Perks.Nimble) >= nimbleExpectedLevel then
        player:getTraits():add("Gymnast");
        DTEMapplyXPBoost(player, Perks.Lightfoot, 1);
        DTEMapplyXPBoost(player, Perks.Nimble, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Gymnast"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddGracefulTrait(player, lightfootExpectedLevel)
    if not player:HasTrait("Graceful") and player:getPerkLevel(Perks.Lightfoot) >= lightfootExpectedLevel then
        player:getTraits():add("Graceful");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_graceful"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddBurglarTrait(player, nimbleExpectedLevel, electricityExpectedLevel, mechanicsExpectedLevel)
    if not player:HasTrait("Burglar") and player:getPerkLevel(Perks.Nimble) >= nimbleExpectedLevel and 
    player:getPerkLevel(Perks.Electricity) >= electricityExpectedLevel and player:getPerkLevel(Perks.Mechanics) >= mechanicsExpectedLevel then
        player:getTraits():add("Burglar");
        HaloTextHelper.addTextWithArrow(player, getText("UI_prof_Burglar"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddNimbleTrait(player, nimbleExpectedLevel)
    if not player:HasTrait("Nimble") and player:getPerkLevel(Perks.Nimble) >= nimbleExpectedLevel then
        player:getTraits():add("Nimble");
        DTEMapplyXPBoost(player, Perks.Nimble, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_nimble"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddEagleEyeTrait(player, aimingExpectedLevel)
    if not player:HasTrait("EagleEyed") and not player:HasTrait("ShortSighted") and 
    player:getPerkLevel(Perks.Aiming) >= aimingExpectedLevel then
        player:getTraits():add("EagleEyed");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_eagleeyed"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddGunFanTrait(player, aimingExpectedLevel, reloadingExpectedLevel)
    if not player:HasTrait("Gunfan") and player:getPerkLevel(Perks.Aiming) >= aimingExpectedLevel and 
    player:getPerkLevel(Perks.Reloading) >= reloadingExpectedLevel then
        player:getTraits():add("Gunfan");
        DTEMapplyXPBoost(player, Perks.Aiming, 1);
		DTEMapplyXPBoost(player, Perks.Reloading, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_gunfan"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddDurabileTrait(player, maintenanceExpectedLevel)
    if not player:HasTrait("Durabile") and player:getPerkLevel(Perks.Maintenance) >= maintenanceExpectedLevel then
        player:getTraits():add("Durabile");
        DTEMapplyXPBoost(player, Perks.Maintenance, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_durabile"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddCutterTrait(player, axeExpectedLevel)
    if not player:HasTrait("Cutter") and player:getPerkLevel(Perks.Axe) >= axeExpectedLevel then
        player:getTraits():add("Cutter");
        DTEMapplyXPBoost(player, Perks.Axe, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_cutter"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddBrawlerTrait(player, axeExpectedLevel, longBluntExpectedLevel)
    if not player:HasTrait("Brawler") and player:getPerkLevel(Perks.Axe) >= axeExpectedLevel and 
    player:getPerkLevel(Perks.Blunt) >= longBluntExpectedLevel then
        player:getTraits():add("Brawler");
        DTEMapplyXPBoost(player, Perks.Axe, 1);
        DTEMapplyXPBoost(player, Perks.Blunt, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_BarFighter"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddAxemanTrait(player, axeExpectedLevel)
    if not player:HasTrait("Axeman") and player:getPerkLevel(Perks.Axe) >= axeExpectedLevel then
        player:getTraits():add("Axeman");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_axeman"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddBaseballPlayerTrait(player, longBluntExpectedLevel)
    if not player:HasTrait("BaseballPlayer") and player:getPerkLevel(Perks.Blunt) >= longBluntExpectedLevel then
        player:getTraits():add("BaseballPlayer");
        DTEMapplyXPBoost(player, Perks.Blunt, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_PlaysBaseball"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddCrusherTrait(player, shortBluntExpectedLevel)
    if not player:HasTrait("Shortbluntfan") and player:getPerkLevel(Perks.SmallBlunt) >= shortBluntExpectedLevel then
        player:getTraits():add("Shortbluntfan");
        DTEMapplyXPBoost(player, Perks.SmallBlunt, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_shortbluntfan"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddSwordsmanTrait(player, longBladeExpectedLevel)
    if not player:HasTrait("Swordsman") and player:getPerkLevel(Perks.LongBlade) >= longBladeExpectedLevel then
        player:getTraits():add("Swordsman");
        DTEMapplyXPBoost(player, Perks.LongBlade, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_swordsman"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddPiercerTrait(player, smallBladeExpectedLevel)
    if not player:HasTrait("Shortbladefan") and player:getPerkLevel(Perks.SmallBlade) >= smallBladeExpectedLevel then
        player:getTraits():add("Shortbladefan");
        DTEMapplyXPBoost(player, Perks.SmallBlade, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_shortbladefan"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddSpearmanTrait(player, spearExpectedLevel)
    if not player:HasTrait("Spearman") and player:getPerkLevel(Perks.Spear) >= spearExpectedLevel then
        player:getTraits():add("Spearman");
        DTEMapplyXPBoost(player, Perks.Spear, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_spearman"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddCarpentryTrait(player, carpentryExpectedLevel)
    if not player:HasTrait("AMCarpenter") and player:getPerkLevel(Perks.Woodwork) >= carpentryExpectedLevel then
        player:getTraits():add("AMCarpenter");
        DTEMapplyXPBoost(player, Perks.Woodwork, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amcarpenter"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddHandyTrait(player, carpentryExpectedLevel)
    if not player:HasTrait("Handy") and not player:HasTrait("Handy2") and 
    player:getPerkLevel(Perks.Woodwork) >= carpentryExpectedLevel then
        player:getTraits():add("Handy");
        DTEMapplyXPBoost(player, Perks.Woodwork, 1);
        DTEMapplyXPBoost(player, Perks.Maintenance, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_handy"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddScullionTrait(player, cookingExpectedLevel)
    if not player:HasTrait("AMCook") and player:getPerkLevel(Perks.Cooking) >= cookingExpectedLevel then
        player:getTraits():add("AMCook");
        DTEMapplyXPBoost(player, Perks.Cooking, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amcook"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddCookTrait(player, cookingExpectedLevel)
    if not player:HasTrait("Cook") and player:getPerkLevel(Perks.Cooking) >= cookingExpectedLevel then
        player:getTraits():add("Cook");
        DTEMapplyXPBoost(player, Perks.Cooking, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Cook"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddNutritionistTrait(player, cookingExpectedLevel)
    if not player:HasTrait("Nutritionist") and not player:HasTrait("Nutritionist2") and 
    player:getPerkLevel(Perks.Cooking) >= cookingExpectedLevel then
        player:getTraits():add("Nutritionist");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_nutritionist"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddGardenerTrait(player, farmingExpectedLevel)
    if not player:HasTrait("Gardener") and player:getPerkLevel(Perks.Farming) >= farmingExpectedLevel then
        player:getTraits():add("Gardener");
        DTEMapplyXPBoost(player, Perks.Farming, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Gardener"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddFirstAidTrait(player, firstAidExpectedLevel)
    if not player:HasTrait("FirstAid") and player:getPerkLevel(Perks.Doctor) >= firstAidExpectedLevel then
        player:getTraits():add("FirstAid");
        DTEMapplyXPBoost(player, Perks.Doctor, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FirstAid"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddAmateurElectricianTrait(player, electricityExpectedLevel)
    if not player:HasTrait("AmateurElectrician") and not player:HasTrait("AmateurElectrician2") and 
    player:getPerkLevel(Perks.Electricity) >= electricityExpectedLevel then
        player:getTraits():add("AmateurElectrician");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AmateurElectrician"), true, HaloTextHelper.getColorGreen());
        local playerRecipes = player:getKnownRecipes();
        if not playerRecipes:contains("Generator") then
            playerRecipes:add("Generator");
        end
    end
end

function DTEMaddElectricalTechnicianTrait(player, electricityExpectedLevel)
    if not player:HasTrait("AMElectrician") and player:getPerkLevel(Perks.Electricity) >= electricityExpectedLevel then
        player:getTraits():add("AMElectrician");
        DTEMapplyXPBoost(player, Perks.Electricity, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amelectrician"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddMetalwelderTrait(player, metalweldingExpectedLevel)
    if not player:HasTrait("AMMetalworker") and player:getPerkLevel(Perks.MetalWelding) >= metalweldingExpectedLevel then
        player:getTraits():add("AMMetalworker");
        DTEMapplyXPBoost(player, Perks.MetalWelding, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_ammetalworker"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddAutoMechanicTrait(player, mechanicsExpectedLevel)
    if not player:HasTrait("AMMechanic") and player:getPerkLevel(Perks.Mechanics) >= mechanicsExpectedLevel then
        player:getTraits():add("AMMechanic");
        DTEMapplyXPBoost(player, Perks.Mechanics, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_ammechanic"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddAmateurMechanicTrait(player, mechanicsExpectedLevel)
    if not player:HasTrait("Mechanics") and player:getPerkLevel(Perks.Mechanics) >= mechanicsExpectedLevel then
        player:getTraits():add("Mechanics");
        DTEMapplyXPBoost(player, Perks.Mechanics, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Mechanics"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddSewerTrait(player, tailoringExpectedLevel)
    if not player:HasTrait("Tailor") and player:getPerkLevel(Perks.Tailoring) >= tailoringExpectedLevel then
        player:getTraits():add("Tailor");
        DTEMapplyXPBoost(player, Perks.Tailoring, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Tailor"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddAnglerTrait(player, fishingExpectedLevel)
    if not player:HasTrait("Fishing") and player:getPerkLevel(Perks.Fishing) >= fishingExpectedLevel then
        player:getTraits():add("Fishing");
        DTEMapplyXPBoost(player, Perks.Fishing, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Fishing"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddFormerScoutTrait(player, trappingExpectedLevel, foragingExpectedLevel)
    if not player:HasTrait("Formerscout") and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel and 
    player:getPerkLevel(Perks.PlantScavenging) >= foragingExpectedLevel then
        player:getTraits():add("Formerscout");
        DTEMapplyXPBoost(player, Perks.Trapping, 1);
        DTEMapplyXPBoost(player, Perks.PlantScavenging, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Scout"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddHikerTrait(player, trappingExpectedLevel, foragingExpectedLevel)
    if not player:HasTrait("Hiker") and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel and 
    player:getPerkLevel(Perks.PlantScavenging) >= foragingExpectedLevel then
        player:getTraits():add("Hiker");
        DTEMapplyXPBoost(player, Perks.Trapping, 1);
        DTEMapplyXPBoost(player, Perks.PlantScavenging, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hiker"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddTrapperTrait(player, trappingExpectedLevel)
    if not player:HasTrait("AMTrapper") and player:getPerkLevel(Perks.Trapping) >= trappingExpectedLevel then
        player:getTraits():add("AMTrapper");
        DTEMapplyXPBoost(player, Perks.Trapping, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amtrapper"), true, HaloTextHelper.getColorGreen());
    end
end

function DTEMaddForagerTrait(player, foragingExpectedLevel)
    if not player:HasTrait("AMForager") and player:getPerkLevel(Perks.PlantScavenging) >= foragingExpectedLevel then
        player:getTraits():add("AMForager");
        DTEMapplyXPBoost(player, Perks.PlantScavenging, 1);
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_amforager"), true, HaloTextHelper.getColorGreen());
    end
end