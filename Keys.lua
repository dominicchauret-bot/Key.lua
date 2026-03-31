-- Script for Blackout: Revival [FREE ZOMBIES] (Place ID: 8767500166)
-- Executed with Synapse X

if not game:IsLoaded() then
    game.Loaded:Wait()
end

if game.PlaceId == 8767500166 then
    -- Load Aimbot V2 Main Script
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Main.lua"))()

    -- Load Aimbot V2 GUI
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Aimbot%20V2%20GUI.lua"))()

    -- Load Raw Main if needed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Raw%20Main.lua"))()

    -- Configure Aimbot Settings
    getgenv().Aimbot.Settings = {
        SendNotifications = true,
        SaveSettings = false, -- Re-execute upon changing
        ReloadOnTeleport = true,
        Enabled = true,
        TeamCheck = false,
        AliveCheck = true,
        WallCheck = false, -- Laggy
        Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
        ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
        ThirdPersonSensitivity = 3, -- Boundary: 0.1 - 5
        TriggerKey = "MouseButton2",
        Toggle = false,
        LockPart = "Head" -- Body part to lock on (Character part's name)
    }

    getgenv().Aimbot.FOVSettings = {
        Enabled = true,
        Visible = true,
        Amount = 90,
        Color = "255, 255, 255",
        LockedColor = "255, 70, 70",
        Transparency = 0.5,
        Sides = 60,
        Thickness = 1,
        Filled = false
    }

    -- Additional configurations
    getgenv().Aimbot.Settings.Enabled = true
    getgenv().Aimbot.FOVSettings.Color = "50, 255, 70"
    getgenv().Aimbot.FOVSettings.Enabled = false
    getgenv().Aimbot.Settings.ThirdPerson = true
    getgenv().Aimbot.Settings.ThirdPersonSensitivity = 3
    getgenv().Aimbot.Settings.SaveSettings = false

    -- Delete settings if needed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Delete%20Settings%20-%20Fix%20Script.lua"))()

    -- Set trigger key
    getgenv().Aimbot.Settings.TriggerKey = "E"

    -- Reset settings
    getgenv().Aimbot.Functions:ResetSettings()

    -- WebSocket for remote execution (Synapse Executer)
    local WebSocket = assert(
        WebSocket or Websocket or websocket or (syn and syn.websocket),
        "Your executor is missing a websocket API!"
    )

    while true do
        local success, client = pcall(WebSocket.connect, "ws://localhost:33882/")
        if success then
            client.OnMessage:Connect(function(payload)
                local callback, exception = loadstring(payload)
                if exception then
                    error(exception, 2)
                end
                task.spawn(callback)
            end)
            client.OnClose:Wait()
        end
        task.wait(1)
    end
else
    warn("This script is for Blackout: Revival [FREE ZOMBIES] (Place ID: 8767500166). Current Place ID: " .. game.PlaceId)
-- Script for Blackout: Revival [FREE ZOMBIES] (Place ID: 8767500166)
-- Executed with Synapse X

if game.PlaceId == 8767500166 then
    -- Load Aimbot V2
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Main.lua"))()

    -- Configure Aimbot Settings
    getgenv().Aimbot.Settings = {
        SendNotifications = true,
        SaveSettings = false, -- Re-execute upon changing
        ReloadOnTeleport = true,
        Enabled = true,
        TeamCheck = false,
        AliveCheck = true,
        WallCheck = false, -- Laggy
        Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
        ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
        ThirdPersonSensitivity = 3, -- Boundary: 0.1 - 5
        TriggerKey = "MouseButton2",
        Toggle = false,
        LockPart = "Head" -- Body part to lock on (Character part's name)
    }

    getgenv().Aimbot.FOVSettings = {
        Enabled = true,
        Visible = true,
        Amount = 90,
        Color = "255, 255, 255",
        LockedColor = "255, 70, 70",
        Transparency = 0.5,
        Sides = 60,
        Thickness = 1,
        Filled = false
    }

    -- Additional configurations
    getgenv().Aimbot.Settings.Enabled = true
    getgenv().Aimbot.FOVSettings.Color = "50, 255, 70"
    getgenv().Aimbot.FOVSettings.Enabled = false
    getgenv().Aimbot.Settings.ThirdPerson = true
    getgenv().Aimbot.Settings.ThirdPersonSensitivity = 3
    getgenv().Aimbot.Settings.SaveSettings = false

    -- Delete settings if needed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Delete%20Settings%20-%20Fix%20Script.lua"))()

    -- Set trigger key
    getgenv().Aimbot.Settings.TriggerKey = "E"

    -- Reset settings
    getgenv().Aimbot.Functions:ResetSettings()

    -- WebSocket for remote execution
    local WebSocket = assert(
        WebSocket or Websocket or websocket or (syn and syn.websocket),
        "Your executor is missing a websocket API!"
    )

    while true do
        local success, client = pcall(WebSocket.connect, "ws://localhost:33882/")
        if success then
            client.OnMessage:Connect(function(payload)
                local callback, exception = loadstring(payload)
                if exception then
                    error(exception, 2)
                end
                task.spawn(callback)
            end)
            client.OnClose:Wait()
        end
        task.wait(1)
    end
else
    warn("This script is for Blackout: Revival [FREE ZOMBIES] (Place ID: 8767500166). Current Place ID: " .. game.PlaceId)
# Docker has specific installation instructions for each operating system.
# Please refer to the official documentation at https://docker.com/get-started/

# Pull the Node.js Docker image:
docker pull node:24-alpine

# Create a Node.js container and start a Shell session:
docker run -it --rm --entrypoint sh node:24-alpine

# Verify the Node.js version:
node -v # Should print "v24.14.1".

# Verify npm version:
npm -v # Should print "11.11.0".


