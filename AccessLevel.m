clear all
close all;
clc;

rights = input("Enter the element for the user: ");
minPermission = input("Enter the minimium permission value: ");
result = '';

for i = 1:length(rights)
    if rights(i) >= minPermission
        result = [result 'A'];
    else
        result = [result 'D'];
    end 
end
disp(result)