program ej;
Type
    punt = ^integer;
Var
    p,q:punt;

Begin
    new (p); 
    p^:= 14;
    write (p^);
    q:=p; 
    q^:= q^*10;
    write (p^);
    write(q^); 
    dispose (q);
    write (p^);
    write (q^);     
end.
