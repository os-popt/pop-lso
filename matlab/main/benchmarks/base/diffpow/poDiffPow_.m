function y = poDiffPow_(x)
% Benchmark Function: DiffPow.
%
% Input ->
%   x : An individual, specified as a vector.
%       Support both the row and column vector.
%       Not accept as input the population whose size is greater than 1.
% Output <-
%   y : Fitness, specified as a scalar.
funcDim = numel(x) - 1;
if funcDim < 1
    error('`numel(x)` should be greater than 1.');
end
if iscolumn(x)
    x = x';
end
y = sum(abs(x) .^ (2 + 4 * (0 : funcDim) / funcDim));
end
