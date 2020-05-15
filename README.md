# states
handles gamestates  

You simply have to call 
require("states")

the gamestates can be loaded by state.load("filepath",(name))

the module will call State[state.active][key] whenever you attempt to call state[key]
if your state has no function at [key] , it will call an empty function instead

state.set("statename",<last state exit vars>,...)
will then handle the rest.

# states_large
Löve only

the only difference to the other version is:
state.load takes a path to a folder instead. every .lua file in that and its subdirectories will be loaded.
the names will be "subfolder.filename", this can be changed to only be filename by adding false as a 2nd argument to when loading
