import "CoreLibs/graphics"

import "init"

local pd <const> = playdate
local gfx <const> = pd.graphics

manager = Manager()
manager:hook()

local function init()
  manager:enter(Hello())
end

function playdate.update()
  gfx.sprite.update()
  pd.timer.updateTimers()

  manager:emit("update")
end

init()
