-- Function to set OnEat parameter
local function DTEMsetItemParameter(itemName, parameter, value)
	local item = ScriptManager.instance:getItem(itemName)
	if item then
		item:DoParam(parameter .. " = " .. value)
	end
end

-- Change to fatigue decrease by Vitamins due to new Overdose mechanic
DTEMsetItemParameter("Base.PillsVitamins", "FatigueChange", "-10")
DTEMsetItemParameter("Base.PillsVitamins", "UseDelta", "0.1")

-- Adds OnEat function to handle effects when Mushrooms are consumed
DTEMsetItemParameter("Base.MushroomGeneric1", "OnEat", "OnEat_Mushroom");
DTEMsetItemParameter("Base.MushroomGeneric2", "OnEat", "OnEat_Mushroom");
DTEMsetItemParameter("Base.MushroomGeneric3", "OnEat", "OnEat_Mushroom");
DTEMsetItemParameter("Base.MushroomGeneric4", "OnEat", "OnEat_Mushroom");
DTEMsetItemParameter("Base.MushroomGeneric5", "OnEat", "OnEat_Mushroom");
DTEMsetItemParameter("Base.MushroomGeneric6", "OnEat", "OnEat_Mushroom");
DTEMsetItemParameter("Base.MushroomGeneric7", "OnEat", "OnEat_Mushroom");

-- Adds OnEat function to handle effects when Berries are consumed
DTEMsetItemParameter("Base.BerryGeneric1", "OnEat", "OnEat_Berry");
DTEMsetItemParameter("Base.BerryGeneric2", "OnEat", "OnEat_Berry");
DTEMsetItemParameter("Base.BerryGeneric3", "OnEat", "OnEat_Berry");
DTEMsetItemParameter("Base.BerryGeneric4", "OnEat", "OnEat_Berry");
DTEMsetItemParameter("Base.BerryGeneric5", "OnEat", "OnEat_Berry");
DTEMsetItemParameter("Base.BerryBlack", "OnEat", "OnEat_Berry");
DTEMsetItemParameter("Base.BerryBlue", "OnEat", "OnEat_Berry");
DTEMsetItemParameter("Base.BerryPoisonIvy", "OnEat", "OnEat_Berry");
DTEMsetItemParameter("Base.BeautyBerry", "OnEat", "OnEat_Berry");
DTEMsetItemParameter("Base.HollyBerry", "OnEat", "OnEat_Berry");
DTEMsetItemParameter("Base.WinterBerry", "OnEat", "OnEat_Berry");

-- Adds OnEat function to handle effects when Caffeine is consumed
DTEMsetItemParameter("Base.Coffee2", "OnEat", "OnEat_Coffee")
DTEMsetItemParameter("Base.ChocolateCoveredCoffeeBeans", "OnEat", "OnEat_Coffee")
DTEMsetItemParameter("Base.HotDrink", "OnEat", "OnEat_HotDrinks")
DTEMsetItemParameter("Base.HotDrinkClay", "OnEat", "OnEat_HotDrinks")
DTEMsetItemParameter("Base.HotDrinkTea", "OnEat", "OnEat_HotDrinks")
DTEMsetItemParameter("Base.HotDrinkTeaCeramic", "OnEat", "OnEat_HotDrinks")
DTEMsetItemParameter("Base.HotDrinkSpiffo", "OnEat", "OnEat_HotDrinks")
DTEMsetItemParameter("Base.HotDrinkWhite", "OnEat", "OnEat_HotDrinks")
--DTEMsetItemParameter("Base.HotDrinkRed", "OnEat", "OnEat_HotDrinks")



-- Adds OnEat function to handle stressFromCigarettes to Gum
DTEMsetItemParameter("Base.Gum", "OnEat", "OnEat_Gum");


-- SALADS
local salad = ScriptManager.instance:getItem("farming.Salad");
if salad then
	salad:DoParam("OnEat = OnEat_Salad");
end

-- STEWS
local potOfStew = ScriptManager.instance:getItem("Base.PotOfStew");
if potOfStew then
	potOfStew:DoParam("OnEat = OnEat_PotOfStew");
end

-- SOUPS
local potOfSoup = ScriptManager.instance:getItem("Base.PotOfSoupRecipe");
if potOfSoup then
	potOfSoup:DoParam("OnEat = OnEat_PotOfSoup");
end

