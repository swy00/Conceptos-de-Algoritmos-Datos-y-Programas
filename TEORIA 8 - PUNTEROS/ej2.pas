program ej2;
type
  punt = ^integer;
Var
  p,q:punt;
  num:integer; 

Begin
  num:= 63;
  new (p);
  new(q);
  q^:= num - 10; 
    
  write(q^);
  write(p^);
end.
