## thinstress

Solution to the ill-posed inverse problem of the residual stress depth
profiling in thin films and compact solid materials.

### What is it?

The inverse problem, which arises in the case of space transformations of
residual stress in image space measured by X-ray diffraction into residual
stress in real space, is nontrivial and closely linked to significant
difficulties obtaining stable solutions. Taking into account the scattering of
the measurement data and the mathematical model describing these
transformations, it is clear that the considered inverse problem is ill-posed
and requires special methods in order to obtain the stable solution.
Furthermore, a particularity of the transformation of residual stresses in
multilayered coating systems is the requirement that the solution is localized
in reflecting layers only. This requirement imposes strong restrictions on
solution methods and does not allow one to use a conventional well known
inverse Laplace transformation which results in a continuous function. The
stable numerical solution of the described inverse problem can be found using
the Tikhonov regularization. This approach can be used in case of compact solid
materials as well as in case of thin films offering a possibility to determine
residual stresses piecewise in diffracting layers only. In additon, this method
allows one to find the *exact solution* of the considered inverse problem,
if some conditions concerning the measurement data are satisfied.

### How to use it

The program was tested using MATLAB, ver. 8.5.0.197613 (R2015a), and GNU
Octave, ver. 3.8.1. Here is a small example on how it could be launched:
```
$ octave
>> cd 'thinstress/'
>> calcStress('models/sampleLayered.m')
...
```
The file `sampleLayered.m` can be used as a template to define a structure of
the multilayered system you investigate.  

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
