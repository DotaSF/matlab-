function realUnitScalar(property,value)
%realUnitScalar A scalar on the interval [0,1]

valid = isreal(value) && isscalar(value) && (value >= 0) && (value <= 1);
if(~valid)
    error(message('globaloptim:realUnitScalar:notScalarOnUnitInterval', property));
end