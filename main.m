clc
clear all
close all
msg='HITECH SOLUTIONS is one of the popular company for industrial automation and academic solutions, They have doing research work for various electronic and mechanical field..';
%% Compression
bin=get_binary_stream(msg);
[cbin,dic]=comp(bin);
% Compression  Radio
fprintf('Compression Radio=%f\n',(length(cbin+length(dic(:)))/length(bin)));
%% Decompression
dbin=decomp(cbin,dic);
str=get_string(dbin);
fprintf('Result\n');
disp(str);