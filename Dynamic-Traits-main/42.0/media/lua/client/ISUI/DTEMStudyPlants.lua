-- All Credit for this goes to Snake
DTEMStudyPlants = {};

DTEMStudyPlants.doMenu = function(player, context, items)
    if getSpecificPlayer(player):HasTrait("Herbalist") or getSpecificPlayer(player):HasTrait("Herbalist2") then
        return
    end
    local Plant = nil
    for i, v in ipairs(items) do
        local tempitem = v
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1]
        end
        if tempitem:getType() ~= nil and StudyPlantsDefs[tempitem:getType()] then
            Plant = tempitem
        end
        if i > 1 then
            Plant = nil
        end
    end
    if Plant == nil then
        return
    end
    if Plant ~= nil then
        local StudyPlantoption = context:addOption(getText("ContextMenu_StudyPlant"), items, nil, player)
        local StudyPlantSubMenu = context:getNew(context)
        context:addSubMenu(StudyPlantoption, StudyPlantSubMenu)
        local tooltip = ISInventoryPaneContextMenu.addToolTip()
        tooltip:setName(getText("ContextMenu_StudyPlant"))
        tooltip.description = getText("ContextMenu_StudyPlantTT")
        tooltip:setTexture(Plant:getTexture():getName())

        for i, k in pairs(items) do
            if not instanceof(k, "InventoryItem") then
                if #k.items > 2 then
                    local StudyPlantSubMenuOption1 = StudyPlantSubMenu:addOption(getText("ContextMenu_One"), items, DTEMStudyPlants.StudyPlant_OnCreate, player, 1)
                    StudyPlantSubMenuOption1.toolTip = tooltip
                    local StudyPlantSubMenuOption2 = StudyPlantSubMenu:addOption(getText("ContextMenu_IdentifyHalf"), items, DTEMStudyPlants.StudyPlant_OnCreate, player, 2)
                    StudyPlantSubMenuOption2.toolTip = tooltip
                    local StudyPlantSubMenuOption3 = StudyPlantSubMenu:addOption(getText("ContextMenu_IdentifyAll"), items, DTEMStudyPlants.StudyPlant_OnCreate, player, 3)
                    StudyPlantSubMenuOption3.toolTip = tooltip
                    break
                else
                    local StudyPlantSubMenuOption = StudyPlantSubMenu:addOption(getText("ContextMenu_One"), items, DTEMStudyPlants.StudyPlant_OnCreate, player, 3)
                    StudyPlantSubMenuOption.toolTip = tooltip
                    break
                end
            else
                local StudyPlantSubMenuOption = StudyPlantSubMenu:addOption(getText("ContextMenu_One"), items, DTEMStudyPlants.StudyPlant_OnCreate, player, 3)
                StudyPlantSubMenuOption.toolTip = tooltip
                break
            end
        end
    end
end

DTEMStudyPlants.StudyPlant_OnCreate = function(items, playernum, directive)
	local player = getSpecificPlayer(playernum);
	local count = 0;
	for i,k in ipairs(items) do
		if not instanceof(k, "InventoryItem") then
			if directive == 1 then
				count = math.floor((#k.items - 1) / (#k.items - 1))
			elseif directive == 2 then
				count =  math.floor((#k.items - 1) / 2)
			else
				count =  math.floor(#k.items - 1)
			end
			-- first in a list is a dummy duplicate, so ignore it.
			for i2=1,count do
				local k2 = k.items[i2+1]
				if luautils.haveToBeTransfered(player, k2) then
					ISTimedActionQueue.add(ISInventoryTransferAction:new(player, k2, k2:getContainer(), player:getInventory()))
				end
				DTEMStudyPlants.EquipPlant(k2, player);
				ISTimedActionQueue.add(DTEMStudyPlantAction:new(player, k2, 150));
			end
		else
			if luautils.haveToBeTransfered(player, k) then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(player, k, k:getContainer(), player:getInventory()))
			end
			DTEMStudyPlants.EquipPlant(k, player);
			ISTimedActionQueue.add(DTEMStudyPlantAction:new(player, k, 150));
		end
	end
end

DTEMStudyPlants.EquipPlant = function(item, player)
	if not item:isEquipped() then
		-- Equip the berry/mushroom to study it.
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, false));
	end
end

DTEMStudyPlants.UnequipPlant = function(item, player)
	if item:isEquipped() then
		-- Unequip the berry/mushroom after it was studied.
		ISTimedActionQueue.add(ISUnequipAction:new(player, item, 50));
	end
end

Events.OnFillInventoryObjectContextMenu.Add(DTEMStudyPlants.doMenu);