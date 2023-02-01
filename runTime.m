clear all

clc;

input = input('Write a string: ', 's');
output = runlengthEncode(input);
disp(output)