function calcStress(fname, conf)
% calcStress - Calculate residual stresses in diffracting material.
%
% Synapsis
%   calcStress(fname, [conf])
%
% Description
%   calcStress solves the problem of residual stress transformation from image-
%   into real space using a regularization approach that is suitable both for
%   solid materials and for thin films. 
%
% Inputs:
%   (string) fname                file name that contains initial data
%   (string) [conf = 'config.m']  configuration file
 
% Authors
%   Konstantin Tolstikhin <k.tolstikhin(at)gmail.com>
%
% License
%   Distributed under the terms of the MIT License. You should have received a
%   copy of the MIT License along with this software. If not, see
%   <http://opensource.org/licenses/MIT/>.

tic;

if nargin < 2
    conf = 'config.m';
end

args = {fname, conf};
for i = 1:length(args)
    if exist(args{i}, 'file') ~= 2
        error('File %s not found.', args{i});
    end
end

% Load configuration variables into workspace:
run(conf);

% Load initial data (the 'sample' structure) into workspace:
run(fname);

printStructure(sample);

fprintf('Initial data pre-processing..\n');
[A, sample] = preProcessing(sample, cfg.sol_length);

fprintf('Tikhonov regularization..\n');
[y, b] = regTikhonov(A, sample.sigma_tau, cfg.alpha, cfg.disc_prin);

fprintf('Results post-processing..\n');
sample = postProcessing(sample, y, b, fname);

t = toc;
t_min = floor(t / 60);
t_sec = mod(t, 60);
fprintf('Done. %d min %.2f sec\n', t_min, t_sec);

plotResults(sample);

end
