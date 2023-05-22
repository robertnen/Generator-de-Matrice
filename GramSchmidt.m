function [Q, R] = GramSchmidt(A)
    [~, n] = size(A);
    Q = zeros(n); R = zeros(n);

    for i = 1 : n
        R(i, i) = norm(A(:, i));
        Q(:, i) = A(:, i) / R(i, i);

        for j = i + 1 : n
            R(i, j) = Q(:, i)' * A(:, j);
            A(:, j) = A(:, j) - Q(:, i) * R(i, j);
        end
    end
end