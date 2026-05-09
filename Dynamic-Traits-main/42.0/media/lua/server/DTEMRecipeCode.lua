require "DTEMB42Compat"

-- On_Eat function for to detect if there are mushrooms on it
-- MUSHROOMS (NO RECIPE)
function OnEat_Mushroom(food, player)
    --print("DT Logger: running OnEat_Mushroom function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        DTEMallergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- On_Eat function for to detect if there are berries on it
-- BERRIES (NO RECIPES)
function OnEat_Berry(food, player)
    --print("DT Logger: running OnEat_Berry function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        DTEMallergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- COFFEE
function OnEat_Coffee(food, player)
    --print("DT Logger: running OnEat_Coffee function")
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTEMcaffeineOnBody);
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTEMtimeSinceLastCaffeine);
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTEMaddictedToCaffeineTrait);
    player:getModData().DTEMtimeSinceLastCaffeine = 0;
    local fluidHungerChange = math.abs(food:getHungerChange() * 100)
    local fluidThirstChange = math.abs(food:getThirstChange() * 100)
    local fluidFatigueChange = math.abs(food:getFatigueChange() * 100)
    --print("Hunger change for: " .. food:getDisplayName() .. " is: " .. fluidHungerChange)
    --print("Thirst change for: " .. food:getDisplayName() .. " is: " .. fluidThirstChange)
    --print("Fatigue change for: " .. food:getDisplayName() .. " is: " .. fluidFatigueChange)
    local caffeineIncrease = (fluidHungerChange + fluidThirstChange + fluidFatigueChange) * 10
    --print("Caffeine increase: " .. caffeineIncrease)
    player:getModData().DTEMcaffeineOnBody = player:getModData().DTEMcaffeineOnBody + caffeineIncrease
    player:getModData().DTEMaddictedToCaffeineTrait = player:getModData().DTEMaddictedToCaffeineTrait - caffeineIncrease
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTEMcaffeineOnBody)
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTEMtimeSinceLastCaffeine)
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTEMaddictedToCaffeineTrait)
end

-- HOTDRINKS
function OnEat_HotDrinks(food, player)
    --print("DT Logger: running OnEat_HotDrinks function")
    --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTEMtimeSinceLastCaffeine)
    --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTEMcaffeineOnBody)
    --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTEMaddictedToCaffeineTrait)
    local ingredients = food:getExtraItems();
    --print(ingredients)
    local fluidHungerChange = math.abs(food:getHungerChange() * 100)
    local fluidThirstChange = math.abs(food:getThirstChange() * 100)
    local fluidFatigueChange = math.abs(food:getFatigueChange() * 100)
    if fluidFatigueChange > 0 then
        --print("The HotDrink had caffeine")
        local coffeeOrTeaAmount = 0
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "Coffee") or string.find(ingredients:get(i), "Teabag") then
                --print("The HotDrink had Coffe or Tea")
                coffeeOrTeaAmount = coffeeOrTeaAmount + 1
            end
        end
        local caffeineIncrease = (fluidHungerChange + fluidThirstChange + fluidFatigueChange) * coffeeOrTeaAmount
        --print("Caffeine increase: " .. caffeineIncrease)
        player:getModData().DTEMtimeSinceLastCaffeine = 0
        player:getModData().DTEMcaffeineOnBody = player:getModData().DTEMcaffeineOnBody + caffeineIncrease
        player:getModData().DTEMaddictedToCaffeineTrait = player:getModData().DTEMaddictedToCaffeineTrait - caffeineIncrease
        --print("DT Logger: DTtimeSinceLastCaffeine value is " .. player:getModData().DTEMtimeSinceLastCaffeine)
        --print("DT Logger: DTcaffeineOnBody value is " .. player:getModData().DTEMcaffeineOnBody)
        --print("DT Logger: DTaddictedToCaffeineTrait value is " .. player:getModData().DTEMaddictedToCaffeineTrait)
    end
end

