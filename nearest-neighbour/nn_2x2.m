function out = nn_2x2(f, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare nearest-neighbour pe imaginea 2x2 f cu puncte
    % intermediare echidistante.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % Parametrii:
    % - f = imaginea ce se doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================
    
    % defineste coordonatele x si y ale punctelor intermediare
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    
    % afla nr. de puncte
    n = length(x_int);
 
    % cele 4 punctele incadratoare vor fi aceleasi pentru toate punctele din
    % interior
    x1 = y1 = 1;
    x2 = y2 = 2;

    % initializeaza rezultatul cu o matrice n x n plina de zero
    out = zeros(n);
    xp = 0;
    yp = 0;
    
    % parcurge fiecare pixel din imaginea finala
    for i = 1 : n
        for j = 1 : n
            % afla cel mai apropiat pixel din imaginea initiala
            if (x_int(i) < (x2 + x1)/2 && y_int(j) < (y2 + y1)/2)
              xp = x1;
              yp = y1;
            endif
            
            if (x_int(i) < (x2 + x1)/2 && y_int(j) >= (y2 + y1)/2)
              xp = x1;
              yp = y2;
            endif
            
            if (x_int(i) >= (x2 + x1)/2 && y_int(j) < (y2 + y1)/2)
              xp = x2;
              yp = y1;
            endif
            
            if (x_int(i) >= (x2 + x1)/2 && y_int(j) >= (y2 + y1)/2)
              xp = x2;
              yp = y2;
            endif
            % calculeaza pixelul din imaginea finala
            out(i, j) = f(xp, yp);
            
        endfor
    endfor

endfunction
