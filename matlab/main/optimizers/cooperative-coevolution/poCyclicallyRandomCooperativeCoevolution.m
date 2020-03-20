function searchResults = poCyclicallyRandomCooperativeCoevolution(...
    problemParameters, optimizerOptions)
% Cyclically Random Decomposition based Cooperative Coevolution.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
%   optimizerOptions  : optimizer options, specified as a structure scalar.
% Output <-
%   searchResults : search results, specified as a structure scalar.
optimizerOptions.partitionStrategy = 'poCyclicallyRandomDecomposition';
optimizerOptions.subOptimizerOptions.name = ...
    'poPureCovarianceMatrixAdaptationEvolutionStrategy';
searchResults = poCooperativeCoevolution(problemParameters, optimizerOptions);
end
