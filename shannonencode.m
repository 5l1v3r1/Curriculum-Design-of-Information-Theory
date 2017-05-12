function [vector,scalar] = shannonencode(source)
% vector返回最终每个符号的编码，对应sort(source)
% scalar返回编码效率
source = sort(source, 'ascend');
n = length(source);
cum_sum = zeros(1, n); %存放累计概率的向量
code_length = zeros(1, n); %存放每一个信源符号需要编码的长度
%vector = cell(n,1);
for i = 1:n
    if i == 1
        cum_sum(i) = 0;
    else
        cum_sum(i) = sum(source(1:i-1));
    end
    code_length(i) = ceil(-1*log2(source(i)));
    vector(i,1:code_length(i)) = dec2binN(cum_sum(i), code_length(i));
end
e = sum(source.*code_length); %计算平均码长 
scalar = calentropy(source)/(e*log2(2));
end