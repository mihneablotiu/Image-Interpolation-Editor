function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================

    % extrage canalul rosu al imaginii
    red = img(:, :, 1);

    % extrage canalul verde al imaginii
    green = img(:, :, 2);

    % extrace canalul albastru al imaginii
    blue = img(:, :, 3);


    % aplica functia nn pe cele 3 canale ale imaginii
    new_red = bicubic_resize(red, p, q);
    new_green = bicubic_resize(green, p, q);
    new_blue = bicubic_resize(blue, p, q);

    % formeaza imaginea finala cu cele 3 canale de culori
    out = cat(3, new_red, new_green, new_blue);

endfunction