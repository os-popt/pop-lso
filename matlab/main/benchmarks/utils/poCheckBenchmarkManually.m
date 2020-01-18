function TF = poCheckBenchmarkManually(name, X, y, tol, isShifted)
% Check the benchmark function manually.
%
% Input ->
%   name      : Function name, specified as a character vector or a string scalar.
%   X         : Population, specified as a matrix whose row and column size
%               equal function dimension (F) and population size (P), respectively.
%               Each column of X denotes an independent individual in the population.
%   y         : Fitness, specified as a row vector whose length is population size.
%               Each element of y is the fitness of each individual (column) of X.
%   tol       : Comparison tolerance, specified as a non-negative scalar.
%               If no value is specified, then the default is 1e-12.
%   isShifted : Whether the function is shifted, specified as a boolean scalar.
%               If no value is specified, then the default is false.
% Output <-
%   TF : Returns logical 1 (true) if pass the checking within the toleration.
%        Otherwise, it returns logical 0 (false).
if ~poIsProblemName(name)
    error('the input `name` should be a character vector or a string scalar.');
end

[funcDim, popSize] = size(X);
if ~isvector(y) || (numel(y) ~= popSize)
    error('the input `y` should be a %d-d vector.', popSize);
end
if iscolumn(y)
    y = y';
end

if nargin < 4
    tol = 1e-12;
end

if nargin < 5
    isShifted = false;
end

if isShifted
    if strcmp(name(1 : 9), 'poShifted')
        funcName = [name(1 : 2) name(10 : end)]; % delete `Shifted`
    elseif strcmp(name(1 : 16), 'poRotatedShifted')
        funcName = [name(1 : 2) name(17 : end)]; % delete `RotatedShifted`
    else
        error('support only two refixes: `poShifted` and `poRotatedShifted`');
    end
    poShiftVector = poLoadShiftVector(funcName, funcDim); % [funcDim, 1]
    poShiftVector = repmat(poShiftVector, 1, popSize); % [funcDim, popSize]
    X = X + poShiftVector; % + rather than -
end

TF = true;
functions = {name, ... % accept the funcDim-by-popSize matrix as input
    [name 'FP'], ...   % accept the funcDim-by-popSize matrix as input
    [name 'PF'], ...   % accept the popSize-by-funcDim matrix as input
    [name '_']};       % accept the vector of length popSize as input
for fi = 1 : length(functions)
    func = functions{fi};
    if strcmp(func(end - 1 : end), 'PF')
        if ~poIsMatrixEquality(feval(func, X'), y', tol)
            TF = false;
            return;
        end
    elseif strcmp(func(end), '_')
        for t = 1 : popSize
            if ~poIsMatrixEquality(feval(func, X(:, t)), y(t), tol) || ...
                    ~poIsMatrixEquality(feval(func, X(:, t)'), y(t), tol)
                TF = false;
                return;
            end
        end
    else
        if ~poIsMatrixEquality(feval(func, X), y, tol)
            TF = false;
            return;
        end
    end
end
end
