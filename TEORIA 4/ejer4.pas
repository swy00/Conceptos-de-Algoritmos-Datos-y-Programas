Program Ejercicio4;
Type 
  rango = 1..100;	
  vecNum = array [rango] of integer;
{Punto A, dado un num X y el vector de numeros, 
retornar la posicion del num X en dicho vector o el valor -1 si no se encuentra}
procedure posicion (v: vecNum; x:integer;var pos:integer);
var
    posi:integer;
    stop:boolean;
begin
    posi:= 1;
    stop:= false;
    while (stop = false) do
        if (v[pos] <> X) then
            posi:= pos + 1;
        else;
            stop:= true;
end;

{b)recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
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
    vTemp = v[posy];
    v[posy] := v[posx];
    v[posx] := vTemp;
end;

{c) sumaVector: retorna la suma de todos los elementos del vector.}
function sumaVector(vector: vecNum): integer;
var
    suma,i: integer;
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
    suma := sumaVector(v);
    promedio := suma / 100;
end;
{elementoMaximo: retorna la posición del mayor elemento del vector}
function elementoMaximo(v:vecNum):integer;
var
    max,i,pos:integer;
begin
    max:=0;
    pos:=0;
    for i := 1 to 100 do
    begin
        if v[i] > max then
        begin
            max := v[i];
            pos := i;
        end;
    end;
    elementoMaximo := pos;
end;
{elementoMinimo: retorna la posicion del menor elemento del vector}    
function elementoMinimo(v:vecNum):integer;
var
    min,i,pos:integer;
begin
    min:=100;
    pos:=0;
    for i := 1 to 100 do
    begin
        if v[i] < min then
        begin
            min := v[i];
            pos := i;
        end;
    end;
    elementoMinimo := pos;
end;
var
    v:vecNum;
    stop:boolean;
    i:integer;
    x:= real;
begin
    stop:= false;
    i:=1;
    while(stop = false) do
    begin
        writeln('Introducir un numero entero')
        read(x);
        if (x = 0) then
        begin
            stop:=true;
        end;
        v[i]:= x;
        i:= i + 1;
    end;
    elemMax:=elementoMaximo(v)
    posMax:=
    elemMin:=
    elemMin:=
    writeln('El elemento maximo',elemMax,'que se encontraba en la posicion',posMax)
    writeln('fue intercambiado con el elemento minimo',elemMin,'que se encontraba en la posicion',posMin)
end.





