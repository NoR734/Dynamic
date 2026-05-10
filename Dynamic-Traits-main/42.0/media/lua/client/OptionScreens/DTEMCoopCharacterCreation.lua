require "ISUI/ISPanelJoypad"
require "OptionScreens/CoopCharacterCreation"

function CoopCharacterCreation:newPlayerMouse()
    if ProfessionFactory and ProfessionFactory.Reset then
        ProfessionFactory.Reset();
    end
    if BaseGameCharacterDetails and BaseGameCharacterDetails.DoProfessions then
        BaseGameCharacterDetails.DoProfessions();
    end
    if SUP and SUP.DoProfessions then
		SUP.DoProfessions();
	end
    if DTEMBaseGameCharacterDetails and DTEMBaseGameCharacterDetails.DoProfessions then
        DTEMBaseGameCharacterDetails.DoProfessions();
    end
	if CoopCharacterCreation.instance then return end
	if UIManager.getSpeedControls() and not IsoPlayer.allPlayersDead() then
		setShowPausedMessage(false)
		UIManager.getSpeedControls():SetCurrentGameSpeed(0)
	end
	CoopCharacterCreation.setVisibleAllUI(false)
	local w = CoopCharacterCreation:new(nil, nil, 0)
	w:initialise()
	w:addToUIManager()
	if w.mapSpawnSelect:hasChoices() then
		w.mapSpawnSelect:fillList()
		w.mapSpawnSelect:setVisible(true)
	else
		w.mapSpawnSelect:useDefaultSpawnRegion()
		w.charCreationProfession:setVisible(true)
	end
end
