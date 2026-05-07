function DTEMallergyIncrease(player, allergy)
    --print("DT Logger: running DTEMallergyIncrease function")
	--print("allergy: " .. allergy)
	if player:HasTrait("WeakStomach") then
		allergy = allergy * 1.1
		--print("DT Logger: player has trait WeakStomach");
		--print("DT Logger: allergy: " .. allergy);
	elseif player:HasTrait("IronGut") then
		allergy = allergy * 0.9
		--print("DT Logger: player has trait IronGut");
		--print("DT Logger: allergy: " .. allergy);
	end
	if player:HasTrait("ProneToIllness") then
		allergy = allergy * 1.3
		--print("DT Logger: player has trait ProneToIllness");
		--print("DT Logger: allergy: " .. allergy);
	elseif player:HasTrait("Resilient") then
		allergy = allergy * 0.7
		--print("DT Logger: player has trait Resilient");
		--print("DT Logger: allergy: " .. allergy);
	end
	--print("allergy: " .. allergy)
	player:getModData().DTEMallergy = player:getModData().DTEMallergy + allergy
    if player:getModData().DTEMallergy > 100 then
        player:getModData().DTEMallergy = 100
    end
end

function DTEMallergyDecrease(player)
    --print("DT Logger: running DTEMallergyDecrease function")
	if ZombRand(5) == 0 then
		local decrease = ZombRand(5)
		--print("decrease: " .. decrease)
		if player:HasTrait("WeakStomach") then
			decrease = decrease * 0.9
			--("DT Logger: player has trait WeakStomach");
			--print("DT Logger: decrease: " .. decrease);
		elseif player:HasTrait("IronGut") then
			decrease = decrease * 1.1
			--print("DT Logger: player has trait IronGut");
			--print("DT Logger: decrease: " .. decrease);
		end
		if player:HasTrait("SlowHealer") then
			decrease = decrease * 0.8
			--print("DT Logger: player has trait SlowHealer");
			--print("DT Logger: decrease: " .. decrease);
		elseif player:HasTrait("FastHealer") then
			decrease = decrease * 1.2
			--print("DT Logger: player has trait FastHealer");
			--print("DT Logger: decrease: " .. decrease);
		end
		--print("decrease: " .. decrease)
		player:getModData().DTEMallergy = player:getModData().DTEMallergy - decrease
		if player:getModData().DTEMallergy < 0 then
			player:getModData().DTEMallergy = 0
		end
	end
	--print("player:getModData().DTEMallergy: " .. player:getModData().DTEMallergy);
end

function DTEMallergyMoodleLv1(player)
	--print("DT Logger: running DTEMallergyMoodleLv1 function");
	-- Sneezes and cough with this frecueny will only occur in the Moodle Lv1.
	if player:getModData().DTEMallergy > 20 and player:getModData().DTEMallergy <= 40 then
		if ZombRand(50) == 0 then
			player:playEmote("dtsneeze")
			player:Say(getText("IGUI_PlayerText_Sneeze"))
            local rand = ZombRand(3, 10)
        	addSound(player, player:getX(), player:getY(), player:getZ(), rand, rand)
		end
        if ZombRand(40) == 0 then
			player:playEmote("dtcough")
			player:Say(getText("IGUI_PlayerText_Cough"))
            local rand = ZombRand(3, 10)
			addSound(player, player:getX(), player:getY(), player:getZ(), rand, rand)
		end
	end
end

function DTEMallergyMoodleLv2(player)
	--print("DT Logger: running DTEMallergyMoodleLv2 function");
	if player:getModData().DTEMallergy > 40 then
		-- Sneezes and cough with this frecueny will only occur in the Moodle Lv2.
		if player:getModData().DTEMallergy <= 60 then
			if ZombRand(30) == 0 then
				player:playEmote("dtsneeze")
				player:Say(getText("IGUI_PlayerText_Sneeze"))
                local rand = ZombRand(5, 15)
				addSound(player, player:getX(), player:getY(), player:getZ(), rand, rand)
			end
            if ZombRand(20) == 0 then
				player:playEmote("dtcough")
				player:Say(getText("IGUI_PlayerText_Cough"))
                local rand = ZombRand(5, 15)
				addSound(player, player:getX(), player:getY(), player:getZ(), rand, rand)
			end
		end
		-- These next effects will be part of Moodle Lv2, Lv3 and Lv4
		if ZombRand(5) == 0 then
			local randNumb = ZombRand(4)
			if randNumb == 0 then
				--print("dtallergyleftarm")
				player:playEmote("dtallergyleftarm");
				DTEMapplyPain(player, 0, "ForeArm_L", ZombRand(15));
				DTEMapplyPain(player, 0, "UpperArm_L", ZombRand(15));
			elseif randNumb == 1 then
				--print("dtallergylefthand")
				player:playEmote("dtallergylefthand");
				DTEMapplyPain(player, 0, "Hand_L", ZombRand(15));
			elseif randNumb == 2 then
				--print("dtallergyrightarm")
				player:playEmote("dtallergyrightarm");
				DTEMapplyPain(player, 0, "ForeArm_R", ZombRand(15));
				DTEMapplyPain(player, 0, "UpperArm_R", ZombRand(15));
			elseif randNumb == 3 then
				--print("dtallergyrighthand")
				player:playEmote("dtallergyrighthand");
				DTEMapplyPain(player, 0, "Hand_R", ZombRand(15));
			end
		end
	end
end

function DTEMallergyMoodleLv3(player)
	--print("DT Logger: running DTEMallergyMoodleLv3 function");
	if player:getModData().DTEMallergy > 60 then
		if ZombRand(5) == 0 then
			local randNumb = ZombRand(3)
			if randNumb == 0 then
				--print("dtallergyleftleg")
				player:playEmote("dtallergyleftleg");
				DTEMapplyPain(player, 0, "UpperLeg_L", ZombRand(15));
				DTEMapplyPain(player, 0, "LowerLeg_L", ZombRand(15));
			elseif randNumb == 1 then
				--print("dtallergypullatcollar")
				player:playEmote("dtallergypullatcollar");
				DTEMapplyPain(player, 0, "Neck", ZombRand(15));
			elseif randNumb == 2 then
				--print("dtallergyrightleg")
				player:playEmote("dtallergyrightleg");
				DTEMapplyPain(player, 0, "UpperLeg_R", ZombRand(15));
				DTEMapplyPain(player, 0, "LowerLeg_R", ZombRand(15));
			end
		end
	end
end

function DTEMallergyMoodleLv4(player)
	--print("DT Logger: running DTEMallergyMoodleLv4 function");
	if player:getModData().DTEMallergy > 80 then
		DTEMincreaseFatigue(player, ZombRand(10), 0.07);
		DTEMdecreaseEndurance(player, ZombRand(10), 0.07);
		DTEMdecreaseBodyPartHealth(player, 0, 2);
		if ZombRand(3) == 0 then
			player:playEmote("dtfeelfeint");
			DTEMapplyPain(player, 0, "Head", ZombRand(15));
			DTEMincreaseFoodSickness(player, 3, 3);
		end
	end
end