function CroutGenerator()

  n = 3; % dimensiunea matricei
  m = 4; % cel mai mare numar natural care poate aparea
  iter = 10; % numarul de matrici generate

  while iter

    Aux = randi([-m, m], n, n);
    L = tril(Aux);
    U = triu(Aux);

    for i = 1 : n
      U(i, i) = 1;
    endfor

    A = L * U;

    disp(iter);
    disp('-------');
    disp('A = ');
    disp(A);
    disp('L = ');
    disp(L);
    disp('U = ');
    disp(U);
    iter = iter - 1; % e o matrice buna
  endwhile
endfunction
