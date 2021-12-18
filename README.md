# error_lib
making strawberrys mad with unnecessary error handling

Example

```lua
local a = CustomErrors.new({
  Name = "DICK_LIMIT_REACHED";
  Syntax = "Got %s dicks, Maximum %s";
  TerminateThread = true;
  Callback = function(Info, Error)
      print("aaaaa")
  end
}) 

Errors.DICK_LIMIT_REACHED(100, 100)
```
