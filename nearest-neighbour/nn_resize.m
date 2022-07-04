
function R = nn_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare nearest-neighbour
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);

    % ignora imagini care nu sunt alb negru
    if nr_colors > 1
        R = -1;
        return
    endif
    
    % cast I la double
    I = double(I);

    % initializeaza matricea finala
    R = zeros(p, q);

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!

    % calculeaza factorii de scalare
    s_x = (q - 1) ./ (n - 1);
    s_y = (p - 1) ./ (m - 1);
    
    % Obs: daca se lucreaza cu indici in intervalul [0, n - 1], ultimul
    % pixel al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n

    % defineste matricea de transformare pentru redimensionare
    T = [s_x, 0; 0, s_y];

    % calculeaza inversa transformarii
    T_inv = [1/s_x, 0; 0, 1/s_y];
    
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : p - 1
        for x = 0 : q - 1
            % aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            coord_p = T_inv * [x, y]';

            % trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            coord_p(1) = coord_p(1) + 1;
            coord_p(2) = coord_p(2) + 1;

            % calculeaza cel mai apropiat vecin
            y1 = floor(coord_p(1));
            y2 = y1 + 1;
            x1 = floor(coord_p(2));
            x2 = x1 + 1;

            % calculeaza valoarea pixelului din imaginea finala
            if (coord_p(2) < (x2 + x1)/2 && coord_p(1) < (y2 + y1)/2)
              xp = x1;
              yp = y1;
            endif
            
            if (coord_p(2) < (x2 + x1)/2 && coord_p(1) >= (y2 + y1)/2)
              xp = x1;
              yp = y2;
            endif
            
            if (coord_p(2) >= (x2 + x1)/2 && coord_p(1) < (y2 + y1)/2)
              xp = x2;
              yp = y1;
            endif
            
            if (coord_p(2) >= (x2 + x1)/2 && coord_p(1) >= (y2 + y1)/2)
              xp = x2;
              yp = y2;
            endif
            
            R(y + 1, x + 1) = I(xp, yp);
        endfor
    endfor

    % converteste matricea rezultat la uint8
    R = uint8(R);

endfunction
