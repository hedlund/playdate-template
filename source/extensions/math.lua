-- A number of useful math functions. Many of them has been borrowed from:
-- https://devforum.play.date/t/a-list-of-helpful-libraries-and-code/221

--- math.clamp returns a value that does not spill outside of min and max.
--- Example: math.clamp(1.5, -1.1, 1.1) returns 1.1
---@param v number The value to clamp
---@param min number The minimum value
---@param max number The maximum value
---@return number The clamped value
function math.clamp(v, min, max)
  return (v < min and min) or (v > max and max) or v
end

--- math.ring returns a value that is wrapped around the range of min and max.
--- Similar to clamp, but loops back from the start, which makes it useful for
--- cycling through values.
--- Example: math.ring(5, 1, 3) returns 2
---@param v number The value to ring
---@param min number The minimum value
---@param max number The maximum value
---@return number The wrapped value
function math.ring(v, min, max)
  if min > max then
    min, max = max, min
  end
  local result = min + (v - min) % (max - min + 1)
  if result > max then
    return result - max + min
  end
  return result
end

--- math.lerp is a linear interpolation that returns the the number between the two
--- numbers (a, b) at t [0, 1].
--- Example: math.lerp(10, 30, 0.5) returns 20
---@param a number The first number
---@param b number The second number
---@param t number The value between [0, 1]
---@return number The interpolated value
function math.lerp(a, b, t)
  return math.ceil(a * (1 - t) + b * t)
end

--- math.alerp is the inverted linear interpolation that returns the value [0, 1]
--- between two numbers (a, b) at v
--- Example: math.alerp(10, 30, 20) returns 0.5
---@param a number The first number
---@param b number The second number
---@param v number The value to interpolate
---@return number The interpolated value between [0, 1]
function math.alerp(a, b, v)
  return math.clamp((v - a) / (b - a), 0, 1)
end

--- math.sign returns 1 if the value is positive, -1 if negative.
---@param v number The value to check
---@return number 1 if positive, -1 if negative
function math.sign(v)
  return (v >= 0 and 1) or -1
end

--- math.round rounds a number to the nearest integer, or to the nearest bracket.
--- Example: math.round(1.5) returns 2, math.round(1.5045, 0.1) returns 1.5
--- @param v number The value to round
--- @param bracket number The bracket to round to, defaults to 1
--- @return number The rounded value
function math.round(v, bracket)
  bracket = bracket or 1

  -- path for additional precision
  if bracket < 1 then
    bracket = 1 // bracket
    local half = (v >= 0 and 0.5) or -0.5
    return (v * bracket + half) // 1 / bracket
  end

  local half = (v >= 0 and bracket / 2) or -bracket / 2
  return ((v + half) // bracket) * bracket
end

--- math.approach returns a value that approaches the target value by a step. It
--- returns a tuple of the new value and a boolean indicating whether the target
--- has been reached.
--- Example: math.approach(1, 10, 3) returns (4, false)
---@param v number The current value
---@param target number The target value
---@param step number The step to approach the target
---@return number The new value
---@return boolean True if the target has been reached, false otherwise
function math.approach(v, target, step)
  if v == target then
    return v, true
  end

  local d = target - v
  if d > 0 then
    v = v + step
    if v >= target then
      return target, true
    else
      return v, false
    end
  elseif d < 0 then
    v = v - step
    if v <= target then
      return target, true
    else
      return v, false
    end
  else
    return v, true
  end
end
