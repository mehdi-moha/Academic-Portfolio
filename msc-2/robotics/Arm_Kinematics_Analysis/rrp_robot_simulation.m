clc;
clear;
close all;

a = 500;
b = 300;
c = 250;

num_steps = 200;
theta1_path = linspace(0, 180, num_steps);
theta2_path = linspace(0, 90, num_steps);
d3_path = linspace(0, 150, num_steps);

fig = figure('Name', 'RRP Custom Robot Simulation', 'Color', 'white');
view(3);
grid on;
axis equal;
xlim([-600 600]);
ylim([-600 600]);
zlim([0 600]);
xlabel('X Coordinate (mm)');
ylabel('Y Coordinate (mm)');
zlabel('Z Coordinate (mm)');
title('Custom RRP Robot: Kinematic Simulation');

handle_arm = plot3(0, 0, 0, '-o', 'LineWidth', 3, 'MarkerSize', 8, 'MarkerFaceColor', 'y', 'Color', 'b');
handle_trace = animatedline('Color', 'r', 'LineWidth', 1.5, 'Marker', '.');

for k = 1:num_steps
    t1 = theta1_path(k);
    t2 = theta2_path(k);
    d3 = d3_path(k);
    
    x_base = 0;
    y_base = 0;
    z_base = a;
    
    x_joint2 = b * cosd(t1);
    y_joint2 = b * sind(t1);
    z_joint2 = a;
    
    x_joint3 = x_joint2 + c * cosd(t1 + t2);
    y_joint3 = y_joint2 + c * sind(t1 + t2);
    z_joint3 = a;
    
    x_end = x_joint3;
    y_end = y_joint3;
    z_end = a - d3;
    
    X_coords = [0, x_base, x_joint2, x_joint3, x_end];
    Y_coords = [0, y_base, y_joint2, y_joint3, y_end];
    Z_coords = [0, z_base, z_joint2, z_joint3, z_end];
    
    set(handle_arm, 'XData', X_coords, 'YData', Y_coords, 'ZData', Z_coords);
    addpoints(handle_trace, x_end, y_end, z_end);
    drawnow;
end