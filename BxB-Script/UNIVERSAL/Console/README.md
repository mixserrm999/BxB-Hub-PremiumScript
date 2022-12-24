I have always disliked Synapse's documentation on rconsole functions so i made a list of rconsole functions and a brief description of each function.


rconsoleprint allows you to print a message to the console. To use it, you need to provide a string as the argument. The string can contain any message you want to print to the console.

#Code:
```lua
rconsoleprint("Hello, World!")
```
This will print the message "Hello, World!" to the console.

rconsoleinfo function

This function works similar to the rconsoleprint function, but it adds a "info" prefix to the message. This can be useful for printing informational messages to the console.

Here's an example of how you can use the rconsoleinfo function:

#Code:
```lua
rconsoleinfo("This is an informational message.")
```
This will print the message "Info: This is an informational message." to the console.

rconsolewarn function

This function works similar to the rconsoleprint function, but it adds a "warning" prefix to the message. This can be useful for printing warning messages to the console.

Here's an example of how you can use the rconsolewarn function:
#Code:
```lua
rconsolewarn("This is a warning message.")
```
This will print the message "Warning: This is a warning message." to the console.

rconsoleerr function

This function works similar to the rconsoleprint function, but it adds an "error" prefix to the message. This can be useful for printing error messages to the console.

Here's an example of how you can use the rconsoleerr function:

#Code:
```lua
rconsoleerr("This is an error message.")
```
This will print the message "Error: This is an error message." to the console.

rconsoleclear function

This function allows you to clear the console. It doesn't take any arguments and doesn't return any value.

Here's an example of how you can use the rconsoleclear function:

#Code:
```lua
rconsoleclear()
```
This will clear the console.

rconsolename function

This function allows you to set the title of the console. It takes a string as the argument, which should be the title you want to set.

Here's an example of how you can use the rconsolename function:

#Code:
```lua
rconsolename("My Console")
```
This will set the title of the console to "My Console".

rconsoleinput function

This function allows you to get input from the user. It doesn't take any arguments and returns a string, which is the input provided by the user.

Here's an example of how you can use the rconsoleinput function:
#Code:
```lua
local input = rconsoleinput()
rconsoleprint("You entered: " .. input)
```
This will prompt the user to enter some input, and then it will print the input to the console.

Here is a basic command system to show how these functions can work together

# Code:
```lua
while true do
  -- Prompt the user to enter a command
  rconsoleprint("Enter a command:")
  local input = rconsoleinput()

  -- Split the input into a list of arguments
  local args = {}
  for arg in string.gmatch(input, "%S+") do
    table.insert(args, arg)
  end

  -- Get the command from the first argument
  local command = args[1]

  if command == "print" then
    -- Print the rest of the arguments to the console
    for i = 2, #args do
      rconsoleprint(args[i])
    end
  elseif command == "info" then
    -- Print the rest of the arguments as an info message
    local message = table.concat(args, " ", 2)
    rconsoleinfo(message)
  elseif command == "warn" then
    -- Print the rest of the arguments as a warning message
    local message = table.concat(args, " ", 2)
    rconsolewarn(message)
  elseif command == "error" then
    -- Print the rest of the arguments as an error message
    local message = table.concat(args, " ", 2)
    rconsoleerr(message)
  elseif command == "clear" then
    -- Clear the console
    rconsoleclear()
  elseif command == "title" then
    -- Set the title of the console
    local title = table.concat(args, " ", 2)
    rconsolename(title)
  else
    -- Print an error message if the command is unknown
    rconsoleerr("Unknown command: " .. command)
  end
end
```

print: Print the rest of the arguments to the console
info: Print the rest of the arguments as an info message
warn: Print the rest of the arguments as a warning message
error: Print the rest of the arguments as an error message
clear: Clear the console
title: Set the title of the console
