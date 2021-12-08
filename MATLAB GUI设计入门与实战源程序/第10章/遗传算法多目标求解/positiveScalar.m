function positiveScalar(property,value)
%positiveScalar any positive scalar

valid =  isreal(value) && isscalar(value) && (value > 0);
if(~valid)
    error(message('globaloptim:positiveScalar:notPosScalar', property));
end
