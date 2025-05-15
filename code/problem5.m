%% Problem 5: Transmit and Noise 
fprintf('Problem 5: Transmit Raised Cosine + AWGN \n');

rc_pulse = rc_05; 
tx_signal = conv(line_code, rc_pulse, 'same');

% Eye diagram of transmitted signal
eyediagram(tx_signal, 2*samples_per_bit);
title('Eye Diagram of Transmit Signal with Raised Cosine');

% Add AWGN noise
r1 = awgn(tx_signal, 10*log10(1/0.5), 'measured');
r2 = awgn(tx_signal, 10*log10(1/2), 'measured');

% Plot noisy signals
figure;
subplot(2,1,1); plot(r1); title('Received Signal σ² = 0.5');
subplot(2,1,2); plot(r2); title('Received Signal σ² = 2');

% Eye diagrams of noisy signals
eyediagram(r1, 2*samples_per_bit);
title('Eye Diagram σ² = 0.5');
eyediagram(r2, 2*samples_per_bit);
title('Eye Diagram σ² = 2');

sound(r1, Fs);
