% CH2MP1.m : chapter 2, p1 

% 1
% script m file determines roots of op amp

% set component values
R = [1e4,1e4,1e4];
C = [1e-6, 1e-6];

% det coeffs for characteristic eqn
A = [1,  (1/R(1)+1/R(2)+1/R(3))/C(2), 1/(R(1)*R(2)*C(1)*C(2))];

% det roots:
lambda = roots(A);




