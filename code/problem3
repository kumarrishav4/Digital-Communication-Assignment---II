%% Problem 3: Line Coding and Eye Diagram 
fprintf('Problem 3: Line Coding and Eye Diagram \n');

bits = randi([0 1], 1, 100);  
polar_nrz = 2*bits - 1;      
Tb = 1e-3; Fs_line = 1e5;     
samples_per_bit = round(Fs_line * Tb);
line_code = repelem(polar_nrz, samples_per_bit);

t_line = (0:length(line_code)-1)/Fs_line;
figure;
plot(t_line(1:20*samples_per_bit), line_code(1:20*samples_per_bit));
title('Polar NRZ Line Code - First 20 bits'); xlabel('Time [s]');

% Eye diagram
eyediagram(line_code, 2*samples_per_bit);
title('Eye Diagram: Polar NRZ');
