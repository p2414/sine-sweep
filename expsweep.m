function [sweep]=expsweep(T,f1,f2,silence,fs)

if nargin < 5
    fs=44100;
end
if nargin < 1
    silence=0;
end
silence=silence*fs;
w1=2*pi*f1; %Generate sine wave
w2=2*pi*f2; %^^^
t=0:1/fs:(T*fs-1)/fs; %Length 
t=t';
K=T*w1/log(w2/w1);
L=T/log(w2/w1);
sweep=sin(K.*(exp(t./L)-1)); % Generate sine sweep 
if sweep(end)>0
    t_end=find(sweep(end:-1:1)<0,1,'first');
end   
if sweep(end)<0
    t_end=find(sweep(end:-1:1)>0,1,'first');
   
end