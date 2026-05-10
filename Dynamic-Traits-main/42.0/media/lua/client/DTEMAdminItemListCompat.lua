require "ISUI/AdminPanel/ISItemsListTable"

local DTEM_NO_ITEM_TYPE = "<No item type>"
local DTEM_NO_LOOT_CATEGORY = "<No loot category>"
local DTEM_GHC = getCore():getGoodHighlitedColor()
local DTEM_BHC = getCore():getBadHighlitedColor()

local function DTEMGetItemName(scriptItem)
    if not scriptItem then
        return "<Unknown item>"
    end

    local ok, name = pcall(function()
        return scriptItem:getName()
    end)
    if ok and name then
        return name
    end

    return "<Unknown item>"
end

local function DTEMGetDisplayName(scriptItem)
    if not scriptItem then
        return DTEMGetItemName(scriptItem)
    end

    local ok, displayName = pcall(function()
        return scriptItem:getDisplayName()
    end)
    if ok and displayName then
        return displayName
    end

    return DTEMGetItemName(scriptItem)
end

local function DTEMGetItemTypeName(scriptItem)
    if not scriptItem then
        return DTEM_NO_ITEM_TYPE
    end

    local ok, itemType = pcall(function()
        return scriptItem:getItemType()
    end)
    if not ok or not itemType then
        return DTEM_NO_ITEM_TYPE
    end

    local okToString, itemTypeName = pcall(function()
        return itemType:toString()
    end)
    if okToString and itemTypeName then
        return itemTypeName
    end

    return DTEM_NO_ITEM_TYPE
end

local function DTEMGetDisplayCategory(scriptItem)
    if not scriptItem then
        return nil
    end

    local ok, displayCategory = pcall(function()
        return scriptItem:getDisplayCategory()
    end)
    if ok then
        return displayCategory
    end

    return nil
end

local function DTEMGetDisplayCategoryName(scriptItem)
    local displayCategory = DTEMGetDisplayCategory(scriptItem)
    if displayCategory then
        return getText("IGUI_ItemCat_" .. displayCategory)
    end

    return "Error: No category set"
end

local function DTEMGetLootCategoryName(scriptItem)
    if not scriptItem then
        return DTEM_NO_LOOT_CATEGORY
    end

    local ok, lootType = pcall(function()
        return scriptItem:getLootType()
    end)
    if not ok or not lootType then
        return DTEM_NO_LOOT_CATEGORY
    end

    return getText("Sandbox_" .. lootType .. "LootNew")
end

local function DTEMIsCraftRecipeProduct(scriptItem)
    local ok, value = pcall(function()
        return scriptItem:isCraftRecipeProduct()
    end)
    return ok and value == true
end

local function DTEMCanBeForaged(scriptItem)
    local ok, value = pcall(function()
        return scriptItem:canBeForaged()
    end)
    return ok and value == true
end

local function DTEMCanSpawnAsLoot(scriptItem)
    local ok, value = pcall(function()
        return scriptItem:canSpawnAsLoot()
    end)
    return ok and value == true
end

local function DTEMGetNumSpawned(scriptItem)
    local ok, value = pcall(function()
        return scriptItem:getNumSpawned()
    end)
    if ok and value then
        return value
    end

    return 0
end

