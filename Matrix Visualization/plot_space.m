function [] = plot_space(x, d, screen_position)

scrsz = get(0,'ScreenSize');
if strcmp(screen_position, 'left')
    figure('Position',[1 0 scrsz(3)/2 scrsz(4)])
elseif strcmp(screen_position, 'right')
    figure('Position',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)])
elseif strcmp(screen_position, 'refresh')
    figure(2)
    clf
elseif strcmp(screen_position, 'stack')
    figure(1)
end

hold on
plot3([-2,2], [0,0], [0,0], '-k');
plot3([0,0], [-2,2], [0,0], '-k');
plot3([0,0], [0,0], [-2,2], '-k');
view(-70, 30)
xlim([-2.0 2.0]);
ylim([-2.0 2.0]);
zlim([-2.0 2.0]);
axis on
rotate3d on

vertices = x';

if d == 3
    faces = [1 2 5 4;
        1 2 11 10;
        1 4 13 10;
        2 3 6 5;
        2 3 12 11;
        3 6 15 12;
        4 5 8 7;
        4 7 16 13;
        7 8 17 16;
        5 6 9 8;
        6 9 18 15;
        8 9 18 17;
        19 20 23 22;
        19 20 11 10;
        19 22 13 10;
        20 21 24 23;
        20 21 12 11;
        21 24 15 12;
        22 23 26 25;
        22 25 16 13;
        25 26 17 16;
        23 24 27 26;
        24 27 18 15;
        26 27 18 17];
    
    colors = [1 1 0;
        1 1 0;
        1 1 0;
        1 0 1;
        1 0 1;
        1 0 1;
        0 1 1;
        0 1 1;
        0 1 1;
        1 0 0;
        1 0 0;
        1 0 0;
        0 1 0;
        0 1 0;
        0 1 0;
        0 0 1;
        0 0 1;
        0 0 1;
        1 1 1;
        1 1 1;
        1 1 1;
        1 .5 0
        1 .5 0
        1 .5 0];
    
    for i = 1:length(faces)
        s = patch('Faces', faces(i,:), 'Vertices', vertices, 'FaceColor', colors(i,:));
        alpha(s,.35)
    end
    
elseif d == 2
    faces = [1 2 5 4;
        2 3 6 5;
        4 5 8 7;
        5 6 9 8];
    
    colors = [1 1 0;
        1 0 1;
        0 1 1;
        1 0 0];
    
    for i = 1:length(faces)
        s = patch('Faces', faces(i,:), 'Vertices', vertices, 'FaceColor', colors(i,:));
        alpha(s,.35)
    end
    
end

