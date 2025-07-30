-- A number of useful table functions. Many of them has been borrowed from:
-- https://devforum.play.date/t/a-list-of-helpful-libraries-and-code/221

--- table.random returns a random element from an array.
---@param t table The array
---@return any The random element from the array
function table.random(t)
  if type(t) ~= "table" then return nil end
  return t[math.ceil(math.random(#t))]
end

--- table.each loops through each element in the table and calls the passed function.
---@param t table The table to loop through
---@param fn function The function to call with the element (and key)
function table.each(t, fn)
  if type(t) ~= "table" or type(fn) ~= "function" then return end
  for k, e in pairs(t) do
    fn(e, k)
  end
end
