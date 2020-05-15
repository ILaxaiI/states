local function empty() end
local state = {active = "",list = {}}

function state.load(filePath,name) 
  if state.list[name or filePath] then io.write('Warning, overriding State Module "'..name..'"\n'..debug.traceback().."\n\n") end
  state.list[name or filePath] = require(filePath:gsub("/","."))
  if type(state.list[name or filePath]) == "boolean" then error("No Module returned in "..filePath.."\n") end
end 

function state.set(name,exit_vars,...)
  state.exit(exit_vars)
  state.active = state.list[name] and name
  state.init(...)
end

return setmetatable(state,{ __index = function(self,key) return self.list[self.active] and self.list[self.active][key] or empty end })
