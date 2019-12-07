local meta={}
local state = setmetatable({},meta)
local States = {}

local function empty() end
function meta:__index(key)
  if States[self.active] and States[self.active][key] then 
    return States[self.active][key]
  end
  return empty
end

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

