function [ o_bin ] = decomp( i_bin,dic )
%Decompression by BitMask and RLE
%   dic = input dictionary selcted from input stram
%dic=[zeros(1,8);ones(1,8)];
ind=1;
o_bin=[];
while(ind<=length(i_bin))
    if(ind+8<=length(i_bin))
        [dec,i]=bit_decomp(i_bin(ind:ind+8),dic);
    else
        [dec,i]=bit_decomp(i_bin(ind:length(i_bin)),dic);
    end
    ind=ind+i-1;
    o_bin=[o_bin,dec];
end

end

