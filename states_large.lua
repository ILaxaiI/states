local function empty() end
local state = {active = "",list = {}}

function state.load(filePath,prepend)
  local i,n = fs.getInfo(filePath)
  if not i or i.type ~= "directory" then error("Specified File Path is not a directory") end
  for _,v in ipairs(fs.getDirectoryItems(filePath)) do
    local nfs = filePath.."/"..v
    local ft = fs.getInfo(nfs).type
    if ft == "directory" then
      state.loadDir(nfs,(prepend ~= false and prepend and prepend .."." or "") .. v)
    elseif ft == "file" then
      v,n = v:gsub(".lua","")
      state.list[(prepend and prepend.."." or "" )..v:gsub(filePath,"")] = n > 0 and require(filePath:gsub("/",".").."."..v) or nil
    end
  end
end

function state.set(name,exit_vars,...)
  state.exit(exit_vars)
  state.active = state.list[name] and name
  state.init(...)
end

return setmetatable(state,{ __index = function(self,key) return self.list[self.active] and self.list[self.active][key] or empty end })


