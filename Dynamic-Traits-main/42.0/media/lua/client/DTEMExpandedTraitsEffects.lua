--[[ local vanillaFishingAction = ISFishingAction.perform
function ISFishingAction:perform()
    vanillaFishingAction(self);
    local player = self.character;
    if DTEMHasTrait(player, "Fishing") then
        DTEMdecreaseStress(player, 0.07);
        DTEMdecreaseUnhappiness(player, 7);
        DTEMdecreaseStressFromCigarettes(player, 1);
        DTEMdecreaseAnger(player, 0.07);
    end
    if DTEMHasProfession(player, "fisherman") then
        DTEMdecreaseStress(player, 0.15);
        DTEMdecreaseUnhappiness(player, 15);
        DTEMdecreaseStressFromCigarettes(player, 1);
        DTEMdecreaseAnger(player, 0.15);
    end
end ]]