-- SALADS
function OnEat_Salad(food, player)
    --print("DT Logger: running OnEat_Salad function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Salad had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end

-- STEWS
function OnEat_PotOfStew(food, player)
    --print("DT Logger: running OnEat_PotOfStew function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Pot of Stew had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end

-- SOUPS
function OnEat_PotOfSoup(food, player)
    --print("DT Logger: running OnEat_PotOfSoup function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Pot of Soup had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end

-- STIR FRIES
function OnEat_StirFry(food, player)
    --print("DT Logger: running OnEat_StirFry function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Stir Fry had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end
function OnEat_StirFry2(food, player)
    --print("DT Logger: running OnEat_StirFry2 function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Stir Fry had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end

-- PASTA
function OnEat_PastaPot(food, player)
    --print("DT Logger: running OnEat_PastaPot function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Pasta Pot had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end
function OnEat_PastaPan(food, player)
    --print("DT Logger: running OnEat_PastaPan function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Pasta Pan had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end

-- RICE
function OnEat_RicePot(food, player)
    --print("DT Logger: running OnEat_RicePot function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Rice Pot had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end
function OnEat_RicePan(food, player)
    --print("DT Logger: running OnEat_RicePan function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Rice Pan had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end

-- ROASTED VEGETABLES
function OnEat_RoastedVegetables(food, player)
    --print("DT Logger: running OnEat_RoastedVegetables function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Roasted Vegetables had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end

-- OMELETTE
function OnEat_OmeletteRecipe(food, player)
    --print("DT Logger: running OnEat_OmeletteRecipe function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Omelette had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end

-- SANDWICH
function OnEat_Sandwich(food, player)
    --print("DT Logger: running OnEat_Sandwich function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Sandwich had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end

-- BURGER
function OnEat_Burger(food, player)
    --print("DT Logger: running OnEat_Burger function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        local ingredients = food:getExtraItems();
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "MushroomGeneric") then
                --print("DT Logger: Burger had a mushroom: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 30);
            end
        end
    end
end



-- SALADS
function OnEat_FruitSalad(food, player)
    --print("DT Logger: running OnEat_FruitSalad function")
    local ingredients = food:getExtraItems();
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "Berry") then
                --print("DT Logger: Fruit salad had a berry: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 15);
            end
        end
    end
end

-- CAKE
function OnEat_CakeRaw(food, player)
    --print("DT Logger: running OnEat_CakeRaw function")
    local ingredients = food:getExtraItems();
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "Berry") then
                --print("DT Logger: Cake Raw had a berry: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 15);
            end
        end
    end
end

-- PANCAKES
function OnEat_Pancakes(food, player)
    --print("DT Logger: running OnEat_Pancakes function")
    local ingredients = food:getExtraItems();
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "Berry") then
                --print("DT Logger: Pancake had a berry: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 15);
            end
        end
    end
end

-- WAFFLES
function OnEat_Waffles(food, player)
    --print("DT Logger: running OnEat_Waffles function")
    local ingredients = food:getExtraItems();
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        --print(ingredients)
        for i = 0, ingredients:size() - 1 do
            if string.find(ingredients:get(i), "Berry") then
                --print("DT Logger: Waffles had a berry: " .. ingredients:get(i))
                DTEMallergyIncrease(player, 15);
            end
        end
    end
end

-- VIOLETS
function OnEat_Violets(food, player)
    --print("DT Logger: running OnEat_Violets function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        DTEMallergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- SUNFLOWER SEEDS
function OnEat_SunFlowerSeeds(food, player)
    --print("DT Logger: running OnEat_SunFlowerSeeds function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        DTEMallergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- GRAPE LEAVES
function OnEat_GrapeLeaves(food, player)
    --print("DT Logger: running OnEat_GrapeLeaves function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        DTEMallergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- ROSEHIPS
function OnEat_Rosehips(food, player)
    --print("DT Logger: running OnEat_Rosehips function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        DTEMallergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- ACORNS
function OnEat_Acorns(food, player)
    --print("DT Logger: running OnEat_Acorns function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        DTEMallergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- DANDELIONS
function OnEat_Dandelions(food, player)
    --print("DT Logger: running OnEat_Dandelions function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        DTEMallergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- NETTLES
function OnEat_Nettles(food, player)
    --print("DT Logger: running OnEat_Nettles function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        DTEMallergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- THISTLE
function OnEat_Thistle(food, player)
    --print("DT Logger: running OnEat_Thistle function")
    if DTEMHasTrait(player, "WildPlantsAllergy") then
        DTEMallergyIncrease(player, food:getHungerChange() * 100 * -1);
    end
end

-- GUM
function OnEat_Gum(food, player, percent)
    --print("DT Logger: running OnEat_Gum function")
    local stats = player:getStats()
    if DTEMHasTrait(player, "Smoker") then
        stats:setStressFromCigarettes(0);
        if stats:getStress() > 0 then
            stats:setStress(stats:getStress() / 2)
        end
    end
end