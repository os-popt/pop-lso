function poCompressSummarySearchResults(problemName, optimizerName)
% Compress a summary of search results.
%
% Input ->
%   problemName   : problem name, specified as a character vector or a string scalar.
%   optimizerName : optimizer name, specified as a character vector or a string scalar.
startTime = tic;

dimensions = [2 10 100 1000 10000];
fileName = sprintf('./%s-%s.mat', problemName, optimizerName);

summarySearchResults = load(fileName);
summarySearchResults = summarySearchResults.summarySearchResults;

for d = 1 : numel(dimensions)
    summarySearchResults{d} = poCompressConvergenceCurve(summarySearchResults{d});
end

save(fileName, 'summarySearchResults', '-v7.3');

fprintf('%s - %s: runtime %7.5e seconds.\n', ...
    problemName, optimizerName, toc(startTime));
end
