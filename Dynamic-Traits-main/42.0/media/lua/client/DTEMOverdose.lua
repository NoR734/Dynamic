-- OVERDOSE FUNCTIONS
local function DTEMOverdoseSandboxEnabled()
	if SandboxVars and SandboxVars.DTEM and SandboxVars.DTEM.EnableOverdoseMechanic ~= nil then
		return SandboxVars.DTEM.EnableOverdoseMechanic
	end
	return true
end

local function DTEMOverdoseHasTrait(player, trait)
	if DTEMHasTrait then
		return DTEMHasTrait(player, trait)
	end
	if player then
		local ok, result = pcall(function()
			return player:HasTrait(trait)
		end)
		return ok and result == true
	end
	return false
end

function DTEMoverdoseIncrease(player, overdose)
	-- Overdose Sandbox
	local overdoseMechanic = DTEMOverdoseSandboxEnabled()

	if overdoseMechanic then 
		--print("Overdose Sandbox is enabled")
		--print("DT Logger: running DTEMoverdoseIncrease function");
		--print("overdose: " .. overdose)
		local overdoseLevel = DTEMGetModDataNumber and DTEMGetModDataNumber(player, "DTEMoverdose", 0) or (tonumber(player:getModData().DTEMoverdose) or 0)
		if DTEMOverdoseHasTrait(player, "IronGut") then
			player:getModData().DTEMoverdose = overdoseLevel + (overdose * 0.7);
		elseif DTEMOverdoseHasTrait(player, "WeakStomach") then
			player:getModData().DTEMoverdose = overdoseLevel + (overdose * 1.3);
		else
			player:getModData().DTEMoverdose = overdoseLevel + overdose;
		end
		if player:getModData().DTEMoverdose > 100 then
			player:getModData().DTEMoverdose = 100;
		end
	end
	
	--print("DT Logger: DTEMoverdose value is " .. player:getModData().DTEMoverdose)
end

function DTEMoverdoseDecrease(player)
	--print("DT Logger: running DTEMoverdoseDecrease function");
	local overdoseLevel = DTEMGetModDataNumber and DTEMGetModDataNumber(player, "DTEMoverdose", 0) or (tonumber(player:getModData().DTEMoverdose) or 0)
	if DTEMOverdoseHasTrait(player, "IronGut") then
		player:getModData().DTEMoverdose = overdoseLevel + (-4 * 1.3);
	elseif DTEMOverdoseHasTrait(player, "WeakStomach") then
		player:getModData().DTEMoverdose = overdoseLevel + (-4 * 0.7);
	else
		player:getModData().DTEMoverdose = overdoseLevel + -4;
	end
	if player:getModData().DTEMoverdose < 0 then
		player:getModData().DTEMoverdose = 0;
	end
	--print("DT Logger: DTEMoverdose value is " .. player:getModData().DTEMoverdose)
end

function DTEMoverdoseMoodleEffects(player)
	--print("DT Logger: running DTEMoverdoseMoodleEffects function");
	local overdoseLevel = DTEMGetModDataNumber and DTEMGetModDataNumber(player, "DTEMoverdose", 0) or (tonumber(player:getModData().DTEMoverdose) or 0)
	if overdoseLevel > 50 then
		--print("DT Logger: Overdose Moodle Lv2")
		DTEMincreaseStress(player, ZombRand(7), 0.10)
		DTEMincreaseWetness(player, ZombRand(7), 10)
	end
	if overdoseLevel > 70 then
		--print("DT Logger: Overdose Moodle Lv3")
		DTEMincreaseFatigue(player, ZombRand(5), 0.07)
	end
	if overdoseLevel > 85 then
		--print("DT Logger: Overdose Moodle Lv4")
		DTEMincreaseFoodSickness(player, ZombRand(5), (ZombRand(math.floor(overdoseLevel)) / 2))
	end
end
