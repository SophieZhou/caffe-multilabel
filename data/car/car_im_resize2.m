clear,close all,clc
type ='verification';
datDir=['~/work/data/',type];
savDir =['~/work/data/',type,'_resize'];
load select_data2%s_id, s_v_id
rng(0);%rand seed
s_id = s_v_id; %comment this line for classification data
n=length(s_id);
im_n = zeros(n,8);

for i=1:n
    for j=1:5
        srcDir = [datDir,'/',num2str(s_id(i)),'/',num2str(j)];
        desDir = [savDir,'/',num2str(s_id(i)),'/',num2str(j)];
        if ~exist(desDir,'dir')
            mkdir(desDir);
        end
        im_list = dir([srcDir,'/*.jpg']);
        im_n(i,j) = length(im_list);
        for k=1:im_n(i,j)
            im = imread([srcDir,'/',im_list(k).name]);
            im =imresize(im, [256,256]);
            imwrite(im,[desDir,'/',im_list(k).name]);
        end
    end
end
