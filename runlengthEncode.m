function output = runlengthEncode(input)
output = '';
i = 1;
while i <= length(input)
    c = 1;
    while i + 1 <= length(input) && input(i) == input(i + 1)
        c = c + 1;
        i = i + 1;
    end
    if c > 4
        output = [output '/'];
        if c < 10
            output = [output '0'];
        end
        output = [output num2str(c) input(i)];
    else
        for j = 1:c
            output = [output input(i)];
        end
    end
    i = i + 1;
end

end



