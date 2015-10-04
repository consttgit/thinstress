% config - Configuration variables for the Tikhonov regularization.
 
% Authors
%   Konstantin Tolstikhin <k.tolstikhin(at)gmail.com>
%
% License
%   Distributed under the terms of the MIT License. You should have received a
%   copy of the MIT License along with this software. If not, see
%   <http://opensource.org/licenses/MIT/>.

% Discrepancy principle used to choose the regularization parameter:
% 'pointwise' or 'uniform'
cfg.disc_prin = 'pointwise';

% Length of the solution's vector:
cfg.sol_length = 250;

% Regularization parameter, alpha_i = alpha_zero * factor^i, i = 0..length:
cfg.alpha.zero   = 0.05;  % initial value > 0
cfg.alpha.mult   = 0.9;   % 0 < multiplier < 1
cfg.alpha.length = 150;   % length of the parameter's vector > 0
