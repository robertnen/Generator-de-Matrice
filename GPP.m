function A = GPP(A)
  for p = 1 : 3
    for i = p + 1 : 3
      miu = A(i, p) / A(p, p);
      A(i, p) = 0;
      for j = p + 1 : 3
          A(i, j) = A(i, j) - miu * A(p, j);
      endfor
    endfor
  endfor
endfunction
