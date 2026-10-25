function [compressedImage, rmse, actualRatio] = compressImageSVD(A, compressionRatio)
% compressImageSVD Compresses a grayscale image using low-rank SVD.
%
% Inputs:
%   A                - Original grayscale image matrix
%   compressionRatio - Desired compression ratio
%
% Outputs:
%   compressedImage  - Reconstructed compressed image
%   rmse             - Root Mean Square Error compared with original
%   actualRatio      - Actual compression ratio achieved
[m, n] = size(A);

% Calculate the rank needed for the target compression ratio
k = round((m * n) / (compressionRatio * (m + n + 1)));

% Compute the Singular Value Decomposition
[U, S, V] = svd(double(A), 'econ');

% Reconstruct the image using only the first k singular components
compressedA = U(:, 1:k) * S(1:k, 1:k) * V(:, 1:k)';

compressedImage = uint8(round(compressedA));

rmse = norm(double(A) - double(compressedImage), 'fro') / sqrt(m * n);

actualRatio = (m * n) / (k * (m + n + 1));

end