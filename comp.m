function [ o_bin,dic ] = comp( i_bin )
%Compressed operation performed by BitMask and RLE
%   i_bin = input, o_bin = output, dic = best dictionary for decompress
dat=reshape(i_bin,8,[])';
dat=bi2de(dat);
% Find the unique values
uniqueVals = unique( dat );

% Count the number of instances of each of the unique vals
valCount = hist( double(dat) , double(uniqueVals) )';
[~,id]=max(valCount);
valCount(id)=0;
dic(1,:)=de2bi(uniqueVals(id),8);
[~,id]=max(valCount);
valCount(id)=0;
dic(2,:)=de2bi(uniqueVals(id),8);
 
%dic=[zeros(1,8);ones(1,8)];
len=length(i_bin);
o_bin=[];
for i=1:8:len
    o_bin=[o_bin,bit_comp(i_bin(i:i+7)',dic)];
end
    

end

