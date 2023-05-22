function HouseholderGenerator()

  n = 3; % dimensiunea matricei
  m = 3; % cel mai mare numar natural care poate aparea
  maxZero = 4; % numarul maxim de zerouri pe care il poate avea A
  tol = 0.001; % cat se accepta toleranta (nu schimba daca nu esti sigur/a)
  iter = 10; % numarul de matrici generate

  while iter

    isValid = 1;
    %VH = randi([-m, m], n, 1); % reflector HouseHolder
    %U = triu(randi([-m, m], n, n)); % R
    %U(3, 2) = 0; % chestia asta e pusa doar pentru matrici 3x3

    %H = eye(n) - 2 * VH * VH' / (VH' * VH);
    %A = U * H';

    A = randi([-m, m], n, n);
    Aux = A(:, 1);
    if norm(Aux) ~= floor(norm(Aux))
      isValid = 0;
    endif

    [Q, R] = householder(A);

    for i = 1 : n
      for j = 1 : n
          counter = numel(A) - nnz(A);
          if counter > maxZero
            isValid = 0;
            break;
          endif

          if A(i, j) ~= floor(A(i, j))
            isValid = 0;
            break;
          endif

          if j < i && (R(i, j) < -tol || R(i, j) > tol)
            isValid = 0;
          endif
      endfor
    endfor

    if isValid
        disp(iter);
        disp('-------');
        disp('A = ');
        disp(A);
        disp('R = ');
        disp(R);
        disp('Q = ');
        disp(Q);
        iter = iter - 1; % e o matrice buna
    endif
  endwhile
endfunction
