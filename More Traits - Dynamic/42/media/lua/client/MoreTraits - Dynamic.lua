function MTDLevelPerkMain(player, perk)
	MTDTraitsGainsByLevel(player, perk);
end

function MTDapplyXPBoost(player, perk, boostLevel)
	local currentXPBoost = player:getXp():getPerkBoost(perk);
	local newBoost = currentXPBoost + boostLevel;
	if newBoost > 3 then
		player:getXp():setPerkBoost(perk, 3);
	else
		player:getXp():setPerkBoost(perk, newBoost);
	end
end

function MTDEveryOneMinuteMain()
	MTDTraitGainsByPanic();
end

function MTDEveryTenMinutesMain()
	MTDTraitGainsByInjuries();
end

function MTDEveryTenMinutesMain()
	MTDTraitGainsByInjuries();
end

function MTDEveryHoursMain()
	MTDTraitGainsByWeight();
end

function MTDOnWeaponHitCharacterMain(wielder, target, weapon, damage)
	if wielder == getPlayer() and target:isZombie() then
		-- Leadfoot
		if SandboxVars.MoreTraitsDynamic.LeadFootDynamic == true and not MTDHasTrait(wielder, "leadfoot") then
			MTDLeadFootToggle(wielder, target, weapon);
		end
		-- Mundane
		if SandboxVars.MoreTraitsDynamic.MundaneDynamic == true and MTDHasTrait(wielder, "mundane") then
			MTDMundane(wielder, damage);
		end
	end
end

function MTDKillsMainExtended(zombie)
	if SandboxVars.MoreTraitsDynamic.LeadFootDynamic == true and not MTDHasTrait(getPlayer(), "leadfoot") then
		MTDLeadFoot(zombie);
	end
	MTDTraitsGainsByLevel(getPlayer(), "KillCount");
end

function MTDKillsMain(zombie)
	MTDLeadFoot(zombie);
end

function MTDMundane(wielder, damage)
	wielder:getModData().MoreTraitsDynamic = wielder:getModData().MoreTraitsDynamic or {};
	wielder:getModData().MoreTraitsDynamic.TotalDamageDone = wielder:getModData().MoreTraitsDynamic.TotalDamageDone or 0;
	wielder:getModData().MoreTraitsDynamic.TotalDamageDone = wielder:getModData().MoreTraitsDynamic.TotalDamageDone + damage;
	print("Total damage:"..wielder:getModData().MoreTraitsDynamic.TotalDamageDone);
	if getGameTime():getModData().MTModVersion == 1 then
		if wielder:getModData().MoreTraitsDynamic.TotalDamageDone >= math.floor(SandboxVars.MoreTraitsDynamic.MundaneDynamicDamage / 10) then
			MTDRemoveTrait(wielder, "mundane");
			HaloTextHelper.addTextWithArrow(wielder, getText("UI_trait_mundane"), false, HaloTextHelper.getColorGreen());
		end
	else
		if wielder:getModData().MoreTraitsDynamic.TotalDamageDone >= SandboxVars.MoreTraitsDynamic.MundaneDynamicDamage then
			MTDRemoveTrait(wielder, "mundane");
			HaloTextHelper.addTextWithArrow(wielder, getText("UI_trait_mundane"), false, HaloTextHelper.getColorGreen());
		end
	end
end

function MTDLeadFootToggle(wielder, target, weapon)
	wielder:getModData().MoreTraitsDynamic = wielder:getModData().MoreTraitsDynamic or {};
	wielder:getModData().MoreTraitsDynamic.AllowLeadFootCount = wielder:getModData().MoreTraitsDynamic.AllowLeadFootCount or false;
	if weapon:getName() == "Bare Hands" and target:isProne() then
		wielder:getModData().MoreTraitsDynamic.AllowLeadFootCount = true;
	else
		wielder:getModData().MoreTraitsDynamic.AllowLeadFootCount = false;
	end
end

