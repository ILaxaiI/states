local meta={}
local state = setmetatable({},meta)
local States = {}

local function createCallback(v)
  return function(...)
    if States[state.active] and States[state.active][v] then 
      States[state.active][v](...)
    end
  end
end

function meta:__index(key)
  self[key] = createCallback(key)
  return self[key]
end

--alternatively manually require the scene to the States table
function state.load(filePath,name)
  local err
  err,States[name or filePath] = pcall(require,filePath)
  return err
end

function state.set(name,...)
  if States[name] or state.load(name) then
    if States[name].init then States[name].init(...) end
    state.active = name
  end
end

function state.getStates()
  return States
end

return state
