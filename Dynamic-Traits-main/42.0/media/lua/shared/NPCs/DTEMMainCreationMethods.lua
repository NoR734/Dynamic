---@diagnostic disable: undefined-global
DTEMBaseGameCharacterDetails = {}

------------------------------------------------------------
----- NEW TRAITS / TRAITS REBALANCE / TRAITS EXCLUSIONS -----
------------------------------------------------------------
DTEMBaseGameCharacterDetails.DoTraits = function()
    print("DT Logger: DTEMBaseGameCharacterDetails.DoTraits function");

    if not TraitFactory or not TraitFactory.addTrait then
        print("DT Logger: TraitFactory is not available, skipping DoTraits.")
        return
    end

    local isMP = (isClient() or isServer());

    -- VANILLA TRAITS COST REBALANCE

    -- PROFESSION TRAITS
    TraitFactory.addTrait("Axeman", getText("UI_trait_axeman"), 0, getText("UI_trait_axemandesc"), true);
    TraitFactory.addTrait("Burglar", getText("UI_prof_Burglar"), 0, getText("UI_trait_BurglarDesc"), true);
    TraitFactory.addTrait("NightOwl", getText("UI_trait_nightowl"), 0, getText("UI_trait_nightowldesc"), true);
    TraitFactory.addTrait("Desensitized", getText("UI_trait_Desensitized"), 0, getText("UI_trait_DesensitizedDesc"), true);
    TraitFactory.addTrait("Blacksmith2", getText("UI_trait_Blacksmith"), 0, getText("UI_trait_BlacksmithDesc"), true);

    -- FITNESS TRAITS
    local unfit = TraitFactory.addTrait("Unfit", getText("UI_trait_unfit"), -12, getText("UI_trait_unfitdesc"), false);
    unfit:addXPBoost(Perks.Fitness, -4);

    local outof = TraitFactory.addTrait("Out of Shape", getText("UI_trait_outofshape"), -8, getText("UI_trait_outofshapedesc"), false);
    outof:addXPBoost(Perks.Fitness, -2);

    local fit = TraitFactory.addTrait("Fit", getText("UI_trait_fit"), 8, getText("UI_trait_fitdesc"), false);
    fit:addXPBoost(Perks.Fitness, 2);

    local ath = TraitFactory.addTrait("Athletic", getText("UI_trait_athletic"), 16, getText("UI_trait_athleticdesc"), false);
    ath:addXPBoost(Perks.Fitness, 4);


    -- STRENGTH TRAITS
    local weak = TraitFactory.addTrait("Weak", getText("UI_trait_weak"), -12, getText("UI_trait_weakdesc"), false);
    weak:addXPBoost(Perks.Strength, -5);

    local feeble = TraitFactory.addTrait("Feeble", getText("UI_trait_feeble"), -8, getText("UI_trait_feebledesc"), false);
    feeble:addXPBoost(Perks.Strength, -2);

    local stout = TraitFactory.addTrait("Stout", getText("UI_trait_stout"), 8, getText("UI_trait_stoutdesc"), false);
    stout:addXPBoost(Perks.Strength, 2);

    local strong = TraitFactory.addTrait("Strong", getText("UI_trait_strong"), 16, getText("UI_trait_strongdesc"), false);
    strong:addXPBoost(Perks.Strength, 4);


    -- WEIGHT TRAITS
    TraitFactory.addTrait("Emaciated", getText("UI_trait_emaciated"), 0, getText("UI_trait_emaciateddesc"), true);
    local weightgain = TraitFactory.addTrait("WeightGain", getText("UI_trait_weightgain"), -2, getText("UI_trait_weightgaindesc"), false);
	weightgain:addFreeTrait("Overweight");

	local weightloss = TraitFactory.addTrait("WeightLoss", getText("UI_trait_weightloss"), -2, getText("UI_trait_weightlossdesc"), false);
	weightloss:addFreeTrait("Underweight");

    local veryUnderweight = TraitFactory.addTrait("Very Underweight", getText("UI_trait_veryunderweight"), 0, getText("UI_trait_veryunderweightdesc"), true);
	veryUnderweight:addXPBoost(Perks.Fitness, -2)

	local underweight = TraitFactory.addTrait("Underweight", getText("UI_trait_underweight"), 0, getText("UI_trait_underweightdesc"), true);
	underweight:addXPBoost(Perks.Fitness, -1)

	local overweight = TraitFactory.addTrait("Overweight", getText("UI_trait_overweight"), 0, getText("UI_trait_overweightdesc"), true);
	overweight:addXPBoost(Perks.Fitness, -1)

    local obese = TraitFactory.addTrait("Obese", getText("UI_trait_obese"), 0, getText("UI_trait_obesedesc"), true);
	obese:addXPBoost(Perks.Fitness, -2)


    -- PERKS & RECIPES TRAITS

    -- AGILITY
    local gym = TraitFactory.addTrait("Gymnast", getText("UI_trait_Gymnast"), 5, getText("UI_trait_GymnastDesc"), false);
    gym:addXPBoost(Perks.Lightfoot, 1);
    gym:addXPBoost(Perks.Nimble, 1);

    local jogger = TraitFactory.addTrait("Jogger", getText("UI_trait_Jogger"), 2, getText("UI_trait_JoggerDesc"), false);
    jogger:addXPBoost(Perks.Sprinting, 1);

    -- COMBAT
    local barfighter = TraitFactory.addTrait("Brawler", getText("UI_trait_BarFighter"), 5, getText("UI_trait_BarFighterDesc"), false)
    barfighter:addXPBoost(Perks.Axe, 1)
    barfighter:addXPBoost(Perks.Blunt, 1)
    barfighter:getFreeRecipes():add("BarbedWireWeapon")
	barfighter:getFreeRecipes():add("CanReinforceLongWeapon")
	barfighter:getFreeRecipes():add("CanReinforceShortWeapon")
	barfighter:getFreeRecipes():add("CanReinforceWeapon")
	barfighter:getFreeRecipes():add("SheetMetalWeapon")

    local baseball = TraitFactory.addTrait("BaseballPlayer", getText("UI_trait_PlaysBaseball"), 3, getText("UI_trait_PlaysBaseballDesc"), false)
    baseball:addXPBoost(Perks.Blunt, 1)
    baseball:getFreeRecipes():add("CarveBat")

    -- CRAFTING
    local artisan = TraitFactory.addTrait("Artisan", getText("UI_trait_Artisan"), 2, getText("UI_trait_ArtisanDesc"), false);
	artisan:addXPBoost(Perks.Glassmaking, 1)
	artisan:addXPBoost(Perks.Pottery, 1)

    local blacksmith = TraitFactory.addTrait("Blacksmith", getText("UI_trait_Blacksmith"), 3, getText("UI_trait_BlacksmithDesc"), false);
    blacksmith:addXPBoost(Perks.Blacksmith, 2)
	blacksmith:addXPBoost(Perks.Maintenance, 1)
