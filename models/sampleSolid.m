% Copyright (c) 2015, Konstantin Tolstikhin <k.tolstikhin{at}gmail.com>

% Model of the residual stress in image space (measured stress: sigma_tau).
%
% Note that if the solution's model (layer(n).sigma_z_model) is given, then the
% stress values must be set to NaN as they will be generated using real stress
% models which are given within each diffracting layer.
sample.sigma_tau = [
%   depth   stress  sigma (standard deviation)
    0.2     nan     6.
    1.0     nan     7.
    1.5     nan     5.
    2.5     nan     4.
    3.5     nan     3.
    4.5     nan     5.
    5.5     nan     4.
    6.5     nan     3.
    8.0     nan     3.
    10.0    nan     4.
];

% Model of the solid material sample. Note that the sample consists just of the
% one single layer. The term 'mue' denotes a linear absorbing coefficient of
% the layer material given in cm^(-1). Layer thickness is given in micrometres.
%
% Note that the model of the residual stress in real space (sigma_z_model) is
% required only if stress in image space is not given. The model stress is a
% vector whose values are uniformly distributed over the entire layer's width.
n = 1;
sample.layer(n).material = 'TiAlN';
sample.layer(n).diffracting = true;
sample.layer(n).thickness = 20;
sample.layer(n).mue = 774;
sample.layer(n).sigma_z_model = [-1000. 350. 320. 120. 10. 5. 0.];
