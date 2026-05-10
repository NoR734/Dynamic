require "DTEMB42Compat"

local function DTEMOnClientCommand(module, command, player, args)
    if module ~= "DynamicTraits" or not player or not args then
        return
    end

    if command == "addTrait" then
        DTEMAddTrait(player, args.trait)
    elseif command == "removeTrait" then
        DTEMRemoveTrait(player, args.trait)
    end
end

Events.OnClientCommand.Add(DTEMOnClientCommand)