function MTDTraitsGainsByLevel(player, perk)
	local player = player or getPlayer();
	local killCountisOn = false;
	if getActivatedMods():contains("KillCount") then
		killCountisOn = true;
	end;
	-- Passive
		-- Strength
			-- Pack Mouse / Pack Mule
				if perk == "characterInitialization" or perk == Perks.Strength then
					-- Pack Mouse
					if SandboxVars.MoreTraitsDynamic.PackMouseDynamic == true and MTDHasTrait(player, "packmouse") and player:getPerkLevel(Perks.Strength) >= SandboxVars.MoreTraitsDynamic.PackMouseDynamicSkill then
						MTDRemoveTrait(player, "packmouse");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_packmouse"), false, HaloTextHelper.getColorGreen());
					end
					-- Pack Mule
					if SandboxVars.MoreTraitsDynamic.PackMuleDynamic == true and not MTDHasTrait(player, "packmule") and player:getPerkLevel(Perks.Strength) >= SandboxVars.MoreTraitsDynamic.PackMuleDynamicSkill then
						MTDAddTrait(player, "packmule");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_packmule"), true, HaloTextHelper.getColorGreen());
					end
				end
			-- Indefatigable
				if perk == "characterInitialization" or perk == Perks.Strength or perk == Perks.Fitness or perk == Perks.Sprinting or perk == Perks.Lightfoot or perk == Perks.Nimble or perk == Perks.Sneak or perk == Perks.Axe or perk == Perks.Blunt or perk == Perks.SmallBlunt	or perk == Perks.LongBlade or perk == Perks.SmallBlade or perk == Perks.Spear then
					if SandboxVars.MoreTraitsDynamic.IndefatigableDynamic == true and not MTDHasTrait(player, "indefatigable") and (player:getPerkLevel(Perks.Strength) + player:getPerkLevel(Perks.Fitness) + player:getPerkLevel(Perks.Sprinting) + player:getPerkLevel(Perks.Lightfoot) + player:getPerkLevel(Perks.Nimble) + player:getPerkLevel(Perks.Sneak) + player:getPerkLevel(Perks.Axe) + player:getPerkLevel(Perks.Blunt) + player:getPerkLevel(Perks.SmallBlunt) + player:getPerkLevel(Perks.LongBlade) + player:getPerkLevel(Perks.SmallBlade) + player:getPerkLevel(Perks.Spear)) >= SandboxVars.MoreTraitsDynamic.IndefatigableDynamicSkill then
						MTDAddTrait(player, "indefatigable");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_indefatigable"), true, HaloTextHelper.getColorGreen());
					end
				end
			-- Second Wind // Gym-Goer
				if perk == "characterInitialization" or perk == Perks.Strength or perk == Perks.Fitness then
					local sumOfLevels = player:getPerkLevel(Perks.Strength) + player:getPerkLevel(Perks.Fitness);
					-- Gym-Goer
					if SandboxVars.MoreTraitsDynamic.GymGoerDynamic == true and not MTDHasTrait(player, "gymgoer") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.GymGoerDynamicSkill then
						MTDAddTrait(player, "gymgoer");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_gymgoer"), true, HaloTextHelper.getColorGreen());
					end
					-- Second Wind
					if SandboxVars.MoreTraitsDynamic.SecondWindDynamic == true and not MTDHasTrait(player, "secondwind") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.SecondWindDynamicSkill then
						MTDAddTrait(player, "secondwind");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_secondwind"), true, HaloTextHelper.getColorGreen());
					end
				end
		-- Fitness
			-- Hardy
				if perk == "characterInitialization" or perk == Perks.Fitness then
					if SandboxVars.MoreTraitsDynamic.HardyDynamic == true and not MTDHasTrait(player, "hardy") and player:getPerkLevel(Perks.Fitness) >= SandboxVars.MoreTraitsDynamic.HardyDynamicSkill then
						MTDAddTrait(player, "hardy");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_hardy"), true, HaloTextHelper.getColorGreen());
					end
				end
			-- Noodle Legs / Evasive
				if perk == "characterInitialization" or perk == Perks.Fitness or perk == Perks.Sprinting or perk == Perks.Lightfoot or perk == Perks.Nimble or perk == Perks.Sneak then
					local sumOfLevels = player:getPerkLevel(Perks.Fitness) + player:getPerkLevel(Perks.Sprinting) + player:getPerkLevel(Perks.Lightfoot) + player:getPerkLevel(Perks.Nimble) + player:getPerkLevel(Perks.Sneak);
					-- Noodle Legs
					if SandboxVars.MoreTraitsDynamic.NoodleLegsDynamic == true and MTDHasTrait(player, "noodlelegs") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.NoodleLegsDynamicSkill then
						MTDRemoveTrait(player, "noodlelegs");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_noodlelegs"), false, HaloTextHelper.getColorGreen());
					end
					-- Evasive
					if SandboxVars.MoreTraitsDynamic.EvasiveDynamic == true and not MTDHasTrait(player, "evasive") and not MTDHasTrait(player, "noodlelegs") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.EvasiveDynamicSkill then
						MTDAddTrait(player, "evasive");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_evasive"), true, HaloTextHelper.getColorGreen());
					end
				end
	-- Agility
		-- Sprinting
			-- Olympian
				if perk == "characterInitialization" or perk == Perks.Sprinting or player:getPerkLevel(Perks.Fitness) then
					if SandboxVars.MoreTraitsDynamic.OlympianDynamic == true and not MTDHasTrait(player, "olympian") and player:getPerkLevel(Perks.Sprinting) >= SandboxVars.MoreTraitsDynamic.OlympianDynamicSkillSprinting and player:getPerkLevel(Perks.Fitness) >= SandboxVars.MoreTraitsDynamic.OlympianDynamicSkillFitness then
						MTDAddTrait(player, "olympian");
						MTDapplyXPBoost(player, Perks.Sprinting, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_olympian"), true, HaloTextHelper.getColorGreen());
					end
				end
			-- Slowpoke // Fast
				if perk == "characterInitialization" or perk == Perks.Sprinting or perk == Perks.Lightfoot or perk == Perks.Nimble or perk == Perks.Sneak then
					local sumOfLevels = player:getPerkLevel(Perks.Sprinting) + player:getPerkLevel(Perks.Lightfoot) + player:getPerkLevel(Perks.Nimble) + player:getPerkLevel(Perks.Sneak);
					-- Slowpoke
					if SandboxVars.MoreTraitsDynamic.SlowpokeDynamic == true and MTDHasTrait(player, "gimp") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.SlowpokeDynamicSkill then
						MTDRemoveTrait(player, "gimp");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_gimp"), false, HaloTextHelper.getColorGreen());
					end
					-- Fast
					if SandboxVars.MoreTraitsDynamic.FastDynamic == true and not MTDHasTrait(player, "fast") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.FastDynamicSkill then
						MTDAddTrait(player, "fast");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_fast"), true, HaloTextHelper.getColorGreen());
					end
				end
		-- Lightfooted
			-- Swift
				if perk == "characterInitialization" or perk == Perks.Lightfoot then
					if SandboxVars.MoreTraitsDynamic.SwiftDynamic == true and not MTDHasTrait(player, "swift") and player:getPerkLevel(Perks.Lightfoot) >= SandboxVars.MoreTraitsDynamic.SwiftDynamicSkill then
						MTDAddTrait(player, "swift");
						MTDapplyXPBoost(player, Perks.Lightfoot, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_swift"), true, HaloTextHelper.getColorGreen());
					end
				end
		-- Nimble
			-- Flexible // Well-Fitted
				if perk == "characterInitialization" or perk == Perks.Nimble then
					-- Flexible
					if SandboxVars.MoreTraitsDynamic.FlexibleDynamic == true and not MTDHasTrait(player, "flexible") and player:getPerkLevel(Perks.Nimble) >= SandboxVars.MoreTraitsDynamic.FlexibleDynamicSkill then
						MTDAddTrait(player, "flexible");
						MTDapplyXPBoost(player, Perks.Nimble, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_flexible"), true, HaloTextHelper.getColorGreen());
					end
					if SandboxVars.MoreTraitsDynamic.WellFittedDynamic == true and not MTDHasTrait(player, "fitted") and player:getPerkLevel(Perks.Nimble) >= SandboxVars.MoreTraitsDynamic.WellFittedDynamicSkill then
						MTDAddTrait(player, "fitted");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_fitted"), true, HaloTextHelper.getColorGreen());
					end
				end
			-- Terminator
				if perk == "characterInitialization" or perk == "KillCount" or perk == Perks.Nimble or perk == Perks.Aiming or perk == Perks.Reloading then
					if killCountisOn and not getActivatedMods():contains("Advanced_trajectory") then
						local categoryKills = 0;
						if player:getModData().KillCount ~= nil and player:getModData().KillCount.WeaponCategory ~= nil and player:getModData().KillCount.WeaponCategory["Firearm"] ~= nil then
								categoryKills = player:getModData().KillCount.WeaponCategory["Firearm"].count or 0;
						end
						if SandboxVars.MoreTraitsDynamic.TerminatorDynamic == true and not MTDHasTrait(player, "terminator") and (player:getPerkLevel(Perks.Nimble) + player:getPerkLevel(Perks.Aiming) + player:getPerkLevel(Perks.Reloading)) >= SandboxVars.MoreTraitsDynamic.TerminatorDynamicSkill and categoryKills >= SandboxVars.MoreTraitsDynamic.TerminatorDynamicKill then
							MTDAddTrait(player, "terminator");
							HaloTextHelper.addTextWithArrow(player, getText("UI_trait_terminator"), true, HaloTextHelper.getColorGreen());
						end
					elseif SandboxVars.MoreTraitsDynamic.TerminatorDynamic == true and not MTDHasTrait(player, "terminator") and (player:getPerkLevel(Perks.Nimble) + player:getPerkLevel(Perks.Aiming) + player:getPerkLevel(Perks.Reloading)) >= SandboxVars.MoreTraitsDynamic.TerminatorDynamicSkill then
						MTDAddTrait(player, "terminator");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_terminator"), true, HaloTextHelper.getColorGreen());
					end
				end
		-- Sneaking
			-- Quiet
				if perk == "characterInitialization" or perk == Perks.Sneak then
					if SandboxVars.MoreTraitsDynamic.QuietDynamic == true and not MTDHasTrait(player, "quiet") and player:getPerkLevel(Perks.Sneak) >= SandboxVars.MoreTraitsDynamic.QuietDynamicSkill then
						MTDAddTrait(player, "quiet");
						MTDapplyXPBoost(player, Perks.Sneak, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_quiet"), true, HaloTextHelper.getColorGreen());
					end
				end
	-- Combat
		-- Axe
			-- Tawern Brawler
				if perk == "characterInitialization" or perk == Perks.Axe or perk == Perks.Blunt or perk == Perks.SmallBlunt or perk == Perks.LongBlade or perk == Perks.SmallBlade or perk == Perks.Spear then
					if SandboxVars.MoreTraitsDynamic.TavernBrawlerDynamic == true and not MTDHasTrait(player, "tavernbrawler") and (player:getPerkLevel(Perks.Axe) + player:getPerkLevel(Perks.Blunt) + player:getPerkLevel(Perks.SmallBlunt) + player:getPerkLevel(Perks.LongBlade) + player:getPerkLevel(Perks.SmallBlade) + player:getPerkLevel(Perks.Spear)) >= SandboxVars.MoreTraitsDynamic.TavernBrawlerDynamicSkill then
						MTDAddTrait(player, "tavernbrawler");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_tavernbrawler"), true, HaloTextHelper.getColorGreen());
					end
				end
			-- Prowess: Blade
				if perk == "characterInitialization" or perk == "KillCount" or perk == Perks.Axe or perk == Perks.LongBlade or perk == Perks.SmallBlade then
					if killCountisOn then
						player:getModData().KillCount = player:getModData().KillCount or {};
						local categoryKills = 0;
						if player:getModData().KillCount ~= nil and player:getModData().KillCount.WeaponCategory ~= nil then
							if player:getModData().KillCount.WeaponCategory["Axe"] ~= nil then
								local axeKills = player:getModData().KillCount.WeaponCategory["Axe"].count or 0;
								categoryKills = categoryKills + axeKills;
							end
							if player:getModData().KillCount.WeaponCategory["LongBlade"] ~= nil then
								local longBladeKills = player:getModData().KillCount.WeaponCategory["LongBlade"].count or 0;
								categoryKills = categoryKills + longBladeKills;
							end
							if player:getModData().KillCount.WeaponCategory["SmallBlade"] ~= nil then
								local shortBladeKills = player:getModData().KillCount.WeaponCategory["SmallBlade"].count or 0;
								categoryKills = categoryKills + shortBladeKills;
							end
						end
						if SandboxVars.MoreTraitsDynamic.ProwessBladeDynamic == true and not MTDHasTrait(player, "problade") and (player:getPerkLevel(Perks.Axe) + player:getPerkLevel(Perks.LongBlade )+ player:getPerkLevel(Perks.SmallBlade)) >= SandboxVars.MoreTraitsDynamic.ProwessBladeDynamicSkill and categoryKills >= SandboxVars.MoreTraitsDynamic.ProwessBladeDynamicKill then
							MTDAddTrait(player, "problade");
							MTDapplyXPBoost(player, Perks.Axe, 1);
							MTDapplyXPBoost(player, Perks.LongBlade, 1);
							MTDapplyXPBoost(player, Perks.SmallBlade, 1);
							HaloTextHelper.addTextWithArrow(player, getText("problade"), true, HaloTextHelper.getColorGreen());
						end
					elseif SandboxVars.MoreTraitsDynamic.ProwessBladeDynamic == true and not MTDHasTrait(player, "problade") and (player:getPerkLevel(Perks.Axe) + player:getPerkLevel(Perks.LongBlade )+ player:getPerkLevel(Perks.SmallBlade)) >= SandboxVars.MoreTraitsDynamic.ProwessBladeDynamicSkill then
						MTDAddTrait(player, "problade");
						MTDapplyXPBoost(player, Perks.Axe, 1);
						MTDapplyXPBoost(player, Perks.LongBlade, 1);
						MTDapplyXPBoost(player, Perks.SmallBlade, 1);
						HaloTextHelper.addTextWithArrow(player, getText("problade"), true, HaloTextHelper.getColorGreen());
					end
				end
		-- Long Blunt
			-- Gordanite
				if perk == "characterInitialization" or perk == "KillCount" or perk == Perks.Blunt then
					if killCountisOn then
						player:getModData().KillCount = player:getModData().KillCount or {};
						local categoryKills = 0;
						if player:getModData().KillCount ~= nil and player:getModData().KillCount.WeaponCategory ~= nil and player:getModData().KillCount.WeaponCategory["Blunt"] ~= nil then
							categoryKills = player:getModData().KillCount.WeaponCategory["Blunt"].count or 0;
						end
						if SandboxVars.MoreTraitsDynamic.GordaniteDynamic == true and not MTDHasTrait(player, "gordanite") and player:getPerkLevel(Perks.Blunt) >= SandboxVars.MoreTraitsDynamic.GordaniteDynamicSkill and categoryKills >= SandboxVars.MoreTraitsDynamic.GordaniteDynamicKill then
							MTDAddTrait(player, "gordanite");
							MTDapplyXPBoost(player, Perks.Blunt, 1);
							HaloTextHelper.addTextWithArrow(player, getText("gordanite"), true, HaloTextHelper.getColorGreen());
						end
					elseif SandboxVars.MoreTraitsDynamic.GordaniteDynamic == true and not MTDHasTrait(player, "gordanite") and player:getPerkLevel(Perks.Blunt) >= SandboxVars.MoreTraitsDynamic.GordaniteDynamicSkill then
						MTDAddTrait(player, "gordanite");
						MTDapplyXPBoost(player, Perks.Blunt, 1);
						HaloTextHelper.addTextWithArrow(player, getText("gordanite"), true, HaloTextHelper.getColorGreen());
					end
				end
			-- Thuggish / Prowess: Blunt
				if perk == "characterInitialization" or perk == "KillCount" or perk == "KillCount" or perk == Perks.Blunt or perk == Perks.SmallBlunt then
					local sumOfLevels = player:getPerkLevel(Perks.Blunt) + player:getPerkLevel(Perks.SmallBlunt);
					-- Thuggish
					if killCountisOn then
						player:getModData().KillCount = player:getModData().KillCount or {};
						local categoryKills = 0;
						if player:getModData().KillCount ~= nil and player:getModData().KillCount.WeaponCategory ~= nil then 
							if player:getModData().KillCount.WeaponCategory["Blunt"] ~= nil then
								local longBluntKills = player:getModData().KillCount.WeaponCategory["Blunt"].count or 0;
								categoryKills = categoryKills + longBluntKills;
							end
							if player:getModData().KillCount.WeaponCategory["SmallBlunt"] ~= nil then
								local shortBluntKills = player:getModData().KillCount.WeaponCategory["SmallBlunt"].count or 0;
								categoryKills = categoryKills + shortBluntKills;
							end
						end
						if SandboxVars.MoreTraitsDynamic.ThuggishDynamic == true and not MTDHasTrait(player, "blunttwirl") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.ThuggishDynamicSkill and categoryKills >= SandboxVars.MoreTraitsDynamic.ThuggishDynamicKill then
							MTDAddTrait(player, "blunttwirl");
							MTDapplyXPBoost(player, Perks.Blunt, 1);
							MTDapplyXPBoost(player, Perks.SmallBlunt, 1);
							HaloTextHelper.addTextWithArrow(player, getText("blunttwirl"), true, HaloTextHelper.getColorGreen());
						end
					elseif SandboxVars.MoreTraitsDynamic.ThuggishDynamic == true and not MTDHasTrait(player, "blunttwirl") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.ThuggishDynamicSkill then
						MTDAddTrait(player, "blunttwirl");
						MTDapplyXPBoost(player, Perks.Blunt, 1);
						MTDapplyXPBoost(player, Perks.SmallBlunt, 1);
						HaloTextHelper.addTextWithArrow(player, getText("blunttwirl"), true, HaloTextHelper.getColorGreen());
					end
					-- Prowess: Blunt
					if killCountisOn then
						player:getModData().KillCount = player:getModData().KillCount or {};
						local categoryKills = 0;
						if player:getModData().KillCount ~= nil and player:getModData().KillCount.WeaponCategory ~= nil then
							if player:getModData().KillCount.WeaponCategory["Blunt"] ~= nil then
								local longBluntKills = player:getModData().KillCount.WeaponCategory["Blunt"].count or 0;
								categoryKills = categoryKills + longBluntKills;
							end
							if player:getModData().KillCount.WeaponCategory["SmallBlunt"] ~= nil then
								local shortBluntKills = player:getModData().KillCount.WeaponCategory["SmallBlunt"].count or 0;
								categoryKills = categoryKills + shortBluntKills;
							end
						end
						if SandboxVars.MoreTraitsDynamic.ProwessBluntDynamic == true and not MTDHasTrait(player, "problunt") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.ProwessBluntDynamicSkill and categoryKills >= SandboxVars.MoreTraitsDynamic.ProwessBluntDynamicKill then
							MTDAddTrait(player, "problunt");
							MTDapplyXPBoost(player, Perks.Blunt, 1);
							MTDapplyXPBoost(player, Perks.SmallBlunt, 1);
							HaloTextHelper.addTextWithArrow(player, getText("problunt"), true, HaloTextHelper.getColorGreen());
						end
					elseif SandboxVars.MoreTraitsDynamic.ProwessBluntDynamic == true and not MTDHasTrait(player, "problunt") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.ProwessBluntDynamicSkill then
						MTDAddTrait(player, "problunt");
						MTDapplyXPBoost(player, Perks.Blunt, 1);
						MTDapplyXPBoost(player, Perks.SmallBlunt, 1);
						HaloTextHelper.addTextWithArrow(player, getText("problunt"), true, HaloTextHelper.getColorGreen());
					end
				end
		-- Short Blunt
			-- Grunt Worker
				if perk == "characterInitialization" or perk == "KillCount" or perk == Perks.SmallBlunt or perk == Perks.Woodwork then
					if killCountisOn then
						player:getModData().KillCount = player:getModData().KillCount or {};
						local categoryKills = 0;
						if player:getModData().KillCount ~= nil and player:getModData().KillCount.WeaponCategory ~= nil and player:getModData().KillCount.WeaponCategory["SmallBlunt"] ~= nil then
							categoryKills = player:getModData().KillCount.WeaponCategory["SmallBlunt"].count or 0;
						end
						if SandboxVars.MoreTraitsDynamic.GruntWorkerDynamic == true and not MTDHasTrait(player, "grunt") and player:getPerkLevel(Perks.SmallBlunt) >= SandboxVars.MoreTraitsDynamic.GruntWorkerDynamicSmallBlunt and player:getPerkLevel(Perks.Woodwork) >= SandboxVars.MoreTraitsDynamic.GruntWorkerDynamicWoodwork and categoryKills >= SandboxVars.MoreTraitsDynamic.GruntWorkerDynamicKill then
							MTDAddTrait(player, "grunt");
							MTDapplyXPBoost(player, Perks.SmallBlunt, 1);
							MTDapplyXPBoost(player, Perks.Woodwork, 1);
							HaloTextHelper.addTextWithArrow(player, getText("UI_trait_grunt"), true, HaloTextHelper.getColorGreen());
						end
					elseif SandboxVars.MoreTraitsDynamic.GruntWorkerDynamic == true and not MTDHasTrait(player, "grunt") and player:getPerkLevel(Perks.SmallBlunt) >= SandboxVars.MoreTraitsDynamic.GruntWorkerDynamicSmallBlunt and player:getPerkLevel(Perks.Woodwork) >= SandboxVars.MoreTraitsDynamic.GruntWorkerDynamicWoodwork then
						MTDAddTrait(player, "grunt");
						MTDapplyXPBoost(player, Perks.SmallBlunt, 1);
						MTDapplyXPBoost(player, Perks.Woodwork, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_grunt"), true, HaloTextHelper.getColorGreen());
					end
				end
			-- Martial Artist
				if perk == "characterInitialization" or perk == Perks.SmallBlunt or perk == Perks.Fitness then
					if SandboxVars.MoreTraitsDynamic.MartialArtistDynamic == true and not MTDHasTrait(player, "martial") and player:getPerkLevel(Perks.SmallBlunt) >= SandboxVars.MoreTraitsDynamic.MartialArtistDynamicSmallBlunt and player:getPerkLevel(Perks.Fitness) >= SandboxVars.MoreTraitsDynamic.MartialArtistDynamicFitness then
						MTDAddTrait(player, "martial");
						MTDapplyXPBoost(player, Perks.SmallBlunt, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_martial"), true, HaloTextHelper.getColorGreen());
					end
				end
			-- Bouncer
				if perk == "characterInitialization" or perk == Perks.SmallBlunt or perk == Perks.Strength then
					if SandboxVars.MoreTraitsDynamic.BouncerDynamic == true and not MTDHasTrait(player, "bouncer") and player:getPerkLevel(Perks.SmallBlunt) >= SandboxVars.MoreTraitsDynamic.BouncerDynamicSmallBlunt and player:getPerkLevel(Perks.Strength) >= SandboxVars.MoreTraitsDynamic.BouncerDynamicStrength then
						MTDAddTrait(player, "bouncer");
						MTDapplyXPBoost(player, Perks.SmallBlunt, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_bouncer"), true, HaloTextHelper.getColorGreen());
					end
				end
		-- Long Blade
			-- Practiced Swordsman
				if perk == "characterInitialization" or perk == "KillCount" or perk == Perks.LongBlade or perk == Perks.SmallBlade then
					if killCountisOn then
						player:getModData().KillCount = player:getModData().KillCount or {};
						local categoryKills = 0;
						if player:getModData().KillCount ~= nil and player:getModData().KillCount.WeaponCategory ~= nil then
							if player:getModData().KillCount.WeaponCategory["SmallBlade"] ~= nil then
								local shortBladeKills = player:getModData().KillCount.WeaponCategory["SmallBlade"].count or 0;
								categoryKills = categoryKills + shortBladeKills;
							end
							if player:getModData().KillCount.WeaponCategory["Long Blade"] ~= nil then
								local longBladeKills = player:getModData().KillCount.WeaponCategory["Long Blade"].count or 0;
								categoryKills = categoryKills + longBladeKills;
							end
						end
						if SandboxVars.MoreTraitsDynamic.PracticedSwordsmanDynamic == true and not MTDHasTrait(player, "bladetwirl") and (player:getPerkLevel(Perks.LongBlade) + player:getPerkLevel(Perks.SmallBlade)) >= SandboxVars.MoreTraitsDynamic.PracticedSwordsmanDynamicSkill and categoryKills >= SandboxVars.MoreTraitsDynamic.PracticedSwordsmanDynamicKill then
						MTDAddTrait(player, "bladetwirl");
						MTDapplyXPBoost(player, Perks.LongBlade, 1);
						MTDapplyXPBoost(player, Perks.SmallBlade, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_bladetwirl"), true, HaloTextHelper.getColorGreen());
						end
					elseif SandboxVars.MoreTraitsDynamic.PracticedSwordsmanDynamic == true and not MTDHasTrait(player, "bladetwirl") and (player:getPerkLevel(Perks.LongBlade) + player:getPerkLevel(Perks.SmallBlade)) >= SandboxVars.MoreTraitsDynamic.PracticedSwordsmanDynamicSkill then
						MTDAddTrait(player, "bladetwirl");
						MTDapplyXPBoost(player, Perks.LongBlade, 1);
						MTDapplyXPBoost(player, Perks.SmallBlade, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_bladetwirl"), true, HaloTextHelper.getColorGreen());
					end
				end
		-- Spear
			-- Wildsman
				if perk == "characterInitialization" or perk == "KillCount" or perk == Perks.Spear or perk == Perks.Fishing or perk == Perks.Trapping or perk == Perks.PlantScavenging then
					if killCountisOn then
						player:getModData().KillCount = player:getModData().KillCount or {};
						local categoryKills = 0;
						if player:getModData().KillCount ~= nil and player:getModData().KillCount.WeaponCategory ~= nil and player:getModData().KillCount.WeaponCategory["Spear"] ~= nil then
							categoryKills = player:getModData().KillCount.WeaponCategory["Spear"].count or 0;
						end
						if SandboxVars.MoreTraitsDynamic.WildsmanDynamic == true and not MTDHasTrait(player, "wildsman") and player:getPerkLevel(Perks.Spear) >= 4 and player:getPerkLevel(Perks.Fishing) >= 1 and player:getPerkLevel(Perks.Trapping) >= 1 and player:getPerkLevel(Perks.PlantScavenging) >= 1 and (player:getPerkLevel(Perks.Fishing) + player:getPerkLevel(Perks.Trapping) + player:getPerkLevel(Perks.PlantScavenging)) >= SandboxVars.MoreTraitsDynamic.WildsmanDynamicSkill and categoryKills >= SandboxVars.MoreTraitsDynamic.WildsmanDynamicKill then
							MTDAddTrait(player, "wildsman");
							MTDapplyXPBoost(player, Perks.Spear, 1);
							MTDapplyXPBoost(player, Perks.Fishing, 1);
							MTDapplyXPBoost(player, Perks.Trapping, 1);
							MTDapplyXPBoost(player, Perks.PlantScavenging, 1);
							local playerRecipes = player:getKnownRecipes();
							if not playerRecipes:contains("Make Stick Trap") then
								playerRecipes:add("Make Stick Trap");
							end
							if not playerRecipes:contains("Make Snare Trap") then
								playerRecipes:add("Make Snare Trap");
							end
							if not playerRecipes:contains("Make Fishing Rod") then
								playerRecipes:add("Make Fishing Rod");
							end
							if not playerRecipes:contains("Fix Fishing Rod") then
								playerRecipes:add("Fix Fishing Rod");
							end
							HaloTextHelper.addTextWithArrow(player, getText("UI_trait_wildsman"), true, HaloTextHelper.getColorGreen());
						end
					elseif SandboxVars.MoreTraitsDynamic.WildsmanDynamic == true and not MTDHasTrait(player, "wildsman") and player:getPerkLevel(Perks.Spear) >= 4 and player:getPerkLevel(Perks.Fishing) >= 1 and player:getPerkLevel(Perks.Trapping) >= 1 and player:getPerkLevel(Perks.PlantScavenging) >= 1 and (player:getPerkLevel(Perks.Fishing) + player:getPerkLevel(Perks.Trapping) + player:getPerkLevel(Perks.PlantScavenging)) >= SandboxVars.MoreTraitsDynamic.WildsmanDynamicSkill then
						MTDAddTrait(player, "wildsman");
						MTDapplyXPBoost(player, Perks.Spear, 1);
						MTDapplyXPBoost(player, Perks.Fishing, 1);
						MTDapplyXPBoost(player, Perks.Trapping, 1);
						MTDapplyXPBoost(player, Perks.PlantScavenging, 1);
						local playerRecipes = player:getKnownRecipes();
						if not playerRecipes:contains("Make Stick Trap") then
							playerRecipes:add("Make Stick Trap");
						end
						if not playerRecipes:contains("Make Snare Trap") then
							playerRecipes:add("Make Snare Trap");
						end
						if not playerRecipes:contains("Make Fishing Rod") then
							playerRecipes:add("Make Fishing Rod");
						end
						if not playerRecipes:contains("Fix Fishing Rod") then
							playerRecipes:add("Fix Fishing Rod");
						end
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_wildsman"), true, HaloTextHelper.getColorGreen());
					end
				end
			-- Prowess: Spear
				if perk == "characterInitialization" or perk == "KillCount" or perk == Perks.Spear  then
					if killCountisOn then
						player:getModData().KillCount = player:getModData().KillCount or {};
						local categoryKills = 0;
						if player:getModData().KillCount ~= nil and player:getModData().KillCount.WeaponCategory ~= nil and player:getModData().KillCount.WeaponCategory["Spear"] ~= nil then
							categoryKills = player:getModData().KillCount.WeaponCategory["Spear"].count or 0;
						end
						if SandboxVars.MoreTraitsDynamic.ProwessSpearDynamic == true and not MTDHasTrait(player, "prospear") and player:getPerkLevel(Perks.Spear) >= SandboxVars.MoreTraitsDynamic.ProwessSpearDynamicSkill and categoryKills >= SandboxVars.MoreTraitsDynamic.ProwessSpearDynamicKill then
							MTDAddTrait(player, "prospear");
							MTDapplyXPBoost(player, Perks.Spear, 2);
							HaloTextHelper.addTextWithArrow(player, getText("UI_trait_prospear"), true, HaloTextHelper.getColorGreen());
						end
					elseif SandboxVars.MoreTraitsDynamic.ProwessSpearDynamic == true and not MTDHasTrait(player, "prospear") and player:getPerkLevel(Perks.Spear) >= SandboxVars.MoreTraitsDynamic.ProwessSpearDynamicSkill then
						MTDAddTrait(player, "prospear");
						MTDapplyXPBoost(player, Perks.Spear, 2);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_prospear"), true, HaloTextHelper.getColorGreen());
					end
				end
		-- Maintenance
			-- Scrapper
				if perk == "characterInitialization" or perk == Perks.Maintenance or perk == Perks.MetalWelding then
					if SandboxVars.MoreTraitsDynamic.ScrapperDynamic == true and not MTDHasTrait(player, "scrapper") and player:getPerkLevel(Perks.Maintenance) >= SandboxVars.MoreTraitsDynamic.ScrapperDynamicMaintenance and player:getPerkLevel(Perks.MetalWelding) >= SandboxVars.MoreTraitsDynamic.ScrapperDynamicMetalWelding then
						MTDAddTrait(player, "scrapper");
						MTDapplyXPBoost(player, Perks.Maintenance, 1);
						MTDapplyXPBoost(player, Perks.MetalWelding, 1);
						local playerRecipes = player:getKnownRecipes();
						if not playerRecipes:contains("Make Metal Pipe") then
							playerRecipes:add("Make Metal Pipe");
						end
						if not playerRecipes:contains("Make Metal Pipe") then
							playerRecipes:add("Make Metal Sheet");
						end
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_scrapper"), true, HaloTextHelper.getColorGreen());
					end
				end
	-- Crafting
		-- Carpentry
			-- Slow/Fast Worker
				if perk == "characterInitialization" or perk == Perks.Woodwork or perk == Perks.Cooking or perk == Perks.Farming or perk == Perks.Doctor or perk == Perks.Electricity or perk == Perks.MetalWelding or perk == Perks.Mechanics or perk == Perks.Tailoring then
					local sumOfLevels = player:getPerkLevel(Perks.Woodwork) + player:getPerkLevel(Perks.Cooking) + player:getPerkLevel(Perks.Farming) + player:getPerkLevel(Perks.Doctor) + player:getPerkLevel(Perks.Electricity) + player:getPerkLevel(Perks.MetalWelding) + player:getPerkLevel(Perks.Mechanics) + player:getPerkLevel(Perks.Tailoring)
					if SandboxVars.MoreTraitsDynamic.SlowWorkerDynamic == true and MTDHasTrait(player, "slowworker") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.SlowWorkerDynamicSkill then
						MTDRemoveTrait(player, "slowworker");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_slowworker"), false, HaloTextHelper.getColorGreen());
					end
					if SandboxVars.MoreTraitsDynamic.FastWorkerDynamic == true and not MTDHasTrait(player, "quickworker") and sumOfLevels >= SandboxVars.MoreTraitsDynamic.FastWorkerDynamicSkill then
						MTDAddTrait(player, "quickworker");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_quickworker"), true, HaloTextHelper.getColorGreen());
					end
				end
		-- Cooking
			-- Natural Eater
				if perk == "characterInitialization" or perk == Perks.Cooking or  perk == Perks.PlantScavenging then
					if SandboxVars.MoreTraitsDynamic.NaturalEaterDynamic == true and not MTDHasTrait(player, "natural") and player:getPerkLevel(Perks.Cooking) >= SandboxVars.MoreTraitsDynamic.NaturalEaterDynamicCooking and player:getPerkLevel(Perks.PlantScavenging) >= SandboxVars.MoreTraitsDynamic.NaturalEaterDynamicForaging then
						MTDAddTrait(player, "natural");
						MTDapplyXPBoost(player, Perks.Cooking, 1);
						MTDapplyXPBoost(player, Perks.PlantScavenging, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_natural"), true, HaloTextHelper.getColorGreen());
					end
				end
			-- Ascetic / Gourmand
				if perk == "characterInitialization" or perk == Perks.Cooking then
					-- Ascetic
						if SandboxVars.MoreTraitsDynamic.AsceticDynamic == true and MTDHasTrait(player, "ascetic") and player:getPerkLevel(Perks.Cooking) >= SandboxVars.MoreTraitsDynamic.AsceticDynamicSkill then
						MTDRemoveTrait(player, "ascetic");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_ascetic"), false, HaloTextHelper.getColorGreen());
					end
					-- Gourmand
					if SandboxVars.MoreTraitsDynamic.GourmandDynamic == true and not MTDHasTrait(player, "gourmand") and player:getPerkLevel(Perks.Cooking) >= SandboxVars.MoreTraitsDynamic.GourmandDynamicSkill then
						MTDAddTrait(player, "gourmand");
						MTDapplyXPBoost(player, Perks.Cooking, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_gourmand"), true, HaloTextHelper.getColorGreen());
					end
				end
		-- Electricity
			-- Tinkerer
				if perk == "characterInitialization" or perk == Perks.Electricity or  perk == Perks.Mechanics or perk == Perks.Tailoring then
					if SandboxVars.MoreTraitsDynamic.TinkererDynamic == true and not MTDHasTrait(player, "tinkerer") and (player:getPerkLevel(Perks.Electricity) + player:getPerkLevel(Perks.Mechanics) + player:getPerkLevel(Perks.Tailoring)) >= SandboxVars.MoreTraitsDynamic.TinkererDynamicSkill then
						MTDAddTrait(player, "tinkerer");
						MTDapplyXPBoost(player, Perks.Electricity, 1);
						MTDapplyXPBoost(player, Perks.Mechanics, 1);
						MTDapplyXPBoost(player, Perks.Tailoring, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_tinkerer"), true, HaloTextHelper.getColorGreen());
					end
				end
	-- Firearm
		-- Aiming
			-- Anti-Gun Activist
				if perk == "characterInitialization" or perk == "KillCount" or perk == Perks.Aiming then
					if killCountisOn and not getActivatedMods():contains("Advanced_trajectory") then
						player:getModData().KillCount = player:getModData().KillCount or {};
						local categoryKills = 0;
						if player:getModData().KillCount ~= nil and player:getModData().KillCount.WeaponCategory ~= nil and player:getModData().KillCount.WeaponCategory["Firearm"] ~= nil then
							categoryKills = player:getModData().KillCount.WeaponCategory["Firearm"].count or 0;
						end
						if SandboxVars.MoreTraitsDynamic.AntiGunActivistDynamic == true and MTDHasTrait(player, "antigun") and player:getPerkLevel(Perks.Aiming) >= SandboxVars.MoreTraitsDynamic.AntiGunActivistDynamicSkill and categoryKills >= SandboxVars.MoreTraitsDynamic.AntiGunActivistDynamicKill then
							MTDRemoveTrait(player, "antigun");
							HaloTextHelper.addTextWithArrow(player, getText("UI_trait_antigun"), false, HaloTextHelper.getColorGreen());
						end
					elseif SandboxVars.MoreTraitsDynamic.AntiGunActivistDynamic == true and MTDHasTrait(player, "antigun") and player:getPerkLevel(Perks.Aiming) >= SandboxVars.MoreTraitsDynamic.AntiGunActivistDynamicSkill then
						MTDRemoveTrait(player, "antigun");
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_antigun"), false, HaloTextHelper.getColorGreen());
					end
				end
			-- Prowess Guns
				if perk == "characterInitialization" or perk == "KillCount" or perk == Perks.Aiming or perk == Perks.Reloading then
					if killCountisOn and not getActivatedMods():contains("Advanced_trajectory") then
						player:getModData().KillCount = player:getModData().KillCount or {};
						local categoryKills = 0;
						if player:getModData().KillCount ~= nil and player:getModData().KillCount.WeaponCategory ~= nil and player:getModData().KillCount.WeaponCategory["Firearm"] ~= nil then
							categoryKills = player:getModData().KillCount.WeaponCategory["Firearm"].count or 0;
						end
						if SandboxVars.MoreTraitsDynamic.ProwessGunsDynamic == true and not MTDHasTrait(player, "progun") and player:getPerkLevel(Perks.Aiming) >= SandboxVars.MoreTraitsDynamic.ProwessGunsDynamicAiming and (player:getPerkLevel(Perks.Aiming) + player:getPerkLevel(Perks.Reloading)) >= SandboxVars.MoreTraitsDynamic.ProwessGunsDynamicSkill and categoryKills >= SandboxVars.MoreTraitsDynamic.ProwessGunsDynamicKill then
							MTDAddTrait(player, "progun");
							MTDapplyXPBoost(player, Perks.Aiming, 1);
							MTDapplyXPBoost(player, Perks.Reloading, 1);
							HaloTextHelper.addTextWithArrow(player, getText("UI_trait_progun"), true, HaloTextHelper.getColorGreen());
						end
					elseif SandboxVars.MoreTraitsDynamic.ProwessGunsDynamic == true and not MTDHasTrait(player, "progun") and player:getPerkLevel(Perks.Aiming) >= SandboxVars.MoreTraitsDynamic.ProwessGunsDynamicAiming and (player:getPerkLevel(Perks.Aiming) + player:getPerkLevel(Perks.Reloading)) >= SandboxVars.MoreTraitsDynamic.ProwessGunsDynamicSkill then
						MTDAddTrait(player, "progun");
						MTDapplyXPBoost(player, Perks.Aiming, 1);
						MTDapplyXPBoost(player, Perks.Reloading, 1);
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_progun"), true, HaloTextHelper.getColorGreen());
					end
				end
	-- Mod Category
		-- Driving
			if getActivatedMods():contains("DrivingSkill") and ( perk == "characterInitialization" or perk == Perks.Driving ) then
				-- Motionsickness
				if SandboxVars.MoreTraitsDynamic.MotionSickenssDynamic == true and MTDHasTrait(player, "motionsickness") and player:getPerkLevel(Perks.Driving) >= SandboxVars.MoreTraitsDynamic.MotionSickenssDynamicSkill then
					MTDRemoveTrait(player, "motionsickness");
					HaloTextHelper.addTextWithArrow(player, getText("UI_trait_motionsickness"), false, HaloTextHelper.getColorGreen());
				end
			end
		-- Scavenging
			if ( getActivatedMods():contains("ScavengingSkill") or getActivatedMods():contains("ScavengingSkillFixed") ) and ( perk == "characterInitialization" or perk == Perks.Scavenging ) then
				-- Incomprehensive
				if SandboxVars.MoreTraitsDynamic.IncomprehensiveDynamic == true and MTDHasTrait(player, "incomprehensive") and player:getPerkLevel(Perks.Scavenging) >= SandboxVars.MoreTraitsDynamic.IncomprehensiveDynamicSkill then
					MTDRemoveTrait(player, "incomprehensive");
					HaloTextHelper.addTextWithArrow(player, getText("UI_trait_incomprehensive"), false, HaloTextHelper.getColorGreen());
				end
				-- Vagabond
				if SandboxVars.MoreTraitsDynamic.VagabondDynamic == true and not MTDHasTrait(player, "vagabond") and player:getPerkLevel(Perks.Scavenging) >= SandboxVars.MoreTraitsDynamic.VagabondDynamicSkill then
					MTDAddTrait(player, "vagabond");
					MTDapplyXPBoost(player, Perks.Scavenging, 1);
					HaloTextHelper.addTextWithArrow(player, getText("UI_trait_vagabond"), true, HaloTextHelper.getColorGreen());
				end
				-- Grave Robber
				if SandboxVars.MoreTraitsDynamic.GraverobberDynamic == true and not MTDHasTrait(player, "graverobber") and player:getPerkLevel(Perks.Scavenging) >= SandboxVars.MoreTraitsDynamic.GraverobberDynamicSkill and player:getZombieKills() >= SandboxVars.MoreTraitsDynamic.GraverobberDynamicKill then
					MTDAddTrait(player, "graverobber");
					MTDapplyXPBoost(player, Perks.Scavenging, 1);
					HaloTextHelper.addTextWithArrow(player, getText("UI_trait_graverobber"), true, HaloTextHelper.getColorGreen());
				end
				-- Antique Collector
				if SandboxVars.MoreTraitsDynamic.AntiqueCollectorDynamic == true and not MTDHasTrait(player, "antique") and player:getPerkLevel(Perks.Scavenging) >= SandboxVars.MoreTraitsDynamic.AntiqueCollectorDynamicSkill then
					MTDAddTrait(player, "antique");
					MTDapplyXPBoost(player, Perks.Scavenging, 1);
					HaloTextHelper.addTextWithArrow(player, getText("UI_trait_antique"), true, HaloTextHelper.getColorGreen());
				end
			end
end

function MTDTraitGainsByWeight()
	local player = getPlayer();
	player:getModData().MoreTraitsDynamic = player:getModData().MoreTraitsDynamic or {};
	player:getModData().MoreTraitsDynamic.WeightMaintainedHours = player:getModData().MoreTraitsDynamic.WeightMaintainedHours or 0;
	player:getModData().MoreTraitsDynamic.WeightNotMaintainedHours = player:getModData().MoreTraitsDynamic.WeightNotMaintainedHours or 0;
	if SandboxVars.MoreTraitsDynamic.IdealWeightDynamic == true then 
		-- Gaining Ideal Weight
		local weight = player:getNutrition():getWeight();
		if not MTDHasTrait(player, "idealweight") then
			if weight >= 78 and weight <= 82 then
				player:getModData().MoreTraitsDynamic.WeightMaintainedHours = player:getModData().MoreTraitsDynamic.WeightMaintainedHours + 1;
			else
				player:getModData().MoreTraitsDynamic.WeightNotMaintainedHours = player:getModData().MoreTraitsDynamic.WeightNotMaintainedHours + 1;
				if player:getModData().MoreTraitsDynamic.WeightNotMaintainedHours >= SandboxVars.MoreTraitsDynamic.IdealWeightDynamicObtainGracePeriod then
					player:getModData().MoreTraitsDynamic.WeightMaintainedHours = 0;
					player:getModData().MoreTraitsDynamic.WeightNotMaintainedHours = 0;
				end
			end
			if player:getModData().MoreTraitsDynamic.WeightMaintainedHours >= SandboxVars.MoreTraitsDynamic.IdealWeightDynamicTargetDaysToObtain * 24 then
				MTDAddTrait(player, "idealweight");
				player:getModData().MoreTraitsDynamic.WeightMaintainedHours = 0;
				player:getModData().MoreTraitsDynamic.WeightNotMaintainedHours = 0;
				HaloTextHelper.addTextWithArrow(player, getText("UI_trait_idealweight"), true, HaloTextHelper.getColorGreen());
			end
		else
			-- Losing Ideal Weight
			if weight >= 78 and weight <= 82 then
				player:getModData().MoreTraitsDynamic.WeightMaintainedHours = player:getModData().MoreTraitsDynamic.WeightMaintainedHours + 0.0834 * SandboxVars.MoreTraitsDynamic.IdealWeightDynamicLoseGracePeriodMultiplier; -- earning grace hours
				if player:getModData().MoreTraitsDynamic.WeightMaintainedHours >= SandboxVars.MoreTraitsDynamic.IdealWeightDynamicLoseGracePeriodCap then -- grace hours cap
					player:getModData().MoreTraitsDynamic.WeightMaintainedHours = SandboxVars.MoreTraitsDynamic.IdealWeightDynamicLoseGracePeriodCap;
				end
			else
				if weight <= 75 or weight >= 85 then
					player:getModData().MoreTraitsDynamic.WeightMaintainedHours = player:getModData().MoreTraitsDynamic.WeightMaintainedHours - 1;
					if player:getModData().MoreTraitsDynamic.WeightMaintainedHours <= 0 then
						MTDRemoveTrait(player, "idealweight");
						player:getModData().MoreTraitsDynamic.WeightMaintainedHours = 0;
						player:getModData().MoreTraitsDynamic.WeightNotMaintainedHours = 0;
						HaloTextHelper.addTextWithArrow(player, getText("UI_trait_idealweight"), false, HaloTextHelper.getColorRed());
					end
				end
			end
		end
	end
end

function MTDTraitGainsByPanic()
	local player = getPlayer();
	player:getModData().MoreTraitsDynamic = player:getModData().MoreTraitsDynamic or {};
	player:getModData().MoreTraitsDynamic.FiftyPlusStressAndPanicTime = player:getModData().MoreTraitsDynamic.FiftyPlusStressAndPanicTime
		or 0;
	-- Paranoia
		local stats = player:getStats();
		if stats:get(CharacterStat.STRESS) >= 0.5 and stats:get(CharacterStat.PANIC) >= 50 then
			player:getModData().MoreTraitsDynamic.FiftyPlusStressAndPanicTime = player:getModData().MoreTraitsDynamic.FiftyPlusStressAndPanicTime + 1;
		end
		if MTDHasTrait(player, "paranoia") and player:getModData().MoreTraitsDynamic.FiftyPlusStressAndPanicTime >=
			SandboxVars.MoreTraitsDynamic.ParanoiaDynamicHoursLose * 60 then
				player:getModData().MoreTraitsDynamic.FiftyPlusStressAndPanicTime = 0
			MTDRemoveTrait(player, "paranoia");
			HaloTextHelper.addTextWithArrow(player, getText("UI_trait_idealweight"), false, HaloTextHelper.getColorGreen());
		end
end

function MTDTraitGainsByInjuries()
	local player = getPlayer();
	player:getModData().MoreTraitsDynamic = player:getModData().MoreTraitsDynamic or {};
	-- Unwavering
		player:getModData().MoreTraitsDynamic.InjuredTime = player:getModData().MoreTraitsDynamic.InjuredTime or 0;
		if SandboxVars.MoreTraitsDynamic.UnwaveringDynamic == true and not MTDHasTrait(player, "unwavering") then
			for n = 0, player:getBodyDamage():getBodyParts():size() - 1 do
				local selectedBodyPart = player:getBodyDamage():getBodyParts():get(n);
				local selectedBodyPartType = selectedBodyPart:getType();
				if selectedBodyPart:HasInjury() and ( selectedBodyPartType == BodyPartType.Groin or selectedBodyPartType == BodyPartType.UpperLeg_L or selectedBodyPartType == BodyPartType.UpperLeg_R or selectedBodyPartType == BodyPartType.LowerLeg_L or selectedBodyPartType == BodyPartType.LowerLeg_R or selectedBodyPartType == BodyPartType.Foot_L or selectedBodyPartType == BodyPartType.Foot_R ) then
					local defaultOneHourFraction = 0.167; -- 0.167 every 10 min equals to 1 in 1h
					if selectedBodyPart:getBleedingTime() ~= 0 then
						player:getModData().MoreTraitsDynamic.InjuredTime = player:getModData().MoreTraitsDynamic.InjuredTime + defaultOneHourFraction / 24; -- adds 1 to counter for every 24h of bleeding
						--print(tostring(selectedBodyPartType).." is bleeding. getBleedingTime()="..tostring(selectedBodyPart:getBleedingTime()).."; Counter: "..tostring(player:getModData().MoreTraitsDynamic.InjuredTime));
					end
					if selectedBodyPart:getScratchTime() ~= 0 then
						player:getModData().MoreTraitsDynamic.InjuredTime = player:getModData().MoreTraitsDynamic.InjuredTime + defaultOneHourFraction / 12; -- adds 1 to counter for every 12h of having scratch
						--print(tostring(selectedBodyPartType).." is scratched. getScratchTime()="..tostring(selectedBodyPart:getScratchTime()).."; Counter: "..tostring(player:getModData().MoreTraitsDynamic.InjuredTime));
					end
					if selectedBodyPart:getCutTime() ~= 0 then
						player:getModData().MoreTraitsDynamic.InjuredTime = player:getModData().MoreTraitsDynamic.InjuredTime + defaultOneHourFraction / 6; -- adds 1 to counter for every 6h of having laceration
						--print(tostring(selectedBodyPartType).." is lacerated. getCutTime()="..tostring(selectedBodyPart:getCutTime()).."; Counter: "..tostring(player:getModData().MoreTraitsDynamic.InjuredTime));
					end
					if selectedBodyPart:getBurnTime() ~= 0 then
						player:getModData().MoreTraitsDynamic.InjuredTime = player:getModData().MoreTraitsDynamic.InjuredTime + defaultOneHourFraction / 8; -- adds 1 to counter for every 8h of having burn
						--print(tostring(selectedBodyPartType).." is burned. getBurnTime()="..tostring(selectedBodyPart:getBurnTime()).."; Counter: "..tostring(player:getModData().MoreTraitsDynamic.InjuredTime));
					end
					if selectedBodyPart:getDeepWoundTime() ~= 0 then
						player:getModData().MoreTraitsDynamic.InjuredTime = player:getModData().MoreTraitsDynamic.InjuredTime + defaultOneHourFraction; -- adds 1 to counter for every 1h of having deep wound
						--print(tostring(selectedBodyPartType).." has deep wound. getDeepWoundTime()="..tostring(selectedBodyPart:getDeepWoundTime()).."; Counter: "..tostring(player:getModData().MoreTraitsDynamic.InjuredTime));
					end
					if selectedBodyPart:getStitchTime() ~= 0 then
						player:getModData().MoreTraitsDynamic.InjuredTime = player:getModData().MoreTraitsDynamic.InjuredTime + defaultOneHourFraction / 8; -- adds 1 to counter for every 8h of bleeding
						--print(tostring(selectedBodyPartType).." is stitched. getStitchTime()="..tostring(selectedBodyPart:getStitchTime()).."; Counter: "..tostring(player:getModData().MoreTraitsDynamic.InjuredTime));
					end
					if selectedBodyPart:getFractureTime() ~= 0 then
						player:getModData().MoreTraitsDynamic.InjuredTime = player:getModData().MoreTraitsDynamic.InjuredTime + defaultOneHourFraction / 8; -- adds 1 to counter for every 8h of having fracture
						--print(tostring(selectedBodyPartType).." is fractured. getFractureTime()="..tostring(selectedBodyPart:getFractureTime()).."; Counter: "..tostring(player:getModData().MoreTraitsDynamic.InjuredTime));
					end
				end
			end
			if player:getModData().MoreTraitsDynamic.InjuredTime >= SandboxVars.MoreTraitsDynamic.UnwaveringDynamicCounter then
				MTDAddTrait(player, "unwavering");
				HaloTextHelper.addTextWithArrow(player, getText("UI_trait_unwavering"), true, HaloTextHelper.getColorGreen());
			end
		end
	-- Immunocompromised  / Super-Immune
		player:getModData().MoreTraitsDynamic.totalInfectionTime = player:getModData().MoreTraitsDynamic.totalInfectionTime or 0;
		-- Immunocompromised
		if SandboxVars.MoreTraitsDynamic.ImmunocompromisedDynamic == true and MTDHasTrait(player, "immunocompromised") and not MTDHasTrait(player, "superimmune") then
			for n = 0, player:getBodyDamage():getBodyParts():size() - 1 do
				if player:getBodyDamage():getBodyParts():get(n):getWoundInfectionLevel() ~= 0 then
					player:getModData().MoreTraitsDynamic.totalInfectionTime = player:getModData().MoreTraitsDynamic.totalInfectionTime + 1 / 6; -- counts hours
					--print(tostring(player:getBodyDamage():getBodyParts():get(n):getType()).." is infected. getWoundInfectionLevel()="..tostring(player:getBodyDamage():getBodyParts():get(n):getWoundInfectionLevel()).."; Counter: "..tostring(player:getModData().MoreTraitsDynamic.totalInfectionTime));
				end
			end
			if player:getModData().MoreTraitsDynamic.totalInfectionTime >= SandboxVars.MoreTraitsDynamic.ImmunocompromisedDynamicInfectionTime then
				MTDRemoveTrait(player, "immunocompromised");
				HaloTextHelper.addTextWithArrow(player, getText("UI_trait_unwavering"), false, HaloTextHelper.getColorGreen());
			end
		end
		-- Super-Immune
		if SandboxVars.MoreTraitsDynamic.SuperImmuneDynamic == true and not MTDHasTrait(player, "superimmune") and not MTDHasTrait(player, "immunocompromised") then
			for n = 0, player:getBodyDamage():getBodyParts():size() - 1 do
				if player:getBodyDamage():getBodyParts():get(n):getWoundInfectionLevel() ~= 0 then
					player:getModData().MoreTraitsDynamic.totalInfectionTime = player:getModData().MoreTraitsDynamic.totalInfectionTime + 1 / 6; -- counts hours
					--print(tostring(player:getBodyDamage():getBodyParts():get(n):getType()).." is infected. getWoundInfectionLevel()="..tostring(player:getBodyDamage():getBodyParts():get(n):getWoundInfectionLevel()).."; Counter: "..tostring(player:getModData().MoreTraitsDynamic.totalInfectionTime));
				end
			end
			if player:getModData().MoreTraitsDynamic.totalInfectionTime >= SandboxVars.MoreTraitsDynamic.SuperImmuneDynamicInfectionTime then
				MTDAddTrait(player, "superimmune");
				HaloTextHelper.addTextWithArrow(player, getText("UI_trait_unwavering"), true, HaloTextHelper.getColorGreen());
			end
		end
end

function MTDLeadFoot(zombie)
	local player = getPlayer();
	player:getModData().MoreTraitsDynamic = player:getModData().MoreTraitsDynamic or {};
	player:getModData().MoreTraitsDynamic.AllowLeadFootCount = player:getModData().MoreTraitsDynamic.AllowLeadFootCount or false;
	player:getModData().MoreTraitsDynamic.LeadFootCount = player:getModData().MoreTraitsDynamic.LeadFootCount or 0;
	if player:getModData().MoreTraitsDynamic.AllowLeadFootCount == true then
		if player:DistTo(zombie) <= 1 then
			--print ("Leadfoot Kill");
			getPlayer():getModData().MoreTraitsDynamic.LeadFootCount = getPlayer():getModData().MoreTraitsDynamic.LeadFootCount + 1;
		end
	end
	if player:getModData().MoreTraitsDynamic.LeadFootCount >= SandboxVars.MoreTraitsDynamic.LeadFootDynamicKill then
		if SandboxVars.MoreTraitsDynamic.LeadFootDynamic == true and not MTDHasTrait(player, "leadfoot") then
			MTDAddTrait(player, "leadfoot");
			HaloTextHelper.addTextWithArrow(player, getText("UI_trait_leadfoot"), true, HaloTextHelper.getColorGreen());
		end
	end
end

function MTDInitializeEvents(player)
	Events.EveryOneMinute.Add(MTDEveryOneMinuteMain);
	Events.EveryTenMinutes.Add(MTDEveryTenMinutesMain);
	Events.EveryHours.Add(MTDEveryHoursMain);

	Events.LevelPerk.Add(MTDLevelPerkMain);
	Events.OnWeaponHitCharacter.Add(MTDOnWeaponHitCharacterMain);
	MTDTraitsGainsByLevel(player, "characterInitialization");
	if getActivatedMods():contains("KillCount") then
		Events.OnZombieDead.Add(MTDKillsMainExtended);
	else
		Events.OnZombieDead.Add(MTDKillsMain);
	end
end

Events.OnGameStart.Add(MTDInitializeEvents)
