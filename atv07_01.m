% Leandro Keiji Utida Pereira

% Explique  como  foi  gerado  o  círculo  na  imagem  sintética  obtida  com  a  função  makeImSynthHex 
% (Notas de aula e prática MATLAB #07). Qual a maneira mais fácil de alterar o diâmetro do círculo? 
% Responda no próprio .m, na forma de comentários

% foi gerado a partir das funcões
% circ = fspecial('gaussian', [r c], r/10); Para aumentar o circulo teria que aumentar o valor de sigma (é um filtro PB com o tamanho de [r c] com o sigma de r/10 sendo que r é tambem o tamanho de linhas de s ... que está comentado no codigo a baixo
% circ = circ < max(circ(:))/10;
% s = s .* uint8(circ);
% Para aumentar o circulo teria que aumentar o valor de sigma (é um filtro
% PB com o tamanho de [r c] com o sigma de r/10 sendo que r é tambem o
% tamanho de linhas de s ... que está comentado no codigo a baixo


clear all,
close all,
clc


img1 = makeImSynthHex(1000,200, 100, 1);


figure
imshow(img1);
figure
imshow(img2);
figure
imshow(img3);



function  s = makeImSynthHex(M, obj, bck, sd)
% Cria uma imagem sintética uint8 de dimensões
% M linhas e M colunas. O objeto tem nível de cinza obj e o fundo tem nível de cinza bck.
% O centro tem nível de cinza zero.
% Adiciona ruído Gaussiano de desvio padrão sd.

nrhs = floor(M/2); % Metade o tamanho M arredondado para baixo
nchs = floor(M/2); % Metade o tamanho M arredondado para baixo

a = triu(ones(nrhs,nchs))*bck; %Cria uma matriz triangular superior com os valores em escala de cinza da variavel bck
b = tril(ones(nrhs,nchs),-1)*obj; %Cria uma matriz triangular inferior(a partir da i-1 e j-i da diagonal principal) com os valores em escala de cinza da variavel obj
g1 = uint8(a+b); %soma as duas matrizes(a e b) e converte para uint8
g2 = fliplr(g1); %espelha a matriz g1 em x
g3 = flipud(g2); %espelha a matriz g2 em y
g4 = flipud(g1); %espelha a matriz g1 em y
s = [g2 g1; g3 g4]; %concatena as matrizes
[r c] = size(s); % valores com as quantidades de linhas e colunas
g5 = ones(r,c); % criauma matriz com valores 1 com o mesmo tamanho de s
g5(nrhs/4:end-(nrhs/4),nchs/4:end-(nchs/4)) = 0; %modifica os valores para zero que ficam no quadrado interno(1/4 da imagem de bordas) 
idx = g5 == 1; %aqui a mariz acaba gerando uma mesma matriz do que a anterior, só que booleana
s(idx) = bck; % madifica os valores na matriz s para o valor de bck na posicao onde os valores são true na matriz idx
% achei q seria + fácil :-)
% deve existir uma maneira mais esperta...

circ = fspecial('gaussian', [r c], r/10); % Para aumentar o diametro do circulo teria que aumentar o valor do ultimo paramentro
circ = circ < max(circ(:))/10;
s = s .* uint8(circ);

% Suaviza, para o degrau não ser ideal
h = fspecial('average', [3 3]);
s = imfilter(s, h, 'replicate');
% Um ruidinho de média zero e desvio padrão sd
s = imnoise(s,'gaussian',...
(0/255),(sd/255)^2);
end