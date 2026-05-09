require "TimedActions/ISInventoryTransferAction"
--require "TimedActions/ISGrabItemAction"

local DTtraitsByMovingObjects = {}
DTtraitsByMovingObjects.ISInventoryTransferAction = {}

DTtraitsByMovingObjects.ISInventoryTransferAction.perform = ISInventoryTransferAction.perform
function ISInventoryTransferAction:perform()
    DTtraitsByMovingObjects.ISInventoryTransferAction.perform(self)
    local player = self.character;
    local item = self.item;
    --print("DT Logger: running ISInventoryTransferAction:perform")
    --print("The weight of the item is : " .. item:getActualWeight());
    --print("The initial value for DTatdTraits is: " .. player:getModData().DTEMallThumbsDextrousTraits);
    --print("The initial value for DTdoTraits is: " .. player:getModData().DTEMdisorganizedOrganizedTraits);
    if not DTEMHasTrait(player, "Dextrous") or not DTEMHasTrait(player, "Organized") then
        -- CHECK IF THE PLAYER IS OBESE OR VERY UNDERWEIGHT
        if DTEMHasTrait(player, "Obese") or DTEMHasTrait(player, "Very Underweight") or DTEMHasTrait(player, "Emaciated") then
            if not DTEMHasTrait(player, "Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                if DTEMHasProfession(player, "nurse") or DTEMHasProfession(player, "doctor") then
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 1);
                elseif DTEMHasProfession(player, "burglar") then
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 0.9);
                elseif DTEMHasProfession(player, "electrician") or DTEMHasProfession(player, "engineer") then
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 0.8);
                else
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 0.7);
                end
            end
            if not DTEMHasTrait(player, "Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                if DTEMHasProfession(player, "nurse") or DTEMHasProfession(player, "doctor") then
                    player:getModData().DTEMdisorganizedOrganizedTraits = player:getModData().DTEMdisorganizedOrganizedTraits + (item:getActualWeight() * 1);
                elseif DTEMHasProfession(player, "carpenter") or DTEMHasProfession(player, "chef") or
                DTEMHasProfession(player, "electrician") or DTEMHasProfession(player, "engineer") or
                DTEMHasProfession(player, "metalworker") or DTEMHasProfession(player, "mechanics") then
                    player:getModData().DTEMdisorganizedOrganizedTraits = player:getModData().DTEMdisorganizedOrganizedTraits + (item:getActualWeight() * 0.9);
                else
                    player:getModData().DTEMdisorganizedOrganizedTraits = player:getModData().DTEMdisorganizedOrganizedTraits + (item:getActualWeight() * 0.8);
                end
            end
        -- CHECK IF THE PLAYER IS OVERWEIGHT OR UNDERWEIGHT
        elseif DTEMHasTrait(player, "Overweight") or DTEMHasTrait(player, "Underweight") then
            if not DTEMHasTrait(player, "Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                if DTEMHasProfession(player, "nurse") or DTEMHasProfession(player, "doctor") then
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 3);
                elseif DTEMHasProfession(player, "burglar") then
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 2);
                elseif DTEMHasProfession(player, "electrician") or DTEMHasProfession(player, "engineer") then
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 1);
                else
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 0.9);
                end
            end
            if not DTEMHasTrait(player, "Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                if DTEMHasProfession(player, "nurse") or DTEMHasProfession(player, "doctor") then
                    player:getModData().DTEMdisorganizedOrganizedTraits = player:getModData().DTEMdisorganizedOrganizedTraits + (item:getActualWeight() * 3);
                elseif DTEMHasProfession(player, "carpenter") or DTEMHasProfession(player, "chef") or
                DTEMHasProfession(player, "electrician") or DTEMHasProfession(player, "engineer") or
                DTEMHasProfession(player, "metalworker") or DTEMHasProfession(player, "mechanics") then
                    player:getModData().DTEMdisorganizedOrganizedTraits = player:getModData().DTEMdisorganizedOrganizedTraits + (item:getActualWeight() * 2);
                else
                    player:getModData().DTEMdisorganizedOrganizedTraits = player:getModData().DTEMdisorganizedOrganizedTraits + (item:getActualWeight() * 1);
                end
            end
        -- THE PLAYER DOESN'T HAVE WEIGHT PROBLEMS
        else
            if not DTEMHasTrait(player, "Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                if DTEMHasProfession(player, "nurse") or DTEMHasProfession(player, "doctor") then
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 5);
                elseif DTEMHasProfession(player, "burglar") then
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 4);
                elseif DTEMHasProfession(player, "electrician") or DTEMHasProfession(player, "engineer") then
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 3);
                else
                    player:getModData().DTEMallThumbsDextrousTraits = player:getModData().DTEMallThumbsDextrousTraits + (item:getActualWeight() * 2);
                end
            end
            if not DTEMHasTrait(player, "Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                if DTEMHasProfession(player, "nurse") or DTEMHasProfession(player, "doctor") then
                    player:getModData().DTEMdisorganizedOrganizedTraits = player:getModData().DTEMdisorganizedOrganizedTraits + (item:getActualWeight() * 5);
                elseif DTEMHasProfession(player, "carpenter") or DTEMHasProfession(player, "chef") or
                DTEMHasProfession(player, "electrician") or DTEMHasProfession(player, "engineer") or
                DTEMHasProfession(player, "metalworker") or DTEMHasProfession(player, "mechanics") then
                    player:getModData().DTEMdisorganizedOrganizedTraits = player:getModData().DTEMdisorganizedOrganizedTraits + (item:getActualWeight() * 4);
                else
                    player:getModData().DTEMdisorganizedOrganizedTraits = player:getModData().DTEMdisorganizedOrganizedTraits + (item:getActualWeight() * 3);
                end
            end
        end
    end
    --print("The final value for DTatdTraits is: " .. player:getModData().DTEMallThumbsDextrousTraits);
    --print("The final value for DTdoTraits is: " .. player:getModData().DTEMdisorganizedOrganizedTraits);
end

function DTEMtraitsByMovingObjects(player)
    --print("DT Logger: running traitsByMovingObjects function");
    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE/GAIN THE TRAITS
    -- ALL THUMBS/DEXTROUS
    if player:getModData().DTEMallThumbsDextrousTraits >= -75000 and DTEMHasTrait(player, "AllThumbs") then
        DTEMRemoveTrait(player, "AllThumbs");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AllThumbs"), false, HaloTextHelper.getColorGreen());
    elseif player:getModData().DTEMallThumbsDextrousTraits >= 200000 and not DTEMHasTrait(player, "Dextrous") then
        DTEMAddTrait(player, "Dextrous");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Dexterous"), true, HaloTextHelper.getColorGreen());
    -- ORGANIZED/DISORGANIZED
    elseif player:getModData().DTEMdisorganizedOrganizedTraits >= -100000 and DTEMHasTrait(player, "Disorganized") then
        DTEMRemoveTrait(player, "Disorganized");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Disorganized"), false, HaloTextHelper.getColorGreen());
    elseif player:getModData().DTEMdisorganizedOrganizedTraits >= 300000 and not DTEMHasTrait(player, "Organized") then
        DTEMAddTrait(player, "Organized");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Packmule"), true, HaloTextHelper.getColorGreen());
    end
    --print("DT Logger: DTatdTraits value is " .. player:getModData().DTEMallThumbsDextrousTraits);
    --print("DT Logger: DTdoTraits value is " .. player:getModData().DTEMdisorganizedOrganizedTraits);
end