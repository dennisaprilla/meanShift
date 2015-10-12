%-------------------------------------
function weights = compute_weights_NG(imPatch, qTarget, pCurrent, Nbins)
w = zeros(size(imPatch));
b = floor(256/Nbins);
matrix_bin = floor(imPatch/b) + 1;

% let's make weight matrix
for u=1:Nbins
    %this if to avoid empty element in bins that can lead into division by zero
    if (sum(sum(matrix_bin==u))~=0)
        whatever = (matrix_bin==u) * sqrt(qTarget(u)/pCurrent(u));
        w = w + whatever;
    end
end
weights = w;

end