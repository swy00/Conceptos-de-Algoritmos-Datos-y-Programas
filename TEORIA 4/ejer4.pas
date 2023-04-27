Program Ejercicio4;
Type 
  rango = 1..100;	
  vecNum = array [rango] of integer;
{Punto A, dado un num X y el vector de numeros, 
retornar la posicion del num X en dicho vector o el valor -1 si no se encuentra}
procedure posicion (v: vecNum; x:integer;var pos:integer)
var
    pos:integer;
    stop:boolean;
begin
    pos :=1;
    stop :=false;
    while (stop = false) do
        if (v[pos] <> X) then 
            pos:= pos + 1;
        else 
            stop:= true;
end;

{recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y}

procedure intercambio (var v:vecNum;x:integer;y:integer)
var
    i,posx,posy,x,y,vTemp: integer;
begin
    for i:=1 to 100 do
        if x = v[i] then
            posx:=i;
        if y = v[i] then
            posy:=i;               
    vTemp=v[posy];
    v[posy]:=v[posx];
    v[posx]:=c;
end;

{c) sumaVector: retorna la suma de todos los elementos del vector.}
function sumaVector(vector: vecNum): integer;
var
    suma,i:integer;
begin
    suma:=0;
    for i:=1 to 100 do
        suma:= suma + v[i]
    sumaVector:= suma;
end;
{d) promedio: devuelve el valor promedio de los elementos del vector}
function promedio(v:vecNum): real;
var
    i,suma: integer;
begin
    suma := 0;
    for i := 1 to 100 do
        suma := suma + v[i];
    promedio := suma / 100;
end;

end.


