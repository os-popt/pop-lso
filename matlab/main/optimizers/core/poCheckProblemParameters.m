function [problemParameters, ...
    name, dimension, ...
    upperBounds, lowerBounds, ...
    initialUpperBounds, initialLowerBounds] = ...
    poCheckProblemParameters(problemParameters)
% Check whether all problem parameters are set properly.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
% Output <-
%   problemParameters  : problem parameters, specified as a structure scalar.
%   name               : problem name, specified as a character vector or a string scalar.
%   dimension          : problem dimension, specified as a positive integer scalar.
%   upperBounds        : upper bounds for all individuals during search,
%                        specified as a column vector of length dimension.
%   lowerBounds        : lower bounds for all individuals during search,
%                        specified as a column vector of length dimension.
%   initialUpperBounds : initial upper bounds for all individuals when starting search,
%                        specified as a column vector of length dimension.
%   initialLowerBounds : initial lower bounds for all individuals when starting search,
%                        specified as a column vector of length dimension.
if ~poIsProblemType(problemParameters)
    error('the input `problemParameters` should be a structure scalar.');
end

% name
if ~isfield(problemParameters, 'name')
    error('`name` should be a field of the input `problemParameters`.');
end
% if ~poIsProblemName(problemParameters.name)
%     error('`name` should be a character vector or a string scalar.');
% end

% dimension
if ~isfield(problemParameters, 'dimension')
    error('`dimension` should be a field of the input `problemParameters`.');
end
if ~poIsPositiveIntegerScalar(problemParameters.dimension)
    error('`dimension` should be a positive integer scalar.');
end

% upperBounds + lowerBounds + initialUpperBounds + initialLowerBounds
if ~isfield(problemParameters, 'upperBounds')
    error('`upperBounds` should be a field of the input `problemParameters`.');
end
if ~isfield(problemParameters, 'lowerBounds')
    error('`lowerBounds` should be a field of the input `problemParameters`.');
end
if ~isfield(problemParameters, 'initialUpperBounds')
    problemParameters.initialUpperBounds = problemParameters.upperBounds;
end
if ~isfield(problemParameters, 'initialLowerBounds')
    problemParameters.initialLowerBounds = problemParameters.lowerBounds;
end
poCheckSearchBounds(problemParameters.dimension, ...
    problemParameters.upperBounds, problemParameters.lowerBounds, ...
    problemParameters.initialUpperBounds, problemParameters.initialLowerBounds);

% output
if nargout > 1
    name = problemParameters.name;
    dimension = problemParameters.dimension;
    upperBounds = problemParameters.upperBounds;
    lowerBounds = problemParameters.lowerBounds;
    initialUpperBounds = problemParameters.initialUpperBounds;
    initialLowerBounds = problemParameters.initialLowerBounds;
end
end
