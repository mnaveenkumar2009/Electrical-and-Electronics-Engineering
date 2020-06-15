% This is a seperate code similar to Find.m but used only to plot the graphs
% to visualise the modes better.

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

hold on
N = len - block_size + 1;
for i = 1:N
    % calculate the current block's FFT(dV(i: i + 31)) magnitude
    cur = dV(i: block_size + i - 1);
    cur = fft(cur);
    cur = (abs(cur).*abs(cur));
    if i == 82705 % number found from the below code (It's just before the first islanding mode data)
        figure('Name','Non Islanding Mode')
        plot(cur(2:end));
        ylabel('FFT(dv/dt)');
        xlabel('Frequency')
        title('Non Islanding Mode');
        saveas(gcf,'nonisland.png')
    endif
    if(min(cur) > 1e-4)
        figure('Name','Islanding Mode')
        plot(cur(2:end));
        ylabel('FFT(dv/dt)');
        xlabel('Frequency')
        title('Islanding Mode');
        saveas(gcf,'island.png')
        i % find the first islanding occurence
        break;
    endif
end

% Note: Edit the code to print both the graphs in same plot to obtain comp.png