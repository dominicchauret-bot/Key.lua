-- ============================================================
--   BLACK OUT REVIVAL - GitHub Script Loader
--   Game ID : 8767500166
--   Owner ID : 1591288741
--   Side     : Server Script (place inside ServerScriptService)
-- ============================================================

local HttpService   = game:GetService("HttpService")
local Players       = game:GetService("Players")
local RunService    = game:GetService("RunService")

-- ──────────────────────────────────────────────
--  CONFIGURATION  (edit these to match your repo)
-- ──────────────────────────────────────────────
local CONFIG = {
    -- Paste your raw GitHub URL here:
    -- e.g. "https://raw.githubusercontent.com/YourUser/YourRepo/main/script.lua"
    GITHUB_URL   = "https://raw.githubusercontent.com/YourUser/YourRepo/main/script.lua",

    -- Your Roblox Player ID — you get full owner privileges
    OWNER_ID     = 1591288741,

    -- How often (seconds) to auto-refresh the script from GitHub (0 = disabled)
    AUTO_RELOAD  = 0,

    -- Print debug info to the output console
    DEBUG        = true,
}

-- ──────────────────────────────────────────────
--  UTILITIES
-- ──────────────────────────────────────────────
local function log(msg)
    if CONFIG.DEBUG then
        print("[BOR Loader] " .. tostring(msg))
    end
end

local function warn(msg)
    warn("[BOR Loader] ⚠️  " .. tostring(msg))
end

local function isOwner(player)
    return player and player.UserId == CONFIG.OWNER_ID
end

-- ──────────────────────────────────────────────
--  GITHUB FETCH & EXECUTE
-- ──────────────────────────────────────────────
local loadedEnv = {}   -- shared environment table between reloads

local function fetchAndRun()
    log("Fetching script from GitHub...")

    local success, result = pcall(function()
        return HttpService:GetAsync(CONFIG.GITHUB_URL, true)
    end)

    if not success then
        warn("HTTP request failed: " .. tostring(result))
        warn("Make sure HttpService is ENABLED in Game Settings > Security.")
        return false
    end

    log("Script fetched successfully (" .. #result .. " bytes). Executing...")

    local fn, compileErr = loadstring(result)
    if not fn then
        warn("Compile error in remote script: " .. tostring(compileErr))
        return false
    end

    -- Pass shared environment data (owner id, players, etc.) via _G
    _G.BOR = _G.BOR or {}
    _G.BOR.OwnerID  = CONFIG.OWNER_ID
    _G.BOR.GameID   = 8767500166
    _G.BOR.Reload   = fetchAndRun  -- allow remote script to trigger a reload

    local runSuccess, runErr = pcall(fn)
    if not runSuccess then
        warn("Runtime error in remote script: " .. tostring(runErr))
        return false
    end

    log("✅ Remote script executed successfully!")
    return true
end

-- ──────────────────────────────────────────────
--  OWNER COMMANDS  (chat-based)
-- ──────────────────────────────────────────────
Players.PlayerAdded:Connect(function(player)
    if isOwner(player) then
        log("👑 Owner joined: " .. player.Name)

        player.Chatted:Connect(function(msg)
            local cmd = msg:lower():gsub("^%s+", "")  -- trim whitespace

            -- !reload  →  pull latest script from GitHub
            if cmd == "!reload" then
                log("Owner triggered reload.")
                fetchAndRun()

            -- !players  →  list all players in server
            elseif cmd == "!players" then
                local names = {}
                for _, p in ipairs(Players:GetPlayers()) do
                    table.insert(names, p.Name .. " (" .. p.UserId .. ")")
                end
                log("Players in server:\n  " .. table.concat(names, "\n  "))

            -- !kick <name>  →  kick a player
            elseif cmd:sub(1, 5) == "!kick" then
                local targetName = cmd:sub(7)
                for _, p in ipairs(Players:GetPlayers()) do
                    if p.Name:lower() == targetName:lower() then
                        p:Kick("You were kicked by the server owner.")
                        log("Kicked player: " .. p.Name)
                        return
                    end
                end
                warn("Player not found: " .. targetName)

            -- !shutdown  →  shut down the server
            elseif cmd == "!shutdown" then
                log("Owner triggered shutdown.")
                for _, p in ipairs(Players:GetPlayers()) do
                    p:Kick("Server is shutting down. Thanks for playing Black Out Revival!")
                end
            end
        end)
    end
end)

-- ──────────────────────────────────────────────
--  AUTO-RELOAD LOOP
-- ──────────────────────────────────────────────
if CONFIG.AUTO_RELOAD > 0 then
    task.spawn(function()
        while true do
            task.wait(CONFIG.AUTO_RELOAD)
            log("Auto-reloading from GitHub...")
            fetchAndRun()
        end
    end)
end

-- ──────────────────────────────────────────────
--  INITIAL LOAD
-- ──────────────────────────────────────────────
task.spawn(fetchAndRun)

log("Loader initialized for Black Out Revival (ID: 8767500166)")
log("Owner ID: " .. CONFIG.OWNER_ID)
</parameter>
</invoke>

