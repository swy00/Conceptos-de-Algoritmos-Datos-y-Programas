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

{PARECIDO AL ENUNCIADO DE ARRIBA; PERO LO QUE SE DISPONE SON LAS CATEGORIAS, NO LAS COMPRAS 
Y ALGUNOS OTROS CAMBIOS MINIMOS}

program p7parcialViejo4;
const
    cantCategorías = 20;
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
    vectorMontos = array [rangoCategoria] of integer; {para guardar el monto recaudado en cada categoria}


procedure leerCategoria(var cat : categoria; var cod : rangoCategoria);
var
begin
    readln(cat.nombre);
    readln(cat.precio);
    readln(cod);
end;


//procedure cargarCategorias(var v:vectorCategorias);
//var
//    i , cod : rangoCategorias;{para iterar por cada categoría}
//    cat : categoria;
//begin
//
//    for i:=1 to  cantCategorías do
//    begin
//        leerCategoria(cat,cod);
//        v[cod] := cat;
//    end;
//end;

procedure inicializarVector(var v:vectorMontos);
var 
    i: rangoCategoria;
begin
    for i:=1 to rangoCategoria do 
    begin
        v[i]:=0;
    end;    
end;

function tieneAlMenos5Pares(dni:integer):Boolean;
var
    cantPares:integer;
begin
    cantPares:=0;
    while (dni <>0) and (cantPares <= 5) do
    begin
        if ((dni MOD 10)MOD 2)=0 then {MOD 10 me da el ultimo numero de la cadena, y el MOD 2 me dice si es par o impar con 0 o 1}
        begin
            cantPares:= cantPares+1;
        end;
        dni := dni DIV 10;{le saco el ultimo digito que procesé}
    end;
    if (cantPares <= 5) then
    begin
        tieneAlMenos3Pares=true;
    end
    else begin
        tieneAlMenos3Pares=false;
    end;
end;

procedure actualizarMinimo (dni:integer;cantCompras:integer;var dniMax:integer;maxCompras:integer);
var
begin
    if (cantCompras < maxCompras) then
    begin
        maxCompras:=cantCompras;
        dniMax:=dni;
    end;
end;

procedure procesarCompras(L:lista; 
                            vec:vectorCategorias ;
                            var DNIMin:integer;
                            var montos : vectorMontos;
                            var cantCompras:integer)
var
    {para el DNI del cliente con max compras}
    cantGastosMin: integer;
    DNIActual, cantGastoActual:integer;
begin
    cantGastosMin := 99999;
    inicializarVector(montos);
    cantCompras := 0;
    while (L <> Nil) do
    begin
        DNIActual:= L^.dato.DNI;
        cantGastoActual:=0;
        while (L<> Nil) and (L^.dato.dni = DNIActual) do
        begin
            cantGastoActual:= cantGastoActual + ((L^.dato.cantKlComprados)*vec[l^.dato.categoria].precio);
            montos[L^.dato.categoria]:= montos[L^.dato.categoria] +1;
            if(tieneAlMenos3Pares(L^.dato.DNI)) then
            begin
                cantCompras:= cantCompras +1;
            L:=L^.sig;
            end;
            actualizarMaximo(DNIActual,cantGastoActual,DNIMin,cantGastosMin);
        end;
    end;
end;

procedure leerCompra(var c:compra);
begin
    readln(c.DNI);
    readln(c.categoria);
    readln(c.cantKlComprados);
end;


procedure agregarAdelante(var l:lista;c:compra);
var
    aux:lista;
begin
    new(aux);
    aux^.dato:=c;
    aux^.sig:=l;
    l:=aux;
end;

procedure cargarLista(var l:lista);
var
    c:compra;
begin
    l:= Nil;
    leerCompra(c);
    while(c.DNI <> -1) do
    begin
        agregarAdelante(l,c);
        leerCompra(c);
    end;
end;
{PROGRAMA PRINCIPAL}
var
    L : lista;
    vec : vectorCategorias;
    DNIMax, cantCompras:integer;
    montos: vectorCategorias;

begin
    cargarLista(L);{TENGO QUE HACER ESTE EN ESTE CASO}
    {PUNTO A}
    cargarCategorias(vec);//SE DISPONE LISTA DE CATEGORIAS
    {PUNTO B}
    procesarCompras(L, vec, DNIMax, montos, cantCompras);
end.