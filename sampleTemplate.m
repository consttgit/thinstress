% Template of the 'sample' structure array which describes a multilayer
% coating system (MLS).

% Authors
%   Konstantin Tolstikhin <k.tolstikhin(at)gmail.com>
%
% License
%   Distributed under the terms of the MIT License. You should have received a
%   copy of the MIT License along with this software. If not, see
%   <http://opensource.org/licenses/MIT/>.

% Numbering of the layers starts from surface to the substrate in an ascending
% order. The term 'mue' denotes a linear absorbing coefficient of the layer
% material given in cm^(-1). Note that the diffracting material remains to be
% the same for all diffracting layers, which is obvious, whereas absorbing
% layers can be of different material types. Layer thickness is given in
% micrometres.
%
% Note that the model of the residual stress in real space 'sigma_z_model' is
% required only if measured stress in image space 'sigma_tau' is not given (set
% to 'nan'). The values of the vector 'sigma_z_model' are uniformly distributed
% over the entire layer thickness.
i = 1;
sample.layer(i).material = 'for example, TiAlN';
sample.layer(i).diffracting = true;
sample.layer(i).thickness = <value>;
sample.layer(i).mue = <value>;
sample.layer(i).sigma_z_model = [<value> <value> ... <value>];
i = 2;
sample.layer(i).material = 'for example, Ti';
sample.layer(i).diffracting = false;
sample.layer(i).thickness = <value>;
sample.layer(i).mue = <value>;
i = 3;
...

% Measured residual stress 'sigma_tau' (stress in image space):
%
% The 'stress' column can be set to 'nan'. In this case the model of the
% residual stress in real space 'sigma_z_model' must be defined within each i-th
% diffracting layer in order to generate the 'stress' column.
sample.sigma_tau = [
%   depth    stress  sigma (standard deviation)
    <value>  nan     <value>
    <value>  nan     <value>
    ...
    <value>  nan     <value>
];
