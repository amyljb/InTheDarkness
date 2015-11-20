require "util"

local appData = {}

function initFunction()
    print "loading info"

    appData = loadTable("data.json")
end

initFunction()

return appData