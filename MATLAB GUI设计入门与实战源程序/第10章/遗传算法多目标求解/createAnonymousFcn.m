function fcn_handle = createAnonymousFcn(fcn,FcnArgs)
%CREATEFUNCTIONHANDLE create an anonymous function handle
%
% fcn: A function handle 
% args: A cell array of extra arguments to user's objective/constraint
% function

fcn_handle = @(x) fcn(x,FcnArgs{:});