Program Ejercicio4;
Type 
  rango = 1..100;	
  vecNum = array [rango] of integer;
{Punto A, dado un num X y el vector de numeros, 
retornar la posicion del num X en dicho vector o el valor -1 si no se encuentra}
procedure posicion (v: vecNum; x:integer,var pos:integer)
var
    pos:integer;
    stop:boolean;
begin
    pos:=1
    stop:=false;
    while (stop = false) do
        if (v[pos] <> X) do
            pos:= pos + 1;
        else do
            stop:= true;
end;

{recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y}

procedure intercambio (var v:vecNum;x:integer;y:integer)
var
    i,posx,posy,x,y,vTemp: integer;
begin
    for i:=1 to 10 do
        if x = v[i] then
            posx:=i;
        if y = v[i] then
            posy:=i;               
    vTemp=v[posy];
    v[posy]:=v[pos];
    v[posx]:=c;
end;

{c) sumaVector: retorna la suma de todos los elementos del vector.}
procedure sumaVector()
var
begin

end;

var
begin

end.