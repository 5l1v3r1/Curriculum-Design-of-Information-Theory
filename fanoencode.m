function [vector,scalar] = fanoencode(source)
% vector��������ÿ�����ŵı��룬��Ӧsort(source)
% scalar���ر���Ч��
% ��������[0.25 0.25 0.20 0.15 0.10 0.05]
code_cell = fano(source);
N = length(code_cell);
len = zeros(1,N);
for i = 1:N
    vector(i,1:length(code_cell{i})) = code_cell{i};
    len(i) = length(code_cell{i});
end
e = sum(source.*len); %����ƽ���볤 
scalar = calentropy(source)/(e*log2(2));
end