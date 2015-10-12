%-------------------------------------
function cd = color_distribution(imPatch, Nbins)

% This kind of method below is slower (but not much), because we do loop for each pixel
% b = floor(256/m);
% [row, col] = size(imagePatch);
% 
% centerX = round(col/2);
% centerY = round(row/2);
% longest_distance = sqrt((row-centerX)^2+(col-centerY)^2);
% disp(longest_distance);
% 
% cd=zeros(m,1);
% 
% for  i=1:row
%     for j=1:col
%         my_m = floor(imagePatch(i,j)/b) + 1;
%         distance = sqrt((i-centerX)^2+(j-centerY)^2);
%         normalized_distance = distance/longest_distance;
%         k=(2/pi)*(1-normalized_distance);
%         h(my_m, 1) = h(my_m,1) + k;
%     end
% end
% 
% norm_of_h = norm(h);
% for i=1:m
%     h(i,1)=h(i,1)/norm_of_h;
% end

b = floor(256/Nbins);
matrix_bin = floor(imPatch/b) + 1;
h=zeros(Nbins,1);

% since there is matlab function called bwdist,
% i want to make matrix 0 with 1 in the center,
% so i can calculate the distance of each pixel to the center with bwdist()
% then i should normalized the distance
center_imagePatch = round(size(imPatch)/2);
imagePatch_new = zeros(size(imPatch));
imagePatch_new(center_imagePatch(1), center_imagePatch(2)) = 1;

d_Center = bwdist(imagePatch_new);
dN_Center = (d_Center - min(d_Center(:)))/(max(d_Center(:)) - min(d_Center(:)));
Epanechnikov_profile=(2/pi)*(1-dN_Center);

for u=1:Nbins
    sigma = ((matrix_bin - u)==0);
    whatever = sigma.*Epanechnikov_profile;    %multiplication for each element
    h(u,1) = sum(whatever(:));
end
unit_h = h/norm(h);

cd = unit_h;
end