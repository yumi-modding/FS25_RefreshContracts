RefreshContractsEvent = {}
local RefreshContractsEvent_mt = Class(RefreshContractsEvent, Event)

RefreshContractsEvent.debug = false --true --

InitEventClass(RefreshContractsEvent, "RefreshContractsEvent")

function RefreshContractsEvent.emptyNew()
    if RefreshContractsEvent.debug then print("RefreshContractsEvent:emptyNew") end
	local self = Event.new(RefreshContractsEvent_mt)

	return self
end

function RefreshContractsEvent.new()
    if RefreshContractsEvent.debug then print("RefreshContractsEvent:new") end
	local self = RefreshContractsEvent.emptyNew()

	return self
end

function RefreshContractsEvent:writeStream(streamId, connection)
    if RefreshContractsEvent.debug then print("RefreshContractsEvent:writeStream") end
	-- NetworkUtil.writeNodeObject(streamId, self.mission)
end

function RefreshContractsEvent:readStream(streamId, connection)
    if RefreshContractsEvent.debug then print("RefreshContractsEvent:readStream") end

	self:run(connection)
end

function RefreshContractsEvent:run(connection)
    if RefreshContractsEvent.debug then print("RefreshContractsEvent:run") end
	if not connection:getIsServer() then
		local senderUserId = g_currentMission.userManager:getUserIdByConnection(connection)
		local senderFarm = g_farmManager:getFarmByUserId(senderUserId)
		local isMasterUser = connection:getIsLocal() or g_currentMission.userManager:getIsConnectionMasterUser(connection)

		-- if g_currentMission:getHasPlayerPermission("manageContracts", connection, senderFarm.farmId) and (self.mission.farmId == senderFarm.farmId or isMasterUser) then
		g_missionManager:refreshMissions()
		-- end
	end
end
