local version = GetConvar('version', '')
local buildNumber = version:match('v%d+%.%d+%.%d+%.(%d+)')

if buildNumber then
    if tonumber(buildNumber) < 12913 then
        while true do
            print('^1Hey so you are not running the latest artifact!!! This means that practically your whole server will not work. Please update to the latest artifact. https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/')
            Wait(3000)
        end
    end
end