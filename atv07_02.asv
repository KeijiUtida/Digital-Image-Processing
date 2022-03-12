% a07teo_04 [script] 
% O  que  deve  acontecer  se  retirarmos  a  opção   conv’?
% R: Como Sobel é como a derivada de da imagem, continua detectando as bordas, mas com sinais contrarios 

% A  opção  pela  convolução  ou  pela  correlação  tem  impacto neste
% resultado final? Não. Por que?
% Não, pois como é uma marcara derivativa ainda continua encontrando
% as bordas nos mesmo locais. 

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

% sem conv
gShSC = imfilter(g,Sh,'replicate');  
gSvSC = imfilter(g,Sv,'replicate'); 

% Normaliza, pois existem 
% valores negativos 
gSh = mat2gray(gSh); 
gSv = mat2gray(gSv); 

%sem conv
gShSC = mat2gray(gShSC); 
gSvSC = mat2gray(gSvSC); 
  
% Display 
figure, imshow(g) 
title('Imagem de entrada')  
figure, subplot(1,2,1), imshow(gSv), 
title('Sobel vertical com conv') 
subplot(1,2,2), imshow(gSh) 
title('Sobel horizontal com conv')

figure, subplot(1,2,1), imshow(gSvSC), 
title('Sobel vertical sem conv') 
subplot(1,2,2), imshow(gShSC) 
title('Sobel horizontal sem conv')
