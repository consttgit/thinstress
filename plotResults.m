function plotResults(sample)
% plotResults - Plot calculated residual stress profiles.
%
% Synopsis
%   plotResults(sample)
%
% Description
%   plotResults displays the residual stress in image space (initial data) and
%   the residual stress-depth profile in real space (calculated results).
%
% Inputs
%   (structure) sample  model structure of the multilayer system
 
% Authors
%   Konstantin Tolstikhin <k.tolstikhin(at)gmail.com>
%
% License
%   Distributed under the terms of the MIT License. You should have received a
%   copy of the MIT License along with this software. If not, see
%   <http://opensource.org/licenses/MIT/>.

figure;
fontsize = 14;

subplot(1, 2, 1);
title('Residual stress in image space (initial data)', ...
      'fontsize', fontsize);
xlabel('Distance from surface {\tau} [{\mu}m]', ...
       'fontsize', fontsize);
ylabel('Residual stress {\sigma}({\tau}) [MPa]', ...
       'fontsize', fontsize);
% Set fontsize for the numbers on axes:
set(gca, 'fontsize', fontsize);

box on;
grid on;

hold on;
% Stress in image space (initial data):
errorbar(sample.sigma_tau(:, 1), ...
         sample.sigma_tau(:, 2), ...
         2.0 * sample.sigma_tau(:, 3), ...
         2.0 * sample.sigma_tau(:, 3), ...
         'bo');

% Pseudo-initial data (projection of the regularized solution onto the
% initial data space):
plot(sample.sigma_tau(:, 1), ...
     sample.sigma_tau(:, 4), ...
     '^', 'markeredgecolor', 'k', 'markerfacecolor', 'r');

legend('Initial data {\sigma}({\tau})', ...
       'Pseudo-initial data {\sigma}_{\alpha}({\tau})', ...
       'location', 'SouthEast');

plot(sample.sigma_tau(:, 1), ...
     sample.sigma_tau(:, 2), ...
     'o:', 'markeredgecolor', 'k', 'markerfacecolor', 'b');
hold off;

subplot(1, 2, 2);
title('Residual stress in real space (solution)', ...
      'fontsize', fontsize);
xlabel('Distance from surface z [{\mu}m]', ...
      'fontsize', fontsize);
ylabel('Residual stress {\sigma}(z) [MPa]', ...
      'fontsize', fontsize);
% Set fontsize for the numbers on axes:
set(gca, 'fontsize', fontsize);

box on;
grid on;

hold on;
% Plot stress profiles:
D = 0.0;
for i = 1:length(sample.layer)
    if sample.layer(i).diffracting
        % Regularized solution:
        p(1) = plot(sample.layer(i).sigma_z(:, 1), ...
                    sample.layer(i).sigma_z(:, 3), ...
                    'r-', 'linewidth', 2);
        % Solution model:
        p(2) = plot(sample.layer(i).sigma_z(:, 1), ...
                    sample.layer(i).sigma_z(:, 2), ...
                    'b-', 'linewidth', 2);
    end
    D = D + sample.layer(i).thickness;
end

% Show absorbing layers:
D = 0.0;
for i = 1:length(sample.layer)
    if ~sample.layer(i).diffracting
        ylim = get(gca, 'ylim');
        vertices = [D                             ylim(1);
                    D                             ylim(2);
                    D + sample.layer(i).thickness ylim(2);
                    D + sample.layer(i).thickness ylim(1)];
        p(3) = fill(vertices(:, 1), vertices(:, 2), 'c');
    end
    D = D + sample.layer(i).thickness;
end

names = {'Solution {\sigma}_{\alpha}(z)', ...
         'Model of the solution {\sigma}(z)', ...
         'Absorbing layers'};

legend(p, names, 'location', 'SouthEast');
hold off;

end