--    blacksmith:addXPBoost(Perks.Melting, 1)
    doMetalWorkerRecipes(blacksmith);

    local carenthusiast = TraitFactory.addTrait("Mechanics", getText("UI_trait_Mechanics"), 4, getText("UI_trait_MechanicsDesc"), false);
    carenthusiast:addXPBoost(Perks.Mechanics, 2);
    carenthusiast:getFreeRecipes():add("Basic Mechanics");
    carenthusiast:getFreeRecipes():add("Intermediate Mechanics");
    carenthusiast:getFreeRecipes():add("Advanced Mechanics");

    local cook = TraitFactory.addTrait("Cook", getText("UI_trait_Cook"), 3, getText("UI_trait_CookDesc"), false)
    cook:addXPBoost(Perks.Cooking, 2)
    cook:getFreeRecipes():add("MakeCakeBatter")
    cook:getFreeRecipes():add("MakePieDough")
    cook:getFreeRecipes():add("MakeBreadDough")
    cook:getFreeRecipes():add("MakeBaguetteDough")
    cook:getFreeRecipes():add("MakeBiscuits")
    cook:getFreeRecipes():add("MakeCookieDough")
    cook:getFreeRecipes():add("MakeChocolateChipCookieDough")
    cook:getFreeRecipes():add("MakeOatmealCookieDough")
    cook:getFreeRecipes():add("MakeShortbreadCookieDough")
    cook:getFreeRecipes():add("MakeSugarCookieDough")
    cook:getFreeRecipes():add("MakePizza")
    cook:getFreeRecipes():add("MakeFriedOnionRings")
    cook:getFreeRecipes():add("MakeFriedShrimp")
    cook:getFreeRecipes():add("MakeCabbageRolls")
    cook:getFreeRecipes():add("MakeJar")

    local fisher = TraitFactory.addTrait("Fishing", getText("UI_trait_Fishing"), 1, getText("UI_trait_FishingDesc"), false)
    fisher:addXPBoost(Perks.Fishing, 1)
    fisher:getFreeRecipes():add("MakeFishingRod")
    fisher:getFreeRecipes():add("FixFishingRod")
    fisher:getFreeRecipes():add("MakeChum")

    local firstAid = TraitFactory.addTrait("FirstAid", getText("UI_trait_FirstAid"), 1, getText("UI_trait_FirstAidDesc"), false);
    firstAid:addXPBoost(Perks.Doctor, 2);

    local gardener = TraitFactory.addTrait("Gardener", getText("UI_trait_Gardener"), 2, getText("UI_trait_GardenerDesc"), false)
    gardener:addXPBoost(Perks.Farming, 1)
    gardener:getFreeRecipes():add("MakeFliesCureFromCigarettes")
    gardener:getFreeRecipes():add("MakeFliesCureFromLooseTobacco")
    gardener:getFreeRecipes():add("MakeFliesCureFromChewingTobacco")
    gardener:getFreeRecipes():add("MakeMildewCure")
    gardener:getFreeRecipes():add("MakeAphidsCure")
    gardener:getFreeRecipes():add("MakeScarecrow")

    gardener:getFreeRecipes():add("Carrot Growing Season")
    gardener:getFreeRecipes():add("Broccoli Growing Season")
    gardener:getFreeRecipes():add("Radish Growing Season")
    gardener:getFreeRecipes():add("Strawberry Growing Season")
    gardener:getFreeRecipes():add("Tomato Growing Season")
    gardener:getFreeRecipes():add("Potato Growing Season")
    gardener:getFreeRecipes():add("Cabbage Growing Season")

    gardener:getFreeRecipes():add("Corn Growing Season")
    gardener:getFreeRecipes():add("Kale Growing Season")
    gardener:getFreeRecipes():add("Sweet Potato Growing Season")
    gardener:getFreeRecipes():add("Green Pea Growing Season")
    gardener:getFreeRecipes():add("Onion Growing Season")
    gardener:getFreeRecipes():add("Garlic Growing Season")
    gardener:getFreeRecipes():add("Soybean Growing Season")

    gardener:getFreeRecipes():add("Basil Growing Season")
    gardener:getFreeRecipes():add("Chives Growing Season")
    gardener:getFreeRecipes():add("Cilantro Growing Season")
    gardener:getFreeRecipes():add("Oregano Growing Season")
    gardener:getFreeRecipes():add("Parsley Growing Season")
    gardener:getFreeRecipes():add("Sage Growing Season")
    gardener:getFreeRecipes():add("Rosemary Growing Season")
    gardener:getFreeRecipes():add("Thyme Growing Season")

    gardener:getFreeRecipes():add("Hops Growing Season")
    gardener:getFreeRecipes():add("Sugar Beet Growing Season")

    gardener:getFreeRecipes():add("Bell Pepper Growing Season")
    gardener:getFreeRecipes():add("Cauliflower Growing Season")
    gardener:getFreeRecipes():add("Cucumber Growing Season")
    gardener:getFreeRecipes():add("Habanero Growing Season")
    gardener:getFreeRecipes():add("Jalapeno Growing Season")
    gardener:getFreeRecipes():add("Leek Growing Season")
    gardener:getFreeRecipes():add("Lettuce Growing Season")
    gardener:getFreeRecipes():add("Pumpkin Growing Season")
    gardener:getFreeRecipes():add("Spinach Growing Season")
    gardener:getFreeRecipes():add("Sunflower Growing Season")
    gardener:getFreeRecipes():add("Turnip Growing Season")
    gardener:getFreeRecipes():add("Watermelon Growing Season")
    gardener:getFreeRecipes():add("Zucchini Growing Season")

    gardener:getFreeRecipes():add("Chamomile Growing Season")
    gardener:getFreeRecipes():add("Lemongrass Growing Season")
    gardener:getFreeRecipes():add("Marigold Growing Season")
    gardener:getFreeRecipes():add("Mint Growing Season")

    gardener:getFreeRecipes():add("Black Sage Growing Season")
    gardener:getFreeRecipes():add("Broadleaf Plantain Growing Season")
    gardener:getFreeRecipes():add("Comfrey Growing Season")
    gardener:getFreeRecipes():add("Common Mallow Growing Season")
    gardener:getFreeRecipes():add("Wild Garlic Growing Season")

    gardener:getFreeRecipes():add("Rose Growing Season")
    gardener:getFreeRecipes():add("Poppy Growing Season")
    gardener:getFreeRecipes():add("Lavender Growing Season")

    gardener:getFreeRecipes():add("MakeJarofTomatoes")
    gardener:getFreeRecipes():add("MakeJarofCarrots")
    gardener:getFreeRecipes():add("MakeJarofPotatoes")
    gardener:getFreeRecipes():add("MakeJarofEggplant")
    gardener:getFreeRecipes():add("MakeJarofLeeks")
    gardener:getFreeRecipes():add("MakeJarofRedRadishes")
    gardener:getFreeRecipes():add("MakeJarofBellPeppers")
    gardener:getFreeRecipes():add("MakeJarofCabbage")
    gardener:getFreeRecipes():add("MakeJarofBroccoli")

    local handy = TraitFactory.addTrait("Handy", getText("UI_trait_handy"), 6, getText("UI_trait_handydesc"), false)
    handy:addXPBoost(Perks.Maintenance, 1)
    handy:addXPBoost(Perks.Woodwork, 1)
    handy:addXPBoost(Perks.Carving, 1)
    handy:getFreeRecipes():add("BarbedWireWeapon")
    handy:getFreeRecipes():add("BoltBat")
    handy:getFreeRecipes():add("MakeBrakeWeapon")
    handy:getFreeRecipes():add("MakeBucketMaul")
    handy:getFreeRecipes():add("CanReinforceLongWeapon")
    handy:getFreeRecipes():add("CanReinforceShortWeapon")
    handy:getFreeRecipes():add("CanReinforceWeapon")
    handy:getFreeRecipes():add("MakeGardenForkHeadWeapon")
    handy:getFreeRecipes():add("MakeKettleMaul")
    handy:getFreeRecipes():add("RailspikeBaseballBat")
    handy:getFreeRecipes():add("MakeRailspikeCudgel")
    handy:getFreeRecipes():add("MakeRailspikeIronPipe")
    handy:getFreeRecipes():add("MakeRailspikeLongHandle")
    handy:getFreeRecipes():add("MakeRailspikeWeapon")
    handy:getFreeRecipes():add("MakeRakeHeadWeapon")
    handy:getFreeRecipes():add("MakeSawPlank")
    handy:getFreeRecipes():add("MakeSawbladeCudgel")
    handy:getFreeRecipes():add("MakeSawbladeLongHandle")
    handy:getFreeRecipes():add("MakeSawbladePlank")
    handy:getFreeRecipes():add("MakeSawbladeTableLeg")
    handy:getFreeRecipes():add("MakeSawbladeWeapon")
    handy:getFreeRecipes():add("SheetMetalWeapon")
    handy:getFreeRecipes():add("MakeSpadeHeadCudgel")
    handy:getFreeRecipes():add("MakeScrewdriver")
    
    local mason = TraitFactory.addTrait("Mason", getText("UI_trait_Mason"), 2, getText("UI_trait_MasonDesc"), false);
	mason:addXPBoost(Perks.Masonry, 2)
    mason:getFreeRecipes():add("Construct_Advanced_Forge")
    mason:getFreeRecipes():add("Construct_Blast_Furnace")
    mason:getFreeRecipes():add("Construct_Dome_Kiln")
    mason:getFreeRecipes():add("Construct_Forge")
    mason:getFreeRecipes():add("Construct_Smelting_Furnace")
    mason:getFreeRecipes():add("Construct_Primitive_Forge")

    local tailoring = TraitFactory.addTrait("Tailor", getText("UI_trait_Tailor"), 2, getText("UI_trait_TailorDesc"), false)
    tailoring:addXPBoost(Perks.Tailoring, 2)
    tailoring:getFreeRecipes():add("KnitBalaclavaFace")
    tailoring:getFreeRecipes():add("KnitBalaclavaFull")
    tailoring:getFreeRecipes():add("KnitBeany")
    tailoring:getFreeRecipes():add("KnitDoily")
    tailoring:getFreeRecipes():add("KnitLegwarmers")
    tailoring:getFreeRecipes():add("KnitScarf")
    tailoring:getFreeRecipes():add("KnitSocks")
    tailoring:getFreeRecipes():add("KnitSweaterVest")
    tailoring:getFreeRecipes():add("KnitWoolyHat")
    tailoring:getFreeRecipes():add("SewCrudeLeatherBackpack")
    tailoring:getFreeRecipes():add("SewHideBoots")
    tailoring:getFreeRecipes():add("SewHidePants")
    tailoring:getFreeRecipes():add("SewHideSleepingBag")
    tailoring:getFreeRecipes():add("SewHideCoat")
    tailoring:getFreeRecipes():add("SewHideHoodie")
    tailoring:getFreeRecipes():add("SewHideJacket")

    -- SURVIVALIST
    local backpacker = TraitFactory.addTrait("Hiker", getText("UI_trait_Hiker"), 4, getText("UI_trait_HikerDesc"), false)
    backpacker:addXPBoost(Perks.PlantScavenging, 2)
    backpacker:addXPBoost(Perks.Trapping, 1)
    backpacker:getFreeRecipes():add("MakeStickTrap")
    backpacker:getFreeRecipes():add("MakeSnareTrap")
    backpacker:getFreeRecipes():add("MakeWoodenBoxTrap")

    local formerscout = TraitFactory.addTrait("Formerscout", getText("UI_trait_Scout"), 2, getText("UI_trait_ScoutDesc"), false)
    formerscout:addXPBoost(Perks.Trapping, 1)
    formerscout:addXPBoost(Perks.PlantScavenging, 1)

    local herbalist = TraitFactory.addTrait("Herbalist", getText("UI_trait_Herbalist"), 3, getText("UI_trait_HerbalistDesc"), false)
    herbalist:addXPBoost(Perks.PlantScavenging, 1)
    herbalist:getFreeRecipes():add("Herbalist")
    herbalist:getFreeRecipes():add("MakePlantainPoultice")
    herbalist:getFreeRecipes():add("MakeComfreyPoultice")
    herbalist:getFreeRecipes():add("MakeWildGarlicPoultice")

    herbalist:getFreeRecipes():add("Black Sage Growing Season")
    herbalist:getFreeRecipes():add("Broadleaf Plantain Growing Season")
    herbalist:getFreeRecipes():add("Comfrey Growing Season")
    herbalist:getFreeRecipes():add("Common Mallow Growing Season")
    herbalist:getFreeRecipes():add("Wild Garlic Growing Season")

    local hunter = TraitFactory.addTrait("Hunter", getText("UI_trait_Hunter"), 7, getText("UI_trait_HunterDesc"), false)
    hunter:addXPBoost(Perks.Aiming, 1)
    hunter:addXPBoost(Perks.Trapping, 1)
    hunter:addXPBoost(Perks.Sneak, 1)
    hunter:addXPBoost(Perks.SmallBlade, 1)
    hunter:getFreeRecipes():add("MakeStickTrap")
    hunter:getFreeRecipes():add("MakeSnareTrap")
    hunter:getFreeRecipes():add("MakeWoodenBoxTrap")
    hunter:getFreeRecipes():add("MakeTrapBox")
    hunter:getFreeRecipes():add("MakeCageTrap")

    local whittler = TraitFactory.addTrait("Whittler", getText("UI_trait_Whittler"), 2, getText("UI_trait_WhittlerDesc"), false)
	whittler:addXPBoost(Perks.Carving, 2)
    whittler:getFreeRecipes():add("SharpenBone")
    whittler:getFreeRecipes():add("MakeBoneFishingHook")
    whittler:getFreeRecipes():add("MakeBoneSewingNeedle")
    whittler:getFreeRecipes():add("SharpenBone")
    whittler:getFreeRecipes():add("SharpenLongBone")
    whittler:getFreeRecipes():add("SharpenJawbone")
    whittler:getFreeRecipes():add("MakeBoneFishingHook")
    whittler:getFreeRecipes():add("MakeBoneSewingNeedle")
    whittler:getFreeRecipes():add("CarveKnittingNeedles")
    whittler:getFreeRecipes():add("CarveBat")
    whittler:getFreeRecipes():add("MakeBoneHatchetHead")
    whittler:getFreeRecipes():add("MakeBoneAwl")
    whittler:getFreeRecipes():add("MakeLargeBoneBead")
    whittler:getFreeRecipes():add("MakeLargeBoneBeads")
    whittler:getFreeRecipes():add("CarveWoodenFork")
    whittler:getFreeRecipes():add("MakeBoneFork")
    whittler:getFreeRecipes():add("CarveWoodenSpade")
    whittler:getFreeRecipes():add("CarveGoblets")
    whittler:getFreeRecipes():add("CarveBucket")
    whittler:getFreeRecipes():add("CarveFleshingTool")
    whittler:getFreeRecipes():add("CarveShortBat")
    whittler:getFreeRecipes():add("CarveWhistle")

    local wilderness = TraitFactory.addTrait("WildernessKnowledge", getText("UI_trait_WildernessKnowledge"), 8, getText("UI_trait_WildernessKnowledgeDesc"), false)
    wilderness:addXPBoost(Perks.PlantScavenging, 1)
    wilderness:addXPBoost(Perks.FlintKnapping, 1)
	wilderness:addXPBoost(Perks.Maintenance, 1)
    wilderness:addXPBoost(Perks.Carving, 1)
    wilderness:getFreeRecipes():add("Herbalist")
    wilderness:getFreeRecipes():add("MakeStoneBlade")
    wilderness:getFreeRecipes():add("MakeLongStoneBlade")
    wilderness:getFreeRecipes():add("MakeStoneBladeScythe")
    wilderness:getFreeRecipes():add("FireHardenSpear")
    wilderness:getFreeRecipes():add("MakeCrudeWhetstone")
    wilderness:getFreeRecipes():add("MakePlantainPoultice")
    wilderness:getFreeRecipes():add("MakeComfreyPoultice")
    wilderness:getFreeRecipes():add("MakeWildGarlicPoultice")

    --wilderness:getFreeRecipes():add("Black Sage Growing Season")
    --wilderness:getFreeRecipes():add("Broadleaf Plantain Growing Season")
    --wilderness:getFreeRecipes():add("Comfrey Growing Season")
    --wilderness:getFreeRecipes():add("Common Mallow Growing Season")
    --wilderness:getFreeRecipes():add("Wild Garlic Growing Season")

    wilderness:getFreeRecipes():add("BindSpear")
    wilderness:getFreeRecipes():add("WireSpear")
    wilderness:getFreeRecipes():add("SharpenBone")
    wilderness:getFreeRecipes():add("MakeBoneFishingHook")
    wilderness:getFreeRecipes():add("MakeBoneSewingNeedle")
    wilderness:getFreeRecipes():add("MakeBoneAwl")
    wilderness:getFreeRecipes():add("MakeStoneAwl")
    wilderness:getFreeRecipes():add("MakeStoneChisel")
    wilderness:getFreeRecipes():add("MakeStoneDrill")
    wilderness:getFreeRecipes():add("MakeLargeStoneAxeHead")
    wilderness:getFreeRecipes():add("MakeStoneMaulHead")

    wilderness:getFreeRecipes():add("MakeBoneClub")
    wilderness:getFreeRecipes():add("MakeBoneHatchetHead")
    wilderness:getFreeRecipes():add("MakeJawboneAxe")
    wilderness:getFreeRecipes():add("MakeFishingRod")
    wilderness:getFreeRecipes():add("MakeSnareTrap")
    wilderness:getFreeRecipes():add("MakeStoneBladeSaw")
    wilderness:getFreeRecipes():add("CarveBucket")
    wilderness:getFreeRecipes():add("CarveFleshingTool")

    -- PANIC TRAITS
    TraitFactory.addTrait("Brave", getText("UI_trait_brave"), 4, getText("UI_trait_bravedesc"), false)
    TraitFactory.addTrait("Cowardly", getText("UI_trait_cowardly"), -2, getText("UI_trait_cowardlydesc"), false)
    TraitFactory.addTrait("Hemophobic", getText("UI_trait_Hemophobic"), -8, getText("UI_trait_HemophobicDesc"), false)
    TraitFactory.addTrait("AdrenalineJunkie", getText("UI_trait_AdrenalineJunkie"), 3, getText("UI_trait_AdrenalineJunkieDesc"), false)
    TraitFactory.addTrait("Agoraphobic", getText("UI_trait_agoraphobic"), -4, getText("UI_trait_agoraphobicdesc"), false)
    TraitFactory.addTrait("Claustophobic", getText("UI_trait_claustro"), -4, getText("UI_trait_claustrodesc"), false)

    -- SNEAK & LIGHTFOOT
    TraitFactory.addTrait("Clumsy", getText("UI_trait_clumsy"), -4, getText("UI_trait_clumsydesc"), false)
    TraitFactory.addTrait("Graceful", getText("UI_trait_graceful"), 4, getText("UI_trait_gracefuldesc"), false)
    TraitFactory.addTrait("Inconspicuous", getText("UI_trait_Inconspicuous"), 4, getText("UI_trait_InconspicuousDesc"), false)
    TraitFactory.addTrait("Conspicuous", getText("UI_trait_Conspicuous"), -4, getText("UI_trait_ConspicuousDesc"), false)

    -- SIGHT & HEARING
    TraitFactory.addTrait("ShortSighted", getText("UI_trait_shortsigh"), -2, getText("UI_trait_shortsighdesc"), false)
    TraitFactory.addTrait("HardOfHearing", getText("UI_trait_hardhear"), -6, getText("UI_trait_hardheardesc"), false)
    TraitFactory.addTrait("Deaf", getText("UI_trait_deaf"), -12, getText("UI_trait_deafdesc"), false)
    TraitFactory.addTrait("KeenHearing", getText("UI_trait_keenhearing"), 6, getText("UI_trait_keenhearingdesc"), false)
    TraitFactory.addTrait("EagleEyed", getText("UI_trait_eagleeyed"), 4, getText("UI_trait_eagleeyeddesc"), false)

    -- LUCKY 
    TraitFactory.addTrait("Lucky", getText("UI_trait_lucky"), 3, getText("UI_trait_luckydesc"), false)
    TraitFactory.addTrait("Unlucky", getText("UI_trait_unlucky"), -3, getText("UI_trait_unluckydesc"), false)

    -- READING 
    TraitFactory.addTrait("FastReader", getText("UI_trait_FastReader"), 1, getText("UI_trait_FastReaderDesc"), false)
    TraitFactory.addTrait("SlowReader", getText("UI_trait_SlowReader"), -1, getText("UI_trait_SlowReaderDesc"), false)
    TraitFactory.addTrait("Illiterate", getText("UI_trait_Illiterate"), -12, getText("UI_trait_IlliterateDesc"), false)

    -- LEARNING 
    TraitFactory.addTrait("FastLearner", getText("UI_trait_FastLearner"), 6, getText("UI_trait_FastLearnerDesc"), false)
    TraitFactory.addTrait("SlowLearner", getText("UI_trait_SlowLearner"), -6, getText("UI_trait_SlowLearnerDesc"), false)
    TraitFactory.addTrait("Pacifist", getText("UI_trait_Pacifist"), -4, getText("UI_trait_PacifistDesc"), false)
    local inventive = TraitFactory.addTrait("Inventive", getText("UI_trait_Inventive"), 2, getText("UI_trait_InventiveDesc"), false)

    -- ITEMS MOVEMENTS & ORGANIZATION
    TraitFactory.addTrait("Organized", getText("UI_trait_Packmule"), 6, getText("UI_trait_PackmuleDesc"), false)
    TraitFactory.addTrait("Disorganized", getText("UI_trait_Disorganized"), -6, getText("UI_trait_DisorganizedDesc"), false)
    TraitFactory.addTrait("Dextrous", getText("UI_trait_Dexterous"), 6, getText("UI_trait_DexterousDesc"), false)
    TraitFactory.addTrait("AllThumbs", getText("UI_trait_AllThumbs"), -8, getText("UI_trait_AllThumbsDesc"), false)

    -- OTHER TRAITS
    TraitFactory.addTrait("SpeedDemon", getText("UI_trait_SpeedDemon"), 1, getText("UI_trait_SpeedDemonDesc"), false)
    TraitFactory.addTrait("SundayDriver", getText("UI_trait_SundayDriver"), -1, getText("UI_trait_SundayDriverDesc"), false)
    TraitFactory.addTrait("PoorPassenger", getText("UI_trait_PoorPassenger"), -1, getText("UI_trait_PoorPassengerDesc"), false, not isMP)

    TraitFactory.addTrait("Nutritionist", getText("UI_trait_nutritionist"), 2, getText("UI_trait_nutritionistdesc"), false)
    TraitFactory.addTrait("Nutritionist2", getText("UI_trait_nutritionist"), 0, getText("UI_trait_nutritionistdesc"), true)

    TraitFactory.addTrait("Outdoorsman", getText("UI_trait_outdoorsman"), 8, getText("UI_trait_outdoorsmandesc"), false)
    TraitFactory.addTrait("NightVision", getText("UI_trait_NightVision"), 4, getText("UI_trait_NightVisionDesc"), false)
    TraitFactory.addTrait("Smoker", getText("UI_trait_Smoker"), -3, getText("UI_trait_SmokerDesc"), false)
    TraitFactory.addTrait("WeakStomach", getText("UI_trait_WeakStomach"), -5, getText("UI_trait_WeakStomachDesc"), false)
    TraitFactory.addTrait("IronGut", getText("UI_trait_IronGut"), 5, getText("UI_trait_IronGutDesc"), false)

    -- TODO: Check new addFreeTrait option for this.
    -- VANILLA TRAITS REMOVED FROM THE CHARACTER CREATION.
    local sleepOK = (isClient() or isServer()) and getServerOptions():getBoolean("SleepAllowed") and getServerOptions():getBoolean("SleepNeeded")

    -- EATING
    TraitFactory.addTrait("LightEater", getText("UI_trait_lighteater"), 0, getText("UI_trait_lighteaterdesc"), true)
    TraitFactory.addTrait("HeartyAppitite", getText("UI_trait_heartyappetite"), 0, getText("UI_trait_heartyappetitedesc"), true)
    TraitFactory.addTrait("LowThirst", getText("UI_trait_LowThirst"), 0, getText("UI_trait_LowThirstDesc"), true)
    TraitFactory.addTrait("HighThirst", getText("UI_trait_HighThirst"), 0, getText("UI_trait_HighThirstDesc"), true)

    -- SLEEP
    TraitFactory.addTrait("NeedsLessSleep", getText("UI_trait_LessSleep"), 0, getText("UI_trait_LessSleepDesc"), true, not sleepOK)
    TraitFactory.addTrait("NeedsMoreSleep", getText("UI_trait_MoreSleep"), 0, getText("UI_trait_MoreSleepDesc"), true, not sleepOK)
    TraitFactory.addTrait("Insomniac", getText("UI_trait_Insomniac"), 0, getText("UI_trait_InsomniacDesc"), true, not sleepOK)

    -- HEALTH
    TraitFactory.addTrait("Resilient", getText("UI_trait_resilient"), 0, getText("UI_trait_resilientdesc"), true)
    TraitFactory.addTrait("ProneToIllness", getText("UI_trait_pronetoillness"), 0, getText("UI_trait_pronetoillnessdesc"), true)
    TraitFactory.addTrait("SlowHealer", getText("UI_trait_SlowHealer"), 0, getText("UI_trait_SlowHealerDesc"), true)
    TraitFactory.addTrait("FastHealer", getText("UI_trait_FastHealer"), 0, getText("UI_trait_FastHealerDesc"), true)
    TraitFactory.addTrait("Asthmatic", getText("UI_trait_Asthmatic"), 0, getText("UI_trait_AsthmaticDesc"), true)
    TraitFactory.addTrait("ThickSkinned", getText("UI_trait_thickskinned"), 0, getText("UI_trait_thickskinneddesc"), true)
    TraitFactory.addTrait("ThinSkinned", getText("UI_trait_ThinSkinned"), 0, getText("UI_trait_ThinSkinnedDesc"), true)
    

    -- NEW TRAITS
    TraitFactory.addTrait("Flimsy", getText("UI_trait_Flimsy"), 0, getText("UI_trait_FlimsyDesc"), true);
    TraitFactory.addTrait("Frail", getText("UI_trait_Frail"), 0, getText("UI_trait_FrailDesc"), true);
    --[[ if getActivatedMods():contains("LeGourmetRevolution") then
        print("DT Logger: LeGourmetRevolution detected, adding Addicted to caffeine trait")
        TraitFactory.addTrait("AddictedToCaffeine", getText("UI_trait_AddictedToCaffeine"), -4, getText("UI_trait_AddictedToCaffeineDesc"), false);
    end ]]
    TraitFactory.addTrait("AddictedToCaffeine", getText("UI_trait_AddictedToCaffeine"), -4, getText("UI_trait_AddictedToCaffeineDesc"), false);
    TraitFactory.addTrait("Bloodlust", getText("UI_trait_Bloodlust"), 0, getText("UI_trait_BloodlustDesc"), true);

    local amateurElectrician = TraitFactory.addTrait("AmateurElectrician", getText("UI_trait_AmateurElectrician"), 1, getText("UI_trait_AmateurElectricianDesc"), false);
    amateurElectrician:getFreeRecipes():add("Generator");

    local amateurElectrician2 = TraitFactory.addTrait("AmateurElectrician2", getText("UI_trait_AmateurElectrician"), 0, getText("UI_trait_AmateurElectricianDesc"), true);
    amateurElectrician2:getFreeRecipes():add("Generator");

    TraitFactory.addTrait("Pluviophile", getText("UI_trait_Pluviophile"), 2, getText("UI_trait_PluviophileDesc"), false);
    TraitFactory.addTrait("Pluviophobia", getText("UI_trait_Pluviophobia"), -2, getText("UI_trait_PluviophobiaDesc"), false);
    TraitFactory.addTrait("Alcoholic", getText("UI_trait_Alcoholic"), -8, getText("UI_trait_AlcoholicDesc"), false);
    TraitFactory.addTrait("Anorexy", getText("UI_trait_Anorexy"), -6, getText("UI_trait_AnorexyDesc"), false);
    -- TraitFactory.addTrait("Bigorexia", getText("UI_trait_Bigorexia"), -8, getText("UI_trait_BigorexiaDesc"), false);
    TraitFactory.addTrait("Prodigy", getText("UI_trait_Prodigy"), 6, getText("UI_trait_ProdigyDesc"), false);
    TraitFactory.addTrait("PhysicallyActive", getText("UI_trait_PhysicallyActive"), 10, getText("UI_trait_PhysicallyActiveDesc"), false);
    TraitFactory.addTrait("PhysicallyActive2", getText("UI_trait_PhysicallyActive"), 0, getText("UI_trait_PhysicallyActiveDesc"), true);
    TraitFactory.addTrait("Sedentary", getText("UI_trait_Sedentary"), -10, getText("UI_trait_SedentaryDesc"), false);
    TraitFactory.addTrait("Nightmares", getText("UI_trait_Nightmares"), 0, getText("UI_trait_NightmaresDesc"), true, not sleepOK);
    --TraitFactory.addTrait("Fibromyalgia", getText("UI_trait_Fibromyalgia"), -10, getText("UI_trait_FibromyalgiaDesc"), false);
    TraitFactory.addTrait("NervousWreck", getText("UI_trait_NervousWreck"), -4, getText("UI_trait_NervousWreckDesc"), false);
    TraitFactory.addTrait("Melancholic", getText("UI_trait_Melancholic"), -4, getText("UI_trait_MelancholicDesc"), false);

    local handy2 = TraitFactory.addTrait("Handy2", getText("UI_trait_handy"), 0, getText("UI_trait_handydesc"), true)
    handy2:addXPBoost(Perks.Maintenance, 1)
    handy2:addXPBoost(Perks.Woodwork, 1)
    handy2:addXPBoost(Perks.Carving, 1)
    handy2:getFreeRecipes():add("BarbedWireWeapon")
    handy2:getFreeRecipes():add("BoltBat")
    handy2:getFreeRecipes():add("MakeBrakeWeapon")
    handy2:getFreeRecipes():add("MakeBucketMaul")
    handy2:getFreeRecipes():add("CanReinforceLongWeapon")
    handy2:getFreeRecipes():add("CanReinforceShortWeapon")
    handy2:getFreeRecipes():add("CanReinforceWeapon")
    handy2:getFreeRecipes():add("MakeGardenForkHeadWeapon")
    handy2:getFreeRecipes():add("MakeKettleMaul")
    handy2:getFreeRecipes():add("RailspikeBaseballBat")
    handy2:getFreeRecipes():add("MakeRailspikeCudgel")
    handy2:getFreeRecipes():add("MakeRailspikeIronPipe")
    handy2:getFreeRecipes():add("MakeRailspikeLongHandle")
    handy2:getFreeRecipes():add("MakeRailspikeWeapon")
    handy2:getFreeRecipes():add("MakeRakeHeadWeapon")
    handy2:getFreeRecipes():add("MakeSawPlank")
    handy2:getFreeRecipes():add("MakeSawbladeCudgel")
    handy2:getFreeRecipes():add("MakeSawbladeLongHandle")
    handy2:getFreeRecipes():add("MakeSawbladePlank")
    handy2:getFreeRecipes():add("MakeSawbladeTableLeg")
    handy2:getFreeRecipes():add("MakeSawbladeWeapon")
    handy2:getFreeRecipes():add("SheetMetalWeapon")
    handy2:getFreeRecipes():add("MakeSpadeHeadCudgel")
    handy2:getFreeRecipes():add("MakeScrewdriver")

    local herbalist2 = TraitFactory.addTrait("Herbalist2", getText("UI_trait_Herbalist"), 0, getText("UI_trait_HerbalistDesc"), true);
    herbalist2:getFreeRecipes():add("Herbalist");

    TraitFactory.addTrait("Dextrous2", getText("UI_trait_Dexterous"), 0, getText("UI_trait_DexterousDesc"), true);
    TraitFactory.addTrait("PillsAllergy", getText("UI_trait_PillsAllergy"), -6, getText("UI_trait_PillsAllergyDesc"), false);
    TraitFactory.addTrait("WildPlantsAllergy", getText("UI_trait_WildPlantsAllergy"), -4, getText("UI_trait_WildPlantsAllergyDesc"), false);
    TraitFactory.addTrait("Flabby", getText("UI_trait_Flabby"), 0, getText("UI_trait_FlabbyDesc"), true);
    TraitFactory.addTrait("BrittleKnees", getText("UI_trait_BrittleKnees"), 0, getText("UI_trait_BrittleKneesDesc"), true);

    -- NEW TRAITS FROM MORE SIMPLE TRAITS
    local sneaky = TraitFactory.addTrait("Sneaky", getText("UI_trait_sneaky"), 2, getText("UI_trait_sneakydesc"), false);
    sneaky:addXPBoost(Perks.Sneak, 1);

	local lightfooted = TraitFactory.addTrait("Lightfooted", getText("UI_trait_lightfooted"), 2, getText("UI_trait_lightfooteddesc"), false);
    lightfooted:addXPBoost(Perks.Lightfoot, 1);

	local nimble = TraitFactory.addTrait("Nimble", getText("UI_trait_nimble"), 3, getText("UI_trait_nimbledesc"), false);
    nimble:addXPBoost(Perks.Nimble, 1);

    local amforager = TraitFactory.addTrait("AMForager", getText("UI_trait_amforager"), 1, getText("UI_trait_amforagerdesc"), false);
    amforager:addXPBoost(Perks.PlantScavenging, 1);

	local amtrapper = TraitFactory.addTrait("AMTrapper", getText("UI_trait_amtrapper"), 1, getText("UI_trait_amtrapperdesc"), false);
    amtrapper:addXPBoost(Perks.Trapping, 1);

    local amcook = TraitFactory.addTrait("AMCook", getText("UI_trait_amcook"), 1, getText("UI_trait_amcookdesc"), false);
    amcook:addXPBoost(Perks.Cooking, 1)	;

	local amelectrician = TraitFactory.addTrait("AMElectrician", getText("UI_trait_amelectrician"), 1, getText("UI_trait_amelectriciandesc"), false);
    amelectrician:addXPBoost(Perks.Electricity, 1);

	local ammechanic = TraitFactory.addTrait("AMMechanic", getText("UI_trait_ammechanic"), 2, getText("UI_trait_ammechanicdesc"), false);
    ammechanic:addXPBoost(Perks.Mechanics, 1);

	local amcarpenter = TraitFactory.addTrait("AMCarpenter", getText("UI_trait_amcarpenter"), 1, getText("UI_trait_amcarpenterdesc"), false);
    amcarpenter:addXPBoost(Perks.Woodwork, 1);

	local ammetalworker = TraitFactory.addTrait("AMMetalworker", getText("UI_trait_ammetalworker"), 2, getText("UI_trait_ammetalworkerdesc"), false);
    ammetalworker:addXPBoost(Perks.MetalWelding, 1);

    local durabile = TraitFactory.addTrait("Durabile", getText("UI_trait_durabile"), 3, getText("UI_trait_durabiledesc"), false);
    durabile:addXPBoost(Perks.Maintenance, 1);

    local shortbladefan = TraitFactory.addTrait("Shortbladefan", getText("UI_trait_shortbladefan"), 2, getText("UI_trait_shortbladefandesc"), false);
    shortbladefan:addXPBoost(Perks.SmallBlade, 1);

	local shortbluntfan = TraitFactory.addTrait("Shortbluntfan", getText("UI_trait_shortbluntfan"), 3, getText("UI_trait_shortbluntfandesc"), false);
    shortbluntfan:addXPBoost(Perks.SmallBlunt, 1);

	local cutter = TraitFactory.addTrait("Cutter", getText("UI_trait_cutter"), 4, getText("UI_trait_cutterdesc"), false);
    cutter:addXPBoost(Perks.Axe, 1);

    local spearman = TraitFactory.addTrait("Spearman", getText("UI_trait_spearman"), 5, getText("UI_trait_spearmandesc"), false);
    spearman:addXPBoost(Perks.Spear, 1);

    local swordsman = TraitFactory.addTrait("Swordsman", getText("UI_trait_swordsman"), 4, getText("UI_trait_swordsmandesc"), false);
    swordsman:addXPBoost(Perks.LongBlade, 1);

    local gunfan = TraitFactory.addTrait("Gunfan", getText("UI_trait_gunfan"), 4, getText("UI_trait_gunfandesc"), false);
    gunfan:addXPBoost(Perks.Aiming, 1);
    gunfan:addXPBoost(Perks.Reloading, 1);

    -- NEW TRAITS EXCLUSIONS & NEW EXCLUSIONS
    -- VANILLA EXCLUSIONS
    TraitFactory.setMutualExclusive("Blacksmith", "Blacksmith2");
    TraitFactory.setMutualExclusive("SpeedDemon", "SundayDriver");
	TraitFactory.setMutualExclusive("Dextrous", "AllThumbs");
    TraitFactory.setMutualExclusive("Nutritionist", "Nutritionist2");
	TraitFactory.setMutualExclusive("FastHealer", "SlowHealer");
	TraitFactory.setMutualExclusive("FastLearner", "SlowLearner");
	TraitFactory.setMutualExclusive("FastReader", "SlowReader");
    TraitFactory.setMutualExclusive("Illiterate", "SlowReader");
    TraitFactory.setMutualExclusive("Illiterate", "FastReader");
	TraitFactory.setMutualExclusive("NeedsLessSleep", "NeedsMoreSleep");
	TraitFactory.setMutualExclusive("ThickSkinned", "ThinSkinned");
	TraitFactory.setMutualExclusive("LowThirst", "HighThirst");
	TraitFactory.setMutualExclusive("Conspicuous", "Inconspicuous");
	TraitFactory.setMutualExclusive("Weak", "Strong");
	TraitFactory.setMutualExclusive("Weak", "Stout");
	TraitFactory.setMutualExclusive("Weak", "Feeble");
	TraitFactory.setMutualExclusive("Stout", "Feeble");
	TraitFactory.setMutualExclusive("Strong", "Feeble");
    TraitFactory.setMutualExclusive("Strong", "Stout");
    TraitFactory.setMutualExclusive("WeightGain", "WeightLoss");
    TraitFactory.setMutualExclusive("Overweight", "Obese");
    TraitFactory.setMutualExclusive("Overweight", "Underweight");
    TraitFactory.setMutualExclusive("Very Underweight", "Underweight");
    TraitFactory.setMutualExclusive("Very Underweight", "HeartyAppitite");
    TraitFactory.setMutualExclusive("Overweight", "Very Underweight");
    TraitFactory.setMutualExclusive("Overweight", "Emaciated");
    TraitFactory.setMutualExclusive("Obese", "Underweight");
    TraitFactory.setMutualExclusive("Obese", "Very Underweight");
    TraitFactory.setMutualExclusive("Obese", "Emaciated");
    TraitFactory.setMutualExclusive("Obese", "LightEater");
    TraitFactory.setMutualExclusive("Obese", "Fit");
    TraitFactory.setMutualExclusive("Athletic", "Overweight");
    TraitFactory.setMutualExclusive("Athletic", "Fit");
    TraitFactory.setMutualExclusive("Athletic", "Obese");
    TraitFactory.setMutualExclusive("Athletic", "Out of Shape");
    TraitFactory.setMutualExclusive("Athletic", "Unfit");
    TraitFactory.setMutualExclusive("Athletic", "Very Underweight");
    TraitFactory.setMutualExclusive("Fit", "Out of Shape");
    TraitFactory.setMutualExclusive("Fit", "Unfit");
    TraitFactory.setMutualExclusive("Fit", "Overweight");
    TraitFactory.setMutualExclusive("Unfit", "Out of Shape");
    TraitFactory.setMutualExclusive("Organized", "Disorganized");
    TraitFactory.setMutualExclusive("Resilient", "ProneToIllness");
    TraitFactory.setMutualExclusive("HardOfHearing", "KeenHearing");
    TraitFactory.setMutualExclusive("HeartyAppitite", "LightEater");
    TraitFactory.setMutualExclusive("Clumsy", "Graceful");
    TraitFactory.setMutualExclusive("Brave", "Cowardly");
    TraitFactory.setMutualExclusive("ShortSighted", "EagleEyed");
    TraitFactory.setMutualExclusive("Lucky", "Unlucky");
    TraitFactory.setMutualExclusive("Deaf", "HardOfHearing");
    TraitFactory.setMutualExclusive("Deaf", "KeenHearing");
    TraitFactory.setMutualExclusive("Desensitized", "Hemophobic");
    TraitFactory.setMutualExclusive("Desensitized", "Cowardly");
    TraitFactory.setMutualExclusive("Desensitized", "Brave");
    TraitFactory.setMutualExclusive("Desensitized", "Agoraphobic");
	TraitFactory.setMutualExclusive("Claustophobic", "Agoraphobic");
    TraitFactory.setMutualExclusive("Desensitized", "Claustophobic");
    TraitFactory.setMutualExclusive("Desensitized", "AdrenalineJunkie");
    TraitFactory.setMutualExclusive("IronGut", "WeakStomach");
    TraitFactory.setMutualExclusive("Herbalist", "WildernessKnowledge");

    -- DYNAMIC TRAITS EXCLUSIONS
    -- TRAITS THAT CAN'T BE PICKED WITH "Obese" TRAIT.
    TraitFactory.setMutualExclusive("Obese", "Inconspicuous");
    TraitFactory.setMutualExclusive("Obese", "Graceful");

    -- TRAITS THAT CAN'T BE PICKED WITH "Very Underweight" TRAIT.
    TraitFactory.setMutualExclusive("Very Underweight", "Strong");
    TraitFactory.setMutualExclusive("Very Underweight", "Stout");
    TraitFactory.setMutualExclusive("Very Underweight", "Fit");

    -- TRAITS THAT CAN'T BE PICKED WITH "Underweight" TRAIT.
    TraitFactory.setMutualExclusive("Underweight", "Strong");
    TraitFactory.setMutualExclusive("Underweight", "Athletic");

    -- TRAITS THAT CAN'T BE PICKED WITH "Brave" TRAIT.
    TraitFactory.setMutualExclusive("Brave", "Agoraphobic");
    TraitFactory.setMutualExclusive("Brave", "Claustophobic");
    TraitFactory.setMutualExclusive("Brave", "Hemophobic");

    -- "Pluviophile" && "Pluviophobia" EXCLUSION.
    TraitFactory.setMutualExclusive("Pluviophile", "Pluviophobia");

    -- TRAITS THAT CAN'T BE PICKED WITH "Anorexy" TRAIT.
    TraitFactory.setMutualExclusive("Anorexy", "Overweight");
    TraitFactory.setMutualExclusive("Anorexy", "Obese");
    TraitFactory.setMutualExclusive("Anorexy", "Strong");
    TraitFactory.setMutualExclusive("Anorexy", "Athletic");

    -- TRAITS THAT CAN'T BE PICKED WITH "Sedentary" TRAIT.
    TraitFactory.setMutualExclusive("Sedentary", "PhysicallyActive");
    TraitFactory.setMutualExclusive("Sedentary", "PhysicallyActive2");
    TraitFactory.setMutualExclusive("Sedentary", "Strong");
    TraitFactory.setMutualExclusive("Sedentary", "Athletic");
    TraitFactory.setMutualExclusive("Sedentary", "Fit");

    -- TRAITS THAT CAN'T BE PICKED WITH "PhysicallyActive" TRAIT.
    TraitFactory.setMutualExclusive("PhysicallyActive", "PhysicallyActive2");
    
    --TraitFactory.setMutualExclusive("PhysicallyActive", "Underweight");
    --TraitFactory.setMutualExclusive("PhysicallyActive", "Very Underweight");
    TraitFactory.setMutualExclusive("PhysicallyActive", "Overweight");
    TraitFactory.setMutualExclusive("PhysicallyActive", "Obese");
    --TraitFactory.setMutualExclusive("PhysicallyActive", "Feeble");
    --TraitFactory.setMutualExclusive("PhysicallyActive", "Weak");
    --TraitFactory.setMutualExclusive("PhysicallyActive", "Out of Shape");
    --TraitFactory.setMutualExclusive("PhysicallyActive", "Unfit");
    
    --TraitFactory.setMutualExclusive("PhysicallyActive2", "Underweight");
    --TraitFactory.setMutualExclusive("PhysicallyActive2", "Very Underweight");
    TraitFactory.setMutualExclusive("PhysicallyActive2", "Overweight");
    TraitFactory.setMutualExclusive("PhysicallyActive2", "Obese");
    --TraitFactory.setMutualExclusive("PhysicallyActive2", "Feeble");
    --TraitFactory.setMutualExclusive("PhysicallyActive2", "Weak");
    --TraitFactory.setMutualExclusive("PhysicallyActive2", "Out of Shape");
    --TraitFactory.setMutualExclusive("PhysicallyActive2", "Unfit");
    
    -- "Desensitized" && "Pacifist" EXCLUSION.
    TraitFactory.setMutualExclusive("Desensitized", "Pacifist");

    -- "Handy" && "Handy2" EXCLUSION.
    TraitFactory.setMutualExclusive("Handy", "Handy2");

    -- "Amateur Electrician" && "Amateur Electrician2" EXCLUSION.
    TraitFactory.setMutualExclusive("AmateurElectrician", "AmateurElectrician2");

    -- "Herbalist" && "Herbalist2" EXCLUSION.
    TraitFactory.setMutualExclusive("Herbalist", "Herbalist2");

    -- "Pluviophobia" && "Outdoorsman" EXCLUSION.
    TraitFactory.setMutualExclusive("Outdoorsman", "Pluviophobia");

    -- Dextrous2 EXCLUSIONS.
    TraitFactory.setMutualExclusive("Dextrous2", "Dextrous");
    TraitFactory.setMutualExclusive("Dextrous2", "AllThumbs");

    -- MORE SIMPLE TRAITS EXCLUSIONS
    -- Sneaky	
	TraitFactory.setMutualExclusive("Sneaky", "Conspicuous");
	-- Lightfooted
	TraitFactory.setMutualExclusive("Lightfooted", "Clumsy");

    local traitList = TraitFactory.getTraits()
    for i = 1, traitList:size() do
        local trait = traitList:get(i - 1)
        BaseGameCharacterDetails.SetTraitDescription(trait)
    end
