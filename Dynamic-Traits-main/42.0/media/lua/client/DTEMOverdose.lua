-- OVERDOSE FUNCTIONS
function DTEMoverdoseIncrease(player, overdose)
	-- Overdose Sandbox
	local overdoseMechanic = SandboxVars.DTEM.EnableOverdoseMechanic

	if overdoseMechanic then 
		--print("Overdose Sandbox is enabled")
		--print("DT Logger: running DTEMoverdoseIncrease function");
		--print("overdose: " .. overdose)
		if player:HasTrait("IronGut") then
			player:getModData().DTEMoverdose = player:getModData().DTEMoverdose + (overdose * 0.7);
		elseif player:HasTrait("WeakStomach") then
			player:getModData().DTEMoverdose = player:getModData().DTEMoverdose + (overdose * 1.3);
		else
			player:getModData().DTEMoverdose = player:getModData().DTEMoverdose + overdose;
		end
		if player:getModData().DTEMoverdose > 100 then
			player:getModData().DTEMoverdose = 100;
		end
	end
	
	--print("DT Logger: DTEMoverdose value is " .. player:getModData().DTEMoverdose)
end

function DTEMoverdoseDecrease(player)
	--print("DT Logger: running DTEMoverdoseDecrease function");
	if player:HasTrait("IronGut") then
		player:getModData().DTEMoverdose = player:getModData().DTEMoverdose + (-4 * 1.3);
	elseif player:HasTrait("WeakStomach") then
		player:getModData().DTEMoverdose = player:getModData().DTEMoverdose + (-4 * 0.7);
	else
		player:getModData().DTEMoverdose = player:getModData().DTEMoverdose + -4;
	end
	if player:getModData().DTEMoverdose < 0 then
		player:getModData().DTEMoverdose = 0;
	end
	--print("DT Logger: DTEMoverdose value is " .. player:getModData().DTEMoverdose)
end

function DTEMoverdoseMoodleEffects(player)
	--print("DT Logger: running DTEMoverdoseMoodleEffects function");
	if player:getModData().DTEMoverdose > 50 then
		--print("DT Logger: Overdose Moodle Lv2")
		DTEMincreaseStress(player, ZombRand(7), 0.10)
		DTEMincreaseWetness(player, ZombRand(7), 10)
	end
	if player:getModData().DTEMoverdose > 70 then
		--print("DT Logger: Overdose Moodle Lv3")
		DTEMincreaseFatigue(player, ZombRand(5), 0.07)
	end
	if player:getModData().DTEMoverdose > 85 then
		--print("DT Logger: Overdose Moodle Lv4")
		DTEMincreaseFoodSickness(player, ZombRand(5), (ZombRand(player:getModData().DTEMoverdose) / 2))
	end
end

