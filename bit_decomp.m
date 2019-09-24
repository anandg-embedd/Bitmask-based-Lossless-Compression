function [ decompress_data,n_index ] = bit_decomp( data_comp,dictionary )
%BitMask Based DeCompression for 8bit group
% Input
%   data_comp = Input Binary Stream to be decompressed
%   dictionary = Two binary stream for dictionary, It's optimally select
%   from Total input binary stream
% Output
%   decompress_data = DeCompressed output by bitmask and RLE 
%   n_index = starting of next binary stream to be decompressed
try 
    if(data_comp(1)==1)
       decompress_data= data_comp(2:9);
       n_index=10;
    elseif(data_comp(2)==1)
       decompress_data= dictionary(data_comp(3)+1,:);
       n_index=4;
    else
       decompress_data=dictionary(data_comp(7)+1,:);
       loc=bi2de(data_comp(3:4))*2+1;
       decompress_data(loc:loc+1)=xor(decompress_data(loc:loc+1),data_comp(5:6));
       n_index=8;
    end
catch
    decompress_data=zeros(1,8);
    n_index=length(data_comp)+1;
end
        
end