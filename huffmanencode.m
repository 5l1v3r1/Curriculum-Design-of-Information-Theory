function [vector,scalar] = huffmanencode(source)
% perfect
n=length(source);  
source = sort(source);
q=source;  
m=zeros(n-1,n);  
for i=1:n-1  
    [q,e]=sort(q);   
    m(i,:)=[e(1:n-i+1),zeros(1,i-1)]; %������l ����һ�����󣬸þ���������ʺϲ�ʱ��˳�����ں���ı���  
    q=[q(1)+q(2),q(3:n),1];   
end  
   
for i=1:n-1  
    tem_c(i,1:n*n)=blanks(n*n); %tem_c �������ڽ���huffman ����  
end  
    tem_c(n-1,n)='1'; %����a ����ĵ�n-1 �е�ǰ����Ԫ��Ϊ����huffman ����Ӻ�����ʱ���õ������������(�ڱ�����Ϊ0.02��0.08)�������ֵΪ0 ��1  
    tem_c(n-1,2*n)='0';   
for i=2:n-1  
    tem_c(n-i,1:n-1)=tem_c(n-i+1,n*(find(m(n-i+1,:)==1))-(n-2):n*(find(m(n-i+1,:)==1))); %����tem_c �ĵ�n-i �ĵ�һ��Ԫ�ص�n-1 ���ַ���ֵΪ��Ӧ��a �����е�n-i+1 ����ֵΪ1 ��λ����tem_c �����еı���ֵ  
    tem_c(n-i,n)='0';   
    tem_c(n-i,n+1:2*n-1)=tem_c(n-i,1:n-1); %����tem_c �ĵ�n-i �ĵڶ���Ԫ�ص�n-1 ���ַ����n-i �еĵ�һ��Ԫ�ص�ǰn-1 ��������ͬ����Ϊ����ڵ���ͬ  
    tem_c(n-i,2*n)='1';   
    for j=1:i-1  
         tem_c(n-i,(j+1)*n+1:(j+2)*n)=tem_c(n-i+1,n*(find(m(n-i+1,:)==j+1)-1)+1:n*find(m(n-i+1,:)==j+1));  
            %����tem_c �е�n-i �е�j+1 �е�ֵ���ڶ�Ӧ��a �����е�n-i+1 ����ֵΪj+1 ��ǰ��һ��Ԫ�ص�λ����tem_c �����еı���ֵ  
    end  
end   
for i=1:n  
    vector(i,1:n)=tem_c(1,n*(find(m(1,:)==i)-1)+1:find(m(1,:)==i)*n); %��vector��ʾ����huffman ����  
    len(i)=length(find(abs(vector(i,:))~=32)); %����ÿһ������ĳ���  
end  
e=sum(source.*len); %����ƽ���볤 
scalar = calentropy(source)/(e*log2(2));
end