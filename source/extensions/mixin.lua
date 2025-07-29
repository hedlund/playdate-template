-- Inlcuding the mixin extension in your project will allow you to include mixins
-- in all classes that inherit from `Object`. Mixins are a way to add functionality
-- to a class without using inheritance. This solution is heavily inspired by the
-- mixin implementation in the `middleclass` library:
--   https://github.com/kikito/middleclass/wiki/Mixins

import "CoreLibs/object"

local function includeMixin(aClass, mixin)
  assert(type(mixin) == "table", "Mixin must be a table")

  -- Add all functions from the mixin to the class
  for name, method in pairs(mixin) do
    if name ~= "included" and name ~= "static" then
      aClass[name] = method
    end
  end

  -- Add all static functions from the mixin to the class
  for name, method in pairs(mixin.static or {}) do
    aClass.static[name] = method
  end

  -- Call the included function if it is specified
  if type(mixin.included) == "function" then
    mixin:included(aClass)
  end
end

--- include adds all functions from specified mixin tables to the object
--- @param ... table A list of mixins to include
--- @return Object The object with the mixins included
function Object:include(...)
  assert(type(self) == 'table', "Make sure you that you are using 'Class:include'")

  for _, mixin in ipairs({ ... }) do
    includeMixin(self, mixin)
  end
  return self
end