function ISItemsListTable:initList(module)
    self.totalResult = 0;
    local categoryNames = {}
    local displayCategoryNames = {}
    local lootCategoryNames = {}
    local categoryMap = {}
    local displayCategoryMap = {}
    local lootCategoryMap = {}

    for _,v in ipairs(module) do
        self.datas:addItem(DTEMGetDisplayName(v), v);

        local itemTypeName = DTEMGetItemTypeName(v)
        if not categoryMap[itemTypeName] then
            categoryMap[itemTypeName] = true
            table.insert(categoryNames, itemTypeName)
        end

        local displayCategory = DTEMGetDisplayCategory(v)
        if displayCategory and not displayCategoryMap[displayCategory] then
            displayCategoryMap[displayCategory] = true
            table.insert(displayCategoryNames, displayCategory)
        end

        local lootCategoryName = DTEMGetLootCategoryName(v)
        if lootCategoryName and not lootCategoryMap[lootCategoryName] then
            lootCategoryMap[lootCategoryName] = true
            table.insert(lootCategoryNames, lootCategoryName)
        end

        self.totalResult = self.totalResult + 1;
    end

    table.sort(self.datas.items, function(a,b) return not string.sort(DTEMGetDisplayName(a.item), DTEMGetDisplayName(b.item)); end);

    local combo = self.filterWidgetMap.Category
    table.sort(categoryNames, function(a,b) return not string.sort(a, b) end)
    combo:addOption("<Any>")
    for _,categoryName in ipairs(categoryNames) do
        combo:addOption(categoryName)
    end

    combo = self.filterWidgetMap.DisplayCategory
    table.sort(displayCategoryNames, function(a,b) return not string.sort(a, b) end)
    combo:addOption("<Any>")
    combo:addOption("<No category set>")
    for _,displayCategoryName in ipairs(displayCategoryNames) do
        combo:addOption(displayCategoryName)
    end

    combo = self.filterWidgetMap.LootCategory
    table.sort(lootCategoryNames, function(a,b) return not string.sort(a, b) end)
    combo:addOption("<Any>")
    for _,lootCategoryName in ipairs(lootCategoryNames) do
        combo:addOption(lootCategoryName)
    end

    combo = self.filterWidgetMap.Craft
    combo:addOption("<Any>")
    combo:addOption("false")
    combo:addOption("true")

    combo = self.filterWidgetMap.Forage
    combo:addOption("<Any>")
    combo:addOption("false")
    combo:addOption("true")

    combo = self.filterWidgetMap.Loot
    combo:addOption("<Any>")
    combo:addOption("false")
    combo:addOption("true")
end

function ISItemsListTable:filterDisplayCategory(widget, scriptItem)
    if widget.selected == 1 then return true end
    if widget.selected == 2 then return DTEMGetDisplayCategory(scriptItem) == nil end
    return DTEMGetDisplayCategory(scriptItem) == widget:getOptionText(widget.selected)
end

function ISItemsListTable:filterCategory(widget, scriptItem)
    if widget.selected == 1 then return true end
    return DTEMGetItemTypeName(scriptItem) == widget:getOptionText(widget.selected)
end

function ISItemsListTable:filterLootCategory(widget, scriptItem)
    if widget.selected == 1 then return true end
    return DTEMGetLootCategoryName(scriptItem) == widget:getOptionText(widget.selected)
end

function ISItemsListTable:filterCraft(widget, scriptItem)
    if widget.selected == 1 then return true end
    return string.lower(tostring(DTEMIsCraftRecipeProduct(scriptItem))) == widget:getOptionText(widget.selected)
end

function ISItemsListTable:filterForage(widget, scriptItem)
    if widget.selected == 1 then return true end
    return string.lower(tostring(DTEMCanBeForaged(scriptItem))) == widget:getOptionText(widget.selected)
end

function ISItemsListTable:filterLoot(widget, scriptItem)
    if widget.selected == 1 then return true end
    return string.lower(tostring(DTEMCanSpawnAsLoot(scriptItem))) == widget:getOptionText(widget.selected)
end

function ISItemsListTable:filterSpawned(widget, scriptItem)
    if widget.selected == 1 then return true end
    return string.lower(tostring(DTEMGetNumSpawned(scriptItem))) == widget:getOptionText(widget.selected)
end

local function DTEMDrawColoredBool(self, value, x, y, a)
    local color = value and DTEM_GHC or DTEM_BHC
    self:drawText(tostring(value), x, y + 3, color:getR(), color:getG(), color:getB(), a, self.font);
end

