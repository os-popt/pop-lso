function searchResults = poCooperativeCoevolution(problemParameters, optimizerOptions)
% Cooperative Co-Evolution.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
%   optimizerOptions  : optimizer options, specified as a structure scalar.
% Output <-
%   searchResults : search results, specified as a structure scalar.
startTime = tic;

% load and check problem parameters
[problemParameters, name, ~, upperBounds, lowerBounds] = ...
    poCheckProblemParameters(problemParameters);

% load and check optimizer options
[optimizerOptions, maximumEvaluations, maximumRuntime, thresholdFitness, ...
    ~, partitionStrategy, subOptimizerOptions] = ...
    poCheckCooperativeCoevolution(problemParameters, optimizerOptions);

% initialize population (i.e., X)
X = poInitializePopulation(problemParameters, optimizerOptions);

% initialize fitness (i.e., y)
startEvaluations = tic;
y = feval(name, X(:, 1));
timeEvaluations = toc(startEvaluations);
numberEvaluations = 1;
evaluations = y;

% initialize the best-so-far fitness and solution
optimalFitness = y;
optimalSolution = X(:, 1);

% iteratively optimize
timeSubOptimizers = 0;
numberSubOptimizers = 0;
numberIterations = 0;
stoppingFlag = 'maximumEvaluations';
while numberEvaluations < maximumEvaluations
    if toc(startTime) >= maximumRuntime
        stoppingFlag = 'maximumRuntime';
        break;
    end
    if optimalFitness <= thresholdFitness
        stoppingFlag = 'thresholdFitness';
        break;
    end
    
    % decompose + optimize
    optimizerOptions = feval(partitionStrategy, ...
        problemParameters, optimizerOptions);
    for ps = 1 : length(optimizerOptions.partitionSet)
        if numberEvaluations >= maximumEvaluations
            break;
        end
        if toc(startTime) >= maximumRuntime
            stoppingFlag = 'maximumRuntime';
            break;
        end
        if optimalFitness <= thresholdFitness
            stoppingFlag = 'thresholdFitness';
            break;
        end
        
        p = optimizerOptions.partitionSet{ps};
        if isempty(p)
            error('any partition sub-set should not be empty.');
        end
        
        subProblemParameters = poSetProblemParameters(...
            @(X)(feval(name, poCooperativeEvaluations(X, optimalSolution, p))), ...
            length(p), upperBounds(p), lowerBounds(p));
        
        subOptimizerOptions.maximumEvaluations = min(100 * length(p), ...
            maximumEvaluations - numberEvaluations);
        subOptimizerOptions.thresholdFitness = thresholdFitness;
        if ~isfield(subOptimizerOptions, 'populationSize')
            subOptimizerOptions.populationSize = 4 + floor(3 * log(length(p)));
        end
        subOptimizerOptions.initialPopulation = repmat(...
            optimalSolution(p), 1, subOptimizerOptions.populationSize);
        
        subSearchResults = feval(subOptimizerOptions.name, ...
            subProblemParameters, subOptimizerOptions);
        
        if optimalFitness > subSearchResults.optimalFitness
            optimalFitness = subSearchResults.optimalFitness;
            optimalSolution(p) = subSearchResults.optimalSolution;
        end
        timeEvaluations = timeEvaluations + subSearchResults.timeEvaluations;
        numberEvaluations = numberEvaluations + subSearchResults.numberEvaluations;
        evaluations = cat(2, evaluations, subSearchResults.evaluations);
        timeSubOptimizers = timeSubOptimizers + subSearchResults.runtime;
        numberSubOptimizers = numberSubOptimizers + 1;
    end
    
    numberIterations = numberIterations + 1;
end

% return final search results
searchResults.optimalFitness = optimalFitness;
searchResults.optimalSolution = optimalSolution;
searchResults.numberEvaluations = numberEvaluations;
searchResults.numberIterations = numberIterations;
searchResults.timeEvaluations= timeEvaluations;
searchResults.evaluations = evaluations;
searchResults.stoppingFlag = stoppingFlag;
searchResults.timeSubOptimizers = timeSubOptimizers;
searchResults.numberSubOptimizers = numberSubOptimizers;
searchResults.problemParameters = problemParameters;
searchResults.optimizerOptions = optimizerOptions;
searchResults.runtime = toc(startTime);
end
