function es = poGetConvergenceCurve(es)
% Get convergence curve of function evaluations in descending order.
%
% Input ->
%   es : function evaluations, specified as a vector.
% Output <-
%   es : function evaluations in descending order, specified as a vector.
for i = 1 : (numel(es) - 1)
    if es(i) < es(i + 1)
        es(i + 1) = es(i);
    end
end
