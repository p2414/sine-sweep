function [sweep]=ssgen(T,f1,f2,silence,fs)

if nargin < 5
    fs=44100;
end
if nargin < 1
    silence=0;
end
silence=silence*fs;
wave1=2*pi*f1; %Generate sine wave
wave2=2*pi*f2; %^^^
t=0:1/fs:(T*fs-1)/fs; %Length 
t=t';
K=T*wave1/log(wave2/wave1);
L=T/log(wave2/wave1);
sweep=sin(K.*(exp(t./L)-1)); % Generate sine sweep 
if sweep(end)>0
    t_end=find(sweep(end:-1:1)<0,1,'first');
end   
if sweep(end)<0
    t_end=find(sweep(end:-1:1)>0,1,'first');
   
end
