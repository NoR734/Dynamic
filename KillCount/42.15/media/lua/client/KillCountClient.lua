
local KCClient = {}
KCClient.lastUpdateCount = nil
KCClient.lastUpdateTime = nil


---sends periodically updates of local players to the server

local lcl = {}
lcl.player_base           = __classmetatables[IsoPlayer.class].__index
lcl.player_getModData     = lcl.player_base.getModData
lcl.player_isLocalPlayer  = lcl.player_base.isLocalPlayer
lcl.player_getZombieKills = lcl.player_base.getZombieKills

lcl.getTimestampMs = getTimestampMs

local function getDelay()
    return SandboxVars and SandboxVars.KillCount and SandboxVars.KillCount.MaxUpdateDelay or 500
end

function KCClient.OnPlayerUpdate(isoPlayer)
    if not SandboxVars.KillCount.shareOnServer then return end
    if not isoPlayer or not lcl.player_isLocalPlayer(isoPlayer) then return end
    
    local md = lcl.player_getModData(isoPlayer)
    local mdKC = md and md.KillCount
    if not mdKC or not mdKC.WeaponCategory then return end-- nothing to send anyway
    
    local currentTime = lcl.getTimestampMs()
    local lastUpdateTime = KCClient.lastUpdateTime
    if lastUpdateTime and currentTime-lastUpdateTime < getDelay() then return end--temporise, to not overload the server & network
    
    local nbKills = lcl.player_getZombieKills(isoPlayer)
    if nbKills == KCClient.lastUpdateCount then return end-- temporise, no update since last emition
    
    --local & distant memo
    KCClient.lastUpdateCount = nbKills--local number to avoid useless updates
    local payload = {}
    for key,value in pairs(mdKC) do
        payload[key] = value
    end
    if md.AKCModData then
        payload.AKCModData = md.AKCModData
    end
    if lastUpdateTime then
        payload.lastUpdateTime = currentTime--distant time for KCServer to retrieve reception order
    else
        payload.lastUpdateTime = nil--distant force KCServer to update at first kill of the session
    end
    mdKC.lastUpdateTime = payload.lastUpdateTime
    KCClient.lastUpdateTime = currentTime--local time to avoid too frequent updates
    
    --send it
    if isClient() then--only as client
        sendClientCommand(isoPlayer,KCShared.Key,isoPlayer:getUsername(),payload)
    else--direct connection as host or solo
        KCServer.OnClientCommand(KCShared.Key, isoPlayer:getUsername(), isoPlayer, payload)
        ISCharacterKills.instance:onPlayersKillsUpdate();
    end
end


Events.OnPlayerUpdate.Add(KCClient.OnPlayerUpdate)
