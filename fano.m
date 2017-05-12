function c = fano(source)
% 测试向量[0.25 0.25 0.20 0.15 0.10 0.05]
n = size(source , 2) ;
%已经编码完成
if n == 1
    c = cell(1,1);
    c{1} = '' ;
    return
end
[source , index] = sort(source);%按概率排序
source = fliplr(source) ;
total = sum(source) ;%总概率
acc = 0 ;%累积概率
flag = 0 ;%是否到达尾部的标志
for i = 1:n-1
    newacc = acc + source(i) ;
    if abs(total - 2 * newacc) >= abs(total - 2 * acc)
        flag = 1 ;
        break;   
    end
    acc = newacc ;
end
if ~flag
    i = n ;
end
split = i ;
%从分界点对两边的码递归做fano
c1 = fano(source(1:split-1)) ;
c2 = fano(source(split:n)) ;
c = cell(1,n) ;
%添加前缀0，1
for i = 1:split-1
    c{i} = strcat('0' , c1{i}) ;
end
for i = split:n
    c{i} = strcat('1' , c2{i - split + 1} ) ;
end
%将顺序调整回去
c = fliplr(c) ;
c(index) = c ;
end