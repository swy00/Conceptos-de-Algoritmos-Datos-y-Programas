Program ej4;
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
    q=nil;
    write (p^);
    write(q^);     
End.
