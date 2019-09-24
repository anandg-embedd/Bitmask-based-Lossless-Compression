function [ bitword ] = get_string( im )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
                                   %Importo l'immagine in un unico vettore colonna
bitword=[''];                                   %Creo il contenitore per la stringa


i=1;
while (i<=length(im)-8),               %Finquando non analizzo tutta l'immagine e non trovo il carattere tappo:
    bitchar=uint8(0);                           %Pulisco la variabile bitchar
    for j=1:8                                   %Operazioni effettuate 8 pixel alla volta
                  
            index=(i-1) + j;                    %Calcolo l'indice del pixel da leggere
        
        b=im(index);                  %Estraggo il bit meno significativo
        if(b==1)                                %Se è pari a 1
            bitchar=bitset(bitchar,j);          %Setto il j-esimo bit del carattere bitchar
        end
    end
%     if(bitchar==255)                            %Controllo se il carattere letto è il tappo
%         flag=1;                                 %Se si pongo flag a 1
%     else
        b_index=(i-1)/8 +1;                     %Altrimenti calcolo l'indice della posizione del carattere nella stringa
        bitword(b_index)=char(bitchar);         %Aggiorno la stringa
        i=i+8;                                  %Aggiorno il contatore i
   % end

end

end

