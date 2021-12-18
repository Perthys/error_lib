local CustomErrors = {}
CustomErrors.Errors = {}

getfenv().CustomErrors = CustomErrors; getfenv().Errors = CustomErrors.Errors

CustomErrors.__index = CustomErrors;

local print = print
local error = error

function CustomErrors.new(Info)
    local Name = Info.Name;
    local Syntax = Info.Syntax;
    local ErrorCode = #CustomErrors.Errors + 1;
    local SetErrorInENV = Info.SetErrorInENV or false
    local TerminateThread = Info.TerminateThread or true
    local Callback = Info.Callback or function() return true end

    local self = setmetatable({
      CallBack = Callback;
    }, {
        __index = CustomErrors;
        __tostring = function(self)
            return Name;
        end;
        __call = function(self, ...)
            Callback(Info, {...})
            if TerminateThread then
              return error(("\n\tErrorCode: %s | %s\n\tErrorMessage: "):format(ErrorCode, Name) .. Syntax:format(...))
            else
              return print(("CustomErrors:\n\tErrorCode: %s | %s\n\tErrorMessage: "):format(ErrorCode, Name) .. Syntax:format(...))
            end
        end;
    });

    Errors[Name] = self;
    return self
end

setfenv(1, CustomErrors)

return CustomErrors;
