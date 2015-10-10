function [A] = numFredholm(sample, sol_length)
% numFredholm - Numerical discretization of the Fredholm integral equation.
%
% Synopsis
%   [A] = numFredholm(sample, sol_length)
%
% Description
%   numFredholm performs a numerical discretization of the Fredholm integral
%   equation of the I-st kind using the rectangle method.
%
% Inputs:
%   (structure) sample       model structure of the multilayered coating system
%   (scalar)    sol_length   the total length of the solution's vector as a sum
%                            of all stress points that correspond to deffracting
%                            layers
%
% Outputs:
%   (matrix)    A            coefficient matrix of the linear equations system
 
% Authors
%   Konstantin Tolstikhin <k.tolstikhin(at)gmail.com>
%
% License
%   Distributed under the terms of the MIT License. You should have received a
%   copy of the MIT License along with this software. If not, see
%   <http://opensource.org/licenses/MIT/>.

% Absorption coefficient of the diffracting layer:
mue_d = nan;
for i = 1:length(sample.layer)
    if sample.layer(i).diffracting
        mue_d = sample.layer(i).mue;
        break;
    end
end

% Coefficient matrix of the linear equations system:
A = [];

for i = 1:size(sample.sigma_tau, 1)
    % Summarized layers' thickness:
    D = 0.0;
    row = [];
    for j = 1:length(sample.layer)
        if sample.layer(j).diffracting
            % Step of the depth grid:
            h = sample.layer(j).h;
            % Solution's domain in the current diffracting layer:
            Z = 0 : h : sample.layer(j).thickness;
            for k = 1:length(Z)
                z = Z(k);
                tau = sample.sigma_tau(i, 1);
                row(end+1) = exp(-(D + z) / tau);
            end
            % Add the real thickness of the layer:
            D = D + sample.layer(j).thickness;
        else
            % Add the equivalent thickness of the layer:
            D = D + sample.layer(j).mue * sample.layer(j).thickness / mue_d;
        end
    end
    row = row / sum(row);
    A = [A; row];
end

end
