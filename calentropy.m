function entropy = calentropy(source)
entropy = 0;
for i=1:length(source)
    if (source(i) - 0)<=eps(0)
        continue;
    end
    entropy = entropy + -1*source(i)*log2(source(i));
end
end