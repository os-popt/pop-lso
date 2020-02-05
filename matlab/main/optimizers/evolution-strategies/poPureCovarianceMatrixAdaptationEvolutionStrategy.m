function searchResults = poPureCovarianceMatrixAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions)
% Pure covariance matrix adaptation evolution strategy.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
%   optimizerOptions  : optimizer options, specified as a structure scalar.
% Output <-
%   searchResults : search results, specified as a structure scalar.
%
% Reference:
%   http://cma.gforge.inria.fr/purecmaes.m
%   http://cma.gforge.inria.fr/cmaes_sourcecode_page.html#matlab
% Copyright:
%   Nikolaus Hansen
%   http://www.cmap.polytechnique.fr/~nikolaus.hansen/
startTime = tic;

% load and check problem parameters
[problemParameters, name, dimension, upperBounds, lowerBounds] = ...
    poCheckProblemParameters(problemParameters);

% load and check optimizer options
[optimizerOptions, ...
    maximumEvaluations, maximumRuntime, thresholdFitness, ...
    populationSize, stepSize, ...
    B, D, C, timeEig, numberEig] = ...
    poCheckPureCovarianceMatrixAdaptationEvolutionStrategy(...
    problemParameters, optimizerOptions);

% initialize population (i.e., X)
X = poInitializePopulation(problemParameters, optimizerOptions);

% initialize `optimalSolution` and `optimalFitness`
optimalSolution = X(:, 1);
startEvaluations = tic;
optimalFitness = feval(name, optimalSolution);
timeEvaluations = toc(startEvaluations);
evaluations = optimalFitness;
numberEvaluations = 0; % NOTE that it is not set to 1 (a negligible inconsistency)

% strategy parameter setting for Selection
mu = populationSize / 2; % number of parents for recombination
weights = log(mu + 1 / 2) - log(1 : mu)'; % recombination weights
mu = floor(mu);
weights = weights / sum(weights); % normalized recombination weights
muEff = sum(weights) ^ 2 / sum(weights .^ 2);

% strategy parameter setting for Adaptation
%   for cumulation for covariance matrix
cc = (4 + muEff / dimension) / (dimension + 4 + 2 * muEff / dimension);
cs = (muEff + 2) / (dimension + muEff + 5);  % for cumulation for stepSize
c1 = 2 / ((dimension + 1.3) ^ 2 + muEff); % for rank-one update
%   for rank-mu update
cmu = min(1 - c1, 2 * (muEff - 2 + 1 / muEff) / ((dimension + 2) ^ 2 + muEff));
%   for stepSize
damps = 1 + 2 * max(0, sqrt((muEff - 1) / (dimension + 1)) - 1) + cs;

% initialize dynamic strategy parameters
pc = zeros(dimension, 1); % evolution path for covariance matrix
ps = zeros(dimension, 1); % evolution path for stepSize

ISC = B * diag(D .^ -1) * B';
trackBD = 0; % track update of B and D
chiDimension = dimension ^ 0.5 * (1 - 1 / (4 * dimension) + 1 / (21 * dimension ^ 2));

% iteratively optimize
xMean = optimalSolution;
stoppingFlag = 'maximumEvaluations';
numberIterations = 0;
while numberEvaluations < (maximumEvaluations - 1) % a negligible inconsistency
    if toc(startTime) >= maximumRuntime
        stoppingFlag = 'maximumRuntime';
        break;
    end
    
    if optimalFitness <= thresholdFitness
        stoppingFlag = 'thresholdFitness';
        break;
    end
    
    % generate mutated samples (i.e., X)
    for k = 1 : populationSize
        X(:, k) = xMean + stepSize * B * (D .* randn(dimension, 1));
        outOfBound = (X(:, k) > upperBounds) | (X(:, k) < lowerBounds);
        if any(outOfBound)
            X(outOfBound, k) = unifrnd(lowerBounds(outOfBound), upperBounds(outOfBound));
        end
    end
    
    % evaluate fitness of new samples (i.e., y)
    startEvaluations = tic;
    y = feval(name, X);
    timeEvaluations = timeEvaluations + toc(startEvaluations);
    numberEvaluations = numberEvaluations + populationSize;
    evaluations = cat(2, evaluations, y);
    
    % sort and compute weighted mean
    [y, ySortIndex] = sort(y);
    xMeanBak = xMean;
    xMean = X(:, ySortIndex(1 : mu)) * weights; % weighted recombination
    
    % update optimalSolution + optimalFitness
    if optimalFitness > y(1)
        optimalFitness = y(1);
        optimalSolution = X(:, ySortIndex(1));
    end
    
    % update evolution paths (cumulation)
    ps = (1 - cs) * ps + ...
        sqrt(cs * (2 - cs) * muEff) * ISC * (xMean - xMeanBak) / stepSize;
    hsig = sum(ps .^ 2) / (1 - (1 - cs) ^ (2 * numberEvaluations / ...
        populationSize)) / dimension < 2 + 4 / (dimension + 1);
    pc = (1 - cc) * pc + ...
        hsig * sqrt(cc * (2 - cc) * muEff) * (xMean - xMeanBak) / stepSize;
    
    % adapt covariance matrix
    muDiff = (1 / stepSize) * (X(:, ySortIndex(1 : mu)) - repmat(xMeanBak, 1, mu));
    C = (1 - c1 - cmu) * C + ...
        c1 * (pc * pc' + (1 - hsig) * cc * (2 - cc) * C) + ... % rank-one update
        cmu * muDiff * diag(weights) * muDiff'; % rank-mu update
    
    % adapt step size
    stepSize = stepSize * exp((cs / damps) * (norm(ps) / chiDimension - 1));
    
    % update B and D from C -> to achieve O(dimension ^ 2)
    if numberEvaluations - trackBD > populationSize / (c1 + cmu) / dimension / 10
        trackBD = numberEvaluations;
        startEig = tic;
        C = triu(C) + triu(C, 1)'; % enforce symmetry
        if any(isnan(C(:))) || any(isinf(C(:)))
            stoppingFlag = 'any(isnan(C(:))) || any(isinf(C(:)))';
            break;
        end
        [B, D] = eig(C);
        D = sqrt(diag(D)); % standard deviations
        ISC = B * diag(D .^ -1) * B';
        timeEig = timeEig + toc(startEig);
        numberEig = numberEig + 1;
    end
    
    numberIterations = numberIterations + 1;
    
    if max(D) > 1e7 * min(D)
        stoppingFlag = 'max(D) > 1e7 * min(D)';
        break;
    end
end

% return final search results
searchResults.optimalFitness = optimalFitness;
searchResults.optimalSolution = optimalSolution;
searchResults.numberEvaluations = numberEvaluations + 1; % a negligible inconsistency
searchResults.numberIterations = numberIterations;
searchResults.timeEvaluations= timeEvaluations;
searchResults.evaluations = evaluations;
searchResults.stoppingFlag = stoppingFlag;
searchResults.numberEig = numberEig;
searchResults.timeEig = timeEig;
searchResults.problemParameters = problemParameters;
searchResults.optimizerOptions = optimizerOptions;
searchResults.runtime = toc(startTime);
end
