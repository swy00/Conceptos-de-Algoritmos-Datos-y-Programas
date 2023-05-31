Program ej3;
Type
    punt= ^integer;
Var
    p,q:punt;

Begin
    new (p);
    new(q);
    p:= q;
    q^:=10; 
    
    write(q^);
    write(p^);
end.
