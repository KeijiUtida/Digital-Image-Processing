%utilizando o metodo de kirshe

clear all, close all, clc 
  
% Cria imagem sintética g 
w = 256; 
objt = 192; fundo = 64; rdn = 10; 
g = makeImSynthHex(w,objt,fundo,rdn);

figure, imshow(g)

y=kirschedge(g); 
figure, imshow(y)
title('Soma de abs do grad');




function y=kirschedge(x)
    
    x=double(x);

    g1=[5,5,5; -3,0,-3; -3,-3,-3];
    g2=[5,5,-3; 5,0,-3; -3,-3,-3];
    g3=[5,-3,-3; 5,0,-3; 5,-3,-3];
    g4=[-3,-3,-3; 5,0,-3; 5,5,-3];
    g5=[-3,-3,-3; -3,0,-3; 5,5,5];
    g6=[-3,-3,-3; -3,0,5;-3,5,5];
    g7=[-3,-3,5; -3,0,5;-3,-3,5];
    g8=[-3,5,5; -3,0,5;-3,-3,-3];

    %faz a convolucao da imagem com as 8 mascaras
    x1=imfilter(x,g1,'replicate', 'conv');
    x2=imfilter(x,g2,'replicate', 'conv');
    x3=imfilter(x,g3,'replicate', 'conv');
    x4=imfilter(x,g4,'replicate', 'conv');
    x5=imfilter(x,g5,'replicate', 'conv');
    x6=imfilter(x,g6,'replicate', 'conv');
    x7=imfilter(x,g7,'replicate', 'conv');
    x8=imfilter(x,g8,'replicate', 'conv');
    
    %Pega o maior valor de cada pixel convoluido
    [l c] = size(x);
    for n = 1:l
        for m = 1:c
            maximo= max([x1(n,m) x2(n,m) x3(n,m) x4(n,m) x5(n,m) x6(n,m) x7(n,m) x8(n,m)]);
            y(n,m) = maximo;
        end
    end

end