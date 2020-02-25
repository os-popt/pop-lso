function y = poRotatedShiftedDiffPow_(x)
% Benchmark Function: Rotated Shifted DiffPow.
%
% Input ->
%   x : An individual, specified as a vector.
%       Support both the row and column vector.
%       Not accept as input the population whose size is greater than 1.
% Output <-
%   y : Fitness, specified as a scalar.
if ~isvector(x)
    error('the input should be a vector.');
end
funcDim = numel(x);
if funcDim < 2
    error('`numel(x)` should be greater than 1.');
end
if isrow(x)
    x = x';
end

persistent poRotationMatrix poShiftVector;
if isempty(poRotationMatrix) || any(size(poRotationMatrix) ~= [funcDim funcDim])
    poRotationMatrix = poLoadRotationMatrix('poDiffPow', funcDim);
end
if isempty(poShiftVector) || any(size(poShiftVector) ~= size(x))
    poShiftVector = poLoadShiftVector('poDiffPow', funcDim);
end
y = poDiffPow_(poRotationMatrix * (x - poShiftVector));
end
