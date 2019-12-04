--uncomment the things if you also implemented my gui lib
--local gui = require("gui")

local state = {}
local States = {}

do 
local functions = {
        "draw",
        "update",
        "mousepressed",
        "mousereleased",
        "mousemooved",
        "keypressed",
      }

  -- auto generate functions for the scenes because im lazy
  for _,v in ipairs(functions) do
    if not state[v] then
    
      state[v] = function(...)
        if state.active and States[state.active] and States[state.active][v] then 
          States[state.active][v](...)
        end

      end
    
    end  
  end
end


--alternatively manually require the scene to the scenes table
function state.load(filePath,name)
  States[name or filePath] = require(filePath)
end

function state.set(name,...)
  if States[name] then
    if States[name].init then States[name].init(...) end
    state.active = name
  end
end

function state.getStates()
  return States
end



return state
