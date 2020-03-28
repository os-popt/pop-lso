function TF = poCheckBenchmarkAutomatically(name, tol, start2)
% Check the benchmark function automatically via sampling.
%
% Input ->
%   name   : Function name, specified as a character vector or a string scalar.
%   tol    : Comparison tolerance, specified as a non-negative scalar.
%            If no value is specified, then the default is 1e-12.
%   start2 : Whether or not the dimension starts from 2, specified as a boolean scalar.
%            If no value is specified, then the default is false.
% Output <-
%   TF : Returns logical 1 (true) if pass the checking within the toleration.
%        Otherwise, it returns logical 0 (false).
if ~poIsProblemName(name)
    error('the input `name` should be a character vector or a string scalar.');
end

if nargin < 3
    start2 = false;
end

if nargin < 2
    tol = 1e-12;
end

TF = true;
functions = {name, ... % accept the funcDim-by-popSize matrix as input
    [name 'FP'], ...   % accept the funcDim-by-popSize matrix as input
    [name 'PF'], ...   % accept the popSize-by-funcDim matrix as input
    [name '_']};       % accept the vector of length popSize as input

numSamping = 200;
for s = 1 : numSamping
    if s < 199
        if start2
            X = unifrnd(-5, 5, randi([2 100], [1 2]));
        else
            X = unifrnd(-5, 5, randi(100, [1 2]));
        end
    elseif s == 199
        X = unifrnd(-5, 5, [1e3, randi(1000)]);
    elseif s == 200
        X = unifrnd(-5, 5, [1e4, randi(1000)]);
    end
    [~, popSize] = size(X);
    y = feval(name, X);
    for fi = 2 : length(functions)
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
        elseif strcmp(func(end - 1 : end), 'FP')
            if ~poIsMatrixEquality(feval(func, X), y, tol)
                TF = false;
                return;
            end
        end
    end
end
end
