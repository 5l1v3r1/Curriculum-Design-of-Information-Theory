function char_bin = dec2binN(number_dec, N)
% N��ʾ���ؼ�λ
% char_binΪnumber_dec��С�����Nλ
char_bin  = [];
for i=1:N
    if (number_dec - 1/2^i) >= 0
        number_dec = number_dec - 1/2^i;
        char_bin = [char_bin '1'];
    else
        char_bin = [char_bin '0'];
    end
end
end