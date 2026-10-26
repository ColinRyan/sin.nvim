-- Test file for function highlighting
local function my_function(param)  -- function definition should be darker
    return param * 2
end

local result = my_function(5)      -- function call should be lighter

-- More examples
print("Hello")                     -- built-in function call
string.format("%s", "test")        -- method call
table.insert(list, item)           -- nested function calls

local obj = {
    method = function(self)        -- method definition
        return self.value
    end
}

obj:method()                       -- method call