% Como o valor de  influencia a saída do detector de bordas? 
% Influencia nos ruidos da imagem de saida, como é mostrado a seguir

clear all, close all 
  
g = imread('cameraman.tif'); 
gd = double(g); 

t= 0.07; %treshold
s = 1; %sigma
lap1 = edge(g,'log',t,0.5);
lap2 = edge(g,'log',t,1);
lap3 = edge(g,'log',t,1.5);
lap4 = edge(g,'log',t,2);

figure, imshow(g)
title('Imagem');

figure, imshow(lap1)
title('Lapaciano sigma 1');
figure, imshow(lap2)
title('Lapaciano sigma 2');
figure, imshow(lap3)
title('Lapaciano sigma 3');
figure, imshow(lap4)
title('Lapaciano sigma 4');