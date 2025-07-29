-- Including the enum extension in your project will allow you to create enums
-- using the `enum` function:
--
-- local Color = enum { "Red", "Green", "Blue" }
-- if color == Color.Red then
--   print("Color is red")
-- end

--- enum creates a table with the specified keys, which can be used as an enum:
--- @param keys table A numeric table with the keys to be used in the enum
--- @return table The enum table where each of the input keys are defined
function enum(keys)
  local enum = {}
  for _, value in ipairs(keys) do
    enum[value] = {}
  end
  return enum
end
