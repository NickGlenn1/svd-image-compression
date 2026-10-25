SVD Image Compression

A MATLAB project exploring image compression using Singular Value Decomposition (SVD) and measuring reconstruction quality using Root Mean Square Error (RMSE).

The project demonstrates how a large image matrix can be approximated using a smaller number of singular components while preserving much of the original image quality.

How It Works

An image can be represented as a matrix of pixel values. Singular Value Decomposition factors that matrix into:

A = UΣVᵀ

By retaining only the first k singular components, the image can be reconstructed using a lower-rank approximation.

This project:

1. Performs SVD on a grayscale image matrix.
2. Calculates the rank needed for a target compression ratio.
3. Reconstructs the image using the selected singular components.
4. Calculates RMSE between the original and reconstructed images.
5. Compares image quality across several compression ratios.

Results

Target Compression	Actual Compression	RMSE
2:1	2.0000:1	3.1664
10:1	10.0127:1	8.2127
25:1	25.0318:1	12.3020
75:1	76.2875:1	18.2650

As compression increases, fewer singular components are retained and reconstruction error increases.

For this image, approximately 10:1 compression provided a strong balance between compression and visual quality.

Compression vs. Reconstruction Error

Example Reconstructions

2:1 Compression

10:1 Compression

25:1 Compression

75:1 Compression

Project Structure

* compressImageSVD.m — Reusable function that performs the low-rank SVD reconstruction and calculates RMSE and compression ratio.
* svd_image_compression.m — Main experiment script that tests multiple compression ratios and generates the results.
* compression_*to1.png — Reconstructed images at different compression levels.
* compression_vs_rmse.png — Visualization of the relationship between compression and reconstruction error.

Technical Note

The reported compression ratio estimates the storage required for the truncated SVD factors compared with the original image matrix. The exported PNG files are provided for visualization and do not represent the calculated SVD storage ratio.

Skills Demonstrated

* MATLAB
* Singular Value Decomposition
* Low-rank matrix approximation
* Image processing
* RMSE error analysis
* Data visualization
* Functions and modular programming
* Applied linear algebra

Future Improvements

* Add support for user-selected image files
* Extend the algorithm to RGB color images
* Compare RMSE with additional image-quality metrics
* Optimize the implementation by reusing the SVD across multiple compression ratios
