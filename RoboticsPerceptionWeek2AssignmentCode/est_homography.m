function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE
H = [];
A = [];

for i = 1:4
   x = video_pts(i,1);
   y = video_pts(i,2);
   x_x1 = video_pts(i,1)*logo_pts(i,1);
   y_x1 = video_pts(i,2)*logo_pts(i,1);
   x1 = logo_pts(i,1);
   x_y1 = video_pts(i,1)*logo_pts(i,2);
   y_y1 = video_pts(i,2)*logo_pts(i,2);
   y1 = logo_pts(i,2);
   
   a_x = [-x -y -1 0 0 0 x_x1 y_x1 x1];
   a_y = [0 0 0 -x -y -1 x_y1 y_y1 y1];
   A = [A; a_x; a_y];
end

[U, S, V] = svd(A);
H = reshape(V(:,end), [3,3]);
H = transpose(H);

end

