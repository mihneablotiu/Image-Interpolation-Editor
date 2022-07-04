function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia
    % =========================================================================
    
    % obtine dimensiunea imaginii
    [m n nr_colors] = size(I);
    
    % fa cast matricii I la double
    I = double(I);

    % calculeaza matricea cu derivate fata de x Ix
    for i = 1 : m
      for j = 1 : n
        if (j == 1 || j == n)
          Ix(i, j) = 0;
          continue;
        endif
        Ix(i, j) = fy(I, i, j);
      endfor
    endfor

    % calculeaza matricea cu derivate fata de y Iy
    for i = 1 : m
      for j = 1 : n
        if (i == 1 || i == m)
          Iy(i, j) = 0;
          continue;
        endif
        Iy(i, j) = fx(I, i, j);
      endfor
    endfor

    % calculeaza matricea cu derivate fata de xy Ixy
    for i = 1 : m
      for j = 1 : n
        if (i == 1 || j == 1 || i == m || j == n)
          Ixy(i, j) = 0;
          continue;
        endif
        Ixy(i, j) = fxy(I, i, j);
      endfor
    endfor

endfunction
