%% Problem 2: Quantization
fprintf('Problem 2: Quantization\n');

L_values = [8, 16, 32, 64, 128];
MSE = zeros(size(L_values));
bits_used = zeros(size(L_values));

for i = 1:length(L_values)
    L = L_values(i);
    [q_sig, bits_used(i)] = quantize_signal(x_filtered, L);
    reconstructed_signal = digtoanalog(q_sig);
    MSE(i) = mean((x_filtered - reconstructed_signal).^2);
end

% Plot MSE vs Quantization Levels
figure;
stem(L_values, MSE, '-o'); grid on;
xlabel('Quantization Levels (L)');
ylabel('Mean Square Error (MSE)');
title('Quantization Error vs Levels');

fprintf('Bits used at L=128: %d\n', bits_used(end));
sound(reconstructed_signal, Fs);
