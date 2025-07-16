-- Import necessary libraries
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create a RemoteEvent for communication
local remoteEvent = Instance.new("RemoteEvent")
remoteEvent.Name = "FEVsScriptEvent"
remoteEvent.Parent = ReplicatedStorage

-- Local Script (FE)
local player = Players.LocalPlayer

remoteEvent.OnClientEvent:Connect(function(message)
    print("Message from server: " .. message)
end)

-- Server Script
local function sendMessageToPlayer(player)
    remoteEvent:FireClient(player, "Hello from the server!")
end

Players.PlayerAdded:Connect(function(player)
    wait(1) -- Wait for a moment to ensure the client is ready
    sendMessageToPlayer(player)
end)
