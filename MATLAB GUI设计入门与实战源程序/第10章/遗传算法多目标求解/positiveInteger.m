function positiveInteger(property,value)
%positiveInteger any positive integer

valid =  isreal(value) && isscalar(value) && (value > 0) && (value == floor(value));
if(~valid)
   error(message('globaloptim:positiveInteger:notPosInteger', property));
end
