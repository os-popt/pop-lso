# Pure Random Search (PRS)

**Open source code of PRS**: [poPureRandomSearch.m](https://github.com/os-popt/pop-lso/blob/master/matlab/main/optimizers/random-search/poPureRandomSearch.m)

## Input

* **problemParameters**: problem parameters, specified as a structure scalar with the following *six fields*:

  * **name**: problem name, specified as a character vector or a string scalar.
  
  * **dimension**: problem dimension, specified as a positive integer scalar.
  
  * **upperBounds**: upper bounds for all candidate solutions (individuals) *during search*, specified as a column vector of length `dimension`.
  
  * **lowerBounds**: lower bounds for all candidate solutions (individuals) *during search*, specified as a column vector of length `dimension`. If no value is specified, then the default is `-upperBounds`.
  
  * **initialUpperBounds**: initial upper bounds of individuals *when starting search*, specified as a column vector of length `dimension`. If no value is specified, then the default is `upperBounds`.
  
  * **initialLowerBounds**: initial lower bounds of individuals *when starting search*, specified as a column vector of length `dimension`. If no value is specified, then the default is `lowerBounds`.

* **optimizerOptions**: optimizer options, specified as a structure scalar with the following *five fields*:

  * **maximumEvaluations**: maximum of function evaluations, specified as a positive integer scalar.
  
  * **seedPopulation**: random seed for the population initialization, specified as a non-negative integer scalar.
  
  * **maximumRuntime**: maximum of allowable runtime (seconds), specified as a positive integer scalar. If no value is specified, then the default is `Inf`.
  
  * **thresholdFitness**: stopping threshold of the best-so-far fitness, specified as a scalar. If no value is specified, then the default is `-Inf`.
  
  * **populationSize**: population size, specified as a positive integer scalar. If no value is specified, then the default is `1000`.

At least two optimizer options (i.e., `maximumEvaluations` and `seedPopulation`) should be set **explicitly** while all other optimizer options can be used *by default*.

Given the same maximum of function evaluations, different settings of `populationSize` lead to different execution time. When vectorization can be used to accelerate the function evaluations of population, a *relatively large* population size may be preferred, e.g., on some common benchmark functions.

The code [poCheckPureRandomSearch.m](https://github.com/os-popt/pop-lso/blob/master/matlab/main/optimizers/random-search/poCheckPureRandomSearch.m) is used to initialize and check the settings of the above two input parameters (i.e., two structure objects).

## Output

* **searchResults**: final search results, specified as a structure scalar with the following *ten fields*:

  * **optimalFitness**: the best-so-far fitness (objective function value) found,  specified as a scalar.
  
  * **optimalSolution**: the best-so-far solution (individual) found, specified as a column vector of size `dimension`. Its fitness should equal `optimalFitness`.
  
  * **numberEvaluations**: number of used function evaluations, specified as a positive integer scalar.
  
  * **numberIterations**: number of used iterations (generations), specified as a positive integer scalar.
  
  * **timeEvaluations**: time used for function evaluations, specified as a positive scalar.
  
  * **evaluations**: all fitness generated during the entire optimization procedure, specified as a row vector of size `numberEvaluations`.
  
  * **stoppingFlag**: stopping flag, specified as a character vector. It should be `'maximumEvaluations'`, `'maximumRuntime'`, or `'thresholdFitness'`.
  
  * **problemParameters**:  used problem parameters, specified as a structure scalar.
  
  * **optimizerOptions**: used optimizer options, specified as a structure scalar.
  
  * **runtime**: runtime of the entire optimization procedure, specified as a positive scalar. It should be absolutely greater than `timeEvaluations`.

## Description

PRS adopts the **uniform distribution** to randomly sample all candidate solutions (individuals) in the box-constrained search space.

PRS is one of the *oldest* and *simplest* search methods for black-box optimization and it is often chosen as a **baseline** for further extensions, improvements, and variations.

Although **No Free Lunch Theorems for Optimization** always hold under the *uniform* problem distributions assumption, generally we should not expect that PRS could achieve a *competitive* search performance for *real-world* large-scale black-box optimization problems, owing to its **sample inefficiency**.

## Example

```MATLAB
tic;
rng(2020);
problemParameters = poSetProblemParameters('poRosenbrock', 1000, 100);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 1;
optimizerOptions.maximumEvaluations = 5000 * problemParameters.dimension;
searchResults = poPureRandomSearch(problemParameters, optimizerOptions);
disp(searchResults.optimalFitness); % 1.5829e+12
disp(searchResults.numberEvaluations); % 5000000
disp(searchResults.stoppingFlag); % maximumEvaluations
semilogy(searchResults.evaluations, 'm.'); % here not smooth the convergence curve
xlabel('Number of function evaluations');
ylabel('Objective function value (minimized)');
title('Convergence Curve of PRS on 1000-d Rosenbrock');
toc;
```

## Reference

* Brooks, S.H., 1958. A discussion of random methods for seeking maxima. Operations Research, 6(2), pp.244-251. - [pdf](https://pubsonline.informs.org/doi/abs/10.1287/opre.6.2.244) -

* Mania, H., Guy, A. and Recht, B., 2018. Simple random search of static linear policies is competitive for reinforcement learning. In Advances in Neural Information Processing Systems (pp. 1800-1809). - [pdf](http://papers.nips.cc/paper/7451-simple-random-search-of-static-linear-policies-is-competitive-for-reinforcement-learning) -
