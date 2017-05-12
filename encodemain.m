clear all;clc;
N = 32;
count = 5; % �ظ�����
huffman_v = zeros(5,1);
fano_v = zeros(5,1);
shannon_v = zeros(5,1);

for k = 1:count
    source = zeros(1, N);
    for i=1:N
        source(i) = rand;
    end
    source = source/sum(source);
    source = sort(source, 'ascend');
    [huffman_codeword, huffman_efficiency] = huffmanencode(source);
    [shannon_codeword, shannon_efficiency] = shannonencode(source);
    [fano_codeword, fano_efficiency] = fanoencode(source);
    huffman_v(k) = huffman_efficiency;
    fano_v(k) = fano_efficiency;
    shannon_v(k) = shannon_efficiency;
end
x = 1:count;
figure;
plot(x, huffman_v, 'r-', x, fano_v, 'b-', x, shannon_v, 'g-');
axis([0 6 0.85 1]);   %axis��������  
grid on;
xlabel('����');
ylabel('����Ч��');
title('���ֱ���Ч�ʱȽ�');
legend('����������','��ŵ����','��ũ����');


