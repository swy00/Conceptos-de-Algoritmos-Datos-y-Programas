program parcial2017;
const
    cantEventos=100;

type
    
    tiposEventos = 1..5;
    
    infoEvento = record
        nombreEvento:string;
        tipoEvento:tiposEventos;
        lugarEvento:string;
        cantMaxPermitida:integer;
        costoEntrada:integer;
    end;
    
    dataTipoEvento = array[tiposEventos] of infoEvento;

    venta = record
        codVenta:integer;
        numEvento:Integer;
        DNIComprador:integer;
        cantEntradas:real;
    end;

    lista=^nodo;

    nodo = record
        dato:venta;
        sig:lista;
    end;



    vectorTipoEvento = array[1..cantEventos] of detalleEvento;

    detalleEvento = record
        recaudacion:integer;
        cantEntradasVendidas:real;
    end;

procedure leerVenta(var v:venta)
begin
    readln(nue^.codVenta);
    readln(nue^.numEvento);
    readln(nue^.DNIComprador);
    readln(nue^.cantEntradas);
end;

procedure agregarAdelante(var l:lista;nue:venta)
var
    aux:lista;
begin
    new(aux);
    aux^.dato:=nue;
    aux^.sig:=l;
    l:=aux;
end;


procedure armarLista(var l:lista;);
var
    nue:venta;
begin
    while (nue.codVenta <> -1) do
    begin
        leerVenta(nue);
        agregarAdelante(l,nue);
    end;

end;

procedure recorrerVector(v:vectorTipoEvento;vec:dataTipoEvento);
var
    min1,min2:integer;
    monto1,monto2:Integer;
begin
    min1:= 9999;
    min2:= 9999;
    for i:= to cantEventos do begin
        if (v[i].recaudacion < min1) then
        begin
            min2:=min1;
            monto2:=monto1;
            min1:=i;
            monto1:= v[i];
        end
        else
        begin
            max2:=i;
            monto2:=v[i];
        end;
    end;
    writeln('El lugar de nombre',dataTipoEvento[min1].nombreEvento,'obtuvo la menor recaudacion');
    writeln('El lugar de nombre',dataTipoEvento[min2].nombreEvento,'obtuvo la menor recaudacion');

end;


function masParesQueImpares(dni:Integer):Boolean
var
    cantPares:integer;
    cantImpares:Integer;
begin
    cantPares:=0;
    cantImpares:=0;
    while (dni <> 0) do
    begin
        if ((dni MOD 10)MOD 2)=0 then
        begin
            cantPares:= cantPares+1;
        end
        else
        begin
            cantImpares:=cantImpares+1
        end;
        dni := dni DIV 10;{le saco el ultimo digito que procesé}
    end;
    masParesQueImpares=(cantPares>cantImpares);
end;



procedure recorrerLista (var l:lista;vec:vector);
var
    vectorTipoEvento:vectorTipoEvento;
    aux:lista;
    recaudacion:integer;
    cantEntradas:integer;
    tipoEventoVenta:integer;
begin
    recaudacion:=0;
    cantEntradas:=0;
    while (l <> nil) do
    begin
    {este lleva la cuenta de la recaudacion y cant entradas de cada evento}
        tipoEventoVenta:=vec[l^.dato.numEvento].tipoEvento;
        vectorTipoEvento[l^.dato.numEvento].recaudacion:= vectorTipoEvento[l^.dato.numEvento].recaudacion + ((l^.dato.cantEntradas)* vec[l^.dato.numEvento].costoEntrada);
        if (masParesQueImpares(l^.dato.DNIComprador)) and (vec[tipoEventoVenta = 3]) then
        begin
            cantEntradas:=cantEntradas+1;
        end;
        {falta el C}

        l:=l^.sig;            
    end;
    recorrerVector(vectorTipoEvento,vec); {para que me diga los eventos con menores recaudaciones}
end;


var
    l:lista;
    vector:dataTipoEvento;
begin
armarLista(l);
cargarVector(vector); //SE DISPONE
recorrerLista(l,vector);

end.