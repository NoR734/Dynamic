require "TimedActions/ISFitnessAction"

local function DTEMWeaponHasCategory(weapon, category)
    if not weapon then
        return false
    end

    local ok, hasCategory = pcall(function()
        return weapon:getCategories():contains(category)
    end)

    return ok and hasCategory == true
end

local function DTEMWeaponHasCategories(weapon)
    if not weapon then
        return false
    end

    local ok, categories = pcall(function()
        return weapon:getCategories()
    end)

    return ok and categories ~= nil
end

-- Additional tweaks and trait effects when the player hit a tree
function DTEMonHitTree(player, weapon)
    --print("DT Logger: running DTEMonHitTree function");
	if DTEMWeaponHasCategory(weapon, "Axe") then
		player:getXp():AddXP(Perks.Axe, 1);
	end
	if DTEMHasTrait(player, "Prodigy") then
		player:getXp():AddXP(Perks.Fitness, 1);
		player:getXp():AddXP(Perks.Strength, 1);
	end
	-- If the player has the trait "Active" the negative moods are reduced when chopping trees
	if DTEMHasTrait(player, "PhysicallyActive") then
		DTEMdecreaseStress(player, 0.03);
        DTEMdecreaseStressFromCigarettes(player, 0.03);
        DTEMdecreaseBoredom(player, 3);
        DTEMdecreaseUnhappiness(player, 3);
        DTEMdecreaseAnger(player, 0.03);
	-- If the player has the trait "Sedentary" little pain is given to the player when chopping trees
	elseif DTEMHasTrait(player, "Sedentary") then
		DTEMapplyPain(player, ZombRand(10), "ForeArm_L", ZombRand(15));
		DTEMapplyPain(player, ZombRand(10), "ForeArm_R", ZombRand(15));
		DTEMapplyPain(player, ZombRand(10), "UpperArm_L", ZombRand(15));
		DTEMapplyPain(player, ZombRand(10), "UpperArm_R", ZombRand(15));
	end
	player:getModData().DTEMphysicallyActiveSedentaryTraits = player:getModData().DTEMphysicallyActiveSedentaryTraits + 3;
	if player:getModData().DTEMphysicallyActiveSedentaryTraits > 70000 then
		player:getModData().DTEMphysicallyActiveSedentaryTraits = 70000;
	end
end

