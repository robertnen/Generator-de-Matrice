function GPPGenerator()

  iter = 10;
  n = 3 % matrix size
  m = 2 % numar maxim
  while iter
  isValid = 1;
  a = randi([-m, m], 1, 1);
  if ~a
    isValid = 0;
  endif
  A = zeros(n, n);
  A(1, 1) = a;
  A(1, 2) = a + 1;
  A(1, 3) = a + 2;
  A(2, 1) = 2 * a;
  A(2, 2) = 2 * a + 1;
  A(2, 3) = 2 * a + 3;
  A(3, 1) = 4 * a;
  A(3, 2) = 4 * a + 5;
  A(3, 3) = 4 * a + 1;

  for i = 1 : n
    for j = 1 : n
        if isnan(A(i, j))
          isValid = 0
        endif
    endfor
  endfor

  if isValid
      iter = iter - 1;
      disp('----------');
      disp('Matrice initiala');
      disp(A);
      A = GPP(A);
      disp('----------');
      disp('Matrice finala');
      disp(A);
  endif
  endwhile

endfunction


