# Competitive Swarm Optimizer (CSO)

**Open source code of CSO**: [poCompetitiveSwarmOptimizer.m](https://github.com/os-popt/pop-lso/blob/master/matlab/main/optimizers/particle-swarm-optimizers/poCompetitiveSwarmOptimizer.m)

## Input

* **problemParameters** : problem parameters, specified as a structure scalar.

* **optimizerOptions**: optimizer options, specified as a structure scalar with the following *six fields*:

  * **maximumEvaluations**: maximum of function evaluations, specified as a positive integer scalar.
  
  * **seedPopulation**: random seed for the population initialization, specified as a non-negative integer scalar.
  
  * **maximumRuntime**: maximum of allowable runtime (seconds), specified as a positive integer scalar. If no value is specified, then the default is `Inf`.
  
  * **thresholdFitness**: stopping threshold of the best-so-far fitness, specified as a scalar. If no value is specified, then the default is `-Inf`.
  
  * **populationSize**: population size, specified as a positive integer scalar. It should be an even number.
  
  * **factor**: factor of social learning, specified as a non-negative scalar.

At least two optimizer options (i.e., `maximumEvaluations` and `seedPopulation`) should be set **explicitly** while all other optimizer options can be used *by default*.

The efficiency of CSO is sensitive to the hyper-parameter settings, in particular `populationSize` and `factor`. See [the original IEEE-TCYB paper](https://ieeexplore.ieee.org/abstract/document/6819057/) for more detailed analyses. Although the default settings of both `populationSize` and `factor` are *empirically* given, they may need to be **fine-tuned** for specific large-scale black-box optimization problems.

The code [poCheckCompetitiveSwarmOptimizer.m](https://github.com/os-popt/pop-lso/blob/master/matlab/main/optimizers/particle-swarm-optimizers/poCheckCompetitiveSwarmOptimizer.m) is used to initialize and check the settings of the above two input parameters (i.e., two structure objects).

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

CSO was proposed by Cheng and Jin, and it was published on [IEEE-TCYB](https://ieeexplore.ieee.org/abstract/document/6819057/) in 2015. Inspired by the particle swarm optimizer, CSO introduced a **pairwise competition mechanism** for large-scale black-box optimization, which is *conceptually very simple*. See [the original IEEE-TCYB paper](https://ieeexplore.ieee.org/abstract/document/6819057/) for more details.

As pointed out in the original paper, generally CSO is not guaranteed to converge to the optimum *even in one-dimensional cases*.

## Note (Comparing with the Original Implementation)

There is an *official* MATLAB implementation for CSO available online, which was written by the original authors. You can download it from [this link](http://www.soft-computing.de/jin-pub_year.html#2015).

Owing to the *ad-hoc* nature of the official MATLAB implementation, this toolbox `pop-lso` **re-wrote** the MATLAB source code, with the following three main differences:

* It is easier to read, understand, and use *under a unified interface*, when compared to the original implementation.

* For *consistency*, the `dimension`-by-`populationSize` matrix is used to store and manipulate the population, while in the original implementation the `populationSize`-by-`dimension` matrix was chosen.

* The original boundary control strategy (i.e., *stopping in the boundary once out of boundary*) is replaced by a more natural boundary control strategy (i.e., *random re-initialization once out of boundary*). However, random re-initialization typically leads to more execution time, as compared to the original strategy.

To ensure the **correctness** as much as possible, [two comparative expeirments](https://github.com/os-popt/pop-lso/blob/master/matlab/test/optimizers/particle-swarm-optimizers/competitive-swarm-optimizer/poCompetitiveSwarmOptimizeTest.m) were conducted. Welcome to check/add them.

## Example

```MATLAB
tic;
rng(2020);
problemParameters = poSetProblemParameters('poRosenbrock', 1000, 100);
optimizerOptions = struct();
optimizerOptions.seedPopulation = 1;
optimizerOptions.maximumEvaluations = 5000 * problemParameters.dimension;
searchResults = poCompetitiveSwarmOptimizer(problemParameters, optimizerOptions);
disp(searchResults.optimalFitness); % 1.1172e+03
disp(searchResults.numberEvaluations); % 5000000
disp(searchResults.stoppingFlag); % maximumEvaluations
semilogy(searchResults.evaluations, 'm.'); % here not smooth the convergence curve
xlabel('Number of function evaluations');
ylabel('Objective function value (minimized)');
title('Convergence Curve of CSO on 1000-d Rosenbrock');
toc;
```

## Reference

* Cheng, R. and Jin, Y., 2015. A competitive swarm optimizer for large scale optimization. *IEEE Transactions on Cybernetics*, 45(2), pp.191-204. - [pdf](https://ieeexplore.ieee.org/abstract/document/6819057/) | [MATLAB](http://www.soft-computing.de/CSO_Matlab_New.zip) | [C](http://www.soft-computing.de/CSO_C.zip) -

