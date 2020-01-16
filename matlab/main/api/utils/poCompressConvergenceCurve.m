function searchResults = poCompressConvergenceCurve(searchResults, numberSamples)
% Compress convergence curve.
%
% Input ->
%   searchResults : search results, specified as a structure scalar.
%   numberSamples : number of samples, specified as a positive integer scalar.
%                   If no value is specified, then the default is 1e4.
% Output <-
%   searchResults : search results after compressing, specified as a structure scalar.
if nargin < 2
    numberSamples = 1e4;
end

evaluations = poGetConvergenceCurve(searchResults.evaluations);
numberEvaluations = numel(evaluations);

if numberEvaluations <= numberSamples
    evaluations = cat(1, 1 : numberEvaluations, evaluations);
else
    interval = ceil(numberEvaluations / numberSamples);
    samplingIndex = 0 : interval : numberEvaluations;
    samplingIndex(1) = 1;
    if samplingIndex(end) < numberEvaluations
        samplingIndex = cat(2, samplingIndex, numberEvaluations);
    end
    evaluations = cat(1, samplingIndex, evaluations(samplingIndex));
end

searchResults.evaluations = evaluations;
end
