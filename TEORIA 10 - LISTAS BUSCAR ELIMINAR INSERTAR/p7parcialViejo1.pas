{UNa empresa de telefonía celular desea analizar las ventas de 130 modelos
de lefeonos durante la ultima edicion del CyberMonday.
De cada venta se conoce; codigo del cliente;codigo de telefono vendido 
(entre 1-130), marca del telefono y medio de pago
utilizado (1.Credito, 2.Debito, 3.Transferencia, 4-Mercado Pago, 5.Bitcoin, 6.Otro ).
Ademas, la empresa dispone de una tabla con el valor de venta de cada modelo de telefono

A. Realizar un modulo que retorne la informacion de las ventas en una estructura 
de datos adecuada.
-La Informacion se ingresa por teclado y debe almacenarse en el orden que fue leida.
-La lectura finaliza cuando se lee el codigo de cliente 1111, que debe procesarse

B. Realizar un modulo que reciba la informacion cargada en el inciso anterior, y retorne:
-Los dos medios de pago que generaron el mayor monto total en ventas.
-Cantidad de ventas de telefonos marca "Motorola" de cliente cuyo codigo de cliente no termine ni en 0 ni en 1
}

{RESOLUCION PARA COMPROBAR 43min https://www.youtube.com/watch?v=Rv48AbjXbRA&list=PLHIr82DPRXloFy4af6HcScIwgEBEz_LXa&index=8}
program p7parcialViejo1;
{USO UNA LISTA PORQUE NO SE LA CANTIDAD DE VENTAS TOTALES}
type
    rangoPago=1..6;
    rango= 1..130;
    ventas= record
        codigoCli: integer;
        codigoTel: rango;
        marca: string;
        medio: rangoPago;
    end;

    vectorPrecios= array[1..130] of real;
    lista =^nodo;
    nodo= record
        dato:venta;
        sig:lista;
    end;

    vectorGanancias = array [1..6] of real;
{Procesos}
procedure leerVentas (var v:ventas);
begin
    read(v.codigoCli);
    read(v.codigoTel);
    read(v.marca);
    read(v.medio);
end;

procedure agregarAtras(var pri:lista; var ult:lista;ve:venta)
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=v;
    nue^.sig:=nil;
    if  (pri = nil) then begin
        pri:=nue;
    end
    else begin    
        ult^.sig:=nue;
    end;
    ult:=nue;
end;

procedure cargarVentas (var pri:lista);
var
    ven: ventas;
    ult:lista;
begin
    repeat
        leerVentas (ven);
        agregarAtras (pri,ult,ven);
    until (v.codigo = 1111)
end;

procedure recorrerVector(vecGanancias: vectorGanancias);
var 
    max1,max2: integer;
    monto1,monto2: Integer;
begin
    max1:=-9999;
    max2:=-9999;
    for i:= 1 to 6 do begin
        if (vecGanancias[i]>max1) then begin
            max2:=max1;
            monto2:=monto1;
            max1:=i;
            monto1:= vecGanancias[i];
        end
        else begin
            max2:=i;
            monto2:= vecGanancias[i];
        end;
    end;
    writeln('El medio que genero la mayor ganancia es : ', max1);
    writeln('El medio que genero la mayor ganancia es : ', max2);
end;


procedure recorrerLista (var pri:lista; vec:vectorPrecios);
var 
    vecGanan: vectorGanancias;
    total:integer;
begin
    total:= 0;
    while (pri <> nil) do begin
        vecGanan[pri^.dato.medio]:= vectorGanancias[pri^.dato.medio] + vecPrecios[pri^.dato.codigoTel];
        if (pri^.dato.marca = 'Motorola') and (not ((pri^.dato.codigoCel DIV 10 = 0) or pri^.dato.codigoCel DIV 10 = 1)) then;
            total:= total + 1;
        pri:= pri^.sig;
    end;
    recorrerVector(vecGanan);
    writeln('El total de personas que compraron Motorola, con no DNI terminado en 1 o 0', total);

end;


{Programa Principal}
Var 
    lis: lista;
    vecPrecios: vectorPrecios;
begin
    cargarVectorDePrecios (vectorPrecios);
    cargarVentas (lis);
    recorrerLista (lis,vectorPrecios);

end.