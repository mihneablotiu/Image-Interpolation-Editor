function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaza coeficientii de interpolare bicubica pentru 4 puncte alaturate
    % =========================================================================

    % calculeaza matricile intermediare
    F = [f(y1, x1), f(y1, x2), Ix(y1, x1), Ix(y1, x2);
    f(y2, x1), f(y2, x2), Ix(y2, x1), Ix(y2, x2);
    Iy(y1, x1), Iy(y1, x2), Ixy(y1, x1), Ixy(y1, x2);
    Iy(y2, x1), Iy(y2, x2), Ixy(y2, x1), Ixy(y2, x2)];

    coef1 = [1, 0, 0, 0; 1, 1, 1, 1; 0, 1, 0, 0; 0, 1, 2, 3];
    coef2 = [1, 1, 0, 0; 0, 1, 1, 1; 0, 1, 0, 2; 0, 1, 0, 3]; 

    % converteste matricile intermediare la double
    F = double(F);
    coef1 = double(coef1);
    coef2 = double(coef2);
    

    % calculeaza matricea finala
    A = inv(coef1) * F' * inv(coef2);

endfunction