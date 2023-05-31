program ej6;
type
    rangoEM = 1..7;
    cadena = string[50];
    Sonda = record
    nombre: cadena;
    duracion: integer;
    costoConst, costoMensual: real;
    cate: rangoEM;
    end;

    ListaSon = ^nodoSon;
    nondoSon = record
    dato: Sonda;
    sig: ListaSon;
    end;

    VectorCont = array[rangoEM] of integer;

procedure LeerReg(VAR S: Sonda);
begin
    writeln('Ingrese el nombre de la sonda: ');
    readln(S.nombre);
    writeln('Ingrese la duración de la sonda: ');
    readln(S.duracion);
    writeln('Ingrese el costo de const.: ');
    readln(S.costoConst);
    writeln('Ingrese el costo mensual: ');
    readln(S.costoMensual);
    writeln('Ingrese la categoria EM: ');
    readln(S.cate);
end;

procedure  AgregarAdelante(var L: ListaSon; S: Sonda);
var
    aux: ListaSon;
begin
    new(aux);
    aux^.dato := S;
    aux^.sig := L;
    L := aux;
end;

procedure CargarSondas(var L: ListaSon);
var
 S: Sonda;
begin
  repeat
    LeerReg(S);
    AgregarAdelante(L,S);
  until(S.nombre = 'GAIA');
end;

procedure Inicializar(var Vc: VectorCont);
var i: rangoEM;
begin
    for i := 1 to 7 do
        Vc[i] := 0;
end;

procedure InformarPorCategoria(Vc: VectorCont);
var i: rangoEM;
begin
    for i := 1 to 7 do
        writeln('Categoría: ', i,' cantidad de sondas: ', Vc[i]);
end;

procedure EvaluarMax(var nomMax: cadena; var costoMax: real; S: Sonda);
var
    costoTotal: real;
begin
    costoTotal := S.costoConst + S.duracion*S.costoMensual;
    if (costoTotal > costoMax) then
        begin
        nomMax := S.nombre;
        costoMax := costoTotal;
    end;
end;


procedure Calcular(L: ListaSon; var nomMax: cadena; var Vc: VectorCont;var duraProm, costoCProm: real);
var
    S: Sonda;
    costoMax, sumaCostoC: real;
    sumaDur, cant: integer;
begin
    costoMax := -1;
    sumaDur := 0;
    cant := 0;
    sumaCostoC := 0;
    while (L <> nil) do begin
        S := L^.dato;
        EvaluarMax(nomMax,costoMax,S); //a
        Vc[S.cate] := Vc[S.cate] + 1; //b
        sumaDur := sumaDur + S.duracion;
        sumaCostoC := sumaCostoC + S.costoConst;
        cant := cant + 1;
        L := L^.sig;
    end;
    duraProm := sumaDur / cant;  //c
    costoCProm := sumaCostoC / cant;  //d
end;

procedure CompararConPromedios(L: ListaSon; duraProm: real;var cantS: integer; costoCProm: real);
begin
    while (L <> nil) do begin
        if (L^.dato.duracion > duraProm) then
        cantS := cantS + 1;  //c
        if (L^.dato.costoConst > costoCProm) then
            writeln(L^.dato.nombre);      
        L := L^.sig;
    end;
end;

var
    L: ListaSon;
    nomMax: cadena;
    Vc: VectorCont;
    duraProm, costoCProm: real;
    cantS: integer;

begin {programa principal}
    L := nil;
     CargarSondas(L);
    Inicializar(Vc);
    Calcular(L, nomMax,Vc,duraProm, costoCProm);
    writeln('La sonda más costosa es: ', nomMax); //a
    InformarPorCategoria(Vc); //b
    cantS := 0;
    CompararConPromedios(L, duraProm, cantS,costoCProm); //d
    writeln('Cantidad de sondas con más duración que el promedio: ', cantS); //c
end.