-- Additional tweaks and trait effects when the player swings the weapon
function DTEMonSwingWeapon(player, weapon)
    --print("DT Logger: running DTEMonSwingWeapon function");
	-- If the player has the trait "Prodigy" extra XP is given to the player for Strength and Fitness
	if DTEMWeaponHasCategory(weapon, "Axe") or DTEMWeaponHasCategory(weapon, "Blunt") then
		if DTEMHasTrait(player, "Prodigy") then
			player:getXp():AddXP(Perks.Fitness, 0.80);
			player:getXp():AddXP(Perks.Strength, 0.80);
		end
		if DTEMHasTrait(player, "Sedentary") then
			DTEMapplyPain(player, ZombRand(10), "ForeArm_L", ZombRand(15));
			DTEMapplyPain(player, ZombRand(10), "ForeArm_R", ZombRand(15));
			DTEMapplyPain(player, ZombRand(10), "UpperArm_L", ZombRand(15));
			DTEMapplyPain(player, ZombRand(10), "UpperArm_R", ZombRand(15));
		end
		player:getModData().DTEMphysicallyActiveSedentaryTraits = player:getModData().DTEMphysicallyActiveSedentaryTraits + 4;
	elseif DTEMWeaponHasCategory(weapon, "Spear") or DTEMWeaponHasCategory(weapon, "LongBlade")then
		if DTEMHasTrait(player, "Prodigy") then
			player:getXp():AddXP(Perks.Fitness, 0.70);
			player:getXp():AddXP(Perks.Strength, 0.70);
		end
		if DTEMHasTrait(player, "Sedentary") then
			DTEMapplyPain(player, ZombRand(10), "ForeArm_L", ZombRand(10));
			DTEMapplyPain(player, ZombRand(10), "ForeArm_R", ZombRand(10));
			DTEMapplyPain(player, ZombRand(10), "UpperArm_L", ZombRand(10));
			DTEMapplyPain(player, ZombRand(10), "UpperArm_R", ZombRand(10));
		end
		player:getModData().DTEMphysicallyActiveSedentaryTraits = player:getModData().DTEMphysicallyActiveSedentaryTraits + 3;
	elseif DTEMWeaponHasCategory(weapon, "SmallBlunt") then
		if DTEMHasTrait(player, "Prodigy") then
			player:getXp():AddXP(Perks.Fitness, 0.60);
			player:getXp():AddXP(Perks.Strength, 0.60);
		end
		if DTEMHasTrait(player, "Sedentary") then
			DTEMapplyPain(player, ZombRand(12), "ForeArm_L", ZombRand(10));
			DTEMapplyPain(player, ZombRand(12), "ForeArm_R", ZombRand(10));
			DTEMapplyPain(player, ZombRand(12), "UpperArm_L", ZombRand(10));
			DTEMapplyPain(player, ZombRand(12), "UpperArm_R", ZombRand(10));
		end
		player:getModData().DTEMphysicallyActiveSedentaryTraits = player:getModData().DTEMphysicallyActiveSedentaryTraits + 2;
	elseif DTEMWeaponHasCategory(weapon, "SmallBlade") then
		if DTEMHasTrait(player, "Prodigy") then
			player:getXp():AddXP(Perks.Fitness, 0.50);
			player:getXp():AddXP(Perks.Strength, 0.50);
		end
		if DTEMHasTrait(player, "Sedentary") then
			DTEMapplyPain(player, ZombRand(15), "ForeArm_L", ZombRand(8));
			DTEMapplyPain(player, ZombRand(15), "ForeArm_R", ZombRand(8));
			DTEMapplyPain(player, ZombRand(15), "UpperArm_L", ZombRand(8));
			DTEMapplyPain(player, ZombRand(15), "UpperArm_R", ZombRand(8));
		end
		player:getModData().DTEMphysicallyActiveSedentaryTraits = player:getModData().DTEMphysicallyActiveSedentaryTraits + 1;
	elseif DTEMWeaponHasCategory(weapon, "Unarmed") then
		if DTEMHasTrait(player, "Prodigy") then
			player:getXp():AddXP(Perks.Fitness, 0.25);
			player:getXp():AddXP(Perks.Strength, 0.25);
		end
		player:getModData().DTEMphysicallyActiveSedentaryTraits = player:getModData().DTEMphysicallyActiveSedentaryTraits + 1;
	end
	-- If the player has the trait "Active" the negative moods are reduced when when fighting
	if DTEMHasTrait(player, "PhysicallyActive") then
		DTEMdecreaseStress(player, 0.01);
        DTEMdecreaseStressFromCigarettes(player, 0.01);
        DTEMdecreaseBoredom(player, 1);
        DTEMdecreaseUnhappiness(player, 1);
        DTEMdecreaseAnger(player, 0.01);
	end
	if player:getModData().DTEMphysicallyActiveSedentaryTraits > 70000 then
		player:getModData().DTEMphysicallyActiveSedentaryTraits = 70000;
	end
	--print("player:getModData().DTEMphysicallyActiveSedentaryTraits: " .. player:getModData().DTEMphysicallyActiveSedentaryTraits);
end

