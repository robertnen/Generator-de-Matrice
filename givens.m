function [Q, R] = givens(A)
    [~, n] = size(A);
    B = A; %copia lui A pentru final cand voi calcula Q
    G = eye(n);
    for i = 1 : n
        for j = 1 : i - 1
            if A(i, j) ~= 0
                p = sqrt(A(j, j) * A(j, j) + A(i, j) * A(i, j));
                Gr = eye(n);
                Gr(j, j) = A(j, j) / p;
                Gr(i, i) = Gr(j, j);
                Gr(i, j) = -A(i, j) / p;
                Gr(j, i) = -Gr(i, j);

                A = Gr * A;
                G = Gr * G;
            end
        end
    end
    R = G * B;
    Q = G';
end