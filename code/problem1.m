%% Problem 1: Audio and Sampling 
fprintf('Problem 1: Audio Signal Analysis\n');

% Import recorded audio
[x, Fs] = audioread('kumarrishav_pcs.wav');
x = x(:,1); 
t = (0:length(x)-1)/Fs;

% Plot and play original signal
figure;
plot(t, x); title('Original Time-Domain Signal');
xlabel('Time [s]'); ylabel('Amplitude');
sound(x,Fs);

% Plot frequency spectrum
X = fftshift(fft(x));
f = linspace(-Fs/2, Fs/2, length(X));
figure; 
plot(f, abs(X)); title('Original Magnitude Spectrum');
xlabel('Frequency [Hz]'); ylabel('Magnitude');

% Apply 4kHz low-pass filter
x_filtered = lowpass(x, 4000, Fs);
Xf = fftshift(fft(x_filtered));
figure; 
plot(f, abs(Xf)); title('Filtered Magnitude Spectrum');
xlabel('Frequency [Hz]');

% Downsample (Below and Above Nyquist)
Fs_below = 6000; Fs_above = 16000;
x_below = resample(x_filtered, Fs_below, Fs);
x_above = resample(x_filtered, Fs_above, Fs);

% Plot spectra of downsampled signals
figure;
subplot(2,1,1);
plot(linspace(-Fs_below/2, Fs_below/2, length(x_below)), abs(fftshift(fft(x_below))));
title('Spectrum - Below Nyquist'); xlabel('Frequency [Hz]');
subplot(2,1,2);
plot(linspace(-Fs_above/2, Fs_above/2, length(x_above)), abs(fftshift(fft(x_above))));
title('Spectrum - Above Nyquist'); xlabel('Frequency [Hz]');

% Reconstruction from below Nyquist
y_r = resample(x_below, Fs, Fs_below);
figure;
plot((0:length(y_r)-1)/Fs, y_r);
title('Reconstructed Signal from Below Nyquist Sampling Rate');
