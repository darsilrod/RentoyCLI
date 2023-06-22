-- Runs all tests
local stats = {passed = 0, total = 0}
local file

function test(t)
    -- Runs tests, adding results in global stats.
    -- Logs in case of test failure.
    local result = t.result()
    if result == t.expected then
        stats.passed = stats.passed + 1
    else
        print("**Failed** " .. t.description)
        print("    in " .. file)
        print("Expected:")
        print('    ' .. tostring(t.expected))
        print("Got instead:")
        print('    ' .. tostring(result))
        print()
    end

    stats.total = stats.total + 1
end

-- Test files
file = assert(io.open("test.cfg", "r"))
assert(load("test_files = " .. file:read("*a")))()
file:close()

for i = 1, #test_files do
    file = test_files[i]
    dofile(file)
end

-- END

print(stats.passed .. " out of " .. stats.total .. " tests passed.")