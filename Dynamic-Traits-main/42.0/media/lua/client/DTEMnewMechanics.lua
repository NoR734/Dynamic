-- Grant XP multiplier if the regularity is maxed
function DTEMexerciseMultiplierIfMaxRegularity(player)
	--print("DT Logger: running DTEMexerciseMultiplierIfMaxRegularity function");
	--print("function DTEMexerciseMultiplierIfMaxRegularity is called");

	-- Remove the Fitness XP multipliers (if any) when the regularity is lower than 99.7
	if player:getFitness():getRegularity("squats") < 99.7 and player:getFitness():getRegularity("situp") < 99.7 
	and player:getFitness():getRegularity("burpees") < 99.7 then
		-- Remove Fitness
		player:getXp():addXpMultiplier(Perks.Fitness, 1, player:getPerkLevel(Perks.Fitness), 10); -- Grant an XP multiplier to avoid lua errors.
		player:getXp():getMultiplierMap():remove(Perks.Fitness); -- Remove the current XP multiplier
	end

	-- Remove the Strength XP multipliers (if any) when the regularity is lower than 99.7
	if player:getFitness():getRegularity("pushups") < 99.7 and player:getFitness():getRegularity("burpees") < 99.7
	and player:getFitness():getRegularity("barbellcurl") < 99.7 and player:getFitness():getRegularity("dumbbellpress") < 99.7
	and player:getFitness():getRegularity("bicepscurl") < 99.7 then
		player:getXp():addXpMultiplier(Perks.Strength, 1, player:getPerkLevel(Perks.Strength), 10); -- Grant an XP multiplier to avoid lua errors.
		player:getXp():getMultiplierMap():remove(Perks.Strength); -- Remove the current XP multiplier
	end

	-- Grant an XP Multiplier when the regularity is maxed and Strenght and/or Fitness are lv7 or more.

	if player:getPerkLevel(Perks.Fitness) >= 7 then
		if player:getFitness():getRegularity("squats") == 100 then
			player:getXp():addXpMultiplier(Perks.Fitness, 3, player:getPerkLevel(Perks.Fitness), 10);
		end
		if player:getFitness():getRegularity("situp") == 100 then
			player:getXp():addXpMultiplier(Perks.Fitness, 3, player:getPerkLevel(Perks.Fitness), 10);
		end
		if player:getFitness():getRegularity("burpees") == 100 then
			player:getXp():addXpMultiplier(Perks.Fitness, 3, player:getPerkLevel(Perks.Fitness), 10);
		end
	end
	if player:getPerkLevel(Perks.Strength) >= 7 then
		if player:getFitness():getRegularity("pushups") == 100 then
			player:getXp():addXpMultiplier(Perks.Strength, 3, player:getPerkLevel(Perks.Strength), 10);
		end
		if player:getFitness():getRegularity("barbellcurl") == 100 then
			player:getXp():addXpMultiplier(Perks.Strength, 3, player:getPerkLevel(Perks.Strength), 10);
		end
		if player:getFitness():getRegularity("dumbbellpress") == 100 then
			player:getXp():addXpMultiplier(Perks.Strength, 3, player:getPerkLevel(Perks.Strength), 10);
		end
		if player:getFitness():getRegularity("bicepscurl") == 100 then
			player:getXp():addXpMultiplier(Perks.Strength, 3, player:getPerkLevel(Perks.Strength), 10);
		end
		if player:getFitness():getRegularity("burpees") == 100 then
			player:getXp():addXpMultiplier(Perks.Strength, 3, player:getPerkLevel(Perks.Strength), 10);
		end
	end

	-- If Fitness is at Lv10 remove the granted multiplier
	if player:getPerkLevel(Perks.Fitness) == 10 then
		player:getXp():addXpMultiplier(Perks.Fitness, 1, player:getPerkLevel(Perks.Fitness), 10); -- Grant an XP multiplier to avoid lua errors.
		player:getXp():getMultiplierMap():remove(Perks.Fitness); -- Remove the current XP multiplier
	end
	-- If Strength is at Lv10 remove the granted multiplier
	if player:getPerkLevel(Perks.Strength) == 10 then
		player:getXp():addXpMultiplier(Perks.Strength, 1, player:getPerkLevel(Perks.Strength), 10); -- Grant an XP multiplier to avoid lua errors.
		player:getXp():getMultiplierMap():remove(Perks.Strength); -- Remove the current XP multiplier
	end
end
