--[[
  Ligma XD Troll Script
  Created by Kenzo - For FE-safe games only!
  Use for fun & trolling!
]]

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ChatService = require(game:GetService("Chat"))

-- Fake Chat Spam
task.spawn(function()
    while true do
        task.wait(2)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
            "💀 YOU HAVE BEEN LIGMA'D 💀", "All"
        )
    end
end)

-- Fake Error GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0.4, 0, 0.2, 0)
frame.Position = UDim2.new(0.3, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
frame.BorderSizePixel = 4
frame.BackgroundTransparency = 0.1

local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(1, 0, 1, 0)
text.Text = "⚠️ SYSTEM ERROR: LIGMA INFECTED"
text.TextScaled = true
text.TextColor3 = Color3.new(1,1,1)
text.BackgroundTransparency = 1
text.Font = Enum.Font.Arcade

-- Sound Effect
local sound = Instance.new("Sound", player:WaitForChild("PlayerGui"))
sound.SoundId = "rbxassetid://9118823106" -- funny sfx
sound.Volume = 3
sound:Play()
