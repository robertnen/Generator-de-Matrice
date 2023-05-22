function GramSchmidtGenerator()
  n = 3; % dimensiunea matricei
  m = 3; % cel mai mare numar natural care poate aparea
  maxZero = 4; % numarul maxim de zerouri pe care il poate avea A
  tol = 0.001; % cat se accepta toleranta (nu schimba daca nu esti sigur/a)
  iter = 10; % numarul de matrici generate

  while iter

    isValid = 1;

    A = randi([-m, m], n, n);
    Aux = A(:, 1);
    if norm(Aux) ~= floor(norm(Aux))
      isValid = 0;
    endif

    for i = 1 : n
      if ~A(i, i)
        isValid = 0;
      endif
    endfor

    if isValid
      [Q, R] = GramSchmidt(A);
    else
      R = zeros(n, n);
      R(1, n) = 1; % ca sa predefinesc pe R
    endif

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
