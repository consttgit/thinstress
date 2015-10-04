thinstress
==========

Solution to the ill-posed inverse problem of transforming stress distributions
in thin films from the image- into real space.

What is it?
-----------

Inverse problems, which arise in the case of space transformations of residual
stresses measured by X-ray diffraction, are nontrivial and closely linked to
significant difficulties obtaining a stable solution. These problems are
ill-posed and traditional solution methods that are based on decompositions
such as LU or QR, which could be successfully applied to more common well-posed
problems, in this case will not lead to an appropriate solution. A
particularity of the transformation of residual stresses in multilayered
coating system is the requirement that the solution is localized in reflecting
layers only. This requirement imposes strong restrictions on solution methods
and does not allow using a conventional well known inverse Laplace
transformation which is a continuous function. A stable solution of the
described inverse problem can be found using Tikhonov’s regularization
approach. This approach can be used in case of compact solid materials as well
as in case of thin films and offers a possibility to determine residual
stresses piecewise in diffracting layers only.

How to use it
-------------

The program was tested using GNU Octave, version 3.8.1. Here is a small example
on how it could be launched:
```
$ octave
>> cd 'thinstress/'
>> calcStress('models/sampleLayered.m')
...
```
The file `sampleLayered.m` can be used as a template to define a structure of
the multilayered system you investigate.  

License
-------

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
