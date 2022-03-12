
clear all, close all 

%imagem com quadrado no centro
g1 = [0 0 0 0 0   0   0   0 0 0 0;
     0 0 0 0 0   0   0   0 0 0 0;
     0 0 0 0 0   0   0   0 0 0 0;
     0 0 0 0 0   0   0   0 0 0 0;
     0 0 0 0 255 255 255 0 0 0 0;
     0 0 0 0 255 255 255 0 0 0 0;
     0 0 0 0 255 255 255 0 0 0 0;
     0 0 0 0 0   0   0   0 0 0 0;
     0 0 0 0 0   0   0   0 0 0 0;
     0 0 0 0 0   0   0   0 0 0 0;
     0 0 0 0 0   0   0   0 0 0 0;];
gd1 = double(g1); 

%imagem com quadrado no centro
g2 = [0 0 0 0 0 0 0 0 0   0   0   ;
      0 0 0 0 0 0 0 0 0   0   0   ;
      0 0 0 0 0 0 0 0 0   0   0   ;
      0 0 0 0 0 0 0 0 0   0   0   ;
      0 0 0 0 0 0 0 0 255 255 255;
      0 0 0 0 0 0 0 0 255 255 255;
      0 0 0 0 0 0 0 0 255 255 255;
      0 0 0 0 0 0 0 0 0   0   0   ;
      0 0 0 0 0 0 0 0 0   0   0   ;
      0 0 0 0 0 0 0 0 0   0   0   ;
      0 0 0 0 0 0 0 0 0   0   0   ;];

gd2 = double(g2);

%imagem rotacionado  em relação à primeira

g3 = imrotate(g1,90);
gd3 = double(g3);


% DFT 2D Imagem normal
dft1 = fft2(gd1); 
dfts1 = fftshift(dft1); 
dftsm1 = abs(dfts1); 
dftsmv1 = mat2gray(log(1+dftsm1)); 

% DFT 2D Imagem deslocada
dft2 = fft2(gd2); 
dfts2 = fftshift(dft2); 
dftsm2 = abs(dfts2); 
dftsmv2 = mat2gray(log(1+dftsm2)); 

% DFT 2D Imagem rotacionada
dft3 = fft2(gd3); 
dfts3 = fftshift(dft3); 
dftsm3 = abs(dfts3); 
dftsmv3 = mat2gray(log(1+dftsm3)); 
  
%Display 
figure 
imshow(g1) 
title('Imagem normal') 
figure 
imshow(dftsmv1) 
title('DFT 2D') 

figure 
imshow(g2) 
title('Imagem deslocada') 
figure 
imshow(dftsmv2) 
title('DFT 2D Imagem deslocada') 

figure 
imshow(g3) 
title('Imagem rotacionada') 
figure 
imshow(dftsmv3) 
title('DFT 2D Imagem rotacionada') 
