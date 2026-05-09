-- All Credit for this goes to Snake
require ("TimedActions/ISBaseTimedAction");

DTEMStudyPlantAction = ISBaseTimedAction:derive("DTEMStudyPlantAction");

function DTEMStudyPlantAction:isValid()
	return (self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() ~= nil and StudyPlantsDefs[self.character:getPrimaryHandItem():getType()] ~= nil);
end

function DTEMStudyPlantAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function DTEMStudyPlantAction:start()
	self.character:playSound("RemovePlant")
    self.item:setJobType(getText("ContextMenu_StudyPlant"));
    self.item:setJobDelta(0.0);
	self:setActionAnim(CharacterActionAnims.Craft);
end

function DTEMStudyPlantAction:stop()
	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function DTEMStudyPlantAction:perform()

    ISBaseTimedAction.perform(self);
	self.item:setJobDelta(0.0);
    self.prim = self.character:getPrimaryHandItem();
	if self.prim and StudyPlantsDefs[self.character:getPrimaryHandItem():getType()] then
		if(self.item:getModData().DTEMAlreadyStudied == nil) then

			self.character:getModData().DTEMplantsKnowledge = self.character:getModData().DTEMplantsKnowledge + ZombRand(5);

			if self.character:getModData().DTEMplantsKnowledge > 175 and not DTEMHasTrait(self.character, "Herbalist") and not DTEMHasTrait(self.character, "Herbalist2") then
				DTEMAddTrait(self.character, "Herbalist");
				HaloTextHelper.addTextWithArrow(self.character, getText("UI_trait_Herbalist"), true, HaloTextHelper.getColorGreen());
				local playerRecipes = self.character:getKnownRecipes();
				if not playerRecipes:contains("Herbalist") then
					playerRecipes:add("Herbalist");
				end
			end

			self.character:Say(getText("IGUI_PlayerText_PlantStudyDone"));
			self.item:getModData().DTEMAlreadyStudied = true;
		else
			self.character:Say(getText("IGUI_PlayerText_PlantStudyAlreadyDone"));
		end
	end
	DTEMStudyPlants.UnequipPlant(self.item, self.character);
end

function DTEMStudyPlantAction:new(character, item, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end