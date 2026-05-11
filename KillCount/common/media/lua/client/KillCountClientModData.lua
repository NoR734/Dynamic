
--solo and host do not need to update they got direct access to server gmd
if not isClient() then return end

--receive the whole global mod data client side
require 'KillCountShared'

local lcl = {}
lcl.player_base        = __classmetatables[IsoPlayer.class].__index
lcl.player_getModData  = lcl.player_base.getModData
lcl.player_getUsername = lcl.player_base.getUsername
lcl.getPlayer = getPlayer

---subscribe to MD
function KCShared.initGMD()
    ModData.request(KCShared.Key);
end

function KCShared.restoreLocalPlayerModData(gmd)
    if not gmd then return end

    local player = lcl.getPlayer()
    if not player then return end

    local playerName = lcl.player_getUsername(player)
    local serverData = playerName and gmd[playerName]
    if not serverData then return end

    local md = lcl.player_getModData(player)
    if not md then return end

    local localData = md.KillCount
    local useServerData = not localData or not localData.WeaponCategory
    if serverData.lastUpdateTime and localData and localData.lastUpdateTime then
        useServerData = useServerData or serverData.lastUpdateTime > localData.lastUpdateTime
    end

    if useServerData then
        md.KillCount = serverData
    end
    if serverData.AKCModData and (useServerData or not md.AKCModData) then
        md.AKCModData = serverData.AKCModData
    end
end

--- merge subscribed global mod data
function KCShared.OnReceiveGlobalModData(_module, _packet)
    if _module == KCShared.Key then
        if _packet then
            if KCShared.Verbose then print("Client receives Global mod data update "..tab2str(_module)..' '..tab2str(_packet)) end
            ModData.add(_module, _packet)
            KCShared.restoreLocalPlayerModData(_packet)
            ISCharacterKills.instance:onPlayersKillsUpdate();
        else
            if KCShared.Verbose then print("Client receives Global mod data synchro "..tab2str(_module)..' '..tab2str(_packet)) end
        end
    end
end

--- install callbacks
--register the database update callback
Events.OnInitGlobalModData.Add(KCShared.initGMD)
--set on database update
Events.OnReceiveGlobalModData.Add(KCShared.OnReceiveGlobalModData)
