clc;
clear;
close all;

DH_alpha = [-90, 0, 90, -90, 90, 0];
DH_a = [0, 431.8, -20.32, 0, 0, 0];
DH_d = [671.83, 139.7, 0, 431.8, 0, 56.5];

num_steps = 350;
q1_path = linspace(-160, 160, num_steps);
q2_path = linspace(-100, 30, num_steps);
q3_path = linspace(10, 150, num_steps) .* cos(linspace(0, 3*pi, num_steps));
q4_path = zeros(1, num_steps);
q5_path = zeros(1, num_steps);
q6_path = zeros(1, num_steps);

fig = figure('Name', 'Robotic Arm Simulation', 'Color', 'white');
view(3);
grid on;
axis equal;
xlim([-1000 1000]);
ylim([-1000 1000]);
zlim([0 1500]);
xlabel('X Coordinate (mm)');
ylabel('Y Coordinate (mm)');
zlabel('Z Coordinate (mm)');
title('PUMA 560: Real-time Workspace Tracking');

handle_arm = plot3(0, 0, 0, '-o', 'LineWidth', 3, 'MarkerSize', 6, 'MarkerFaceColor', 'y', 'Color', 'b');
handle_trace = animatedline('Color', 'r', 'LineWidth', 1.5, 'Marker', '.');

for k = 1:num_steps
    theta_current = [q1_path(k), q2_path(k), q3_path(k), q4_path(k), q5_path(k), q6_path(k)];
    T_mat = eye(4);
    joints_coords = zeros(7, 3);
    
    for i = 1:6
        ct = cosd(theta_current(i));
        st = sind(theta_current(i));
        ca = cosd(DH_alpha(i));
        sa = sind(DH_alpha(i));
        a_i = DH_a(i);
        d_i = DH_d(i);
        
        A_matrix = [ct, -st*ca, st*sa, a_i*ct; st, ct*ca, -ct*sa, a_i*st; 0, sa, ca, d_i; 0, 0, 0, 1];
        T_mat = T_mat * A_matrix;
        joints_coords(i+1, :) = T_mat(1:3, 4)';
    end
    
    set(handle_arm, 'XData', joints_coords(:, 1), 'YData', joints_coords(:, 2), 'ZData', joints_coords(:, 3));
    addpoints(handle_trace, joints_coords(7, 1), joints_coords(7, 2), joints_coords(7, 3));
    drawnow;
end