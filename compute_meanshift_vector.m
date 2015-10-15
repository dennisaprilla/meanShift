%-------------------------------------
function z = compute_meanshift_vector(imPatch, prev_center, weights)
[h,w] = size(imPatch);
coordinate = [prev_center(1)-w/2 prev_center(2)-h/2];

% g is minus derivative of k
% since k = (2/pi)*(1-x), then the derivative is -2/pi
% g = -2/pi;

% x = zeros(size(imPatch));
% for i=1:size(imPatch,2)sum_x/denominator, sum_y/denominator
%     x(:,i) = (i-1)+coordinate(1);
% end
% my_x = x.*weights;
% sum_x = sum(my_x(:));
% 
% y = zeros(size(imPatch));
% for i=1:size(imPatch,1)
%     y(i,:) = (i-1)+coordinate(2);
% end
% my_y = y.*weights.*g;
% sum_y = sum(my_y(:));

[x,y] = meshgrid(coordinate(1):1:w+coordinate(1)-1, coordinate(2):1:h+coordinate(2)-1);
% let's compute z
% numerator = (imagePatch.*weights)*g;
% denominator = imagePatch.*weights;
% z = sum(numerator(:)) / sum(denominator(:));

% sum_x = 0;
% sum_y = 0;
% for i=1:size(imPatch,1)
%     for j=1:size(imPatch,2)
%         pixel_weight = weights(x,y);
%         sum_x = sum_x + (coordinate(1)+x)*g*pixel_weight;
%         sum_y = sum_y + (coordinate(2)+y)*g*pixel_weight;
%     end
% end

% x = zeros(size(imPatch));
% y = zeros(size(imPatch));
% for i=1:size(imPatch,1)
%     for j=1:size(imPatch,2)
%         x(i,j) = coordinate(1)+i;
%         y(i,j) = coordinate(2)+j;
%     end
% end
% sum_x = sum(sum(x.*weights.*g));
% sum_y = sum(sum(y.*weights.*g));

x_mass = sum(sum(x.*weights /sum(sum(weights))));
y_mass = sum(sum(y.*weights /sum(sum(weights))));

% z = [coordinate; sum_x/denominator, sum_y/denominator; coordinate(1) + sum_x/denominator, coordinate(2) + sum_y/denominator];
z = [x_mass, y_mass];

end
