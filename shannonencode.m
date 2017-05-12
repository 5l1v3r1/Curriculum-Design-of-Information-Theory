function [vector,scalar] = shannonencode(source)
% vector��������ÿ�����ŵı��룬��Ӧsort(source)
% scalar���ر���Ч��
source = sort(source, 'ascend');
n = length(source);
cum_sum = zeros(1, n); %����ۼƸ��ʵ�����
code_length = zeros(1, n); %���ÿһ����Դ������Ҫ����ĳ���
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
e = sum(source.*code_length); %����ƽ���볤 
scalar = calentropy(source)/(e*log2(2));
end