end

---------------------------------
----- PROFESSIONS REBALANCE -----
---------------------------------
DTEMBaseGameCharacterDetails.DoProfessions = function()
    print("DT Logger: DTEMBaseGameCharacterDetails.DoProfessions function");

    if not ProfessionFactory or not ProfessionFactory.addProfession then
        print("DT Logger: ProfessionFactory is not available, skipping DoProfessions.")
        return
    end

    -- SNAKE ALICE BACKPACK COMPATIBILITY
    if getActivatedMods():contains("AliceSPack") then
        print("DT Logger: AliceSPack detected, running DoTrait function");
        ABSBaseGameCharacterDetails.DoTraits();
    end
    -- SNAKE AMMO MAKER COMPATIBILITY
    if getActivatedMods():contains("AmmoMaker") then
        print("DT Logger: AmmoMaker detected, running DoTrait function");
        AMBaseGameCharacterDetails.DoTraits();
    end
    -- SNAKE LE GOURMET REVOLUTION COMPATIBILITY
    if getActivatedMods():contains("LeGourmetRevolution") then
        print("DT Logger: LeGourmetRevolution detected, running DoTrait function");
        LGBaseGameCharacterDetails.DoTraits();
    end
    -- SNAKE TABLE SAW COMPATIBILITY
    if getActivatedMods():contains("TableSaw") then
        print("DT Logger: TableSaw detected, running DoTrait function");
        TSBaseGameCharacterDetails.DoTraits();
    end
    -- SNAKE TALLER MECANICO COMPATIBILITY
    if getActivatedMods():contains("TallerMecanico") then
        print("DT Logger: TallerMecanico detected, running DoTrait function");
        PMRMBaseGameCharacterDetails.DoTraits();
    end
    -- SNAKE TABLE SAW COMPATIBILITY
    if getActivatedMods():contains("WPA") then
        print("DT Logger: WPA detected, running DoTrait function");
        WPABaseGameCharacterDetails.DoTraits();
    end
    
    -- PROFFESIONS REBALANCE AND REWORK

    -- FIRE OFFICER PROFESSION REBALANCE
    local fireofficer = ProfessionFactory.addProfession("fireofficer", getText("UI_prof_fireoff"), "profession_fireofficer2", -9);
    fireofficer:addFreeTrait("Axeman");
	fireofficer:addXPBoost(Perks.Sprinting, 1);
    fireofficer:addXPBoost(Perks.Strength, 1);
    fireofficer:addXPBoost(Perks.Fitness, 1);
	fireofficer:addXPBoost(Perks.Axe, 1);

    -- POLICE OFFICER PROFESSION REBALANCE
    local policeofficer = ProfessionFactory.addProfession("policeofficer", getText("UI_prof_policeoff"), "profession_policeofficer2", -6);
    policeofficer:addFreeTrait("NightOwl");
	policeofficer:addXPBoost(Perks.Aiming, 3);
	policeofficer:addXPBoost(Perks.Reloading, 2);
	policeofficer:addXPBoost(Perks.Nimble, 1);

    -- PARK RANGER PROFESSION REBALANCE
    if getActivatedMods():contains("LeGourmetRevolution") then
        local parkranger = ProfessionFactory.addProfession("parkranger", getText("UI_prof_parkranger"), "profession_parkranger2", -9);
        parkranger:addFreeTrait("Herbalist2");
	    parkranger:addXPBoost(Perks.Trapping, 2);
	    parkranger:addXPBoost(Perks.PlantScavenging, 2);
	    parkranger:addXPBoost(Perks.Woodwork, 1);
        parkranger:addXPBoost(Perks.Axe, 1);
        parkranger:addXPBoost(Perks.LongBlade, 1);
        parkranger:getFreeRecipes():add("MakeStickTrap");
        parkranger:getFreeRecipes():add("MakeSnareTrap");
        parkranger:getFreeRecipes():add("MakeWoodenBoxTrap");
        parkranger:getFreeRecipes():add("MakeTrapBox");
        parkranger:getFreeRecipes():add("MakeCageTrap");
    else
        local parkranger = ProfessionFactory.addProfession("parkranger", getText("UI_prof_parkranger"), "profession_parkranger2", -7);
        parkranger:addFreeTrait("Herbalist2");
	    parkranger:addXPBoost(Perks.Trapping, 2);
	    parkranger:addXPBoost(Perks.PlantScavenging, 2);
	    parkranger:addXPBoost(Perks.Woodwork, 1);
        parkranger:addXPBoost(Perks.Axe, 1);
        parkranger:addXPBoost(Perks.LongBlade, 1);
        parkranger:getFreeRecipes():add("MakeStickTrap");
        parkranger:getFreeRecipes():add("MakeSnareTrap");
        parkranger:getFreeRecipes():add("MakeWoodenBoxTrap");
        parkranger:getFreeRecipes():add("MakeTrapBox");
        parkranger:getFreeRecipes():add("MakeCageTrap");
    end

    -- CONSTRUCTION WORKER PROFESSION REBALANCE
    local constructionworker = ProfessionFactory.addProfession("constructionworker", getText("UI_prof_constructionworker"), "profession_constructionworker2", -4)
	constructionworker:addXPBoost(Perks.SmallBlunt, 1)
    constructionworker:addXPBoost(Perks.Maintenance, 1)
	constructionworker:addXPBoost(Perks.Woodwork, 3)
    constructionworker:addXPBoost(Perks.Masonry, 3)

    -- SECURITY GUARD PROFESSION REBALANCE
    local securityguard = ProfessionFactory.addProfession("securityguard", getText("UI_prof_securityguard"), "profession_securityguard2", -2);
	securityguard:addXPBoost(Perks.Sprinting, 2);
	securityguard:addXPBoost(Perks.Aiming, 1);
    securityguard:addXPBoost(Perks.SmallBlunt, 1);
	securityguard:addFreeTrait("NightOwl");

    -- CARPENTER PROFESSION REBALANCE
    if getActivatedMods():contains("TableSaw") then
        local carpenter = ProfessionFactory.addProfession("carpenter", getText("UI_prof_Carpenter"), "profession_hammer2", -4)
	    carpenter:addXPBoost(Perks.Woodwork, 3)
        carpenter:addXPBoost(Perks.Carving, 1)
	    carpenter:addXPBoost(Perks.SmallBlunt, 1)
        carpenter:addXPBoost(Perks.Maintenance, 1)
        carpenter:addFreeTrait("Handy2")
    else
        local carpenter = ProfessionFactory.addProfession("carpenter", getText("UI_prof_Carpenter"), "profession_hammer2", -2)
	    carpenter:addXPBoost(Perks.Woodwork, 3)
        carpenter:addXPBoost(Perks.Carving, 1)
	    carpenter:addXPBoost(Perks.SmallBlunt, 1)
        carpenter:addXPBoost(Perks.Maintenance, 1)
        carpenter:addFreeTrait("Handy2")
    end

    -- BURGLAR PROFESSION REBALANCE
    if getActivatedMods():contains("WPA") then
        local burglar = ProfessionFactory.addProfession("burglar", getText("UI_prof_Burglar"), "profession_burglar2", -11);
	    burglar:addXPBoost(Perks.Nimble, 2);
	    burglar:addXPBoost(Perks.Sneak, 2);
	    burglar:addXPBoost(Perks.Lightfoot, 2);
	    burglar:addFreeTrait("Burglar");
        burglar:getFreeRecipes():add("MakeForearmMagazineArmor");
        burglar:getFreeRecipes():add("MakeThighMagazineArmor");
        burglar:getFreeRecipes():add("MakeShinMagazineArmor");
        burglar:getFreeRecipes():add("MakeBodyMagazineArmor");
        burglar:getFreeRecipes():add("MakeGlassShiv");
        burglar:getFreeRecipes():add("MakeShiv");
        burglar:getFreeRecipes():add("MakeToothbrushShiv");
        burglar:getFreeRecipes():add("CopyBuildingKey");
        burglar:getFreeRecipes():add("MakeHollowBook");
        burglar:getFreeRecipes():add("MakeForearmBulletproofVestArmor");
        burglar:getFreeRecipes():add("MakeShinBulletproofVestArmor");
        burglar:getFreeRecipes():add("MakeThighBulletproofVestArmor");
        burglar:getFreeRecipes():add("Hemp Growing Season");
    else
        local burglar = ProfessionFactory.addProfession("burglar", getText("UI_prof_Burglar"), "profession_burglar2", -9);
	    burglar:addXPBoost(Perks.Nimble, 2);
	    burglar:addXPBoost(Perks.Sneak, 2);
	    burglar:addXPBoost(Perks.Lightfoot, 2);
	    burglar:addFreeTrait("Burglar");
        burglar:getFreeRecipes():add("MakeForearmMagazineArmor");
        burglar:getFreeRecipes():add("MakeThighMagazineArmor");
        burglar:getFreeRecipes():add("MakeShinMagazineArmor");
        burglar:getFreeRecipes():add("MakeBodyMagazineArmor");
        burglar:getFreeRecipes():add("MakeGlassShiv");
        burglar:getFreeRecipes():add("MakeShiv");
        burglar:getFreeRecipes():add("MakeToothbrushShiv");
        burglar:getFreeRecipes():add("CopyBuildingKey");
        burglar:getFreeRecipes():add("MakeHollowBook");
        burglar:getFreeRecipes():add("MakeForearmBulletproofVestArmor");
        burglar:getFreeRecipes():add("MakeShinBulletproofVestArmor");
        burglar:getFreeRecipes():add("MakeThighBulletproofVestArmor");
        burglar:getFreeRecipes():add("Hemp Growing Season");
    end

    -- CHEF PROFESSION REBALANCE
    if getActivatedMods():contains("LeGourmetRevolution") then
        local chef = ProfessionFactory.addProfession("chef", getText("UI_prof_Chef"), "profession_chef2", -7);
	    chef:addXPBoost(Perks.Cooking, 4);
	    chef:addXPBoost(Perks.Maintenance, 1);
	    chef:addXPBoost(Perks.SmallBlade, 1);
        chef:addFreeTrait("Dextrous2");
        chef:addFreeTrait("Nutritionist2");
        chef:getFreeRecipes():add("MakeCakeBatter");
        chef:getFreeRecipes():add("MakePieDough");
        chef:getFreeRecipes():add("MakeBreadDough");
        chef:getFreeRecipes():add("MakeBaguetteDough");
        chef:getFreeRecipes():add("MakeBiscuits");
        chef:getFreeRecipes():add("MakeChocolateCookieDough");
        chef:getFreeRecipes():add("MakeChocolateChipCookieDough");
        chef:getFreeRecipes():add("MakeOatmealCookieDough");
        chef:getFreeRecipes():add("MakeShortbreadCookieDough");
        chef:getFreeRecipes():add("MakeSugarCookieDough");
        chef:getFreeRecipes():add("MakePizza");
        chef:getFreeRecipes():add("MakeFriedOnionRings");
        chef:getFreeRecipes():add("MakeFriedShrimp");
        chef:getFreeRecipes():add("MakeSushi");
        chef:getFreeRecipes():add("MakeOnigiri");
        chef:getFreeRecipes():add("MakeMaki");
        chef:getFreeRecipes():add("MakeCabbageRolls");
	    chef:getFreeRecipes():add("PrepareMuffins");

        chef:getFreeRecipes():add("MakeJarofTomatoes");
        chef:getFreeRecipes():add("MakeJarofCarrots");
        chef:getFreeRecipes():add("MakeJarofPotatoes");
        chef:getFreeRecipes():add("MakeJarofEggplant");
        chef:getFreeRecipes():add("MakeJarofLeeks");
        chef:getFreeRecipes():add("MakeJarofRedRadishes");
        chef:getFreeRecipes():add("MakeJarofBellPeppers");
        chef:getFreeRecipes():add("MakeJarofCabbage");
        chef:getFreeRecipes():add("MakeJarofBroccoli");
    else
        local chef = ProfessionFactory.addProfession("chef", getText("UI_prof_Chef"), "profession_chef2", -3);
	    chef:addXPBoost(Perks.Cooking, 4);
	    chef:addXPBoost(Perks.Maintenance, 1);
	    chef:addXPBoost(Perks.SmallBlade, 1);
        chef:addFreeTrait("Dextrous2");
        chef:addFreeTrait("Nutritionist2");
        chef:getFreeRecipes():add("MakeCakeBatter");
        chef:getFreeRecipes():add("MakePieDough");
        chef:getFreeRecipes():add("MakeBreadDough");
        chef:getFreeRecipes():add("MakeBaguetteDough");
        chef:getFreeRecipes():add("MakeBiscuits");
        chef:getFreeRecipes():add("MakeChocolateCookieDough");
        chef:getFreeRecipes():add("MakeChocolateChipCookieDough");
        chef:getFreeRecipes():add("MakeOatmealCookieDough");
        chef:getFreeRecipes():add("MakeShortbreadCookieDough");
        chef:getFreeRecipes():add("MakeSugarCookieDough");
        chef:getFreeRecipes():add("MakePizza");
        chef:getFreeRecipes():add("MakeFriedOnionRings");
        chef:getFreeRecipes():add("MakeFriedShrimp");
        chef:getFreeRecipes():add("MakeSushi");
        chef:getFreeRecipes():add("MakeOnigiri");
        chef:getFreeRecipes():add("MakeMaki");
        chef:getFreeRecipes():add("MakeCabbageRolls");
	    chef:getFreeRecipes():add("PrepareMuffins");

        chef:getFreeRecipes():add("MakeJarofTomatoes");
        chef:getFreeRecipes():add("MakeJarofCarrots");
        chef:getFreeRecipes():add("MakeJarofPotatoes");
        chef:getFreeRecipes():add("MakeJarofEggplant");
        chef:getFreeRecipes():add("MakeJarofLeeks");
        chef:getFreeRecipes():add("MakeJarofRedRadishes");
        chef:getFreeRecipes():add("MakeJarofBellPeppers");
        chef:getFreeRecipes():add("MakeJarofCabbage");
        chef:getFreeRecipes():add("MakeJarofBroccoli");
    end

    -- REPAIRMAN PROFESSION REBALANCE
    if getActivatedMods():contains("AmmoMaker") then
        local repairman = ProfessionFactory.addProfession("repairman", getText("UI_prof_Repairman"), "profession_repairman2", -5)
	    repairman:addXPBoost(Perks.Woodwork, 1)
	    repairman:addXPBoost(Perks.Maintenance, 3)
	    repairman:addXPBoost(Perks.SmallBlunt, 1)
        repairman:addFreeTrait("Inventive")
    else
        local repairman = ProfessionFactory.addProfession("repairman", getText("UI_prof_Repairman"), "profession_repairman2", -3);
	    repairman:addXPBoost(Perks.Woodwork, 1)
	    repairman:addXPBoost(Perks.Maintenance, 3)
	    repairman:addXPBoost(Perks.SmallBlunt, 1)
        repairman:addFreeTrait("Inventive")
    end

    local rancher = ProfessionFactory.addProfession("rancher", getText("UI_prof_rancher"), "profession_rancher", 0);
    rancher:addXPBoost(Perks.Farming, 1)
    rancher:addXPBoost(Perks.Husbandry, 3)
    rancher:addXPBoost(Perks.Butchering, 3)

    -- FARMER PROFESSION REBALANCE
    if getActivatedMods():contains("LeGourmetRevolution") then
        local farmer = ProfessionFactory.addProfession("farmer", getText("UI_prof_Farmer"), "profession_farmer2", -1);
	    farmer:addXPBoost(Perks.Farming, 4);
        farmer:addXPBoost(Perks.Strength, 1);
        farmer:getFreeRecipes():add("MakeMildewCure");
        farmer:getFreeRecipes():add("MakeFliesCureFromCigarettes");
        farmer:getFreeRecipes():add("MakeFliesCureFromLooseTobacco");
        farmer:getFreeRecipes():add("MakeFliesCureFromChewingTobacco");
        farmer:getFreeRecipes():add("MakeAphidsCure");
        --farmer:getFreeRecipes():add("MakeSlugTrap");
        farmer:getFreeRecipes():add("MakeScarecrow");
        farmer:getFreeRecipes():add("MakeBarbedWire");

        farmer:getFreeRecipes():add("Carrot Growing Season");
        farmer:getFreeRecipes():add("Broccoli Growing Season");
        farmer:getFreeRecipes():add("Radish Growing Season");
        farmer:getFreeRecipes():add("Strawberry Growing Season");
        farmer:getFreeRecipes():add("Tomato Growing Season");
        farmer:getFreeRecipes():add("Potato Growing Season");
        farmer:getFreeRecipes():add("Cabbage Growing Season");

        farmer:getFreeRecipes():add("Corn Growing Season");
        farmer:getFreeRecipes():add("Kale Growing Season");
        farmer:getFreeRecipes():add("Sweet Potato Growing Season");
        farmer:getFreeRecipes():add("Green Pea Growing Season");
        farmer:getFreeRecipes():add("Onion Growing Season");
        farmer:getFreeRecipes():add("Garlic Growing Season");
        farmer:getFreeRecipes():add("Soybean Growing Season");
        farmer:getFreeRecipes():add("Wheat Growing Season");

        farmer:getFreeRecipes():add("Basil Growing Season");
        farmer:getFreeRecipes():add("Chives Growing Season");
        farmer:getFreeRecipes():add("Cilantro Growing Season");
        farmer:getFreeRecipes():add("Oregano Growing Season");
        farmer:getFreeRecipes():add("Parsley Growing Season");
        farmer:getFreeRecipes():add("Sage Growing Season");
        farmer:getFreeRecipes():add("Rosemary Growing Season");
        farmer:getFreeRecipes():add("Thyme Growing Season");

        farmer:getFreeRecipes():add("Barley Growing Season");
        farmer:getFreeRecipes():add("Flax Growing Season");
