function [Q, R] = householder(A)

    [m, n] = size(A);
    H = eye(n);
    v(1 : m) = 0;

    for p = 1 : min(m - 1, n)

        v(1 : p - 1) = 0; %reflector Householder
        tmp(1 : p) = 0; %in tmp pun elementele care se vor schimba
        v(p + 1 : m) = A(p + 1 : m, p);
        tmp(p : m) = A(p : m, p);
        v(p) = A(p, p) - sign(A(p, p)) * norm(tmp);

        Hp = eye(n) - 2 / (norm(v) * norm(v)) * (v' * v);
        A = Hp * A;
        H = Hp * H;
    end
    Q = H';
    R = A;
end
