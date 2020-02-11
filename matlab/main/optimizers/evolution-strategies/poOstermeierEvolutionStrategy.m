function searchResults = poOstermeierEvolutionStrategy(...
    problemParameters, optimizerOptions)
% Ostermeier's evolution strategy.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
%   optimizerOptions  : optimizer options, specified as a structure scalar.
% Output <-
%   searchResults : search results, specified as a structure scalar.
%
% Reference:
%   Ostermeier, A., Gawelczyk, A. and Hansen, N., 1994.
%   A derandomized approach to self-adaptation of evolution strategies.
%   Evolutionary Computation, 2(4), pp.369-380.
startTime = tic;

% load and check problem parameters
[problemParameters, name, dimension, upperBounds, lowerBounds] = ...
    poCheckProblemParameters(problemParameters);

% load and check optimizer options
[optimizerOptions, maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize] = poCheckOstermeierEvolutionStrategy(...
    problemParameters, optimizerOptions);

% initialize population (i.e., x)
X = poInitializePopulation(problemParameters, optimizerOptions);

% initialize fitness (i.e., y)
startEvaluations = tic;
y = feval(name, X);
timeEvaluations = toc(startEvaluations);
numberEvaluations = populationSize;
evaluations = y;

% initialize `optimalSolution` and `optimalFitness`
[optimalFitness, optimalFitnessIndex] = min(y);
optimalSolution = X(:, optimalFitnessIndex);

% initialize step-size for all individuals
stepSize = ones(dimension, 1);
globalVariation = Inf * ones(populationSize, 1); % global step-size variation
mutation = Inf * ones(dimension, populationSize); % normally distributed mutation

% iteratively optimize
numberIterations = 1;
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
    
    % mutate the best-so-far solution (1. creation of offspring)
    for k = 1 : populationSize
        if rand(1) > 1 / 2
            globalVariation(k) = 1.4;
        else
            globalVariation(k) = 1 / 1.4;
        end
        mutation(:, k) = normrnd(zeros(dimension, 1), 1);
        X(:, k) = optimalSolution + globalVariation(k) * stepSize .* mutation(:, k);
        outOfBound = (X(:, k) > upperBounds) | (X(:, k) < lowerBounds);
        if any(outOfBound)
            X(outOfBound, k) = unifrnd(lowerBounds(outOfBound), upperBounds(outOfBound));
        end
    end
    
    % evaluate fitness of new sample (i.e., y)
    startEvaluations = tic;
    y = feval(name, X);
    timeEvaluations = timeEvaluations + toc(startEvaluations);
    numberEvaluations = numberEvaluations + populationSize;
    evaluations = cat(2, evaluations, y);
    
    % update `optimalSolution` and `optimalFitness` (2. selection)
    [newFitness, newFitnessIndex] = min(y);
    if optimalFitness >= newFitness
        optimalFitness = newFitness;
        optimalSolution = X(:, newFitnessIndex);
        optimalFitnessIndex = newFitnessIndex;
    end
    
    % update step-size (2. adaptation)
    stepSize = (globalVariation(optimalFitnessIndex) ^ sqrt(1 / dimension)) * ...
        (exp(abs(mutation(:, optimalFitnessIndex)) - sqrt(2 / 3.14)) .^ (1 / dimension)) .* ...
        stepSize;
    
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
searchResults.problemParameters = problemParameters;
searchResults.optimizerOptions = optimizerOptions;
searchResults.runtime = toc(startTime);
end