--     farmer:getFreeRecipes():add("Hemp Growing Season"); -- it's illegal in Kentucky in 1993 so Nope! Leaving the commented out code to flag this.
        farmer:getFreeRecipes():add("Hops Growing Season");
        farmer:getFreeRecipes():add("Rye Growing Season");
        farmer:getFreeRecipes():add("Sugar Beet Growing Season");
        farmer:getFreeRecipes():add("Tobacco Growing Season");

        farmer:getFreeRecipes():add("Bell Pepper Growing Season");
        farmer:getFreeRecipes():add("Cauliflower Growing Season");
        farmer:getFreeRecipes():add("Cucumber Growing Season");
        farmer:getFreeRecipes():add("Habanero Growing Season");
        farmer:getFreeRecipes():add("Jalapeno Growing Season");
        farmer:getFreeRecipes():add("Leek Growing Season");
        farmer:getFreeRecipes():add("Lettuce Growing Season");
        farmer:getFreeRecipes():add("Pumpkin Growing Season");
        farmer:getFreeRecipes():add("Spinach Growing Season");
        farmer:getFreeRecipes():add("Sunflower Growing Season");
        farmer:getFreeRecipes():add("Turnip Growing Season");
        farmer:getFreeRecipes():add("Watermelon Growing Season");
        farmer:getFreeRecipes():add("Zucchini Growing Season");

        farmer:getFreeRecipes():add("Chamomile Growing Season");
        farmer:getFreeRecipes():add("Lemongrass Growing Season");
        farmer:getFreeRecipes():add("Marigold Growing Season");
        farmer:getFreeRecipes():add("Mint Growing Season");

        farmer:getFreeRecipes():add("MakeJarofTomatoes");
        farmer:getFreeRecipes():add("MakeJarofCarrots");
        farmer:getFreeRecipes():add("MakeJarofPotatoes");
        farmer:getFreeRecipes():add("MakeJarofEggplant");
        farmer:getFreeRecipes():add("MakeJarofLeeks");
        farmer:getFreeRecipes():add("MakeJarofRedRadishes");
        farmer:getFreeRecipes():add("MakeJarofBellPeppers");
        farmer:getFreeRecipes():add("MakeJarofCabbage");
        farmer:getFreeRecipes():add("MakeJarofBroccoli");
    else
        local farmer = ProfessionFactory.addProfession("farmer", getText("UI_prof_Farmer"), "profession_farmer2", 5);
	    farmer:addXPBoost(Perks.Farming, 4);
        farmer:addXPBoost(Perks.Strength, 1);
        farmer:getFreeRecipes():add("MakeMildewCure");
        farmer:getFreeRecipes():add("MakeFliesCureFromCigarettes");
        farmer:getFreeRecipes():add("MakeFliesCureFromLooseTobacco");
        farmer:getFreeRecipes():add("MakeFliesCureFromChewingTobacco");
        farmer:getFreeRecipes():add("MakeAphidsCure");
        farmer:getFreeRecipes():add("MakeSlugTrap");
        farmer:getFreeRecipes():add("MakeScarecrow");
        farmer:getFreeRecipes():add("MakeBarbedWire");

        farmer:getFreeRecipes():add("Carrot Growing Season");
        farmer:getFreeRecipes():add("Broccoli Growing Season");
        farmer:getFreeRecipes():add("Radish Growing Season");
        farmer:getFreeRecipes():add("Strawberry Growing Season");
        farmer:getFreeRecipes():add("Tomato Growing Season");
        farmer:getFreeRecipes():add("Potato Growing Season");
        farmer:getFreeRecipes():add("Cabbage Growing Season");

        farmer:getFreeRecipes():add("Corn Growing Season");
        farmer:getFreeRecipes():add("Kale Growing Season");
        farmer:getFreeRecipes():add("Sweet Potato Growing Season");
        farmer:getFreeRecipes():add("Green Pea Growing Season");
        farmer:getFreeRecipes():add("Onion Growing Season");
        farmer:getFreeRecipes():add("Garlic Growing Season");
        farmer:getFreeRecipes():add("Soybean Growing Season");
        farmer:getFreeRecipes():add("Wheat Growing Season");

        farmer:getFreeRecipes():add("Basil Growing Season");
        farmer:getFreeRecipes():add("Chives Growing Season");
        farmer:getFreeRecipes():add("Cilantro Growing Season");
        farmer:getFreeRecipes():add("Oregano Growing Season");
        farmer:getFreeRecipes():add("Parsley Growing Season");
        farmer:getFreeRecipes():add("Sage Growing Season");
        farmer:getFreeRecipes():add("Rosemary Growing Season");
        farmer:getFreeRecipes():add("Thyme Growing Season");

        farmer:getFreeRecipes():add("Barley Growing Season");
        farmer:getFreeRecipes():add("Flax Growing Season");
