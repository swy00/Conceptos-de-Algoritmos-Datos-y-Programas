{Una panaderia artesanal de La Plata vende productos de elaboracion propia.
La panaderia agrupa a sus productos en 26 categorías(1.Pan 2.Medialunas 3.Masasfinas etc)
Para cada categoria se conoce su nombre y el precio por kilo del producto.

La Panadería dispone de informacion de todas las compras realizadas en el ultimo año. De cada
compra se conoce el DNI del cliente, la categoria del producto (entre 1 y 26) y la cantidad de kilos 
comprados.La informacion se encuentra ordenada por DNI del cliente.

a) Realizas un modulo que retorne la informacion de las categorias en una esctructura de datos adecuada.
La informacion se lee por teclado sin ningun orden, De cada categoria se lee el nombre, el codigo(1 a 26) 
y precio por kl

b)Realizar un modulo que reciba la informacion de todas las compras, la informacion de las categorias y 
retorne:
1-DNI del cliente que mas compras ha realizado   //tengo que ir contando las compras que hace cada cliente, como esta ordenado por cliente puede hacer un corte de control, mientras que no cambie de DNI voy sumando y lo comparo con un "max" que voy actualizando
2-Monto total recaudado por cada categoria      //si tengo que tener un vector, donde voy sumando la cantidad de kl+precio en cada categoría
3-Cantidad total de compras de clientes con DNI compuesto por, al menos 
        3 digitos pares
}

program p7parcialViejo3;
const
    cantCategorías = 26;
type
    rangoCategoria= 1..cantCategorías;
    
    categoria= record
        nombre:string;
        precio:real;
    end;

    vectorCategorias= array [rangoCategoria] of categoria;

    compra= record
        DNI:integer;
        categoria:rangoCategoria;
        cantKlComprados:real;
    end;

    lista=^nodo;

    nodo = record
        dato:compra;
        sig:lista;
    end;
    vectorMontos = array [rangoCategoria] of real; {para guardar el monto recaudado en cada categoria}


procedure leerCategoria(var cat : categoria; var cod : rangoCategoria);
var
begin
    readln(cat.nombre);
    readln(cat.precio);
    readln(cod);
end;


procedure cargarCategorias(var v:vectorCategorias);
var
    i , cod : rangoCategorias;{para iterar por cada categoría}
    cat : categoria;
begin

    for i:=1 to  cantCategorías do
    begin
        leerCategoria(cat,cod);
        v[cod] := cat;
    end;
end;

procedure inicializarVector(var v:vectorMontos);
var 
    i: rangoCategoria;
begin
    for i:=1 to rangoCategoria do 
    begin
        v[i]:=0;
    end;    
end;

function tieneAlMenos3Pares(dni:integer):Boolean;
var
    cantPares:integer;
begin
    cantPares:=0;
    while (dni <>0) and (cantPares < 3) do
    begin
        if ((dni MOD 10)MOD 2)=0 then
        begin
            cantPares:= cantPares+1;
        end;
        dni := dni DIV 10;{le saco el ultimo digito que procesé}
    end;
    if (cantPares = 3) then
    begin
        tieneAlMenos3Pares=true;
    end
    else begin
        tieneAlMenos3Pares=false;
    end;
end;

procedure actualizarMaximo (dni:integer;cantCompras:integer;var dniMax:integer;maxCompras:integer);
var
begin
    if (cantCompras > maxCompras) then
    begin
        maxCompras:=cantCompras;
        dniMax:=dni;
    end;
end;

procedure procesarCompras(L:lista; vec:vectorCategorias ;
                            var DNIMax:integer;
                            var montos : vectorMontos;
                            var cantCompras:integer)
var
    {para el DNI del cliente con max compras}
    cantComprasMax: integer;
    DNIActual, cantComprasActual:integer;
begin
    cantCompras:= 0;
    inicializarVector(montos);{tengo que inicializarlo en 0}
    cantComprasMax:=0;

    while (L <> nil) do {mientras que no llego al final de la lista}
    begin
        DNIActual := L^.dato.DNI;
        cantComprasActual:=0;
        while (L <> nil) and (L^.dato.DNI = DNIActual) do
        begin
            cantComprasActual:= cantComprasActual +1;
            montos[L^.dato.categoria]:= montos[L^.dato.categoria] + 
{cantKilos comprados + el precio/kg de esa catgoria}((L^.dato.cantKlComprados)*(v[L^.dato.categoria].precio)) ;
            if(tieneAlMenos3Pares(L^.dato.DNI)) then
            begin
                cantCompras:=cantCompras+1;
            end;
            L := L^.sig; {Como paso al siguiente, se repite el while}
        end;
        actualizarMaximo(DNIActual, cantComprasActual,DNIMax,cantComprasMax);{si compras actual es mas grande que comprasMax, actualizo el maximo}

    end;
end;

{PROGRAMA PRINCIPAL}
var
    L : lista;
    vec : vectorCategorias;
    DNIMax, cantCompras:integer;
    montos: vectorCategorias;

begin
    cargarLista(L);//SE DISPONE LISTA DE COMPRAS
    {PUNTO A}
    cargarCategorias(vec);
    {PUNTO B}
    procesarCompras(L, vec, DNIMax, montos, cantCompras);
end.