function poAutomaticallyCheckBenchmark(name, start2)
% Automatically check the benchmark function.
%
% Input ->
%   name   : Function name, specified as a character vector or a string scalar.
%   start2 : Whether or not the dimension starts from 2, specified as a boolean scalar.
%            If no value is specified, then the default is false.
if nargin < 2
    start2 = false;
end

tols = [1e-12 1e-9 1e-6 1e-3 1e-2 1e-1];
isPass = false;
for t = 1 : numel(tols)
    tol = tols(t);
    if poCheckBenchmarkAutomatically(name, tol, start2)
        isPass = true;
        break;
    end
end
if isPass
    fprintf('%s : pass the automatic checking within the tolerance `%5.2e`.\n', name, tol);
else
    fprintf('%s : NOT pass the automatic checking within the tolerance `%5.2e`.\n', name, tol);
end
end
