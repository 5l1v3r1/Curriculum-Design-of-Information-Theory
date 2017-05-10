clear all;clc;
N = 32;
source = zeros(1, N);
for i=1:N
    source(i) = rand;
end
source = source/sum(source);
source = sort(source, 'ascend');

[huffman_codeword, huffman_efficiency] = huffmanencode(source);
[shannon_codeword, shannon_efficiency] = shannonencode(source);
[fano_codeword, fano_efficiency] = fanoencode(source);