--     farmer:getFreeRecipes():add("Hemp Growing Season"); -- it's illegal in Kentucky in 1993 so Nope! Leaving the commented out code to flag this.
        farmer:getFreeRecipes():add("Hops Growing Season");
        farmer:getFreeRecipes():add("Rye Growing Season");
        farmer:getFreeRecipes():add("Sugar Beet Growing Season");
        farmer:getFreeRecipes():add("Tobacco Growing Season");

        farmer:getFreeRecipes():add("Bell Pepper Growing Season");
        farmer:getFreeRecipes():add("Cauliflower Growing Season");
        farmer:getFreeRecipes():add("Cucumber Growing Season");
        farmer:getFreeRecipes():add("Habanero Growing Season");
        farmer:getFreeRecipes():add("Jalapeno Growing Season");
        farmer:getFreeRecipes():add("Leek Growing Season");
        farmer:getFreeRecipes():add("Lettuce Growing Season");
        farmer:getFreeRecipes():add("Pumpkin Growing Season");
        farmer:getFreeRecipes():add("Spinach Growing Season");
        farmer:getFreeRecipes():add("Sunflower Growing Season");
        farmer:getFreeRecipes():add("Turnip Growing Season");
        farmer:getFreeRecipes():add("Watermelon Growing Season");
        farmer:getFreeRecipes():add("Zucchini Growing Season");

        farmer:getFreeRecipes():add("Chamomile Growing Season");
        farmer:getFreeRecipes():add("Lemongrass Growing Season");
        farmer:getFreeRecipes():add("Marigold Growing Season");
        farmer:getFreeRecipes():add("Mint Growing Season");

        farmer:getFreeRecipes():add("MakeJarofTomatoes");
        farmer:getFreeRecipes():add("MakeJarofCarrots");
        farmer:getFreeRecipes():add("MakeJarofPotatoes");
        farmer:getFreeRecipes():add("MakeJarofEggplant");
        farmer:getFreeRecipes():add("MakeJarofLeeks");
        farmer:getFreeRecipes():add("MakeJarofRedRadishes");
        farmer:getFreeRecipes():add("MakeJarofBellPeppers");
        farmer:getFreeRecipes():add("MakeJarofCabbage");
        farmer:getFreeRecipes():add("MakeJarofBroccoli");
    end

    -- FISHERMAN PROFESSION REBALANCE
    if getActivatedMods():contains("LeGourmetRevolution") then
        local fisherman = ProfessionFactory.addProfession("fisherman", getText("UI_prof_Fisherman"), "profession_fisher2", 1);
	    fisherman:addXPBoost(Perks.Fishing, 3);
	    fisherman:addXPBoost(Perks.PlantScavenging, 1);
        fisherman:getFreeRecipes():add("MakeFishingRod");
        fisherman:getFreeRecipes():add("FixFishingRod");
        fisherman:getFreeRecipes():add("GetWireBack");
        fisherman:getFreeRecipes():add("MakeFishingNet");
        fisherman:getFreeRecipes():add("MakeChum");
    else
        local fisherman = ProfessionFactory.addProfession("fisherman", getText("UI_prof_Fisherman"), "profession_fisher2", 3);
	    fisherman:addXPBoost(Perks.Fishing, 3);
	    fisherman:addXPBoost(Perks.PlantScavenging, 1);
        fisherman:getFreeRecipes():add("MakeFishingRod");
        fisherman:getFreeRecipes():add("FixFishingRod");
        fisherman:getFreeRecipes():add("GetWireBack");
        fisherman:getFreeRecipes():add("MakeFishingNet");
        fisherman:getFreeRecipes():add("MakeChum");
    end

    -- DOCTOR PROFESSION REBALANCE
    local doctor = ProfessionFactory.addProfession("doctor", getText("UI_prof_Doctor"), "profession_doctor2", 0);
	doctor:addXPBoost(Perks.Doctor, 5);
	doctor:addXPBoost(Perks.SmallBlade, 2);
    doctor:addFreeTrait("NightOwl");

    -- VETERAN PROFESSION REBALANCE
    if getActivatedMods():contains("AliceSPack") and getActivatedMods():contains("AmmoMaker") then
        local veteran = ProfessionFactory.addProfession("veteran", getText("UI_prof_Veteran"), "profession_veteran2", -12);
	    veteran:addFreeTrait("Desensitized");
	    veteran:addXPBoost(Perks.Aiming, 3);
	    veteran:addXPBoost(Perks.Reloading, 2);
    elseif getActivatedMods():contains("AliceSPack") or getActivatedMods():contains("AmmoMaker") then
        local veteran = ProfessionFactory.addProfession("veteran", getText("UI_prof_Veteran"), "profession_veteran2", -10);
	    veteran:addFreeTrait("Desensitized");
	    veteran:addXPBoost(Perks.Aiming, 3);
	    veteran:addXPBoost(Perks.Reloading, 2);
    else
        local veteran = ProfessionFactory.addProfession("veteran", getText("UI_prof_Veteran"), "profession_veteran2", -8);
	    veteran:addFreeTrait("Desensitized");
	    veteran:addXPBoost(Perks.Aiming, 3);
	    veteran:addXPBoost(Perks.Reloading, 2);
    end

    -- NURSE PROFESSION REBALANCE
    local nurse = ProfessionFactory.addProfession("nurse", getText("UI_prof_Nurse"), "profession_nurse", 0);
    nurse:addXPBoost(Perks.Doctor, 3);
    nurse:addXPBoost(Perks.Lightfoot, 1);
    nurse:addXPBoost(Perks.Sneak, 1);
    nurse:addFreeTrait("NightOwl");

    -- LUMBERBACK PROFESSION REBALANCE
    if getActivatedMods():contains("AliceSPack") then
        local lumberjack = ProfessionFactory.addProfession("lumberjack", getText("UI_prof_Lumberjack"), "profession_lumberjack", -10)
        lumberjack:addXPBoost(Perks.Axe, 2)
        lumberjack:addXPBoost(Perks.Maintenance, 1)
        lumberjack:addXPBoost(Perks.Strength, 1)
        lumberjack:addFreeTrait("Axeman")
    else
        local lumberjack = ProfessionFactory.addProfession("lumberjack", getText("UI_prof_Lumberjack"), "profession_lumberjack", -8)
        lumberjack:addXPBoost(Perks.Axe, 2)
        lumberjack:addXPBoost(Perks.Maintenance, 1)
        lumberjack:addXPBoost(Perks.Strength, 1)
        lumberjack:addFreeTrait("Axeman")
    end

    -- FITNESS INSTRUCTOR PROFESSION REBALANCE
    if getActivatedMods():contains("AliceSPack") then
        local fitnessInstructor = ProfessionFactory.addProfession("fitnessInstructor", getText("UI_prof_FitnessInstructor"), "profession_fitnessinstructor", -12);
        fitnessInstructor:addXPBoost(Perks.Fitness, 3);
        fitnessInstructor:addXPBoost(Perks.Sprinting, 2);
        fitnessInstructor:addFreeTrait("Nutritionist2");
        fitnessInstructor:addFreeTrait("PhysicallyActive2");
    else
        local fitnessInstructor = ProfessionFactory.addProfession("fitnessInstructor", getText("UI_prof_FitnessInstructor"), "profession_fitnessinstructor", -10);
        fitnessInstructor:addXPBoost(Perks.Fitness, 3);
        fitnessInstructor:addXPBoost(Perks.Sprinting, 2);
        fitnessInstructor:addFreeTrait("Nutritionist2");
        fitnessInstructor:addFreeTrait("PhysicallyActive2");
    end

    -- BURGER FLIPPER PROFESSION REBALANCE
    if getActivatedMods():contains("LeGourmetRevolution") then
        local burger = ProfessionFactory.addProfession("burgerflipper", getText("UI_prof_BurgerFlipper"), "profession_burgerflipper", -2);
        burger:addXPBoost(Perks.Cooking, 2);
        burger:addXPBoost(Perks.Maintenance, 1);
	    burger:addXPBoost(Perks.SmallBlade, 1);
        burger:addFreeTrait("Dextrous2");
        burger:getFreeRecipes():add("MakeCakeBatter");
        burger:getFreeRecipes():add("MakePieDough");
        burger:getFreeRecipes():add("MakeBreadDough");
        burger:getFreeRecipes():add("MakeBaguetteDough");
        burger:getFreeRecipes():add("MakeBiscuits");
        burger:getFreeRecipes():add("MakeChocolateCookieDough");
        burger:getFreeRecipes():add("MakeChocolateChipCookieDough");
        burger:getFreeRecipes():add("MakeOatmealCookieDough");
        burger:getFreeRecipes():add("MakeShortbreadCookieDough");
        burger:getFreeRecipes():add("MakeSugarCookieDough");
    else    
        local burger = ProfessionFactory.addProfession("burgerflipper", getText("UI_prof_BurgerFlipper"), "profession_burgerflipper", 0);
        burger:addXPBoost(Perks.Cooking, 2);
        burger:addXPBoost(Perks.Maintenance, 1);
	    burger:addXPBoost(Perks.SmallBlade, 1);
        burger:addFreeTrait("Dextrous2");
        burger:getFreeRecipes():add("MakeCakeBatter");
        burger:getFreeRecipes():add("MakePieDough");
        burger:getFreeRecipes():add("MakeBreadDough");
        burger:getFreeRecipes():add("MakeBaguetteDough");
        burger:getFreeRecipes():add("MakeBiscuits");
        burger:getFreeRecipes():add("MakeChocolateCookieDough");
        burger:getFreeRecipes():add("MakeChocolateChipCookieDough");
        burger:getFreeRecipes():add("MakeOatmealCookieDough");
        burger:getFreeRecipes():add("MakeShortbreadCookieDough");
        burger:getFreeRecipes():add("MakeSugarCookieDough");
    end

    -- ELECTRICIAN PROFESSION REBALANCE
    local electrician = ProfessionFactory.addProfession("electrician", getText("UI_prof_Electrician"), "profession_electrician", 2);
    electrician:addXPBoost(Perks.Electricity, 4);
    electrician:addFreeTrait("AmateurElectrician2");
    electrician:getFreeRecipes():add("Generator");
    electrician:getFreeRecipes():add("MakeRemoteControllerV1");
    electrician:getFreeRecipes():add("MakeRemoteControllerV2");
    electrician:getFreeRecipes():add("MakeRemoteControllerV3");
    electrician:getFreeRecipes():add("MakeRemoteTrigger");
    electrician:getFreeRecipes():add("MakeTimer");
    electrician:getFreeRecipes():add("CraftMakeshiftRadio");
    electrician:getFreeRecipes():add("CraftMakeshiftHAMRadio");
    electrician:getFreeRecipes():add("CraftMakeshiftWalkieTalkie");
    electrician:getFreeRecipes():add("MakeImprovisedFlashlight");
    electrician:getFreeRecipes():add("MakeImprovisedLantern");

    -- ENGINEER PROFESSION REBALANCE
    if getActivatedMods():contains("WPA") and getActivatedMods():contains("AmmoMaker") then
        local engineer = ProfessionFactory.addProfession("engineer", getText("UI_prof_Engineer"), "profession_engineer", -8);
        engineer:addXPBoost(Perks.Electricity, 1);
        engineer:addXPBoost(Perks.Woodwork, 1);
        engineer:addXPBoost(Perks.Mechanics, 1);
        engineer:addXPBoost(Perks.MetalWelding, 1);
        engineer:addFreeTrait("Burglar");
        engineer:addFreeTrait("AmateurElectrician2");
        engineer:getFreeRecipes():add("MakeAerosolBomb");
        engineer:getFreeRecipes():add("MakeFlameBomb");
        engineer:getFreeRecipes():add("MakePipeBomb");
        engineer:getFreeRecipes():add("MakeNoisegenerator");
        engineer:getFreeRecipes():add("MakeSmokeBomb");
        engineer:getFreeRecipes():add("MakeFirecracker");
        engineer:getFreeRecipes():add("MakeCraftedGasMaskFilter");
        engineer:getFreeRecipes():add("MakeImprovisedGasMask");
        engineer:getFreeRecipes():add("RechargeGasMaskFilter");
        engineer:getFreeRecipes():add("RechargeRespiratorFilters");
        engineer:getFreeRecipes():add("RechargeFilters");
        engineer:getFreeRecipes():add("MakeImprovisedFlashlight");
        engineer:getFreeRecipes():add("MakeImprovisedLantern");
        -- all things considered they should know how to
        engineer:getFreeRecipes():add("Generator");
    elseif getActivatedMods():contains("WPA") or getActivatedMods():contains("AmmoMaker") then
        local engineer = ProfessionFactory.addProfession("engineer", getText("UI_prof_Engineer"), "profession_engineer", -6);
        engineer:addXPBoost(Perks.Electricity, 1);
        engineer:addXPBoost(Perks.Woodwork, 1);
        engineer:addXPBoost(Perks.Mechanics, 1);
        engineer:addXPBoost(Perks.MetalWelding, 1);
        engineer:addFreeTrait("Burglar");
        engineer:addFreeTrait("AmateurElectrician2");
        engineer:getFreeRecipes():add("MakeAerosolBomb");
        engineer:getFreeRecipes():add("MakeFlameBomb");
        engineer:getFreeRecipes():add("MakePipeBomb");
        engineer:getFreeRecipes():add("MakeNoisegenerator");
        engineer:getFreeRecipes():add("MakeSmokeBomb");
        engineer:getFreeRecipes():add("MakeFirecracker");
        engineer:getFreeRecipes():add("MakeCraftedGasMaskFilter");
        engineer:getFreeRecipes():add("MakeImprovisedGasMask");
        engineer:getFreeRecipes():add("RechargeGasMaskFilter");
        engineer:getFreeRecipes():add("RechargeRespiratorFilters");
        engineer:getFreeRecipes():add("RechargeFilters");
        engineer:getFreeRecipes():add("MakeImprovisedFlashlight");
        engineer:getFreeRecipes():add("MakeImprovisedLantern");
        -- all things considered they should know how to
        engineer:getFreeRecipes():add("Generator");
    else
        local engineer = ProfessionFactory.addProfession("engineer", getText("UI_prof_Engineer"), "profession_engineer", -4);
        engineer:addXPBoost(Perks.Electricity, 1);
        engineer:addXPBoost(Perks.Woodwork, 1);
        engineer:addXPBoost(Perks.Mechanics, 1);
        engineer:addXPBoost(Perks.MetalWelding, 1);
        engineer:addFreeTrait("Burglar");
        engineer:addFreeTrait("AmateurElectrician2");
        engineer:getFreeRecipes():add("MakeAerosolBomb");
        engineer:getFreeRecipes():add("MakeFlameBomb");
        engineer:getFreeRecipes():add("MakePipeBomb");
        engineer:getFreeRecipes():add("MakeNoisegenerator");
        engineer:getFreeRecipes():add("MakeSmokeBomb");
        engineer:getFreeRecipes():add("MakeFirecracker");
        engineer:getFreeRecipes():add("MakeCraftedGasMaskFilter");
        engineer:getFreeRecipes():add("MakeImprovisedGasMask");
        engineer:getFreeRecipes():add("RechargeGasMaskFilter");
        engineer:getFreeRecipes():add("RechargeRespiratorFilters");
        engineer:getFreeRecipes():add("RechargeFilters");
        engineer:getFreeRecipes():add("MakeImprovisedFlashlight");
        engineer:getFreeRecipes():add("MakeImprovisedLantern");
        -- all things considered they should know how to
        engineer:getFreeRecipes():add("Generator");
    end

    -- METALWORKER PROFESSION REBALANCE
    if getActivatedMods():contains("AmmoMaker") then
        local metalworker = ProfessionFactory.addProfession("metalworker", getText("UI_prof_MetalWorker"), "profession_metalworker", 0);
        metalworker:addXPBoost(Perks.MetalWelding, 4);
        metalworker:getFreeRecipes():add("Make Metal Walls");
        metalworker:getFreeRecipes():add("Make Metal Fences");
        metalworker:getFreeRecipes():add("Make Metal Containers");
        metalworker:getFreeRecipes():add("Make Metal Sheet");
        metalworker:getFreeRecipes():add("Make Small Metal Sheet");
        metalworker:getFreeRecipes():add("Make Metal Roof");
        metalworker:getFreeRecipes():add("MakeScrapMetalHelmet");
        metalworker:getFreeRecipes():add("MakeScrapMetalShoulderArmor");
        metalworker:getFreeRecipes():add("MakeScrapMetalThighArmor");
        metalworker:getFreeRecipes():add("MakeScrapMetalBodyArmor");
        metalworker:getFreeRecipes():add("SpikeArmorWelding");
    else
        local metalworker = ProfessionFactory.addProfession("metalworker", getText("UI_prof_MetalWorker"), "profession_metalworker", 2);
        metalworker:addXPBoost(Perks.MetalWelding, 4);
        metalworker:getFreeRecipes():add("Make Metal Walls");
        metalworker:getFreeRecipes():add("Make Metal Fences");
        metalworker:getFreeRecipes():add("Make Metal Containers");
        metalworker:getFreeRecipes():add("Make Metal Sheet");
        metalworker:getFreeRecipes():add("Make Small Metal Sheet");
        metalworker:getFreeRecipes():add("Make Metal Roof");
        metalworker:getFreeRecipes():add("MakeScrapMetalHelmet");
        metalworker:getFreeRecipes():add("MakeScrapMetalShoulderArmor");
        metalworker:getFreeRecipes():add("MakeScrapMetalThighArmor");
        metalworker:getFreeRecipes():add("MakeScrapMetalBodyArmor");
        metalworker:getFreeRecipes():add("SpikeArmorWelding");
    end

    local smither = ProfessionFactory.addProfession("smither", getText("UI_prof_Smither"), "profession_smither", -6);
    smither:addXPBoost(Perks.Blacksmith, 4);
	smither:addXPBoost(Perks.Maintenance, 1)
    --smither:addXPBoost(Perks.Blacksmith, 3);
    --smither:addXPBoost(Perks.Melting, 2);
    smither:addFreeTrait("Blacksmith2");
    doMetalWorkerRecipes(smither);

    -- MECHANICS PROFESSION REBALANCE
    local mechanics = ProfessionFactory.addProfession("mechanics", getText("UI_prof_Mechanics"), "profession_mechanic", -4);
	mechanics:addXPBoost(Perks.Mechanics, 3);
	mechanics:addXPBoost(Perks.MetalWelding, 1);
    mechanics:addFreeTrait("Burglar");
	mechanics:getFreeRecipes():add("Basic Mechanics");
	mechanics:getFreeRecipes():add("Intermediate Mechanics");
	mechanics:getFreeRecipes():add("Advanced Mechanics");

    -- SNAKE ALICE BACKPACK COMPATIBILITY
    if getActivatedMods():contains("AliceSPack") then
        print("DT Logger: AliceSPack detected, running DoProfessions function");
        ABSBaseGameCharacterDetails.DoProfessions();
    end
    -- SNAKE AMMO MAKER COMPATIBILITY
    if getActivatedMods():contains("AmmoMaker") then
        print("DT Logger: AmmoMaker detected, running DoProfessions function");
        AMBaseGameCharacterDetails.DoProfessions();
    end

    local profList = ProfessionFactory.getProfessions()
    for i = 1, profList:size() do
        local prof = profList:get(i - 1)
        BaseGameCharacterDetails.SetProfessionDescription(prof)
    end
