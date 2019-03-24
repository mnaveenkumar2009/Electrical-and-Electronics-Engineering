function str=num2text(a)
    str=[];
    s=['0','1','2','3','4','5','6','7','8','9'];
    while a!=0
        i=mod(int64(a),10);
        str=[s(i+1) str];
        a=floor(a/10);
    end
end