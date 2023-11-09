
% CH2MP1.m : chapter 2, p1 

% 1
% 

% set component values
t =[0:0.0005:0.1];
h = @(t) (-0.0045*exp(-261.8034*t)+0.0045*exp(-38.1966*t)).*(t>0);
plot(t, h(t));
grid();

