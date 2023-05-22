function CholeskyGenerator()

  n = 3; % dimensiunea matricei
  m = 2; % cel mai mare numar natural care poate aparea
  iter = 10; % numarul de matrici generate

  while iter

    Aux = randi([-m, m], n, n);
    L = tril(Aux);

    A = L * L';

    disp(iter);
    disp('-------');
    disp('A = ');
    disp(A);
    disp('L = ');
    disp(L);
    disp('Lt = ');
    disp(L');
    iter = iter - 1; % e o matrice buna
  endwhile
endfunction
