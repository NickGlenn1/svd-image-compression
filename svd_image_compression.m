% SVD Image Compression
% Demonstrates image compression using Singular Value Decomposition (SVD)
% and evaluates reconstruction quality using Root Mean Square Error (RMSE).
%
% Tests multiple compression ratios and generates visual comparisons
% showing the tradeoff between compression and image quality.

clear;
clc;
close all;

% Load the original grayscale image matrix
load('source_image.mat');

% Compression ratios to evaluate
compressionRatios = [2, 10, 25, 75];
rmseResults = zeros(size(compressionRatios));
actualRatios = zeros(size(compressionRatios));

% Compress the image at each target ratio and record the results
for i = 1:length(compressionRatios)
        ratio = compressionRatios(i);

        [compressedImage, rmse, actualRatio] = compressImageSVD(A, ratio);

        rmseResults(i) = rmse;
        actualRatios(i) = actualRatio;

        fprintf('Target: %.0f:1 | Actual: %.4f:1 | RMSE: %.4f\n', ...
            ratio, actualRatio, rmse);
        figure;
        imshow(compressedImage);
        title(sprintf('SVD Compression - %.0f:1', ratio));
        exportgraphics(gcf, sprintf('compression_%dto1.png', ratio));

end
      
figure;
plot(actualRatios, rmseResults, '-o');

xlabel('Compression Ratio');
ylabel('RMSE');
title('SVD Compression vs. Reconstruction Error');

grid on;
exportgraphics(gcf, 'compression_vs_rmse.png');