end

----------------------------------------------
----- INITIALIZATION FOR A NEW CHARACTER -----
----------------------------------------------
DTEMBaseGameCharacterDetails.DoNewCharacterInitializations = function(playernum, character)
    --print("DT Logger: running DTEMBaseGameCharacterDetails.DoNewCharacterInitializations function")
    local player = getSpecificPlayer(playernum);
    local function hasTrait(traitName)
        if player and player.HasTrait then
            return player:HasTrait(traitName)
        end
        if player and player.hasTrait then
            return player:hasTrait(traitName)
        end
        local traits = player and player.getTraits and player:getTraits() or nil
        return traits and traits.contains and traits:contains(traitName) or false
    end

    -- TRAITS CHANGE
    if hasTrait("PhysicallyActive2") then
        player:getTraits():remove("PhysicallyActive2");
        player:getTraits():add("PhysicallyActive");
    end
    if hasTrait("Handy2") then
        player:getTraits():remove("Handy2");
        player:getTraits():add("Handy");
    end
    if hasTrait("Dextrous2") then
        player:getTraits():remove("Dextrous2");
        player:getTraits():add("Dextrous");
    end

    -- INITIALIZATION FOR KILLS PATH
    if player:getModData().DTEMKillsPath == nil then
        if hasTrait("Cowardly") then
            player:getModData().DTEMKillsPath = 1;
        elseif hasTrait("Brave") then
            player:getModData().DTEMKillsPath = 2;
        elseif hasTrait("Desensitized") then
            player:getModData().DTEMKillsPath = 3;
        else
            player:getModData().DTEMKillsPath = 4;
        end
    end
    -- INITIALIZATION FOR KILLS SYSTEM
    if player:getModData().DTEMKillscheck2 == nil then
        player:getModData().DTEMKillscheck2 = 0;
    end
    -- INITIALIZATION FOR DEXTROUS/ALLTHUMBS
    if player:getModData().DTEMallThumbsDextrousTraits == nil then
        if hasTrait("AllThumbs") then
            if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                player:getModData().DTEMallThumbsDextrousTraits = -125000;
            elseif player:getDescriptor():getProfession() == "burglar" then
                player:getModData().DTEMallThumbsDextrousTraits = -150000;
            elseif player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" then
                player:getModData().DTEMallThumbsDextrousTraits = -175000;
            else
                player:getModData().DTEMallThumbsDextrousTraits = -200000;
            end
        elseif hasTrait("Dextrous") then
            player:getModData().DTEMallThumbsDextrousTraits = 200000;
        else
            if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                player:getModData().DTEMallThumbsDextrousTraits = 75000;
            elseif player:getDescriptor():getProfession() == "burglar" then
                player:getModData().DTEMallThumbsDextrousTraits = 50000;
            elseif player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" then
                player:getModData().DTEMallThumbsDextrousTraits = 35000;
            else
                player:getModData().DTEMallThumbsDextrousTraits = 0;
            end

        end
    end
    -- INITIALIZATION FOR ORGANIZED/DISORGANIZED TRAITS
    if player:getModData().DTEMdisorganizedOrganizedTraits == nil then
        if hasTrait("Disorganized") then
            if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                player:getModData().DTEMdisorganizedOrganizedTraits = -200000;
            elseif player:getDescriptor():getProfession() == "carpenter" or player:getDescriptor():getProfession() == "chef" or 
            player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" or 
            player:getDescriptor():getProfession() == "metalworker" or player:getDescriptor():getProfession() == "mechanics" then
                player:getModData().DTEMdisorganizedOrganizedTraits = -250000;
            else
                player:getModData().DTEMdisorganizedOrganizedTraits = -300000;
            end
        elseif hasTrait("Organized") then
            player:getModData().DTEMdisorganizedOrganizedTraits = 300000;
        else
            if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                player:getModData().DTEMdisorganizedOrganizedTraits = 100000;
            elseif player:getDescriptor():getProfession() == "carpenter" or player:getDescriptor():getProfession() == "chef" or 
            player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" or 
            player:getDescriptor():getProfession() == "metalworker" or player:getDescriptor():getProfession() == "mechanics" then
                player:getModData().DTEMdisorganizedOrganizedTraits = 50000;
            else
                player:getModData().DTEMdisorganizedOrganizedTraits = 0;
            end
        end
    end
    -- INITIALIZATION FOR OUTDOORSMAN TRAIT
    if player:getModData().DTOutdoorsmanTrait == nil then
        if hasTrait("Outdoorsman") then
            player:getModData().DTOutdoorsmanTrait = 600000;
        else
            if player:getDescriptor():getProfession() == "parkranger" then
                player:getModData().DTOutdoorsmanTrait = 200000;
            elseif player:getDescriptor():getProfession() == "farmer" or player:getDescriptor():getProfession() == "fisherman" then
                player:getModData().DTOutdoorsmanTrait = 100000;
            elseif player:getDescriptor():getProfession() == "lumberjack" then
                player:getModData().DTOutdoorsmanTrait = 50000;
            else
                player:getModData().DTOutdoorsmanTrait = 0;
            end
        end
    end
    -- INITIALIZATION FOR CATSEYES TRAIT
    if player:getModData().DTEMCatsEyesTrait == nil then
        if hasTrait("NightVision") then
            player:getModData().DTEMCatsEyesTrait = 150000;
        else
            if player:getDescriptor():getProfession() == "securityguard" then
                player:getModData().DTEMCatsEyesTrait = 75000;
            elseif player:getDescriptor():getProfession() == "burglar" then
                player:getModData().DTEMCatsEyesTrait = 50000;
            elseif player:getDescriptor():getProfession() == "fireofficer" or player:getDescriptor():getProfession() == "policeofficer" then
                player:getModData().DTEMCatsEyesTrait = 25000;
            else
                player:getModData().DTEMCatsEyesTrait = 0;
            end
        end
    end
    -- INITIALIZATION FOR RAIN TRAITS
    if player:getModData().DTEMRainTraits == nil then
        if hasTrait("Pluviophile") then
            player:getModData().DTEMRainTraits = 40000;
        elseif hasTrait("Pluviophobia") then
            player:getModData().DTEMRainTraits = -40000;
        else
            player:getModData().DTEMRainTraits = 0;
        end
    end
    -- INITIALIZATION FOR CLAUSTROPHOBIC AND AGORAPHOBIC TRAITS
    if player:getModData().DTEMagoraphobicClaustrophobicTraits == nil then
        player:getModData().DTEMagoraphobicClaustrophobicTraits = 0;
    end
    -- INITIALIZATION FOR SMOKER TRAIT
    if player:getModData().DTEMdaysSinceLastSmoke == nil then
        player:getModData().DTEMdaysSinceLastSmoke = 0;
    end
    -- INITIALIZATION FOR BLOODLUST TRAIT
    if player:getModData().DTEMKillscheck == nil then
        player:getModData().DTEMKillscheck = 0;
    end
    if player:getModData().DTEMtimeSinceLastKill == nil then
        player:getModData().DTEMtimeSinceLastKill = 0;
    end
    -- INITIALIZATION FOR ALCOHOLIC TRAIT
    if player:getModData().DTEMalcoholicTrait == nil then
        if hasTrait("Alcoholic") then
            player:getModData().DTEMalcoholicTrait = -44640;
        else
            player:getModData().DTEMalcoholicTrait = 0;
        end
    end
    if player:getModData().DTEMtimeSinceLastDrink == nil then
        player:getModData().DTEMtimeSinceLastDrink = 0;
    end
    -- INITIALIZATION FOR ANOREXIC TRAIT
    if player:getModData().DTEManorexyTrait == nil then
        if hasTrait("Anorexy") then
            player:getModData().DTEManorexyTrait = -720;
        else
            player:getModData().DTEManorexyTrait = 0;
        end
    end
    -- INITIALIZATION FOR PHYSICALLY ACTIVE/SEDENTARY TRAITS
    if player:getModData().DTEMphysicallyActiveSedentaryTraits == nil then
        if hasTrait("PhysicallyActive") then
            player:getModData().DTEMphysicallyActiveSedentaryTraits = 60000;
        elseif hasTrait("Sedentary") then
            player:getModData().DTEMphysicallyActiveSedentaryTraits = -60000;
        else
            player:getModData().DTEMphysicallyActiveSedentaryTraits = 0;
        end
    end
    -- INITIALIZATION FOR HARD OF HEARING AND KEEN HEARING TRAITS
    if player:getModData().DTEMkeenHearingHardOfHearingTraits == nil then
        local total = 0;
        -- AGILITY SKILLS
        total = total + player:getPerkLevel(Perks.Sneak);
        total = total + player:getPerkLevel(Perks.Lightfoot);
        total = total + player:getPerkLevel(Perks.Nimble);
        -- FIREARMS SKILLS
        total = total + player:getPerkLevel(Perks.Aiming);
        -- COMBAT SKILLS
        total = total + player:getPerkLevel(Perks.Axe);
        total = total + player:getPerkLevel(Perks.Blunt);
        total = total + player:getPerkLevel(Perks.SmallBlunt);
        total = total + player:getPerkLevel(Perks.LongBlade);
        total = total + player:getPerkLevel(Perks.SmallBlade);
        total = total + player:getPerkLevel(Perks.Spear);
        -- SURVIVALIST SKILLS
        total = total + player:getPerkLevel(Perks.PlantScavenging);
        -- MOD DATA = TOTAL
        player:getModData().DTEMkeenHearingHardOfHearingTraits = total;
        -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE HARD OF HEARING OR OBTAIN KEEN HEARING
        if player:getModData().DTEMkeenHearingHardOfHearingTraits >= 30 and hasTrait("HardOfHearing") then
            player:getTraits():remove("HardOfHearing");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_hardhear"), false, HaloTextHelper.getColorGreen());
        end
        if player:getModData().DTEMkeenHearingHardOfHearingTraits >= 50 and not hasTrait("KeenHearing") and
            not hasTrait("Deaf") then
            player:getTraits():add("KeenHearing");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_keenhearing"), true,
                HaloTextHelper.getColorGreen());
        end
    end
    -- INITIALIZATION FOR SLOW LEARNER AND FAST LEARNER TRAITS
    if player:getModData().DTEMslowFastLearnerTraits == nil then
        local total = 0;
        -- CRAFTING SKILLS
        total = total + player:getPerkLevel(Perks.Woodwork);
        total = total + player:getPerkLevel(Perks.Cooking);
        total = total + player:getPerkLevel(Perks.Farming);
        total = total + player:getPerkLevel(Perks.Doctor);
        total = total + player:getPerkLevel(Perks.Electricity);
        total = total + player:getPerkLevel(Perks.MetalWelding);
        total = total + player:getPerkLevel(Perks.Mechanics);
        total = total + player:getPerkLevel(Perks.Tailoring);
        -- SURVIVALIST SKILLS
        total = total + player:getPerkLevel(Perks.Fishing);
        total = total + player:getPerkLevel(Perks.Trapping);
        total = total + player:getPerkLevel(Perks.PlantScavenging);
        -- MOD DATA = TOTAL
        player:getModData().DTEMslowFastLearnerTraits = total;
        -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE SLOW LEARNER OR OBTAIN FAST LEARNER
        if player:getModData().DTEMslowFastLearnerTraits >= 30 and hasTrait("SlowLearner") then
            player:getTraits():remove("SlowLearner");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowLearner"), false,
                HaloTextHelper.getColorGreen());
        end
        if player:getModData().DTEMslowFastLearnerTraits >= 50 and not hasTrait("FastLearner") then
            player:getTraits():add("FastLearner");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastLearner"), true,
                HaloTextHelper.getColorGreen());
        end
    end
    -- INITIALIZATION FOR WETNESS MOODLE
    if player:getModData().DTEMgenerateAColdChance == nil then
        player:getModData().DTEMgenerateAColdChance = 0;
    end
    -- INITIALIZATION FOR NERVOUS WRECK
    if player:getModData().DTEMisNervousWreck == nil then
        if hasTrait("NervousWreck") then
            player:getModData().DTEMisNervousWreck = true
        else
            player:getModData().DTEMisNervousWreck = false
        end
    end
    if player:getModData().DTEMnervousWreckTrait == nil then
        player:getModData().DTEMnervousWreckTrait = 0
    end
    if player:getModData().DTEMrecentlyConsumedBetaBlockers == nil then
        player:getModData().DTEMrecentlyConsumedBetaBlockers = 0
    end
    -- INITIALIZATION FOR MELANCHOLIC
    if player:getModData().DTEMisMelancholic == nil then
        if hasTrait("Melancholic") then
            player:getModData().DTEMisMelancholic = true
        else
            player:getModData().DTEMisMelancholic = false
        end
    end
    if player:getModData().DTEMmelancholicTrait == nil then
        player:getModData().DTEMmelancholicTrait = 0
    end
    if player:getModData().DTEMrecentlyConsumedAntidepressants == nil then
        player:getModData().DTEMrecentlyConsumedAntidepressants = 0
    end
    -- INITIALIZATION FOR OVERDOSE 
    if player:getModData().DTEMoverdose == nil then
        player:getModData().DTEMoverdose = 0;
    end
    -- INITIALIZATION FOR EMOTIONAL INTELLIGENCE
    if player:getModData().DTEMstressIntelligence == nil then
        player:getModData().DTEMstressIntelligence = false;
    end
    if player:getModData().DTEMunhappynessIntelligence == nil then
        player:getModData().DTEMunhappynessIntelligence = false;
    end
    if player:getModData().DTEMboredomIntelligence == nil then
        player:getModData().DTEMboredomIntelligence = false;
    end
    if player:getModData().DTEMangerIntelligence == nil then
        player:getModData().DTEMangerIntelligence = false;
    end
    if player:getModData().DTEMplantsKnowledge == nil then
        player:getModData().DTEMplantsKnowledge = 0;
    end
    -- INITIALIZATION FOR ALLERGIES
    if player:getModData().DTEMallergy == nil then
        player:getModData().DTEMallergy = 0;
    end
    -- INITIALIZATION FOR PASSING OUT
    if player:getModData().DTEMpassingOut == nil then
        player:getModData().DTEMpassingOut = 0;
    end
    if player:getModData().DTEMpassingOutQuietTime == nil then
        player:getModData().DTEMpassingOutQuietTime = 0;
    end
    -- INITIALIZATION FOR FLIMSY/FRAIL TRAITS
    if player:getModData().DTEMcurrentStrXPLevel == nil then
        player:getModData().DTEMcurrentStrXPLevel = 0;
    end
    -- INITIALIZATION FOR FLABBY/BRITTLEKNEES
    if player:getModData().DTEMcurrentFitXPLevel == nil then
        player:getModData().DTEMcurrentFitXPLevel = 0;
    end
    -- INITIALIZATION FOR ADDICTED TO CAFFEINE TRAIT
    if player:getModData().DTEMaddictedToCaffeineTrait == nil then
        if hasTrait("AddictedToCaffeine") then
            player:getModData().DTEMaddictedToCaffeineTrait = -20160;
        else
            player:getModData().DTEMaddictedToCaffeineTrait = 0;
        end
    end
    if player:getModData().DTEMtimeSinceLastCaffeine == nil then
        player:getModData().DTEMtimeSinceLastCaffeine = 0;
    end
    if player:getModData().DTEMcaffeineOnBody == nil then
        player:getModData().DTEMcaffeineOnBody = 0;
    end
