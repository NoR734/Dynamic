function DTEMtraitsGainsByKills(player)
    --print("DT Logger: running traitsGainsByKills function");
    if DTEMHasTrait(player, "Agoraphobic") or DTEMHasTrait(player, "Claustophobic") then
        if ZombRand(5) == 0 then
            player:getModData().DTEMagoraphobicClaustrophobicTraits = player:getModData().DTEMagoraphobicClaustrophobicTraits + ZombRand(10);
        end
    end
    if player:getHoursSurvived() > 720 then
        if player:getZombieKills() > player:getModData().DTEMKillscheck2 then
            -- TRAITS GAINED/LOST BY KILLS BASED ON THE PATH
            ----- THE PLAYER STARTED WITH COWARDLY -----
            if player:getModData().DTEMKillsPath == 1 then
                --print("DT Logger: DTKillsPath is 1");
                if DTEMHasTrait(player, "Cowardly") then
                    -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF REMOVING COWARDLY (AT 3000 KILL IF THE TRAIT IS STILL THERE IT IS REMOVED)
                    if DTEMrandomNumberForKills(player, 3000) == 0 then
                        DTEMRemoveTrait(player, "Cowardly");
                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_cowardly"), false, HaloTextHelper.getColorGreen());
                    end
                else
                    -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF REMOVING HEMOPHOBIC (AT 4000 KILL IF THE TRAIT IS STILL THERE IT IS REMOVED)
                    if DTEMHasTrait(player, "Hemophobic") then
                        if DTEMrandomNumberForKills(player, 4000) == 0 then
                            DTEMRemoveTrait(player, "Hemophobic");
                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hemophobic"), false, HaloTextHelper.getColorGreen());
                        end
                    else
                        -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF ADDING BRAVE (AT 5000 KILL IF THE TRAIT IS NOT THERE IT IS ADDED)
                        if not DTEMHasTrait(player, "Brave") and not DTEMHasTrait(player, "Desensitized") and not DTEMHasTrait(player, "Agoraphobic") and not DTEMHasTrait(player, "Claustophobic") then
                            if DTEMrandomNumberForKills(player, 5000) == 0 then
                                DTEMAddTrait(player, "Brave");
                                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_brave"), true, HaloTextHelper.getColorGreen());
                            end
                        else
                            -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF ADDING DESENSITIZED (AT 7000 KILL IF THE TRAIT IS NOT THERE IT IS ADDED)
                            if not DTEMHasTrait(player, "Desensitized") and not DTEMHasTrait(player, "Agoraphobic") and not DTEMHasTrait(player, "Claustophobic") then
                                if DTEMrandomNumberForKills(player, 7000) == 0 then
                                    if DTEMHasTrait(player, "AdrenalineJunkie") then
                                        DTEMRemoveTrait(player, "AdrenalineJunkie");
                                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AdrenalineJunkie"), false, HaloTextHelper.getColorGreen());
                                    end
                                    if DTEMHasTrait(player, "Pacifist") then
                                        DTEMRemoveTrait(player, "Pacifist");
                                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pacifist"), false, HaloTextHelper.getColorGreen());
                                    end
                                    if DTEMHasTrait(player, "Nightmares") then
                                        DTEMRemoveTrait(player, "Nightmares");
                                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Nightmares"), false, HaloTextHelper.getColorGreen());
                                    end
                                    DTEMRemoveTrait(player, "Brave");
                                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_brave"), false, HaloTextHelper.getColorGreen());
                                    DTEMAddTrait(player, "Desensitized");
                                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Desensitized"), true, HaloTextHelper.getColorGreen());
                                end
                            else
                                if not DTEMHasTrait(player, "Bloodlust") and DTEMHasTrait(player, "Desensitized") then
                                    if DTEMrandomNumberForKills2(player, 15000) == 0 then
                                        DTEMAddTrait(player, "Bloodlust");
                                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Bloodlust"), true, HaloTextHelper.getColorRed());
                                    end
                                end
                            end
                        end
                    end
                end
            ----- THE PLAYER STARTED WITH BRAVE -----
            elseif player:getModData().DTEMKillsPath == 2 then
                --print("DT Logger: DTKillsPath is 2");
                -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF ADDING DESENSITIZED (AT 4000 KILL IF THE TRAIT IS NOT THERE IT IS ADDED)
                if not DTEMHasTrait(player, "Desensitized") and not DTEMHasTrait(player, "Agoraphobic") and not DTEMHasTrait(player, "Claustophobic") then
                    if DTEMrandomNumberForKills(player, 4000) == 0 then
                        if DTEMHasTrait(player, "AdrenalineJunkie") then
                            DTEMRemoveTrait(player, "AdrenalineJunkie");
                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AdrenalineJunkie"), false, HaloTextHelper.getColorGreen());
                        end
                        if DTEMHasTrait(player, "Pacifist") then
                            DTEMRemoveTrait(player, "Pacifist");
                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pacifist"), false, HaloTextHelper.getColorGreen());
                        end
                        if DTEMHasTrait(player, "Nightmares") then
                            DTEMRemoveTrait(player, "Nightmares");
                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Nightmares"), false, HaloTextHelper.getColorGreen());
                        end
                        DTEMRemoveTrait(player, "Brave");
                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_brave"), false, HaloTextHelper.getColorGreen());
                        DTEMAddTrait(player, "Desensitized");
                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Desensitized"), true, HaloTextHelper.getColorGreen());
                    end
                else
                    if not DTEMHasTrait(player, "Bloodlust") and DTEMHasTrait(player, "Desensitized") then
                        if DTEMrandomNumberForKills2(player, 15000) == 0 then
                            DTEMAddTrait(player, "Bloodlust");
                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Bloodlust"), true, HaloTextHelper.getColorRed());
                        end
                    end
                end
            ----- THE PLAYER STARTED WITH DESENSITIZED -----
            elseif player:getModData().DTEMKillsPath == 3 then
                --print("DT Logger: DTKillsPath is 3");
                if not DTEMHasTrait(player, "Bloodlust") then
                    if DTEMrandomNumberForKills2(player, 15000) == 0 then
                        DTEMAddTrait(player, "Bloodlust");
                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Bloodlust"), true, HaloTextHelper.getColorRed());
                    end
                end
            ----- THE PLAYER STARTED WITHOUT TRAITS -----
            else
                --print("DT Logger: DTKillsPath is 4");
                -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF REMOVING HEMOPHOBIC (AT 3000 KILL IF THE TRAIT IS STILL THERE IT IS REMOVED)
                if DTEMHasTrait(player, "Hemophobic") then
                    if DTEMrandomNumberForKills(player, 3000) == 0 then
                        DTEMRemoveTrait(player, "Hemophobic");
                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hemophobic"), false, HaloTextHelper.getColorGreen());
                    end
                else
                    -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF ADDING BRAVE (AT 4000 KILL IF THE TRAIT IS NOT THERE IT IS ADDED)
                    if not DTEMHasTrait(player, "Brave") and not DTEMHasTrait(player, "Desensitized") and not DTEMHasTrait(player, "Agoraphobic") and not DTEMHasTrait(player, "Claustophobic") then
                        if DTEMrandomNumberForKills(player, 4000) == 0 then
                            DTEMAddTrait(player, "Brave");
                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_brave"), true, HaloTextHelper.getColorGreen());
                        end
                    else
                        -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF ADDING DESENSITIZED (AT 6000 KILL IF THE TRAIT IS NOT THERE IT IS ADDED)
                        if not DTEMHasTrait(player, "Desensitized") and not DTEMHasTrait(player, "Agoraphobic") and not DTEMHasTrait(player, "Claustophobic") then
                            if DTEMrandomNumberForKills(player, 6000) == 0 then
                                if DTEMHasTrait(player, "AdrenalineJunkie") then
                                    DTEMRemoveTrait(player, "AdrenalineJunkie");
                                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AdrenalineJunkie"), false, HaloTextHelper.getColorGreen());
                                end
                                if DTEMHasTrait(player, "Pacifist") then
                                    DTEMRemoveTrait(player, "Pacifist");
                                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pacifist"), false, HaloTextHelper.getColorGreen());
                                end
                                if DTEMHasTrait(player, "Nightmares") then
                                    DTEMRemoveTrait(player, "Nightmares");
                                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Nightmares"), false, HaloTextHelper.getColorGreen());
                                end
                                DTEMRemoveTrait(player, "Brave");
                                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_brave"), false, HaloTextHelper.getColorGreen());
                                DTEMAddTrait(player, "Desensitized");
                                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Desensitized"), true, HaloTextHelper.getColorGreen());
                            end
                        else
                            if not DTEMHasTrait(player, "Bloodlust") and DTEMHasTrait(player, "Desensitized") then
                                if DTEMrandomNumberForKills2(player, 15000) == 0 then
                                    DTEMAddTrait(player, "Bloodlust");
                                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Bloodlust"), true, HaloTextHelper.getColorRed());
                                end
                            end
                        end
                    end
                end
            end
        end
        player:getModData().DTEMKillscheck2 = player:getZombieKills();
    end
end