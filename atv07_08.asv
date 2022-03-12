clear all, close all 
  
f = dir('*.png');
files={f.name};
for k=1 : numel(files)
  Im{k}=imread(files{k});
end

I = Im{1};


I2 = imcrop(I,[75 68 130 640]);



figure, imshow(I2) 
% 
% t = 0.1;
% sobel  =  edge(g,'sobel',t);
% 
% canny = edge(g,'Canny');
% 
% figure, imshow(g)
% title('Imagem');
% 
% figure, imshow(sobel)
% title('sobel');
% 
% figure, imshow(canny)
% title('canny ');