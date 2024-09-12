function [y,v] = puretone(dB,f,base,dur,fs)
    t=0:1/fs:dur-1/fs;
    xt=sin(2*pi*f*t);
    v = 10*power(10,dB/20) * base;
    y = xt *v;
end

