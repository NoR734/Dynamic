--[[
    Overrides the perform method of ISDrinkFluidAction to add custom behavior for handling alcohol and caffeine consumption.
    
    Original Method:
    - Calls the original ISDrinkFluidAction.perform method.

    Custom Behavior:
    - Retrieves the player character and the drink item.
    - Extracts fluid container properties such as hunger change, thirst change, alcohol content, and fatigue change.

    Alcohol Handling:
    - If the drink contains alcohol:
        - Calculates an overdose increase value based on alcohol content, hunger change, and thirst change.
        - Calls DTEMoverdoseIncrease function to update the overdose value.
        - Updates the Alcoholic Trait ModData values by decreasing DTEMalcoholicTrait and resetting DTEMtimeSinceLastDrink.

    Caffeine Handling:
    - If the drink contains caffeine:
        - Resets DTEMtimeSinceLastCaffeine to 0.
        - Calculates a caffeine increase value based on hunger change, thirst change, and fatigue change.
        - Updates the Addicted to Caffeine Trait ModData values by increasing DTEMcaffeineOnBody, decreasing DTEMaddictedToCaffeineTrait and resetting DTEMtimeSinceLastCaffeine.
--]]
require "TimedActions/ISDrinkFluidAction"

local og_ISDrinkFluidAction_perform = ISDrinkFluidAction.perform
function ISDrinkFluidAction:perform()
    og_ISDrinkFluidAction_perform(self)
    --print("DTEM: ISDrinkFluidAction:perform")
    local player = self.character
    local drink = self.item
    local fluidContainerProperties = drink:getFluidContainer():getProperties()
    local fluidHungerChange = math.abs(fluidContainerProperties:getHungerChange() * 100)
    local fluidThirstChange = math.abs(fluidContainerProperties:getThirstChange() * 100)
    local fluidAlcohol = math.floor(fluidContainerProperties:getAlcohol() * 100)
    local fluidFatigueChange = math.abs(fluidContainerProperties:getFatigueChange() * 100)
    --print("DTEM: fluidHungerChange: " .. fluidHungerChange)
    --print("DTEM: fluidThirstChange: " .. fluidThirstChange)
    --print("DTEM: fluidAlcohol: " .. fluidAlcohol)
    --print("DTEM: fluidFatigueChange: " .. fluidFatigueChange)
    -- If the Drink has Alcohol: 
        -- The DTEMoverdoseIncrease function is called to update the Overdose value
        -- The Alcoholic Trait ModData values are updated
    if fluidAlcohol > 0 then

        -- OVERDOSE MECHANIC
        local overdoseIncrease = fluidAlcohol + (fluidHungerChange / 2) + (fluidThirstChange / 2)
        if overdoseIncrease > 85 then
            overdoseIncrease = 85
            --print("DTEM: overdoseIncrease capped at 85")
        end

        --print("DTEM: overdoseIncrease: " .. overdoseIncrease)
        DTEMoverdoseIncrease(player, overdoseIncrease)
        
        -- ALCOHOLIC TRAIT
        local alcoholicIncrease = (fluidHungerChange * 10) + (fluidThirstChange * 10) + (fluidAlcohol * 10)
        --print("DTEM: alcoholicIncrease: " .. alcoholicIncrease)
        player:getModData().DTEMalcoholicTrait = player:getModData().DTEMalcoholicTrait - alcoholicIncrease
        player:getModData().DTEMtimeSinceLastDrink = 0
    end
    -- If the Drink has Caffeine:
        -- The Addicted to Caffeine Trait ModData values are updated
    if fluidFatigueChange > 0 then
        -- ADDICTED TO CAFFEINE TRAIT
        player:getModData().DTEMtimeSinceLastCaffeine = 0
        local caffeineIncrease = fluidHungerChange + fluidThirstChange + fluidFatigueChange
        player:getModData().DTEMcaffeineOnBody = player:getModData().DTEMcaffeineOnBody + caffeineIncrease
        player:getModData().DTEMaddictedToCaffeineTrait = player:getModData().DTEMaddictedToCaffeineTrait - caffeineIncrease
    end
end