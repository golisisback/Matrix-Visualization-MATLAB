clc
clear all
close all

%% Toggle parameters on/off (1/0) - USER DEFINED

% [initial final]
R = 0; % row space
C = 0; % column space
N = 1; % null space
NL = 0; % left null space
evectors = 1; % eigenvectors
V = 0; % V from svd

stack_results = 1; % superimpose images of steps


%% Define matrix - USER DEFINED

A = [3 2 0;
    0 1 -1;
    0 1 0];

dimension = 3;


%% Main script - AUTOMATIC

toggle = [R C N NL evectors V];
x = initialize_space(dimension);
plot_space(x, dimension, 'left');
plot_matrixdata(A, toggle);

plot_space(x, dimension, 'right');
plot_matrixdata(A, toggle);
step_matrix = sqrtm(sqrtm(sqrtm(A))); % 8 steps
pause(0.8)
for step = 1 : 8
    x = step_matrix * x;
    plot_space(x, dimension, 'refresh');
    plot_matrixdata(A, toggle);
    if stack_results
        plot_space(x, dimension, 'stack');
    end
    pause(0.4)
end

[EV, D] = eig(A)
[U, S, V] = svd(A)