function ISItemsListTable:drawDatas(y, item, alt)
    if y + self:getYScroll() + self.itemheight < 0 or y + self:getYScroll() >= self.height then
        return y + self.itemheight
    end

    local scriptItem = item.item
    local a = 0.9;

    if self.selected == item.index then
        self:drawRect(0, (y), self:getWidth(), self.itemheight, 0.3, 0.7, 0.35, 0.15);
    end

    if alt then
        self:drawRect(0, (y), self:getWidth(), self.itemheight, 0.3, 0.6, 0.5, 0.5);
    end

    self:drawRectBorder(0, (y), self:getWidth(), self.itemheight, a, self.borderColor.r, self.borderColor.g, self.borderColor.b);

    local iconX = 4
    local iconSize = FONT_HGT_SMALL;
    local xoffset = UI_BORDER_SPACING;

    local column = 1
    local clipY = math.max(0, y + self:getYScroll())
    local clipY2 = math.min(self.height, y + self:getYScroll() + self.itemheight)

    self:setStencilRect(self.columns[column].size, clipY, self.columns[column+1].size - self.columns[column].size, clipY2 - clipY)
    self:drawText(DTEMGetItemName(scriptItem), xoffset, y + 3, 1, 1, 1, a, self.font);
    self:clearStencilRect()

    column = column+1
    self:setStencilRect(self.columns[column].size, clipY, self.columns[column+1].size - self.columns[column].size, clipY2 - clipY)
    self:drawText(DTEMGetDisplayName(scriptItem), self.columns[2].size + iconX + iconSize + 4, y + 3, 1, 1, 1, a, self.font);
    self:clearStencilRect()

    column = column+1
    self:setStencilRect(self.columns[column].size, clipY, self.columns[column+1].size - self.columns[column].size, clipY2 - clipY)
    self:drawText(DTEMGetItemTypeName(scriptItem), self.columns[3].size + xoffset, y + 3, 1, 1, 1, a, self.font);
    self:clearStencilRect()

    column = column+1
    self:setStencilRect(self.columns[column].size, clipY, self.columns[column+1].size - self.columns[column].size, clipY2 - clipY)
    self:drawText(DTEMGetDisplayCategoryName(scriptItem), self.columns[4].size + xoffset, y + 3, 1, 1, 1, a, self.font);
    self:clearStencilRect()

    column = column+1
    self:setStencilRect(self.columns[column].size, clipY, self.columns[column+1].size - self.columns[column].size, clipY2 - clipY)
    local lootCategoryName = DTEMGetLootCategoryName(scriptItem)
    if lootCategoryName ~= DTEM_NO_LOOT_CATEGORY then
        self:drawText(lootCategoryName, self.columns[5].size + xoffset, y + 3, 1, 1, 1, a, self.font);
    end
    self:clearStencilRect()

    column = column+1
    self:setStencilRect(self.columns[column].size, clipY, self.columns[column+1].size - self.columns[column].size, clipY2 - clipY)
    DTEMDrawColoredBool(self, DTEMIsCraftRecipeProduct(scriptItem), self.columns[6].size + xoffset, y, a)
    self:clearStencilRect()

    column = column+1
    self:setStencilRect(self.columns[column].size, clipY, self.columns[column+1].size - self.columns[column].size, clipY2 - clipY)
    DTEMDrawColoredBool(self, DTEMCanBeForaged(scriptItem), self.columns[7].size + xoffset, y, a)
    self:clearStencilRect()

    column = column+1
    self:setStencilRect(self.columns[column].size, clipY, self.columns[column+1].size - self.columns[column].size, clipY2 - clipY)
    DTEMDrawColoredBool(self, DTEMCanSpawnAsLoot(scriptItem), self.columns[8].size + xoffset, y, a)
    self:clearStencilRect()

    local numSpawned = DTEMGetNumSpawned(scriptItem)
    local spawnedColor = numSpawned > 0 and DTEM_GHC or DTEM_BHC
    self:drawText(tostring(numSpawned), self.columns[9].size + xoffset, y + 3, spawnedColor:getR(), spawnedColor:getG(), spawnedColor:getB(), a, self.font);

    self:repaintStencilRect(0, clipY, self.width, clipY2 - clipY)

    local icon = nil
    local okIcon = pcall(function()
        icon = scriptItem:getIcon()
        if scriptItem:getIconsForTexture() and not scriptItem:getIconsForTexture():isEmpty() then
            icon = scriptItem:getIconsForTexture():get(0)
        end
    end)

    if okIcon and icon then
        local texture = tryGetTexture("Item_" .. icon)
        if texture then
            self:drawTextureScaledAspect2(texture, self.columns[2].size + iconX, y + (self.itemheight - iconSize) / 2, iconSize, iconSize,  1, 1, 1, 1);
        end
    end

    return y + self.itemheight;
end
