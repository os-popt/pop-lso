function y = poRotatedShiftedAckley_(x)
% Benchmark Function: Rotated Shifted Ackley.
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
if isrow(x)
    x = x';
end

persistent poRotationMatrix poShiftVector;
if isempty(poRotationMatrix) || any(size(poRotationMatrix) ~= [funcDim funcDim])
    poRotationMatrix = poLoadRotationMatrix('poAckley', funcDim);
end
if isempty(poShiftVector) || any(size(poShiftVector) ~= size(x))
    poShiftVector = poLoadShiftVector('poAckley', funcDim);
end
y = poAckley_(poRotationMatrix * (x - poShiftVector));
end
