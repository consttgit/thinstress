function [A, sample] = preProcessing(sample, sol_length)
% preProcessing - Perform a pre-processing of the initial data.
%
% Synapsis
%   [A, sample] = preProcessing(sample, sol_length)
%
% Description
%   preProcessing is used to:
%     1) define residual stress domain in real space;
%
%     2) interpolate residual stress model in real space (sigma_z_model) with
%        cubic splines if such a model is given;
%
%     3) discretize the initial inverse problem that is posed in form of
%        Fredholm integral equation of the I-st kind;
%
%     4) model residual stress in image space (sigma_tau) if such a model is not
%        provided.
%
% Inputs:
%   (structure) sample      model structure of the multilayered coating system
%   (scalar)    sol_length  the total length of the solution's vector as a sum
%                           of all stress points that correspond to diffracting
%                           layers
%
% Outputs:
%   (matrix)    A           coefficient matrix of the linear equations system
%   (structure) sample      model structure of the multilayered coating system
 
% Authors
%   Konstantin Tolstikhin <k.tolstikhin(at)gmail.com>
%
% License
%   Distributed under the terms of the MIT License. You should have received a
%   copy of the MIT License along with this software. If not, see
%   <http://opensource.org/licenses/MIT/>.

% Summarized thickness of the diffracting layers:
sum_thickness = 0.0;
for i = 1:length(sample.layer)
    if sample.layer(i).diffracting
        sum_thickness = sum_thickness + sample.layer(i).thickness;
    end
end

% Grid step of the solution's depth:
h = sum_thickness / sol_length;

% Summarized layers' thickness:
D = 0.0;
for i = 1:length(sample.layer)
    if sample.layer(i).diffracting
        % Solution's domain:
        depth = D : h : (D + sample.layer(i).thickness);
        % Solution's matrix (1st col: depth, 2nd col: model, 3rd col:
        % approximative solution):
        sample.layer(i).sigma_z = zeros(length(depth), 3);
        sample.layer(i).sigma_z(:, 1) = (depth)';
        sample.layer(i).sigma_z(:, 2) = nan;
        sample.layer(i).sigma_z(:, 3) = nan;
        % Depth grid step:
        sample.layer(i).h = h;
        % Cubic spline interpolation of the residual stress model in real
        % space if given:
        if isfield(sample.layer(i), 'sigma_z_model')
            fprintf('Layer %d: Model residual stress in real space..\n', i);
            if ~length(sample.layer(i).sigma_z_model)
                error('Layer %d: Stress model is not defined.', i);
            end
            % User defined model of the residual stress in real space:
            y = sample.layer(i).sigma_z_model;
            x = linspace(D, D + sample.layer(i).thickness, length(y));
            % Cubic spline interpolation of the model given:
            sample.layer(i).sigma_z(:, 2) = interp1(x, y, depth, 'spline');
        end
    end
    D = D + sample.layer(i).thickness;
    % Transform the linear absorption coefficient cm^(-1) --> mue^(-1):
    sample.layer(i).mue = sample.layer(i).mue / 10000.0;
end

fprintf('Numerical approximation of the Fredholm integral equation..\n');
% Coefficient matrix of the linear equations system:
A = numFredholm(sample, sol_length);

% Generate the corresponding model of the residual stress in the image space
% (initial data) using the stress model in real space (solution) if the initial
% data is not given (NaN):
if all(isnan(sample.sigma_tau(:, 2)))
    fprintf('Model residual stress distribution in image space..\n', i);
    % Model of the residual stress in real space:
    sigma_z = [];
    for i = 1:length(sample.layer)
        if sample.layer(i).diffracting
            if all(isnan(sample.layer(i).sigma_z(:, 2)))
                error('Layer %d: Stress model is not defined.', i);
            end
            sigma_z = [sigma_z; sample.layer(i).sigma_z(:, 2)];
        end
    end
    % Model of the residual stress in image space that is equal to the
    % direct solution of the initial inverse problem:
    sigma_tau = A * sigma_z;
    % Apply a random perturbation that is normally distributed to the model
    % obtained:
    sample.sigma_tau(:, 2) = normrnd(sigma_tau, sample.sigma_tau(:, 3));
end

end
