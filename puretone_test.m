close all
clear 

fs=48000;
stim_dur=1; %duration of puretone in seconds

t=0:1/fs:stim_dur-1/fs;


base_volume = 0.0002;
disp("Sample")
[y,v] = puretone(2,1000,base_volume, 1,fs);
sound(y,fs);
pause(1);


on = true;
disp("ISO226:2003")
%{
ISO226:2003
| **Frequency [Hz]** | **dB SPL** | **dB HL** |
| ---  | --- | --- |
| 250  |  12 |  0  |
| 500  |  5  |  0  |
| 1000 | 2   |  0  |
| 2000 | - 2 |  0  |
| 4000 | - 5 |  0  |
| 8000 | 13  |  0  |
%}
f = [250,500,1000,2000,4000,8000];
dB  = [12, 5,2,-2,-5,13];
on = true;

if on
    for i = 1:6
        disp(f(i));
        [y,v] = puretone(dB(i),f(i),base_volume,1,fs);
        sound(y,fs);
        audiowrite("ISO_"+num2str(f(i))+".wav",y,fs);
        pause(1);
    end
end

%{
ANSI S3.6-1996
Frequency [Hz]	SPL to HL(dB)
125	45
250	27
500	13.5
1000	7.5
1500	7.5
2000	9.0
3000	11.5
4000	12
6000	16
8000	15.5
%}


disp("ANSI S3.9-1996")
base_volume = 0.0001;
f =   [125, 250, 500, 1000,1500,2000,3000,4000,6000,8000];
dB  = [45, 27, 13.5, 7.5, 7.5, 9.0, 11.5, 12, 16, 15.5];
on = true;

if on
    for i = 1:10
        disp(f(i));
        [y,v] = puretone(dB(i),f(i),base_volume,1,fs);
        sound(y,fs);
        audiowrite("ANSI_"+num2str(f(i))+".wav",y,fs);
        pause(1);
    end
end