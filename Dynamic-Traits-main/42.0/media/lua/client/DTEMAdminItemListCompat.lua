require "ISUI/AdminPanel/ISItemsListTable"

local function DTEMGetItemTypeName(scriptItem)
    if not scriptItem then
        return nil
    end

    local ok, itemType = pcall(function()
        return scriptItem:getItemType()
    end)
    if not ok or not itemType then
        return nil
    end

    local okToString, itemTypeName = pcall(function()
        return itemType:toString()
    end)
    if okToString and itemTypeName then
        return itemTypeName
    end

    return nil
end

local function DTEMGetLootCategoryName(scriptItem)
    if not scriptItem then
        return nil
    end

    local ok, lootType = pcall(function()
        return scriptItem:getLootType()
    end)
    if not ok or not lootType then
        return nil
    end

    return getText("Sandbox_" .. lootType .. "LootNew")
end

function ISItemsListTable:initList(module)
    self.totalResult = 0;
    local categoryNames = {}
    local displayCategoryNames = {}
    local lootCategoryNames = {}
    local categoryMap = {}
    local displayCategoryMap = {}
    local lootCategoryMap = {}

    for x,v in ipairs(module) do
        local itemTypeName = DTEMGetItemTypeName(v)
        if itemTypeName then
            self.datas:addItem(v:getDisplayName(), v);
            if not categoryMap[itemTypeName] then
                categoryMap[itemTypeName] = true
                table.insert(categoryNames, itemTypeName)
            end

            if v:getDisplayCategory() and not displayCategoryMap[v:getDisplayCategory()] then
                displayCategoryMap[v:getDisplayCategory()] = true
                table.insert(displayCategoryNames, v:getDisplayCategory())
            end

            local lootCategoryName = DTEMGetLootCategoryName(v)
            if lootCategoryName and not lootCategoryMap[lootCategoryName] then
                lootCategoryMap[lootCategoryName] = true
                table.insert(lootCategoryNames, lootCategoryName)
            end
            self.totalResult = self.totalResult + 1;
        end
    end

    table.sort(self.datas.items, function(a,b) return not string.sort(a.item:getDisplayName(), b.item:getDisplayName()); end);

    local combo = self.filterWidgetMap.Category
    table.sort(categoryNames, function(a,b) return not string.sort(a, b) end)
    combo:addOption("<Any>")
    for _,categoryName in ipairs(categoryNames) do
        combo:addOption(categoryName)
    end

    local combo = self.filterWidgetMap.DisplayCategory
    table.sort(displayCategoryNames, function(a,b) return not string.sort(a, b) end)
    combo:addOption("<Any>")
    combo:addOption("<No category set>")
    for _,displayCategoryName in ipairs(displayCategoryNames) do
        combo:addOption(displayCategoryName)
    end

    local combo = self.filterWidgetMap.LootCategory
    table.sort(lootCategoryNames, function(a,b) return not string.sort(a, b) end)
    combo:addOption("<Any>")
    for _,lootCategoryName in ipairs(lootCategoryNames) do
        combo:addOption(lootCategoryName)
    end

    local combo = self.filterWidgetMap.Craft
    combo:addOption("<Any>")
    combo:addOption("false")
    combo:addOption("true")

    local combo = self.filterWidgetMap.Forage
    combo:addOption("<Any>")
    combo:addOption("false")
    combo:addOption("true")

    local combo = self.filterWidgetMap.Loot
    combo:addOption("<Any>")
    combo:addOption("false")
    combo:addOption("true")
end

function ISItemsListTable:filterCategory(widget, scriptItem)
    if widget.selected == 1 then return true end
    return DTEMGetItemTypeName(scriptItem) == widget:getOptionText(widget.selected)
end

function ISItemsListTable:filterLootCategory(widget, scriptItem)
    if widget.selected == 1 then return true end
    return DTEMGetLootCategoryName(scriptItem) == widget:getOptionText(widget.selected)
end
