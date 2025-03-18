fs = 8000;

%note freq definitions
c_sharp = 277;
f_sharp = 370;
g_sharp = 415;
a = 440;
d = 293;
b = 493;
a2 = 110;
b2 = 123;
e3 = 165;

%time lengths of diff values for rests and notes
rest = 0;
duration_eighth = 0.4;
duration_quarter = 0.8;
duration_half = 1.6;
duration_dotted_half = 2.4;
duration_whole = 3.6;
duration_lift = 0.1;

%diff note lengths-- 
t0 = 0:1/fs:(duration_eighth - 1/fs); %eighth note
t1 = 0:1/fs:(duration_quarter - 1/fs); %quarter note
t2 = 0:1/fs:(duration_half - 1/fs); %half note
t3 = 0:1/fs:(duration_dotted_half - 1/fs); %dotted half note
t4 = 0:1/fs:(duration_whole - 1/fs); %whole note
t_lift = 0:1/fs:(duration_lift - 1/fs); %brief lift after phrases, not quite a full rest

% normal notes, adsr effect
note_c_sharp_1 = adsr(t0, fs) .* cos(2*pi*c_sharp*t0);
note_c_sharp_2 = adsr(t2, fs) .* cos(2*pi*c_sharp*t2);
note_c_sharp_3 = adsr(t3, fs) .* cos(2*pi*c_sharp*t3);
note_f_sharp = adsr(t0, fs) .* cos(2*pi*f_sharp*t0);
note_g_sharp = adsr(t0, fs) .* cos(2*pi*g_sharp*t0);
note_a = adsr(t0, fs) .* cos(2*pi*a*t0);
note_d_1 = adsr(t0, fs) .* cos(2*pi*d*t0);
note_d_2 = adsr(t2, fs) .* cos(2*pi*d*t2);
note_d_3 = adsr(t3, fs) .* cos(2*pi*d*t3);
note_b = adsr(t0, fs) .* cos(2*pi*b*t0);
note_rest_eigth = zeros(1, length(t0));
note_lift = zeros(1, length(t_lift));

% harmonic notes for phrase 2, upper right hand
harmonic_c_sharp_1 = note_c_sharp_1 + 0.5 .* cos(2*pi*2*c_sharp*t0);
harmonic_c_sharp_3 = note_c_sharp_3 + 0.5 .* cos(2*pi*2*c_sharp*t3);
harmonic_f_sharp = note_f_sharp + 0.5 .* cos(2*pi*2*f_sharp*t0);
harmonic_g_sharp = note_g_sharp + 0.5 .* cos(2*pi*2*g_sharp*t0);
harmonic_d_1 = note_d_1 + 0.5 * cos(2*pi*2*d*t0);
harmonic_d_3 = note_d_3 + 0.5 .* cos(2*pi*2*d*t3);
harmonic_b = note_b + 0.5 .* cos(2*pi*2*b*t0);
harmonic_a = note_a + 0.5 .* cos(2*pi*2*a*t0);

% bass notes for left hand
a2_3 = adsr(t3, fs) .* cos(2*pi*a2*t3);
b2_3 = adsr(t3, fs) .* cos(2*pi*b2*t3);
e3_3 = adsr(t3, fs) .* cos(2*pi*e3*t3);

% right hand chord -- upper notes
right1_hand = [
    note_c_sharp_1, note_f_sharp, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_d_3, note_lift,  ...
    note_d_1, note_f_sharp, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_c_sharp_3, note_lift, ...
    note_c_sharp_1, note_f_sharp, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_d_3, note_lift,...
    note_b, note_a, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_c_sharp_3, note_rest_eigth, ...
    harmonic_c_sharp_1, harmonic_f_sharp, harmonic_g_sharp, harmonic_a, harmonic_g_sharp, harmonic_f_sharp, harmonic_d_3, note_lift,...
    harmonic_d_1, harmonic_f_sharp, harmonic_g_sharp, harmonic_a, harmonic_g_sharp, harmonic_f_sharp, harmonic_c_sharp_3, note_lift,...
    harmonic_c_sharp_1, harmonic_f_sharp, harmonic_g_sharp, harmonic_a, harmonic_g_sharp, harmonic_f_sharp, harmonic_d_3, note_lift,...
    harmonic_b, harmonic_a, harmonic_g_sharp, harmonic_a, harmonic_g_sharp, harmonic_f_sharp, harmonic_c_sharp_3, note_lift
];
%right hand chord -- lower notes
right2_hand = [
    note_c_sharp_1, note_f_sharp, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_d_3, note_lift,  ...
    note_d_1, note_f_sharp, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_c_sharp_3, note_lift, ...
    note_c_sharp_1, note_f_sharp, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_d_3, note_lift,...
    note_b, note_a, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_c_sharp_3, note_rest_eigth, ...
    note_c_sharp_1, note_f_sharp, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_d_3, note_lift,  ...
    note_d_1, note_f_sharp, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_c_sharp_3, note_lift, ...
    note_c_sharp_1, note_f_sharp, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_d_3, note_lift,...
    note_b, note_a, note_g_sharp, note_a, note_g_sharp, note_f_sharp, note_c_sharp_3, note_lift
];

% left hand notes
left_hand = [
    a2_3, b2_3, note_lift, ...
    e3_3, a2_3, note_lift, ...
    a2_3, b2_3, note_lift, ...
    e3_3, a2_3, note_rest_eigth, ...
    a2_3, b2_3, note_lift, ...
    e3_3, a2_3, note_lift, ...
    a2_3, b2_3, note_lift, ...
    e3_3, a2_3, note_rest_eigth
];

% make sure all samples r the same length
max_length = max([length(right1_hand), length(right2_hand), length(left_hand)]);
right1_hand = [right1_hand, zeros(1, max_length - length(right1_hand))];
right2_hand = [right2_hand, zeros(1, max_length - length(right2_hand))];
left_hand = [left_hand, zeros(1, max_length - length(left_hand))];

% put together right and left hands
songVector = right1_hand + right2_hand;
bothVector = songVector + left_hand;

% normalize amplitude of sound vector
bothVector = bothVector / max(abs(bothVector));

% write to file
filename = 'Zhao_MiaSebTheme.wav';
audiowrite(filename, bothVector, fs);

% ADSR helper function-- intended to sound more like a piano with really
% sticky keys LOL
function dynamicNote = adsr(t, fs)
    A = linspace(0, 1, 0.075 * length(t));
    D = linspace(1, 0.6, 0.2 * length(t));
    S = linspace(0.6, 0.6, 0.625 * length(t));
    R = linspace(0.6, 0, 0.1 * length(t));
    dynamicNote = [A,D,S,R];
end
