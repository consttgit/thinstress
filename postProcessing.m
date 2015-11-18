function [sample] = postProcessing(sample, y, b, fname)
% postProcessing - Perfom a post-processing of the results.
% 
% Synapsis
%   [sample] = postProcessing(sample, y, b, fname)
%
% Description
%   postProcessing assigns solution points to the corresponded diffracting
%   layers and saves results to the following files:
%     1) [fname].res  contains the calculated residual stress in real space
%     2) [fname].dat  contains the initial and pseudo initial data - residual
%                     stress in image space
%
% Inputs
%   (structure) sample  model structure of the multilayered coating system
%   (vector)    y       integral solution (stress in diffracting layers)
%   (vector)    b       regularized pseudo-initial data
%   (string)    fname   file name
%
% Outputs
%   (structure) sample  model structure of the multilayered coating system with
%                       the solution added
 
% Authors
%   Konstantin Tolstikhin <k.tolstikhin(at)gmail.com>
%
% License
%   Distributed under the terms of the MIT License. You should have received a
%   copy of the MIT License along with this software. If not, see
%   <http://opensource.org/licenses/MIT/>.

% Add the regularized pseudo-initial data to the initial data:
sample.sigma_tau = [sample.sigma_tau, b];

% Split the regularized solution vector into the corresponded diffracting
% layers:
for i = 1:length(sample.layer)
    if sample.layer(i).diffracting
        for j = 1:size(sample.layer(i).sigma_z, 1)
            sample.layer(i).sigma_z(j, 3) = y(1);
            y = y(2:end);
        end
    end
end

% Save results:
[dir, name] = fileparts(fname);

results = fullfile(dir, [name, '.res']);
fprintf('Write results to: %s, ', results);

file = fopen(results, 'w');
fprintf(file, 'z\tsigmaZmodel\tsigmaZ\n');

for i = 1:length(sample.layer)
    if sample.layer(i).diffracting
        for j = 1:size(sample.layer(i).sigma_z, 1)
            fprintf(file, '%e\t%e\t%e\n', ...
                sample.layer(i).sigma_z(j, 1), ...
                sample.layer(i).sigma_z(j, 2), ...
                sample.layer(i).sigma_z(j, 3));
        end
        fprintf(file, '\n');
    end
end

fclose(file);

results = fullfile(dir, [name, '.dat']);
fprintf('%s\n', results);

file = fopen(results, 'w');
fprintf(file, 'tau\tsigmaTau\tstd\tsigmaTauPseudo\n');

for i = 1:size(sample.sigma_tau, 1)
    fprintf(file, '%e\t%e\t%e\t%e\n', sample.sigma_tau(i, 1), ...
                                      sample.sigma_tau(i, 2), ...
                                      sample.sigma_tau(i, 3), ...
                                      sample.sigma_tau(i, 4));
end

fclose(file);

end
