% CH2MP1.m : chapter 2, p1 

function [lambda] = CH2MP2(R,C);

% CH2MP2.m : chpt 2, p 2
% Function find char roots of op amp circuit
% INPUTS: R = length-3 vector of resistances
% C = length-2 vector of capacitances
% OUTPUTS: lambda = characteristic roots

% Determine coefficients for characteristic equation:
A = [1, (1/R(1)+1/R(2)+1/R(3))/C(2), 1/(R(1)*R(2)*C(1)*C(2))];
% Determine characteristic roots:
lambda = roots(A);




