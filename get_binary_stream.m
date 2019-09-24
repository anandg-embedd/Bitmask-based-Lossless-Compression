function [ t_im ] = get_binary_stream( msg )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
stringa=msg;
t_im=uint8(zeros(length(msg)*8,1));
 for i=1:length(stringa)     %Per ogni carattere della stringa:
        for j=1:8                                   %Per ogni bit del singolo carattere:
                                   %Se non è presente la key:
                index=(i-1)*8 + j;                  %Calcolo l'indice del pixel da modificare
            
            b=bitget(uint8(stringa(i)),j);          %Acquisisco il j-esimo bit dell'i-esimo carattere
            if(b==1)                                %Se è pari a 1:
                t_im(index)=bitset(t_im(index),1);  %Setto il bit meno significato del pixel indicato da index
            end
        end
  end

end

