%% Quantization Function
function [q_out, total_bits] = quantize_signal(signal, L)
    min_val = min(signal);
    max_val = max(signal);
    q_step = (max_val - min_val) / L;
    
    centers = min_val + q_step*(0.5:1:L-0.5); % Mid-rise quantizer
    q_out = zeros(size(signal));
    
    for i = 1:length(signal)
        [~, idx] = min(abs(signal(i) - centers));
        q_out(i) = centers(idx);
    end
    
    total_bits = length(signal) * ceil(log2(L));
end

%% Digital to Analog Reconstruction Function
function analog_signal = digtoanalog(quantized_signal)
    analog_signal = quantized_signal; % Ideal reconstruction
end

%% Raised Cosine Function
function p = raised_cosine(t, T, beta)
    p = zeros(size(t));
    for i = 1:length(t)
        if abs(1 - (2*beta*t(i)/T)^2) < 1e-5
            p(i) = (pi/4)*sinc(1/(2*beta));
        elseif abs(t(i)) < 1e-8
            p(i) = 1;
        else
            numerator = sinc(t(i)/T) * cos(pi*beta*t(i)/T);
            denominator = 1 - (2*beta*t(i)/T)^2;
            p(i) = numerator / denominator;
        end
    end
end
