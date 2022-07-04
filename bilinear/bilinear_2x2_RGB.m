function out = bilinear_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare biliniara pe imaginea 2x2 img cu puncte intermediare
    % echidistante, cu precizarea ca img este o imagine colorata RGB.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % Practic, apeleaza bilinear_2x2_interpolation pe fiecare canal al imaginii
    % img si reconstruieste imaginea colorata la final
    % Parametrii:
    % - img = imaginea 2x2 RGB care doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================

    % extrage canalul rosu al imaginii
    red = img(:, :, 1);

    % extrage canalul verde al imaginii
    green = img(:, :, 2);

    % extrage canalul albastru al imaginii
    blue = img(:, :, 3);


    % aplica bilinear_2x2_interpolation pe fiecare dintre canale
    new_red = bilinear_2x2(red, STEP);
    new_green = bilinear_2x2(green, STEP);
    new_blue = bilinear_2x2(blue, STEP);

    % combina rezultatul in imaginea finala
    out = cat(3, new_red, new_green, new_blue);

endfunction