-- STIR FRIES 
local stirFry = ScriptManager.instance:getItem("Base.PanFriedVegetables");
if stirFry then
	stirFry:DoParam("OnEat = OnEat_StirFry");
end
local stirFry2 = ScriptManager.instance:getItem("Base.GriddlePanFriedVegetables");
if stirFry2 then
	stirFry2:DoParam("OnEat = OnEat_StirFry2");
end

-- PASTA
local pastaPot = ScriptManager.instance:getItem("Base.PastaPot");
if pastaPot then
	pastaPot:DoParam("OnEat = OnEat_PastaPot");
end
local pastaPan = ScriptManager.instance:getItem("Base.PastaPan");
if pastaPan then
	pastaPan:DoParam("OnEat = OnEat_PastaPan");
end

-- RICE
local ricePot = ScriptManager.instance:getItem("Base.RicePot");
if ricePot then
	ricePot:DoParam("OnEat = OnEat_RicePot");
end
local ricePan = ScriptManager.instance:getItem("Base.RicePan");
if ricePan then
	ricePan:DoParam("OnEat = OnEat_RicePan");
end

-- ROASTED VEGETABLES
local roastedVegetables = ScriptManager.instance:getItem("Base.PanFriedVegetables2");
if roastedVegetables then
	roastedVegetables:DoParam("OnEat = OnEat_RoastedVegetables");
end

-- OMELETTE
local omelette = ScriptManager.instance:getItem("Base.OmeletteRecipe");
if omelette then
	omelette:DoParam("OnEat = OnEat_OmeletteRecipe");
end

-- SANDWICH
local sandwich = ScriptManager.instance:getItem("Base.Sandwich");
if sandwich then
	sandwich:DoParam("OnEat = OnEat_Sandwich");
end

-- BURGER
local burger = ScriptManager.instance:getItem("Base.BurgerRecipe");
if burger then
	burger:DoParam("OnEat = OnEat_BurgerRecipe");
end

-- PIE 
local pie = ScriptManager.instance:getItem("Base.PieWholeRaw");
if pie then
	pie:DoParam("OnEat = OnEat_PieWholeRaw");
end



-- SALAD
local fruitSalad = ScriptManager.instance:getItem("Base.FruitSalad");
if fruitSalad then
	fruitSalad:DoParam("OnEat = OnEat_FruitSalad");
end

-- CAKE
local cakeRaw = ScriptManager.instance:getItem("Base.CakeRaw");
if cakeRaw then
	cakeRaw:DoParam("OnEat = OnEat_CakeRaw");
end

-- PANCAKES
local pancakes = ScriptManager.instance:getItem("Base.PancakesRecipe");
if pancakes then
	pancakes:DoParam("OnEat = OnEat_Pancakes");
end

-- WAFFLES
local waffles = ScriptManager.instance:getItem("Base.WafflesRecipe");
if waffles then
	waffles:DoParam("OnEat = OnEat_Waffles");
end

-- VIOLETS
local violets = ScriptManager.instance:getItem("Base.Violets");
if violets then
	violets:DoParam("OnEat = OnEat_Violets");
end

-- SUNFLOWERSEEDS
local sunflowerseeds = ScriptManager.instance:getItem("Base.SunflowerSeeds");
if sunflowerseeds then
	sunflowerseeds:DoParam("OnEat = OnEat_SunFlowerSeeds");
end

-- GRAPELEAVES
local grapeLeaves = ScriptManager.instance:getItem("Base.GrapeLeaves");
if grapeLeaves then
	grapeLeaves:DoParam("OnEat = OnEat_GrapeLeaves");
end

-- ROSEHIPS
local rosehips = ScriptManager.instance:getItem("Base.Rosehips");
if rosehips then
	rosehips:DoParam("OnEat = OnEat_Rosehips");
end

-- ACORN
local acorns = ScriptManager.instance:getItem("Base.Acorn");
if acorns then
	acorns:DoParam("OnEat = OnEat_Acorns");
end

-- DANDELIONS
local dandelions = ScriptManager.instance:getItem("Base.Dandelions");
if dandelions then
	dandelions:DoParam("OnEat = OnEat_Dandelions");
end

-- NETTLES
local nettles = ScriptManager.instance:getItem("Base.Nettles");
if nettles then
	nettles:DoParam("OnEat = OnEat_Nettles");
end

-- THISTLE
local thistle = ScriptManager.instance:getItem("Base.Thistle");
if thistle then
	thistle:DoParam("OnEat = OnEat_Thistle");
end




