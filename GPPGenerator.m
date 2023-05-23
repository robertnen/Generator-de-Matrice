function GPPGenerator()

  iter = 10; % numarul de matrici generate
  m = 2; % numar maxim
  while iter
  isValid = 1;
  a = randi([-m, m], 1, 1);
  if ~a
    isValid = 0;
  endif
  A = zeros(3, 3);
  A(3, 1) = a;
  A(3, 2) = a + 1;
  A(3, 3) = a + 2;
  A(2, 1) = 2 * a;
  A(2, 2) = 2 * a + 3;
  A(2, 3) = 2 * a + 5;
  A(1, 1) = 4 * a;
  A(1, 2) = 4 * a + 5;
  A(1, 3) = 4 * a + 10;

  B = GPP(A);

  for i = 1 : 3
    for j = 1 : 3
        if isnan(A(i, j))
          isValid = 0;
        endif
        if isnan(B(i, j))
          isValid = 0;
        endif
        pd = floor(B(i, j) * 10) - floor(B(i, j)) * 10;
        if pd ~= 0 && pd ~= 5
          isValid = 0;
        endif
    endfor
  endfor

  if isValid
      iter = iter - 1;
      disp('----------');
      disp('Matrice initiala');
      disp(A);
      disp('----------');
      disp('Matrice finala');
      disp(B);
  endif
  endwhile

endfunction

