# states
handles love gamestates  
You simply have to call 
require("states")

the gamestates can be loaded by state.load("filepath")
or buy adding a require in the State table.

youll need to add
state.draw(),update,mousepressed.. to your love functions manually.

if you need a callback i forgot or you just want more, just add its name as a string to the functions table.
a function with that name containing checks for wether or not that function exists in the current state will be auto generated for you


state.set("statename")
will then handle the rest.

you can also add more vars to this, it will look for a .init function and call it with varargs
