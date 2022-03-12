% No entanto, para evitar o cálculo de uma raiz quadrada, 
% economizando  assim  recursos  computacionais,  pode-se  fazer  uma  simples  soma  dos  valores 
% absolutos (sem sinal) dos gradientes Gv e Gh.

clear all, close all, clc 
% Cria imagem sintética g 
w = 256; 
objt = 192; fundo = 64; rdn = 10; 
g = makeImSynthHex(w,objt,fundo,rdn); 
g = im2double(g); 
Sh = fspecial('sobel'); 
gSh = imfilter(g,Sh,'replicate','conv'); 
Sv = Sh'; 
gSv = imfilter(g,Sv,'replicate','conv'); 
% Imagem de magnitude do gradiente 
S = sqrt(gSv.^2 + gSh.^2); 

% Imagem soma dos valores absolutos
Ssoma = abs(gSv) + abs(gSh); %soma se valores absolutos

% Normaliza 
gSh = mat2gray(gSh); 
gSv = mat2gray(gSv); 
S = mat2gray(S); 
Ssoma=mat2gray(Ssoma); 
% Limiariza 
Sbw = imbinarize(S); 
Ssomabw = imbinarize(Ssoma); 

% Display 
figure, imshow(g) 
title('Imagem de entrada') 
figure, imshow(S), 
title('Magn. do grad.') 
figure, imshow(Sbw) 
title('Magn. do grad. bw');
% Resposta da questão
figure, imshow(Ssoma) 
title('Soma de abs do grad');
figure, imshow(Ssomabw) 
title('Soma de abs do grad bw');