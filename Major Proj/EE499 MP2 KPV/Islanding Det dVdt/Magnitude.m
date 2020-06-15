% This code is used to print the magnitude of the dV into a file so that 
% it can be used as a data for the neural network
% The lines are same from Find.m along with just printing the array dV

% Terminal Command Run in Ubuntu 18 : [[[ octave-cli Magnitude.m > ../Voltage.csv  ]]] 
% (Then manually add dV as heading in the csv file)

V = csvread('../Data.csv');
dVtem = V(3:end, :) - V(2:end - 1, :); % 1 is heading (all 0s)

dV = dVtem(:, 1) + dVtem(:, 2) * exp(j * 120 * pi/180) + dVtem(:, 3) * exp(j * 240 * pi/180);
dV = abs(dV);
len = size(dV);

for i = 1:len
    disp(dV(i))
end