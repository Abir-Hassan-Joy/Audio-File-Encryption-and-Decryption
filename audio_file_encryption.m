clc
clear all;
close all;

%% Asking for audio file
[fname path] = uigetfile('*.*','Please enter the file');
fname = strcat(path,fname);

info = audioinfo(fname) ;
disp(info)

[w,fs] = audioread(fname);
player = audioplayer(w,fs);

%% Display & Play
subplot(2,2,1)
plot(w)
title('Original Signal')
play(player)
pause(10)

%% Normalization
[l ch] = size(w);
for i =1:ch
    w1 = w(:,i);
    mx = max(abs(w1));
    w1= w1/mx;
    w(:,i) = w1;
end
subplot(2,2,2)
plot(w);
title('Normalized Signal')
play(player)
pause(10)

%% Encryption : Linear encryption
key = 32000;
En = w*key;
subplot(2,2,3)
plot(En)
title('Encrypted Signal')
[w,fs] = audioread(fname);
player = audioplayer(En, fs);
play(player)
pause(10)

%% Decryption
Dec = En/key;
player = audioplayer(Dec,fs);
subplot(2,2,4)
plot(Dec)
title('Decrypted Signal')
play(player)
pause(10)

%% Comparison between Encrypted and decrypted signals
figure
plot(En(:,1),'r-')
hold on
plot(Dec(:,1),'g-')
legend('Encrypted','Decrypted')
title('Comparison')




