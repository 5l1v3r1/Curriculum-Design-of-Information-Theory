function c = fano(source)
% ��������[0.25 0.25 0.20 0.15 0.10 0.05]
n = size(source , 2) ;
%�Ѿ��������
if n == 1
    c = cell(1,1);
    c{1} = '' ;
    return
end
[source , index] = sort(source);%����������
source = fliplr(source) ;
total = sum(source) ;%�ܸ���
acc = 0 ;%�ۻ�����
flag = 0 ;%�Ƿ񵽴�β���ı�־
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
%�ӷֽ������ߵ���ݹ���fano
c1 = fano(source(1:split-1)) ;
c2 = fano(source(split:n)) ;
c = cell(1,n) ;
%���ǰ׺0��1
for i = 1:split-1
    c{i} = strcat('0' , c1{i}) ;
end
for i = split:n
    c{i} = strcat('1' , c2{i - split + 1} ) ;
end
%��˳�������ȥ
c = fliplr(c) ;
c(index) = c ;
end