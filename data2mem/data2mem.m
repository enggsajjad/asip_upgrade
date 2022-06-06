%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VULNERABILITY STATS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear  all
format long g
% read stats
lut=[192,48,12,3];
fid = fopen('matlab.mem','wt');
M = dlmread('bramO0_uprint_data2mem_dec.txt');
[R C]=size(M)
indx=0;
for k=1:C
    for j=1:4
        a='';
        for i=1:R
            b= dec2bin(bitand(M(i,k),lut(j)),8);
            a=strcat(b(2*j-1:2*j),a);
        end
        IM=dec2hex(bin2dec(a),8);
        fprintf(fid,'%s %s\n', dec2hex(indx*4,8),IM);
        indx=indx+1;
    end
end
fclose(fid);