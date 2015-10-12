%-------------------------------------
%this is a comment
function z = compute_meanshift_vector(imagePatch, ROI_Center, weights)
% g is minus derivative of k
% since k = (2/pi)*(1-x), then the derivative is -2/pi
g = -2/pi;

% let's compute z
% numerator = (imagePatch.*weights)*g;
% denominator = imagePatch.*weights;
% z = sum(numerator(:)) / sum(denominator(:));

sum_x = 0;
sum_y = 0;
whatever = weights*g;
denominator = sum(whatever(:));

for x=1:size(imagePatch,1)
    for y=1:size(imagePatch,2)
        sum_x = sum_x + (x*g)*weights(x,y);
        sum_y = sum_y + (y*g)*weights(x,y);
    end
end

coordinate = ROI_Center - size(imagePatch)/2;
% z = [coordinate; sum_x/denominator, sum_y/denominator; coordinate(1) + sum_x/denominator, coordinate(2) + sum_y/denominator];
z = coordinate + [sum_x/denominator, sum_y/denominator];

end
