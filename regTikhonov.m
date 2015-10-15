function [y_alpha, b_alpha] = regTikhonov(A, b, alpha, disc_prin)
% regTikhonov - Find the regularized solution to the ill-posed inverse problem.
%
% Synapsis
%   [y_alpha, b_alpha] = regTikhonov(A, b, alpha, disc_prin)
%
% Description
%   regTikhonov solves the given linear equations system Ay = b using the
%   Tikhonov's regularization approach.
%
% Inputs
%   (matrix)    A          coefficient matrix of the linear equations system
%   (matrix)    b          right-side matrix of the system (columns from left to
%                          right: variable, function, standard deviation of the
%                          function values)
%   (structure) alpha      regularization parameter
%   (string)    disc_prin  discrepancy principle used to choose the
%                          regularization parameter: 'pointwise' or 'uniform'
%
% Outputs
%   (vector)    y_alpha    regularized solution
%   (vector)    b_alpha    regularized pseudo-initial data
 
% Authors
%   Konstantin Tolstikhin <k.tolstikhin(at)gmail.com>
%
% License
%   Distributed under the terms of the MIT License. You should have received a
%   copy of the MIT License along with this software. If not, see
%   <http://opensource.org/licenses/MIT/>.

% m - length of the initial data vector,
% n - length of the soluton vector
[m, n] = size(A);

% Regularized solution:
y_alpha = zeros(n, 1);
% Regularized pseudo-initial data (projection of the regularized solution
% onto the initial data space):
b_alpha = zeros(m, 1);

% Euclidean norm of the initial data error. Note that error range of the
% input data set to 4*sigma which corresponds to the 95.45% of values
% expected:
err = 4.0 * b(:, 3);
err_norm = norm(err);

fprintf('Define Euler equation of the 2nd order..\n');

% Calculate a linear space of possible stable solutions of the ill-posed inverse
% problem solving the Tikhonov's equation (Euler equation of the II-nd order):
% (alpha*I + A^T*A)*y_alpha = A^T*b
ATA = transpose(A) * A;
ATb = transpose(A) * b(:, 2);

% Define regularization parameters which will be used to calculate a space
% of the approximative stable solutions:
alphas = alpha.zero * alpha.mult.^[0:alpha.length];

fprintf('Define vector space of the regularized solutions..\n');

% Hilbert finite dimensional vector space of the regularized solutions:
sol_found = false;
for i = 1:alpha.length
    % Solve Euler equation of the II-nd order:
    alphaI = alphas(i) * eye(n);

    % QR-factorization:
    [Q, R] = qr(alphaI + ATA);
    % Solution of the integral equation:
    y_alpha = R \ (transpose(Q) * ATb);

    % Regularized pseudo-initial data:
    b_alpha = A * y_alpha;

    % Check if the obtained solution confirms the pointwise discrepancy
    % principle:
    discrepancy_uniform = norm(b_alpha - b(:, 2));
    
    if discrepancy_uniform < err_norm
        if strcmp(disc_prin, 'pointwise')
            discrepancy_pointwise = abs(b_alpha - b(:, 2));
            if any(discrepancy_pointwise > (err / 2.0))
                continue;
            else
                fprintf('Found parameter using pointwise DP: ');
                sol_found = true;
                alpha_i = i;
                break;
            end
        elseif strcmp(disc_prin, 'uniform')
            fprintf('Found parameter using uniform DP: ');
            sol_found = true;
            alpha_i = i;
            break;
        else
            error('Not appropriate configuration option: %s', disc_prin);
        end
    end
end

if ~sol_found
    if alpha.length == 1
        fprintf('Using predefined parameter: ');
        alpha_i = 1;
    else
        error('Regularization: No solution has been found.');
    end
end

fprintf('alpha(%d) = %e\n', alpha_i, alphas(alpha_i));

end
