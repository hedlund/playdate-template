local pd <const> = playdate
local gfx <const> = pd.graphics

Hello = {}
class("Hello").extends(Room)

function Hello:update()
  gfx.clear()
  gfx.drawText("Hello World", 20, 20)
end

function Hello:BButtonUp()
  manager:push(Pause())
end
