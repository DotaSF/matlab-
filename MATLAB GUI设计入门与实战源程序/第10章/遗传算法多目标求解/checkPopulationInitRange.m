function options = checkPopulationInitRange(lb,ub,options)
% 该函数检测 PopInitRange个体初始范围，保证在lb~ub之间

% 个体取值范围Range 为一个 (2 x nvars) 矩阵
lowerRange = options.PopInitRange(1,:)';  % 下限
upperRange = options.PopInitRange(2,:)';  % 上限

% 每一个变量的取值长度，上限-下限
rangeExtent = abs(upperRange - lowerRange);

% 取值范围上下限是否为一个有限值，即有限边界
finiteLB = isfinite(lb);
finiteUB = isfinite(ub);

if ~options.UserSpecPopInitRange
    % Because the user didn't specify PopInitRange, options.PopInitRange
    % has the default range for the given problem-type. 
    
    % Ranges given bound values where finite, and default range values
    % otherwise. 
    lowerRange(finiteLB) = lb(finiteLB);
    upperRange(finiteUB) = ub(finiteUB);
    
    % In the case of 1-sided bounds, set opposite range to the finite bound
    % offset by the span of default range. NOTE: this guarantees
    % consistency in the range.
    onlyLbFinite = finiteLB & (~finiteUB);
    onlyUbFinite = finiteUB & (~finiteLB);
    upperRange(onlyLbFinite) = lowerRange(onlyLbFinite) + rangeExtent(onlyLbFinite);
    lowerRange(onlyUbFinite) = upperRange(onlyUbFinite) - rangeExtent(onlyUbFinite);
else
    % If user has given an initial range (which must be finite). Check this
    % for consistency with the bounds, and correct where needed.
    % NOTE: at this point both the bounds and PopInitRange have been
    % checked for consistency separately.
    lowerRangeViolatesLB = lowerRange < lb;
    lowerRange(lowerRangeViolatesLB) = lb(lowerRangeViolatesLB);
    
    % If entire range is greater than the ub, attempt to shift range to end
    % at ub. If the lower range is then smaller than the lb, move the lower
    % range to lb.
    lowerRangeViolatesUB = lowerRange > ub;
    upperRange(lowerRangeViolatesUB) = ub(lowerRangeViolatesUB);
    lowerRange(lowerRangeViolatesUB) = max(lb(lowerRangeViolatesUB), ...
        ub(lowerRangeViolatesUB) - rangeExtent(lowerRangeViolatesUB));
    
    upperRangeViolatesUB = upperRange > ub;
    upperRange(upperRangeViolatesUB) = ub(upperRangeViolatesUB);
    % If entire range is less than the lb, attempt to shift range to start
    % at lb. If the upper range is then greater than the ub, move it back
    % to the ub.
    upperRangeViolatesLB = upperRange < lb;
    lowerRange(upperRangeViolatesLB) = lb(upperRangeViolatesLB);    
    upperRange(upperRangeViolatesLB) = min(ub(upperRangeViolatesLB), ...
        lb(upperRangeViolatesLB) + rangeExtent(upperRangeViolatesLB));
end

options.PopInitRange = [lowerRange';upperRange'];

