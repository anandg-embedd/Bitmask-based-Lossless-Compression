function [ compress_data ] = bit_comp( original_data,dictionary )
%BitMask Based Compression for 8bit group
% Input
%   original_data = Input Binary Stream to be compressed
%   dictionary = Two binary stream for dictionary, It's optimally select
%   from Total input binary stream
% Output
%   compress_data = Compressed output by bitmask and RLE 

    cmpress_bitmask_0=dictionary(1,:);
    cmpress_bitmask_1=dictionary(2,:);
    if(symerr(original_data , cmpress_bitmask_0)==0)
        compress_data=[0 1 0];
    elseif(symerr(original_data , cmpress_bitmask_1)==0)
		compress_data=[0 1 1];
    else
        comp_d=[0,0];
        x_0=xor(original_data,cmpress_bitmask_0);
        x_1=xor(original_data,cmpress_bitmask_1);
        if(sum(x_0)<sum(x_1))
            xr=x_0;
            end_bit=0;
        else
            xr=x_1;
            end_bit=1;
        end
            for i=1:2:8
                if(sum(xr(i:i+1))>0)
                    comp_d=[comp_d,de2bi((i-1)/2,2),xr(i:i+1)];
                end
            end
            comp_d(end+1)=end_bit;
    if(length(comp_d)<9)
       compress_data= comp_d;
    else
       compress_data=[1, original_data];
    end            
    end

end
            
            
    
		 
	 
 






