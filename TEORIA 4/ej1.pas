program Hello;
type
    vnums = array [1..10] of integer;
var
    numeros: vnums;
    i: integer;
begin
    for i:=1 to 10 do
        numeros[i]:= i;
        writeln(i);
    for i:=2 to 10 do
        numeros[i]:= numeros[i] + numeros[i-1];
        writeln(numeros[i]);
end.

