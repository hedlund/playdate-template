local pd <const> = playdate
local gfx <const> = pd.graphics

Pause = {}
class("Pause").extends(PauseRoom)

function Pause:update()
  gfx.drawTextAligned("- Paused -", 200, 110, kTextAlignment.center)
end

function Pause:BButtonUp()
  manager:pop()
end
