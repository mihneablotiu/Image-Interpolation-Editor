function out = nn_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================

    % extrage canalul rosu al imaginii
    red = img(:, :, 1);

    % extrage canalul verde al imaginii
    green = img(:, :, 2);

    % extrage canalul albastru al imaginii
    blue = img(:, :, 3);

    % aplica functia nn pe cele 3 canale ale imaginii
    new_red = nn_resize(red, p, q);
    new_blue = nn_resize(blue, p, q);
    new_green = nn_resize(green, p, q);
    
    % formeaza imaginea finala cu cele 3 canale de culori
    out = cat(3, new_red, new_green, new_blue);

endfunction
