local json = require "json"

function length(T)
    local count = 0
    for _ in pairs(T) do
        count = count + 1
    end

    return count
end

function loadTable(filename)
    local path = system.pathForFile(filename, system.ResourceDirectory)
    local file = io.open(path, "r")

    if file then
        local contents = file:read("*a")
        local myTable = json.decode(contents)
        io.close(file)
        print("returned file")
        return myTable
    end

    return nil
end

