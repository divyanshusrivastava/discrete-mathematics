% this script generates gray codes of n bits
% total 2^n -1 continuous gray codes will be generated.

clear all;
clc;

bits = input('Enter the number of bits: ');

if (bits > 1)
    
    result = zeros((2^bits)-1,bits);
    
    result(1,end) = 1;
    
    result(2,end) = 1;
    result(2,end-1) = 1;

    for i=3:2^(bits)-1
       result(i,:) =  xor(result(i-1,:),result(1,:));
    end
else
    disp('Sorry! bits should be greater than 1');
end

result