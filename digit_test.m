clearvars, close all

load btwo.mat,load bthree.mat,load bfour.mat
load wtwo.mat,load wthree.mat,load wfour.mat
load data_test.mat
if ~exist('test','var')
    error('La variabile "test" non e'' presente in data_test.mat');
end

labels = test(:,1); % output corretto

images = test(:,2:785);
images = images/255;
images = images'; %Input vectors

% per visualizzare
% ind=37;
% I1=images(:,ind);
% I2=reshape(I1,[28 28]);
% imshow(I2'), title(sprintf('%d',labels(ind)));

success = 0;
n = size(images,2);

for i = 1:n
a12 = elu(w12*images(:,i)+b12);
a23 = elu(w23*a12+b23);
a34 = elu(w34*a23+b34);

[~, idx] = max(a34);
numero = idx - 1;

if labels(i) == numero
    success = success + 1;
end

end
fprintf('Accuratezza: ');
fprintf('%f',success/n*100);
disp(' %');
