%% Lab 5a - Simulated ECG

a = readmatrix('30bpm.txt'); % read both data files in a matrix
b = readmatrix('60bpm.txt');
fs = 1/.0001; % calculate sampling frequency

[a_row, a_col] = size(a); % determine size of matrix
t_a = (1:a_row)/fs; % create time vector

plot(t_a, a(:,2)); % plot data
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Simulated ECG @ 30bpm');

[b_row, b_col] = size(b); % determine size of matrix
t_b = (1:b_row)/fs; % create time vector

figure % new figure
plot(t_b, b); % plot data
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Simulated ECG @ 60bpm');

%% Lab 5a - Part 3

f_a = (1:a_row)*fs/a_row; % create frequency vector

x_a = a(:,2); 
X_a = fft(x_a);
Mag_a = abs(X_a(2:end))/(a_row/2);
Phase_a = angle(X_a(2:end))*(360/(2*pi));

figure
plot(f_a(1:20), Mag_a(1:20), 'xb');

f_b = (1:b_row)*fs/b_row;

x_b = b(:,2);
X_b = fft(x_b);
Mag_b = abs(X_b(2:end))/(b_row/2);
b = angle(X_b(2:end))*(360/(2*pi));

figure
plot(f_b(1:20), Mag_b(1:20), 'ob');
