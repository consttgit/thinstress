function printStructure(sample)
% printStructure - Print layers' structure of the multilayer system.
%
% Synapsis
%   printStructure(sample)
%
% Description
%   printStructure shows the order and the quantity of the absorbing and
%   diffracting layers in the investigated multilayer system.
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

fprintf('Structure of the multilayer system:\n');
fprintf('---- surface ----\n');
for i = 1:length(sample.layer)
    fprintf('%d. %-8s (%-6.2f mue) ', i, ...
                                     sample.layer(i).material, ...
                                     sample.layer(i).thickness);
    if sample.layer(i).diffracting
        fprintf('diffracting\n');
    else
        fprintf('absorbing\n');
    end
end
fprintf('--- substrate ---\n');

end
