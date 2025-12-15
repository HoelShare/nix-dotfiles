-- AeroSpace workspace switching via vertical scroll (dy = ±1)

local AEROSPACE = "/run/current-system/sw/bin/aerospace"

local function aerospaceExec(cmd)
    local command = string.format(
        "%s list-workspaces --monitor mouse --visible | xargs %s workspace && %s workspace --no-stdin %s",
        AEROSPACE,
        AEROSPACE,
        AEROSPACE,
        cmd
    )
    hs.execute(command)
end

-- Debounce: verhindert mehrfaches Triggern bei einem Scroll
local lastFire = 0
local COOLDOWN = 0.15 -- Sekunden

local scrollTap = hs.eventtap.new(
    { hs.eventtap.event.types.scrollWheel },
    function(e)
        local dy = e:getProperty(
            hs.eventtap.event.properties.scrollWheelEventDeltaAxis2
        )

        if dy ~= 1 and dy ~= -1 then
            return false
        end

        local now = hs.timer.secondsSinceEpoch()
        if now - lastFire < COOLDOWN then
            return true
        end
        lastFire = now

        if dy == -1 then
            -- Scroll down
            aerospaceExec("next")
        elseif dy == 1 then
            -- Scroll up
            aerospaceExec("prev")
        end

        return true
    end
)

scrollTap:start()