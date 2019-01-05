function [s] = Norm(s)
% Normalizes de state between 0 and 1
    s(1) = (s(1) + 1.2) / 1.8;
    s(2) = (s(2) + 0.07) / 0.14;
    
    % clip outliers
    s(s>1) = 1; 
    s(s<0) = 0.0000001;