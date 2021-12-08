function [handle,args] = functionHandleOrCell(property,value)
%functionHandleOrCell A function Handle or a cell array starting with a function
%handle.

[handle,args] = isFcn(value);

if ~isempty(handle)
    return
elseif strcmp(property,'NonconFcn')
    error(message('globaloptim:functionHandleOrCell:needFunctionHandleConstr'));
else
    error(message('globaloptim:functionHandleOrCell:needFunctionHandle', property));
end