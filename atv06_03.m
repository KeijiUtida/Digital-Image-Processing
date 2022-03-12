% fft_PbGaussiano [script] 
clear all, close all 
  
f = imread('cameraman.tif'); 
[nr nc] = size(f); 
fd = double(f); 
  
% DFT 2D 
F = fft2(fd); 
F = fftshift(F); 
  
% Filtro Gaussiano PB
% sigma 5
Hpb5 = fspecial('gaussian', [nr nc], 5); 
Hpb5 = mat2gray(Hpb5);  
% sigma 30
Hpb30 = fspecial('gaussian', [nr nc], 30); 
Hpb30 = mat2gray(Hpb30);  

% Filtro Gaussiano PA
% sigma 5
Hpa5 = imcomplement(Hpb5);
% sigma 30
Hpa30 = imcomplement(Hpb30);
 
% Multiplicação ponto-a-ponto 
Gpb5  = F .* Hpb5; 
Gpb30 = F .* Hpb30; 
Gpa5  = F .* Hpa5;
Gpa30 = F .* Hpa30;

% DFT 2D inversa 
gpb5  = ifft2(Gpb5); 
gpb30 = ifft2(Gpb30); 
gpa5  = ifft2(Gpa5); 
gpa30 = ifft2(Gpa30); 

% Magnitude e visualização 
gpb5  = mat2gray(abs(gpb5)); 
gpb30 = mat2gray(abs(gpb30)); 
gpa5  = mat2gray(abs(gpa5)); 
gpa30 = mat2gray(abs(gpa30)); 
 
% Display 
figure, imshow(f) 
title('Imagem de entrada') 
figure, 
imshow(mat2gray(log(1+abs(F)))) 
title('DFT da imagem') 
figure, imshow(mat2gray(Hpb5)) 
title('Filtro PB Gaussiano sigma = 5') 
figure, imshow(gpb5) 
title('Saída PB sigma = 5')
figure, imshow(mat2gray(Hpb30)) 
title('Filtro PB Gaussiano sigma = 30') 
figure, imshow(gpb30) 
title('Saída PB sigma = 30')
figure, imshow(mat2gray(Hpa5)) 
title('Filtro PA Gaussiano sigma = 5') 
figure, imshow(gpa5) 
title('Saída PA sigma = 5')
figure, imshow(mat2gray(Hpa30)) 
title('Filtro Pa Gaussiano sigma = 30') 
figure, imshow(gpa30) 
title('Saída PA sigma = 30')