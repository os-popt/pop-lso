# Rechenberg's (1+1)-Evolution Strategy (ES)

**Open source code of Rechenberg's (1+1)-Evolution Strategy**: [poRechenberg1Plus1EvolutionStrategy.m](https://github.com/os-popt/pop-lso/blob/master/matlab/main/optimizers/evolution-strategies/poRechenberg1Plus1EvolutionStrategy.m)

## Input

* **problemParameters**: problem parameters, specified as a structure scalar.

* **optimizerOptions**: optimizer options, specified as a structure scalar with the following *five fields*:

  * **maximumEvaluations**: maximum of function evaluations, specified as a positive integer scalar.
  
  * **seedPopulation**: random seed for the population initialization, specified as a non-negative integer scalar.
  
  * **maximumRuntime**: maximum of allowable runtime (seconds), specified as a positive integer scalar. If no value is specified, then the default is `Inf`.
  
  * **thresholdFitness**: stopping threshold of the best-so-far fitness, specified as a scalar. If no value is specified, then the default is `-Inf`.
  
  * **stepSize**: step size for mutation, specified as a non-negative scalar. If no value is specified, then the default is `0.01 * min(upperBounds - lowerBounds)`.

At least two optimizer options (i.e., `maximumEvaluations` and `seedPopulation`) should be set **explicitly** while all other optimizer options can be used *by default*.

For Rechenberg's (1+1)-ES, `stepSize` is fixed during the optimization process and no adaptive mechanism is used. In practice, therefore, typically the user needs to fine-tune the setting of `stepSize` for specific optimization problems. For (1+1)-ES, `populationSize` is always set to 1, so the user does not need to set it. Even if set to any other value (not 1) by the user, it will be re-set to 1 by the optimizer itself.

The code [poCheckRechenberg1Plus1EvolutionStrategy.m](https://github.com/os-popt/pop-lso/blob/master/matlab/main/optimizers/evolution-strategies/poCheckRechenberg1Plus1EvolutionStrategy.m) is used to initialize and check the settings of the above two input parameters (i.e., two structure objects).

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

**The canonical (1+1)-ES**, arguably regarded as a kind of *stochastic hill climbing*, was originally proposed by Rechenberg to solve black-box optimization problems, motivated by the biological evolution. In the evolutionary computation community, (1+1)-ES is particularly **of theoretical importance** for the rigorous convergence analysis owing to its simplicity. However, in practice, typically more advanced ES versions (e.g., CMA-ES, LM-CMA, and dd-CMA-ES) are used for large-scale black-box optimization.

The basic idea of (1+1)-ES is very simple from the implementation perspective. In essence, it is just a *stochastic, iterative* search procedure: first initialize one parent randomly; then generate one offspring via adding normally distributed random noises to the parent (that is, mutation); finally select the better one (parent v.s. offspring) based on their fitness. Repeat the above *comparison-based* search procedure until one of termination criteria is met.

## Example

```MATLAB
tic;
rng(2020);
problemParameters = poSetProblemParameters('poRosenbrock', 1000, 100);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 1;
optimizerOptions.maximumEvaluations = 5000 * problemParameters.dimension;
searchResults = poRechenberg1Plus1EvolutionStrategy(problemParameters, optimizerOptions);
disp(searchResults.optimalFitness); % 1.0981e+09
disp(searchResults.numberEvaluations); % 5000000
disp(searchResults.stoppingFlag); % maximumEvaluations
semilogy(searchResults.evaluations, 'm.'); % here not smooth the convergence curve
xlabel('Number of function evaluations');
ylabel('Objective function value (minimized)');
title('Convergence Curve of (1+1)-ES on 1000-d Rosenbrock');
toc;
```

## Reference

* Back, T., Hoffmeister, F. and Schwefel, H.P., 1991, July. A survey of evolution strategies. In Proceedings of the Fourth International Conference on Genetic Algorithms (Vol. 2, No. 9). Morgan Kaufmann Publishers San Mateo, CA. - [pdf](http://delta.cs.cinvestav.mx/~ccoello/compevol/strategy.pdf) -

