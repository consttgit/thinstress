## Thinstress: Residual stress depth profiling in thin films.

[![DOI](https://zenodo.org/badge/19969/consttgit/thinstress.svg)](https://zenodo.org/badge/latestdoi/19969/consttgit/thinstress)

The inverse problem, which arises in the case of space transformations of residual stress *image space* measured by X-ray diffraction into residual stress in *real space*, is nontrivial and closely linked to significant difficulties obtaining a stable solution. Taking into account the scattering of the measurement results and the mathematical model, which describes the space transformations, it is clear that the considered inverse problem is ill-posed and requires special solution methods. Furthermore, a particularity of the transformation of the residual stresses in a multilayer systems is the requirement that the solution is localized in reflecting layers only. This requirement imposes strong restrictions on the solution methods and does not allow one to utilize methods based on the inverse Laplace transform, which is commonly used for the considered space transformations in compact solid materials. Besides, in the case of the solid materials the methods based on the inverse Laplace transform often lead to extremely unstable solutions. The stable numerical solution of the discussed inverse problem can be found using a method based on the Tikhonov regularization. This method can be applied both for solid materials and for thin films offering a possibility to determine stable approximative solutions in form of a piecewise function defined in diffracting layers only. Hereby, the only requirement is that a correct pointwise error estimation of the measured initial data must be available. The advantage of the proposed method is the convergence of the obtained approximative solution to the unknown exact one with decreasing perturbation of the initial data. In addition, this method allows one to find the stable *exact solution* of the considered inverse problem if the initial data satisfy certain constraints.

### Usage

The program was tested using MATLAB, ver. 8.5.0.197613 (R2015a), and GNU Octave, ver. 3.8.1.  Here is a small example on how it could be launched:
```
$ octave
>> cd 'thinstress/'
>> calcStress('yourSample.m')
...
```
The file `sampleTemplate.m` can be used as a template to define a structure array `sample` in `yourSample.m` which describes a multilayered coating system you investigate.  

### License

Copyright (c) 2015 Konstantin Tolstikhin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
