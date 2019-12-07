# states

handles gamestates  

You simply have to call 
require("states")

the gamestates can be loaded by state.load("filepath",(name))
or buy adding a require in the State table.

the module will call State[state.active][key] whenever you attempt to call state.key
if your state has no function at key , it will call an empty function instead to avoid erroring

state.set("statename",...)
will then handle the rest.
