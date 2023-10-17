tic
load('ELE532_Lab1_Data.mat')
for c = 1:1024
    for d = 1:100
        if abs(B(c,d)) < 0.01
            B(c,d)=0;
        end 
    end
end 
disp(B)
toc


