function [] = plot_matrixdata(A, toggle)

[m, n] = size(A);
r = rank(A);
C = colspace(sym(A)); % column space
R = colspace(sym(A)'); % row space
N = null(A); % null space
NL = null(A'); % left null space
[EV, D] = eig(A);
[U, S, V] = svd(A);

% plot rowspace
if toggle(1)
    for i = 1 : r
        line([-2*R(1,i) 2*R(1,i)], [-2*R(2,i) 2*R(2,i)], [-2*R(3,i) 2*R(3,i)], 'Color', 'r', 'LineWidth', 1, 'LineStyle', '-');
    end
end

% plot colspace
if toggle(2)
    for i = 1 : r
        line([-2*C(1,i) 2*C(1,i)], [-2*C(2,i) 2*C(2,i)], [-2*C(3,i) 2*C(3,i)], 'Color', 'b', 'LineWidth', 1, 'LineStyle', '-');
    end
end

% plot nullspace
if toggle(3)
    if not(isempty(N))
        for i = 1 : n-r
            line([-2*N(1,i) 2*N(1,i)], [-2*N(2,i) 2*N(2,i)], [-2*N(3,i) 2*N(3,i)], 'Color', 'r', 'LineWidth', 2, 'LineStyle', ':');
        end
    end
end

% plot left nullspace
if toggle(4)
    if not(isempty(NL))
        for i = 1 : m-r
            line([-2*NL(1,i) 2*NL(1,i)], [-2*NL(2,i) 2*NL(2,i)], [-2*NL(3,i) 2*NL(3,i)], 'Color', 'b', 'LineWidth', 2, 'LineStyle', ':');
        end
    end
end

% plot eigenvectors
if toggle(5)
    D_r = real(D);
    EV_r = real(EV);
    for i = 1 : length(EV)
        line([-abs(D_r(i,i))*EV_r(1,i) abs(D_r(i,i))*EV_r(1,i)], [-abs(D_r(i,i))*EV_r(2,i) abs(D_r(i,i))*EV_r(2,i)], [-abs(D_r(i,i))*EV_r(3,i) abs(D_r(i,i))*EV_r(3,i)], 'Color', 'k', 'LineWidth', 2, 'LineStyle', '--');
    end
end

% plot V
if toggle(6)
    for i = 1 : length(V)
        line([-V(1,i) V(1,i)], [-V(2,i) V(2,i)], [-V(3,i) V(3,i)], 'Color', 'k', 'LineWidth', 2, 'LineStyle', ':');
    end
end