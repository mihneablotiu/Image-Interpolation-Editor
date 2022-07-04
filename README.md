313CA - Bloțiu Mihnea-Andrei - 2021
Interpolare aplicată pe imagini


1. Interpolare nearest - neighbour

Interpolarea efectivă a unei imagini alb-negru presupune aflarea punctelor intermediare echidistante
(la distanța STEP unul față de celălalt), numărul acestor puncte și cele patru puncte ce încadrează
toate celelalte puncte intermediare.
Astfel, algoritmul efectiv presupune compararea fiecărui punct intermediar cu mijlocul distanței
dintre punctele incadratoare pentru a putea afla cel mai apropiat punct de cel curent. După ce
acesta a fost găsit, se replică la noua poziție din imaginea rezultată, valoarea pixelului din
punctul încadrator cel mai apropiat.

Interpolarea unei imagini color - RGB prespune aplicarea aceluiași algoritm menționat anterior de 3
ori, câte o dată pentru fiecare dintre cele 3 culori fundamentale. Acestea au fost extrase anterior
din imaginea oferită ca parametru. După aplicarea acestui algoritm, se concatenează la final
rezultatele obținute.

Pentru resize-ul unei imagini alb-negru, începem prin a calcula factorii de scalare cu o formulă
puțin diferită deoarece ne dorim să mutăm originea fiecărei imagini în origine pentru a nu fi
afectată de scalare. Pe baza acestora se calculează transformata și inversa acesteia. Apoi, pentru
fiecare pixel din imaginea finală aplicăm transformata inversă pentru a găsi pixelul corespunzător
din imaginea inițială, dar având în vedere că aceasta este indexată de la 1 în loc de 0, facem
modificările necesare. Calculăm din nou cel mai apropiat vecin, iar în funcție de acesta setăm și
valoarea pixelului din matricea finală.

Analog, pentru partea de RGB se aplică același algoritm pentru fiecare dintre cele 3 culori
fundamentale extrase în prealabil.

2. Interpolare biliniară

Interpolarea efectivă a unei imagini alb-negru presupune aflarea punctelor intermediare echidistante
(la distanța STEP unul față de celălalt), numărul acestor puncte și cele patru puncte ce încadrează
toate celelalte puncte intermediare.
Apoi, de această dată, calculăm coeficienții interpolării biliniare între cele 4 puncte menționate
anterior conform teoriei. Practic, rezolvăm sistemul Aa = b în "a" cu matricea A și vectorul b
conform teoriei atașate.
După aflarea acestor coeficienți, parcurgem toți pixelii din imaginea finală și îi completăm conform
formei finale a funcției în care înlocuim coeficienții menționați anterior.

Interpolarea unei imagini color - RGB prespune aplicarea aceluiași algoritm menționat anterior de 3
ori, câte o dată pentru fiecare dintre cele 3 culori fundamentale.

Pentru partea de resize, algoritmul este identic cu cel de la interpolarea nearest-neighbour cu
singura diferență că de această dată, valoarea noului pixel va fi dată tot de funcția menționată
anterior și nu de cel mai apropiat pixel. Analog pentru partea de RGB.

Pentru partea de rotate, ideea este similară cu cea de la resize cu următoarele diferențe. De 
această dată, transformata este construită în funcție de sinusul si cosinusul unghiului cu care
dorim să rotim imaginea și implicit și inversa acesteia. De asemenea, în cazul în care unghiul
inițial se află în afara imaginii după aplicarea transformatei inverse, punem pe poziția corespunzătoare
în imaginea finală un pixel negru. Altfel, aplicăm aceeași idee de la resize. Analog pentru RGB,
pentru fiecare dintre cele trei culori extrase.

3. Interpolare bicubică

Pentru această interpolare am calculat în primul rând derivatele parțiale cu aproximare folosind
formulele din teorie ce au fost prezentate și în fișierele fx, fy, fxy.

Acestea au fost ulterior folosite în aflarea coeficienților de interpolare bicubică conform
ecuației matriceale din teorie.

Pentru partea de resize, algoritmul este identic cu singura diferentă că de această dată calculăm
derivatele parțiale pe care le vom folosi pentru a determina coeficienții de interpolare bicubică
pe care îi vom folosi la rândul lor pentru a calcula valoarea pixelului final conform formulei
din teorie. Analog pentru RGB la fiecare culoare în parte.