end

----------------------------------------------------
----- INITIALIZATION FOR AN EXISTING CHARACTER -----
----------------------------------------------------
DTEMBaseGameCharacterDetails.DoExistingCharacterInitializations = function(player)
    --print("DT Logger: running DTEMBaseGameCharacterDetails.DoExistingCharacterInitializations function")
    local function hasTrait(traitName)
        if player and player.HasTrait then
            return player:HasTrait(traitName)
        end
        if player and player.hasTrait then
            return player:hasTrait(traitName)
        end
        local traits = player and player.getTraits and player:getTraits() or nil
        return traits and traits.contains and traits:contains(traitName) or false
    end
    -- NPC MOD COMPATIBILITY
    if (player:getModData().DTEMKillsPath == nil or player:getModData().DTEMKillscheck2 == nil or
        player:getModData().DTEMallThumbsDextrousTraits == nil or player:getModData().DTEMdisorganizedOrganizedTraits == nil or
        player:getModData().DTOutdoorsmanTrait == nil or player:getModData().DTEMCatsEyesTrait == nil or
        player:getModData().DTEMRainTraits == nil or player:getModData().DTEMagoraphobicClaustrophobicTraits == nil or
        player:getModData().DTEMdaysSinceLastSmoke == nil or player:getModData().DTEMKillscheck == nil or
        player:getModData().DTEMtimeSinceLastKill == nil or player:getModData().DTEMalcoholicTrait == nil or
        player:getModData().DTEMtimeSinceLastDrink == nil or player:getModData().DTEManorexyTrait == nil or
        player:getModData().DTEMphysicallyActiveSedentaryTraits == nil or player:getModData().DTEMkeenHearingHardOfHearingTraits == nil or
        player:getModData().DTEMslowFastLearnerTraits == nil or player:getModData().DTEMgenerateAColdChance == nil or 
        player:getModData().DTEMisNervousWreck == nil or player:getModData().DTEMisMelancholic == nil or 
        player:getModData().DTEMnervousWreckTrait == nil or player:getModData().DTEMmelancholicTrait == nil or 
        player:getModData().DTEMrecentlyConsumedBetaBlockers == nil or player:getModData().DTEMrecentlyConsumedAntidepressants == nil or 
        player:getModData().DTEMoverdose == nil or player:getModData().DTEMstressIntelligence == nil or 
        player:getModData().DTEMunhappynessIntelligence == nil or player:getModData().DTEMboredomIntelligence == nil or
        player:getModData().DTEMangerIntelligence == nil or player:getModData().DTEMplantsKnowledge == nil or
        player:getModData().DTEMallergy == nil or player:getModData().DTEMpassingOut == nil or 
        player:getModData().DTEMpassingOutQuietTime == nil or player:getModData().DTEMcurrentStrXPLevel == nil or 
        player:getModData().DTEMcurrentFitXPLevel == nil or player:getModData().DTEMaddictedToCaffeineTrait == nil or 
        player:getModData().DTEMtimeSinceLastCaffeine == nil or player:getModData().DTEMcaffeineOnBody == nil) then

        -- TRAITS CHANGE
        if hasTrait("PhysicallyActive2") then
            player:getTraits():remove("PhysicallyActive2");
            player:getTraits():add("PhysicallyActive");
        end
        if hasTrait("Handy2") then
            player:getTraits():remove("Handy2");
            player:getTraits():add("Handy");
        end
        if hasTrait("Dextrous2") then
            player:getTraits():remove("Dextrous2");
            player:getTraits():add("Dextrous");
        end

        -- INITIALIZATION FOR KILLS PATH
        if player:getModData().DTEMKillsPath == nil then
            if hasTrait("Cowardly") then
                player:getModData().DTEMKillsPath = 1;
            elseif hasTrait("Brave") then
                player:getModData().DTEMKillsPath = 2;
            elseif hasTrait("Desensitized") then
                player:getModData().DTEMKillsPath = 3;
            else
                player:getModData().DTEMKillsPath = 4;
            end
        end
        -- INITIALIZATION FOR KILLS SYSTEM
        if player:getModData().DTEMKillscheck2 == nil then
            player:getModData().DTEMKillscheck2 = 0;
        end
        -- INITIALIZATION FOR DEXTROUS/ALLTHUMBS
        if player:getModData().DTEMallThumbsDextrousTraits == nil then
            if hasTrait("AllThumbs") then
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTEMallThumbsDextrousTraits = -125000;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTEMallThumbsDextrousTraits = -150000;
                elseif player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" then
                    player:getModData().DTEMallThumbsDextrousTraits = -175000;
                else
                    player:getModData().DTEMallThumbsDextrousTraits = -200000;
                end
            elseif hasTrait("Dextrous") then
                player:getModData().DTEMallThumbsDextrousTraits = 200000;
            else
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTEMallThumbsDextrousTraits = 75000;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTEMallThumbsDextrousTraits = 50000;
                elseif player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" then
                    player:getModData().DTEMallThumbsDextrousTraits = 35000;
                else
                    player:getModData().DTEMallThumbsDextrousTraits = 0;
                end

            end
        end
        -- INITIALIZATION FOR ORGANIZED/DISORGANIZED TRAITS
        if player:getModData().DTEMdisorganizedOrganizedTraits == nil then
            if hasTrait("Disorganized") then
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTEMdisorganizedOrganizedTraits = -200000;
                elseif player:getDescriptor():getProfession() == "carpenter" or player:getDescriptor():getProfession() == "chef" or 
                player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" or 
                player:getDescriptor():getProfession() == "metalworker" or player:getDescriptor():getProfession() == "mechanics" then
                    player:getModData().DTEMdisorganizedOrganizedTraits = -250000;
                else
                    player:getModData().DTEMdisorganizedOrganizedTraits = -300000;
                end
            elseif hasTrait("Organized") then
                player:getModData().DTEMdisorganizedOrganizedTraits = 300000;
            else
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTEMdisorganizedOrganizedTraits = 100000;
                elseif player:getDescriptor():getProfession() == "carpenter" or player:getDescriptor():getProfession() == "chef" or 
                player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" or 
                player:getDescriptor():getProfession() == "metalworker" or player:getDescriptor():getProfession() == "mechanics" then
                    player:getModData().DTEMdisorganizedOrganizedTraits = 50000;
                else
                    player:getModData().DTEMdisorganizedOrganizedTraits = 0;
                end
            end
        end
        -- INITIALIZATION FOR OUTDOORSMAN TRAIT
        if player:getModData().DTOutdoorsmanTrait == nil then
            if hasTrait("Outdoorsman") then
                player:getModData().DTOutdoorsmanTrait = 600000;
            else
                if player:getDescriptor():getProfession() == "parkranger" then
                    player:getModData().DTOutdoorsmanTrait = 200000;
                elseif player:getDescriptor():getProfession() == "farmer" or player:getDescriptor():getProfession() == "fisherman" then
                    player:getModData().DTOutdoorsmanTrait = 100000;
                elseif player:getDescriptor():getProfession() == "lumberjack" then
                    player:getModData().DTOutdoorsmanTrait = 50000;
                else
                    player:getModData().DTOutdoorsmanTrait = 0;
                end
            end
        end
        -- INITIALIZATION FOR CATSEYES TRAIT
        if player:getModData().DTEMCatsEyesTrait == nil then
            if hasTrait("NightVision") then
                player:getModData().DTEMCatsEyesTrait = 150000;
            else
                if player:getDescriptor():getProfession() == "securityguard" then
                    player:getModData().DTEMCatsEyesTrait = 75000;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTEMCatsEyesTrait = 50000;
                elseif player:getDescriptor():getProfession() == "fireofficer" or player:getDescriptor():getProfession() == "policeofficer" then
                    player:getModData().DTEMCatsEyesTrait = 25000;
                else
                    player:getModData().DTEMCatsEyesTrait = 0;
                end
            end
        end
        -- INITIALIZATION FOR RAIN TRAITS
        if player:getModData().DTEMRainTraits == nil then
            if hasTrait("Pluviophile") then
                player:getModData().DTEMRainTraits = 40000;
            elseif hasTrait("Pluviophobia") then
                player:getModData().DTEMRainTraits = -40000;
            else
                player:getModData().DTEMRainTraits = 0;
            end
        end
        -- INITIALIZATION FOR CLAUSTROPHOBIC AND AGORAPHOBIC TRAITS
        if player:getModData().DTEMagoraphobicClaustrophobicTraits == nil then
            player:getModData().DTEMagoraphobicClaustrophobicTraits = 0;
        end
        -- INITIALIZATION FOR SMOKER TRAIT
        if player:getModData().DTEMdaysSinceLastSmoke == nil then
            player:getModData().DTEMdaysSinceLastSmoke = 0;
        end
        -- INITIALIZATION FOR BLOODLUST TRAIT
        if player:getModData().DTEMKillscheck == nil then
            player:getModData().DTEMKillscheck = 0;
        end
        if player:getModData().DTEMtimeSinceLastKill == nil then
            player:getModData().DTEMtimeSinceLastKill = 0;
        end
        -- INITIALIZATION FOR ALCOHOLIC TRAIT
        if player:getModData().DTEMalcoholicTrait == nil then
            if hasTrait("Alcoholic") then
                player:getModData().DTEMalcoholicTrait = -44640;
            else
                player:getModData().DTEMalcoholicTrait = 0;
            end
        end
        if player:getModData().DTEMtimeSinceLastDrink == nil then
            player:getModData().DTEMtimeSinceLastDrink = 0;
        end
        -- INITIALIZATION FOR ANOREXIC TRAIT
        if player:getModData().DTEManorexyTrait == nil then
            if hasTrait("Anorexy") then
                player:getModData().DTEManorexyTrait = -720;
            else
                player:getModData().DTEManorexyTrait = 0;
            end
        end
        -- INITIALIZATION FOR PHYSICALLY ACTIVE/SEDENTARY TRAITS
        if player:getModData().DTEMphysicallyActiveSedentaryTraits == nil then
            if hasTrait("PhysicallyActive") then
                player:getModData().DTEMphysicallyActiveSedentaryTraits = 60000;
            elseif hasTrait("Sedentary") then
                player:getModData().DTEMphysicallyActiveSedentaryTraits = -60000;
            else
                player:getModData().DTEMphysicallyActiveSedentaryTraits = 0;
            end
        end
        -- INITIALIZATION FOR HARD OF HEARING AND KEEN HEARING TRAITS
        if player:getModData().DTEMkeenHearingHardOfHearingTraits == nil then
            local total = 0;
            -- AGILITY SKILLS
            total = total + player:getPerkLevel(Perks.Sneak);
            total = total + player:getPerkLevel(Perks.Lightfoot);
            total = total + player:getPerkLevel(Perks.Nimble);
            -- FIREARMS SKILLS
            total = total + player:getPerkLevel(Perks.Aiming);
            -- COMBAT SKILLS
            total = total + player:getPerkLevel(Perks.Axe);
            total = total + player:getPerkLevel(Perks.Blunt);
            total = total + player:getPerkLevel(Perks.SmallBlunt);
            total = total + player:getPerkLevel(Perks.LongBlade);
            total = total + player:getPerkLevel(Perks.SmallBlade);
            total = total + player:getPerkLevel(Perks.Spear);
            -- SURVIVALIST SKILLS
            total = total + player:getPerkLevel(Perks.PlantScavenging);
            -- MOD DATA = TOTAL
            player:getModData().DTEMkeenHearingHardOfHearingTraits = total;
            -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE HARD OF HEARING OR OBTAIN KEEN HEARING
            if player:getModData().DTEMkeenHearingHardOfHearingTraits >= 30 and hasTrait("HardOfHearing") then
                player:getTraits():remove("HardOfHearing");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_hardhear"), false,
                    HaloTextHelper.getColorGreen());
            end
            if player:getModData().DTEMkeenHearingHardOfHearingTraits >= 50 and not hasTrait("KeenHearing") and
                not hasTrait("Deaf") then
                player:getTraits():add("KeenHearing");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_keenhearing"), true,
                    HaloTextHelper.getColorGreen());
            end
        end
        -- INITIALIZATION FOR SLOW LEARNER AND FAST LEARNER TRAITS
        if player:getModData().DTEMslowFastLearnerTraits == nil then
            local total = 0;
            -- CRAFTING SKILLS
            total = total + player:getPerkLevel(Perks.Woodwork);
            total = total + player:getPerkLevel(Perks.Cooking);
            total = total + player:getPerkLevel(Perks.Farming);
            total = total + player:getPerkLevel(Perks.Doctor);
            total = total + player:getPerkLevel(Perks.Electricity);
            total = total + player:getPerkLevel(Perks.MetalWelding);
            total = total + player:getPerkLevel(Perks.Mechanics);
            total = total + player:getPerkLevel(Perks.Tailoring);
            -- SURVIVALIST SKILLS
            total = total + player:getPerkLevel(Perks.Fishing);
            total = total + player:getPerkLevel(Perks.Trapping);
            total = total + player:getPerkLevel(Perks.PlantScavenging);
            -- MOD DATA = TOTAL
            player:getModData().DTEMslowFastLearnerTraits = total;
            -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE SLOW LEARNER OR OBTAIN FAST LEARNER
            if player:getModData().DTEMslowFastLearnerTraits >= 30 and hasTrait("SlowLearner") then
                player:getTraits():remove("SlowLearner");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowLearner"), false,
                    HaloTextHelper.getColorGreen());
            end
            if player:getModData().DTEMslowFastLearnerTraits >= 50 and not hasTrait("FastLearner") then
                player:getTraits():add("FastLearner");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastLearner"), true,
                    HaloTextHelper.getColorGreen());
            end
        end
        -- INITIALIZATION FOR WETNESS MOODLE
        if player:getModData().DTEMgenerateAColdChance == nil then
            player:getModData().DTEMgenerateAColdChance = 0;
        end
        -- INITIALIZATION FOR NERVOUS WRECK
        if player:getModData().DTEMisNervousWreck == nil then
            if hasTrait("NervousWreck") then
                player:getModData().DTEMisNervousWreck = true
            else
                player:getModData().DTEMisNervousWreck = false
            end
        end
        if player:getModData().DTEMnervousWreckTrait == nil then
            player:getModData().DTEMnervousWreckTrait = 0
        end
        if player:getModData().DTEMrecentlyConsumedBetaBlockers == nil then
            player:getModData().DTEMrecentlyConsumedBetaBlockers = 0
        end
        -- INITIALIZATION FOR MELANCHOLIC
        if player:getModData().DTEMisMelancholic == nil then
            if hasTrait("Melancholic") then
                player:getModData().DTEMisMelancholic = true
            else
                player:getModData().DTEMisMelancholic = false
            end
        end
        if player:getModData().DTEMmelancholicTrait == nil then
            player:getModData().DTEMmelancholicTrait = 0
        end
        if player:getModData().DTEMrecentlyConsumedAntidepressants == nil then
            player:getModData().DTEMrecentlyConsumedAntidepressants = 0
        end
        -- INITIALIZATION FOR OVERDOSE 
        if player:getModData().DTEMoverdose == nil then
            player:getModData().DTEMoverdose = 0;
        end
        -- INITIALIZATION FOR EMOTIONAL INTELLIGENCE
        if player:getModData().DTEMstressIntelligence == nil then
            player:getModData().DTEMstressIntelligence = false;
        end
        if player:getModData().DTEMunhappynessIntelligence == nil then
            player:getModData().DTEMunhappynessIntelligence = false;
        end
        if player:getModData().DTEMboredomIntelligence == nil then
            player:getModData().DTEMboredomIntelligence = false;
        end
        if player:getModData().DTEMangerIntelligence == nil then
            player:getModData().DTEMangerIntelligence = false;
        end
        if player:getModData().DTEMplantsKnowledge == nil then
            player:getModData().DTEMplantsKnowledge = 0;
        end
        -- INITIALIZATION FOR ALLERGIES
        if player:getModData().DTEMallergy == nil then
            player:getModData().DTEMallergy = 0;
        end
        -- INITIALIZATION FOR PASSING OUT
        if player:getModData().DTEMpassingOut == nil then
            player:getModData().DTEMpassingOut = 0;
        end
        if player:getModData().DTEMpassingOutQuietTime == nil then
            player:getModData().DTEMpassingOutQuietTime = 0;
        end
        -- INITIALIZATION FOR FLIMSY/FRAIL TRAITS
        if player:getModData().DTEMcurrentStrXPLevel == nil then
            player:getModData().DTEMcurrentStrXPLevel = 0;
        end
        -- INITIALIZATION FOR FLABBY/BRITTLEKNEES
        if player:getModData().DTEMcurrentFitXPLevel == nil then
            player:getModData().DTEMcurrentFitXPLevel = 0;
        end
        -- INITIALIZATION FOR ADDICTED TO CAFFEINE TRAIT
        if player:getModData().DTEMaddictedToCaffeineTrait == nil then
            if hasTrait("AddictedToCaffeine") then
                player:getModData().DTEMaddictedToCaffeineTrait = -20160;
            else
                player:getModData().DTEMaddictedToCaffeineTrait = 0;
            end
        end
        if player:getModData().DTEMtimeSinceLastCaffeine == nil then
            player:getModData().DTEMtimeSinceLastCaffeine = 0;
        end
        if player:getModData().DTEMcaffeineOnBody == nil then
            player:getModData().DTEMcaffeineOnBody = 0;
        end
    end
end

Events.OnGameBoot.Add(DTEMBaseGameCharacterDetails.DoTraits);
Events.OnGameBoot.Add(DTEMBaseGameCharacterDetails.DoProfessions);
Events.OnCreatePlayer.Add(DTEMBaseGameCharacterDetails.DoNewCharacterInitializations);
