
% x1 Dn

% T :
T1 = 5;

n1_list = -T1:T1;

% x1:
x1= @(t) cos((3*pi*t)/10) + 0.5*cos(pi*t/10);

w1 = 2*pi/T1;

% for loop to run through n-list array
for i = 1:length(n1_list)
    n = n1_list(i);

    % Dn = 1/T * integral x(t) * exp (-j*n_list*wo*t)
    y = @(t) x1(t).*exp(-1i*n*t*w1);
    
    % Dn formula
    Dn = (1/T1) * integral (y, -T1/2, T1/2);
        
    % display 
    stem(abs(Dn),angle(Dn));

end
% 
% % x2 Dn
% 
% % T
% T2_on = 10 ;
% T2_off = 10;
% T2 = T2_on+T2_off;
% 
% n2_list = -T2:T2;
% 
% % x2 
% x2=@(t) 
% 
