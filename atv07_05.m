%fui ajustando os parametros do fitro laplaciano
%mas mesmo assim nao consegui obeter o resultado do filtro sobel
% Pelos resultados que eu objetive o filtro laplaciano é mais sensivel a
% ruidos
clear all, close all 
  
g = imread('cameraman.tif'); 
gd = double(g); 

t = 0.52;
h = fspecial('laplacian',0); 
lap = edge(g,'zerocross',t,h);

sob = edge(g,'sobel');

figure, imshow(g)
title('Imagem');

figure, imshow(lap)
title('Lapaciano');

figure, imshow(sob)
title('Sobel ');