function DTEMonPlayerMoving(player)
    --print("DT Logger: running DTEMonPlayerMoving function");
    -- Player is walking
    if player:isPlayerMoving() and not player:isRunning() and not player:isSprinting() then
        --print("Player is walking");
        if DTEMHasTrait(player, "PhysicallyActive") then
            DTEMdecreaseStress(player, 0.003);
            DTEMdecreaseStressFromCigarettes(player, 0.003);
            DTEMdecreaseBoredom(player, 0.3);
            DTEMdecreaseUnhappiness(player, 0.3);
            DTEMdecreaseAnger(player, 0.003);
        end
        -- Player is running
    elseif player:isRunning() then
        --print("Player is running");
        if DTEMHasTrait(player, "PhysicallyActive") then
            DTEMdecreaseStress(player, 0.01);
            DTEMdecreaseStressFromCigarettes(player, 0.01);
            DTEMdecreaseBoredom(player, 1);
            DTEMdecreaseUnhappiness(player, 1);
            DTEMdecreaseAnger(player, 0.01);
        elseif DTEMHasTrait(player, "Sedentary") then
            DTEMapplyPain(player, ZombRand(3), "UpperLeg_L", ZombRand(7));
            DTEMapplyPain(player, ZombRand(3), "UpperLeg_R", ZombRand(7));
            DTEMapplyPain(player, ZombRand(3), "LowerLeg_L", ZombRand(7));
            DTEMapplyPain(player, ZombRand(3), "LowerLeg_R", ZombRand(7));
        end
        if DTEMHasTrait(player, "Prodigy") then
			player:getXp():AddXP(Perks.Fitness, 3);
		end
        player:getModData().DTEMphysicallyActiveSedentaryTraits = player:getModData().DTEMphysicallyActiveSedentaryTraits + 1;
        -- Player is sprinting
    elseif player:isSprinting() then
        --print("Player is sprinting");
        if DTEMHasTrait(player, "PhysicallyActive") then
            DTEMdecreaseStress(player, 0.015);
            DTEMdecreaseStressFromCigarettes(player, 0.015);
            DTEMdecreaseBoredom(player, 1.5);
            DTEMdecreaseUnhappiness(player, 1.5);
            DTEMdecreaseAnger(player, 0.015);
        elseif DTEMHasTrait(player, "Sedentary") then
            DTEMapplyPain(player, ZombRand(3), "UpperLeg_L", ZombRand(10));
            DTEMapplyPain(player, ZombRand(3), "UpperLeg_R", ZombRand(10));
            DTEMapplyPain(player, ZombRand(3), "LowerLeg_L", ZombRand(10));
            DTEMapplyPain(player, ZombRand(3), "LowerLeg_R", ZombRand(10));
        end
        if DTEMHasTrait(player, "Prodigy") then
			player:getXp():AddXP(Perks.Fitness, 5);
		end
        player:getModData().DTEMphysicallyActiveSedentaryTraits = player:getModData().DTEMphysicallyActiveSedentaryTraits + 2;
    end
    if player:getModData().DTEMphysicallyActiveSedentaryTraits > 70000 then
        player:getModData().DTEMphysicallyActiveSedentaryTraits = 70000;
    end
    --print("player:getModData().DTEMphysicallyActiveSedentaryTraits: " .. player:getModData().DTEMphysicallyActiveSedentaryTraits);
end

function DTEMonPlayerHittingAZombie(player, target, weapon, damage)
    --print("DT Logger: running DTEMonPlayerHittingAZombie function");
    if target:isZombie() and not target:getVariableBoolean("Bandit") then
        --print("DT Logger: target is a zombie and not a Bandit");
        if DTEMWeaponHasCategories(weapon) and not DTEMWeaponHasCategory(weapon, "Unarmed") then
            --print("DT Logger: using a weapon");
            --print("DT Logger: damage: " .. damage);
            local currentTargetHealth = target:getHealth();
            --print("DT Logger: current target health: " .. currentTargetHealth);
            local additionalDamageToDeal = (damage * DTEMGetStatValue(player:getStats(), "ANGER", "getAnger", 0)) / 2;
            --print("DT Logger: additionalDamageToDeal: " .. additionalDamageToDeal);
            target:setHealth(currentTargetHealth - additionalDamageToDeal);
            --print("DT Logger: new target health: " .. target:getHealth());
            if target:getHealth() <= 0 then
			    target:update();
		    end
            if player:getMoodles():getMoodleLevel(MoodleType.ANGRY) ~= 0 then
                local currentWeaponCondition = weapon:getCondition();
                --print("DT Logger: current weapon condition: " .. currentWeaponCondition);
                local range = 0;
                if player:getMoodles():getMoodleLevel(MoodleType.ANGRY) == 1 then
                    range = 40;
                elseif player:getMoodles():getMoodleLevel(MoodleType.ANGRY) == 2 then
                    range = 30;
                elseif player:getMoodles():getMoodleLevel(MoodleType.ANGRY) == 3 then
                    range = 20;
                elseif player:getMoodles():getMoodleLevel(MoodleType.ANGRY) == 4 then
                    range = 10;
                end
                range = range + player:getPerkLevel(Perks.Maintenance) + weapon:getConditionLowerChance() + DTEMluckyUnluckyModifier(player, 15);
                --print("DT Logger: range: " .. range);
                if ZombRand(range) == 0 then
                    --print("DT Logger: reducing weapon condition");
                    weapon:setCondition(currentWeaponCondition - 1);
                    --print("DT Logger: new weapon condition: " .. weapon:getCondition());
                    DTEMincreaseAnger(player, 0, 0.15);
                end
                if weapon:getCondition() <= 0 then
                    --print("DT Logger: weapon broke, increasing anger");
                    DTEMincreaseAnger(player, 0, 0.50);
                end
            end
        end
    end
