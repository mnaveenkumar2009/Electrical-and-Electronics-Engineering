% This code is used to detect the Islanding for a Grid with just the Voltage
% as the input data. More details are found in the report.

starttime = time() % store the start time
V = csvread('../Data.csv');
dVtem = V(3:end, :) - V(2:end - 1, :); % 1 is heading (Va, Vb, Vc, Ia, Ib, Ic) (all 0s)
% Hence dV(i) is equal to V(i + 2) - V(i + 1)
% Thus, dV (temporary as we need net magnitude later) = V(3:end) - V(2:end - 1) .. for all columns

% calculate net V as Va/_0 + Vb/_120 + Vc/_240
dV = dVtem(:, 1) + dVtem(:, 2) * exp(j * 120 * pi/180) + dVtem(:, 3) * exp(j * 240 * pi/180);
% now, calculate the Magnitude
dV = abs(dV);
len = size(dV); % length of the dV

% block_size is the block size used to compute fft. All continous
% windows of size block_size are considered to detect islanding
block_size = 32;

N = len - block_size + 1; % Find the length of the output

FT = 1:N; % create a vector of size N. Initial values don't matter as they will be modified anyways.

for i = 1:N

    % calculate the current block's FFT(dV(i: i + 31)) magnitude
    cur = dV(i: block_size + i - 1);
    cur = fft(cur);
    cur = (abs(cur).*abs(cur));

    % From printing the cur values we can observe that the
    % Islanding modes have a minimum magnitude much greater than 1e-4 and hence
    % we can use that value as our threshold. All non islanding modes have
    % magnitude less than 1e-4 (around 1e-6/1e-5 to be specific)
    FT(i) = min(min(cur), 1.5);
end


% Print the detected islanding mode for each window of size 32.
% These values are going to be used for other methods to train the models such as ANN
% and hence need to be printed.
t = linspace(0,1.5, size(FT)(2));
figure('Name', 'FFT')
plot(t, FT)
ylabel('FFT(dv/dt)');
xlabel('time(s)')
title('FFT(dv/dt) vs time');
xlim([0 1.5]);
ylim([0 0.7]);
saveas(gcf,'fftvstime.png');