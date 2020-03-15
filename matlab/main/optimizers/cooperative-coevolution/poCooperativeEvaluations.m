function subX = poCooperativeEvaluations(subX, optimalSolution, subDimension)
% Cooperative function evaluations.
%
% Input ->
%   subX            : all the individuals of a subpopulation, specified as
%                     a `SubDimension`-by-`subPopulationSize` matrix.
%   optimalSolution : the best-so-far solution, specified as a column
%                     vector of length `dimension`.
%   subDimension    : original dimension indexes of a subpopulation,
%                     specified as an integer vector.
% Output <-
%   subX : all the updated individuals of the subpopulation after being
%          combined with the best-so-far solution, specified as a
%          `dimension`-by-`subPopulationSize` matrix
optimalX = repmat(optimalSolution, 1, size(subX, 2));
optimalX(subDimension, :) = subX;
subX = optimalX;
end