end

local DTfitness = {}
DTfitness.ISFitnessAction = {}

DTfitness.ISFitnessAction.exeLooped = ISFitnessAction.exeLooped
function ISFitnessAction:exeLooped()
    DTfitness.ISFitnessAction.exeLooped(self)
    --print("DT Logger: running ISFitnessAction:exeLooped function");
    --print("self.exercise: " .. self.exercise)
    player = self.character;
    -- If the player has the trait "Prodigy", extra experience is added to Strength or/and Fitness on each loop (depending on the exercise)
    -- If the player has the trait "Physically Active" the negative moods are reduced when doing exercise
    -- If the player has the trait "Sedentary" extra pain is added the the bodyparts based on the exercise
    if self.exercise == "squats" then
        if DTEMHasTrait(player, "Prodigy") then
            player:getXp():AddXP(Perks.Fitness, (self.exeData.xpMod * 3));
        end
        if DTEMHasTrait(player, "Sedentary") then
            DTEMapplyPain(player, 0, "UpperLeg_L", ZombRand(7));
            DTEMapplyPain(player, 0, "UpperLeg_R", ZombRand(7));
            DTEMapplyPain(player, 0, "LowerLeg_L", ZombRand(7));
            DTEMapplyPain(player, 0, "LowerLeg_R", ZombRand(7));
        end
    elseif self.exercise == "pushups" then
        if DTEMHasTrait(player, "Prodigy") then
            player:getXp():AddXP(Perks.Strength, (self.exeData.xpMod * 3));
        end
        if DTEMHasTrait(player, "Sedentary") then
            DTEMapplyPain(player, 0, "ForeArm_L", ZombRand(7));
            DTEMapplyPain(player, 0, "ForeArm_R", ZombRand(7));
            DTEMapplyPain(player, 0, "UpperArm_L", ZombRand(7));
            DTEMapplyPain(player, 0, "UpperArm_R", ZombRand(7));
        end
    elseif self.exercise == "situp" then
        if DTEMHasTrait(player, "Prodigy") then
            player:getXp():AddXP(Perks.Fitness, (self.exeData.xpMod * 3));
        end
        if DTEMHasTrait(player, "Sedentary") then
            DTEMapplyPain(player, 0, "Torso_Lower", ZombRand(15));
        end
    elseif self.exercise == "burpees" then
        if DTEMHasTrait(player, "Prodigy") then
            player:getXp():AddXP(Perks.Fitness, (self.exeData.xpMod * 3));
            player:getXp():AddXP(Perks.Strength, (self.exeData.xpMod * 3));
        end
        if DTEMHasTrait(player, "Sedentary") then
            DTEMapplyPain(player, 0, "UpperLeg_L", ZombRand(5));
            DTEMapplyPain(player, 0, "UpperLeg_R", ZombRand(5));
            DTEMapplyPain(player, 0, "LowerLeg_L", ZombRand(5));
            DTEMapplyPain(player, 0, "LowerLeg_R", ZombRand(5));
            DTEMapplyPain(player, 0, "ForeArm_L", ZombRand(5));
            DTEMapplyPain(player, 0, "ForeArm_R", ZombRand(5));
            DTEMapplyPain(player, 0, "UpperArm_L", ZombRand(5));
            DTEMapplyPain(player, 0, "UpperArm_R", ZombRand(5));
        end
    elseif self.exercise == "barbellcurl" then
        if DTEMHasTrait(player, "Prodigy") then
            player:getXp():AddXP(Perks.Strength, (self.exeData.xpMod * 3));
        end
        if DTEMHasTrait(player, "Sedentary") then
            DTEMapplyPain(player, 0, "ForeArm_L", ZombRand(10));
            DTEMapplyPain(player, 0, "ForeArm_R", ZombRand(10));
            DTEMapplyPain(player, 0, "UpperArm_L", ZombRand(10));
            DTEMapplyPain(player, 0, "UpperArm_R", ZombRand(10));
        end
    elseif self.exercise == "dumbbellpress" then
        if DTEMHasTrait(player, "Prodigy") then
            player:getXp():AddXP(Perks.Strength, (self.exeData.xpMod * 3));
        end
        if DTEMHasTrait(player, "Sedentary") then
            DTEMapplyPain(player, 0, "ForeArm_L", ZombRand(10));
            DTEMapplyPain(player, 0, "ForeArm_R", ZombRand(10));
            DTEMapplyPain(player, 0, "UpperArm_L", ZombRand(13));
            DTEMapplyPain(player, 0, "UpperArm_R", ZombRand(13));
        end
    elseif self.exercise == "bicepscurl" then
        if DTEMHasTrait(player, "Prodigy") then
            player:getXp():AddXP(Perks.Strength, (self.exeData.xpMod * 3));
        end
        if DTEMHasTrait(player, "Sedentary") then
            DTEMapplyPain(player, 0, "ForeArm_L", ZombRand(10));
            DTEMapplyPain(player, 0, "ForeArm_R", ZombRand(10));
            DTEMapplyPain(player, 0, "UpperArm_L", ZombRand(13));
            DTEMapplyPain(player, 0, "UpperArm_R", ZombRand(13));
        end
    end
    if getActivatedMods():contains("FWOBenchPress&Treadmill") then
        if self.exercise == "treadmill" then
            --print("DT Logger: FWO treadmill exercise");
            if DTEMHasTrait(player, "Prodigy") then
                player:getXp():AddXP(Perks.Fitness, (self.exeData.xpMod * 3));
            end
            if DTEMHasTrait(player, "Sedentary") then
                DTEMapplyPain(player, 0, "UpperLeg_L", ZombRand(3));
                DTEMapplyPain(player, 0, "UpperLeg_R", ZombRand(3));
                DTEMapplyPain(player, 0, "LowerLeg_L", ZombRand(3));
                DTEMapplyPain(player, 0, "LowerLeg_R", ZombRand(3));
                DTEMapplyPain(player, 0, "Torso_Lower", ZombRand(3));
            end
        elseif self.exercise == "benchpress" then
            --print("DT Logger: FWO benchpress exercise");
            if DTEMHasTrait(player, "Prodigy") then
                player:getXp():AddXP(Perks.Strength, (self.exeData.xpMod * 3));
            end
            if DTEMHasTrait(player, "Sedentary") then
                DTEMapplyPain(player, 0, "ForeArm_L", ZombRand(3));
                DTEMapplyPain(player, 0, "ForeArm_R", ZombRand(3));
                DTEMapplyPain(player, 0, "UpperArm_L", ZombRand(3));
                DTEMapplyPain(player, 0, "UpperArm_R", ZombRand(3));
            end
        end
    end
    -- IMPROVE THE MOODLE IF PHYSICALLY ACTIVE IS PRESENT
    if DTEMHasTrait(player, "PhysicallyActive") then
        DTEMdecreaseStress(player, 0.05);
        DTEMdecreaseStressFromCigarettes(player, 0.05);
        DTEMdecreaseUnhappiness(player, 5);
        DTEMdecreaseBoredom(player, 5);
        DTEMdecreaseAnger(player, 0.05);
        -- GIVE BOREDOM IF SEDENTARY IS PRESENT
    elseif DTEMHasTrait(player, "Sedentary") then
        DTEMincreaseBoredom(player, 3, 7);
    end
    player:getModData().DTEMphysicallyActiveSedentaryTraits = player:getModData().DTEMphysicallyActiveSedentaryTraits + 10;
    if player:getModData().DTEMphysicallyActiveSedentaryTraits > 70000 then
        player:getModData().DTEMphysicallyActiveSedentaryTraits = 70000;
    end
    -- IF THE ROLL IS 0 THEN THE NEXT TRAITS ARE POSITIVELY AFFECTED: SMOKER, ALCOHOLIC, ANOREXIC
    if ZombRand(10) == 0 then
        --print("Roll is success while doing excercise")
        -- SMOKER
        if DTEMHasTrait(player, "Smoker") then
            player:getModData().DTEMdaysSinceLastSmoke = player:getModData().DTEMdaysSinceLastSmoke + ZombRand(7);
        end
        -- ALCOHOLIC
        player:getModData().DTEMalcoholicTrait = player:getModData().DTEMalcoholicTrait + ZombRand(50);
        -- ANOREXIC
        player:getModData().DTEManorexyTrait = player:getModData().DTEManorexyTrait + ZombRand(10);
    end
    DTEMincreaseWetness(player, 0, 1);
    --print("DT Logger: end of ISFitnessAction:exeLooped function")
end
