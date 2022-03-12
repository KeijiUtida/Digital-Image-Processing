clear all, close all 
  
g = imread('cameraman.tif'); 
gd = double(g); 

%tresposta do exercicio
% DFT 2D usando apensa fft 1D
dftrX = fft(gd,[],1);
dftrY = fft(dftrX,[],2);
dftrs = fftshift(dftrY);
dftrsm = abs(dftrs);
dftrsmv = mat2gray(log(1+dftrsm));

%Usado para comparacao
% DFT 2D 
dft = fft2(gd); 
dfts = fftshift(dft); 
dftsm = abs(dfts);  
dftsmv = mat2gray(log(1+dftsm)); 
  
%Display 
figure 
imshow(g) 
title('Imagem de entrada') 
figure 
imshow(dftrsmv) 
title('DFT 2D Usando fft')
figure 
imshow(dftsmv) 
title('DFT 2D')

% Como resultado percebe-se que as duas são identicas.