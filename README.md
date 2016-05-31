## Thinstress: Residual stress depth profiling in thin films.

[![DOI](https://zenodo.org/badge/19969/consttgit/thinstress.svg)](https://zenodo.org/badge/latestdoi/19969/consttgit/thinstress)

The inverse problem of evaluating residual stresses in real space using residual stresses in image space is considered. This problem is ill-posed and special solution methods are required in order to obtain a stable solution.  Moreover, the real space solution must be localized in reflecting layers only in multilayer systems. This requirement imposes strong restrictions on the solution methods and does not allow one to use methods based on the inverse Laplace transform employed for compact solid materials. Besides, in the case of the solid materials, the use of the inverse Laplace transform often leads to extremely unstable solutions. The stable numerical solution of the discussed inverse problem can be found using a method based on the Tikhonov regularization. Given the measured data and their pointwise error estimation, this method provides stable approximate solutions for both solid materials and thin films in the form of piecewise functions defined solely in diffracting layers. The approximations are shown to converge to the exact function when the noise in the experimental data approaches zero. If the initial data satisfy certain constraints, the method provides a stable, exact solution for the inverse problem.

Tolstikhin, K. and Scholtes, B. (2016) An approach to solving an ill-posed inverse problem of residual stress depth profiling in thin films and compact solid materials. *Journal of Applied Crystallography*. **49**, doi:10.1107/S1600576716007676.

### Usage

The program was tested using MATLAB, ver. 8.5.0.197613 (R2015a), and GNU Octave, ver. 3.8.1.  Here is a small example on how it could be launched:
```
$ octave
>> cd 'thinstress/'
>> calcStress('yourSample.m')
...
```
The file `sampleTemplate.m` can be used as a template to define a structure array `sample` in `yourSample.m` which describes a multilayer system you investigate.

