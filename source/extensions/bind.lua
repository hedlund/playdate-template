-- Inluding the bind extension in your project will allows you to bind arguments
-- to functions using the `bind` function:
--
-- local function add(a, b)
--   return a + b
-- end
-- local addFive = bind(add, 5)
-- print(addFive(3)) -- prints 8

--- bind takes a function and a list of arguments and returns a new function
--- that takes the same arguments as fn, but with the first argument being the
--- list of arguments passed to bind. This is useful for creating functions that
--- take a fixedset of arguments and then call another function with those
--- arguments.
---@param fn function The function to bind arguments to
---@param ... any All arguments to bind
---@return function
function bind(fn, ...)
  local args = { ... }
  return function(...)
    return fn(table.unpack(args), ...)
  end
end
