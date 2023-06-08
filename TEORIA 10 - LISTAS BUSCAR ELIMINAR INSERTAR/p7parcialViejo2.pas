{Una empresa de fletes de larga distancia desea analizar los 
servicios realizados por sus camiones. De cada servicio se
conocen el codigo de camion (entre 200 y 255), provincia de origen
provincia de destino, cantidad de km recorridos y DNI de cliente
La informacion de los servicios se encuentra disponible en una
estructura de datos adecuada, y está ordenada por prov de origen

Realizar un programa que procese la informacion de los servicios
e informe:
-Cantidad de camiones que recorrieron mas de 5000 km entre todos sus viajes
-Nombre de la provincia donde partieron mas viajes
-Cantidad de clientes con DNI impar cuyos viajes fueron dentro de la misma provincia
}

{RESOLUCION PARA COMPROBAR 1h28min https://www.youtube.com/watch?v=Rv48AbjXbRA&list=PLHIr82DPRXloFy4af6HcScIwgEBEz_LXa&index=8}
program p7parcialViejo2;

type

    rangoCamion = 200..255;
    servicios = record  
        codCamion: rangoCamion;
        provOrigen:string;
        provDestino:string;
        cantKmRecorrido:integer;
        dniCliente:integer;
    end;
    lista= ^nodo;

    nodo= record
        dato:servicios;
        sig:lista;
    end;
    vectorCamiones= array[rangoCamion] of real;
{Procesos}

procedure recorrerLista (var pri:lista);
var
    vecViajesxCamion: vectorCamiones;
    total:integer;
    totalViajes: integer;
    actual:string;
    max: Integer;
    nombre: String;
    totalDNI: Integer;
begin
    totalViajes:=0;
    max:= -9999;
    totalDNI:=0;
    while(pri <> nil) do begin
        actual:=pri^.dato.provOrigen;
        while (pri <> nil) and (actual = pri^.dato.provOrigen) do begin
            totalViajes:= totalViajes + 1;

            vecViajesxCamion[pri^.dato.codCamion]:= vecViajesxCamion[pri^.dato.codCamion] + pri^.dato.cantKmRecorrido ; {Voy sumando la cantidad de km que recorre cada camion}
            if (pri^.dato.provOrigen = pri^.dato.provDestino) and (pri^.dato.dni MOD 2=0) then begin
                totalDNI:= totalDNI +1;
            end;
        end;
        pri:=pri^.sig;
        if (total > max) then begin
            max:= total;
            nombre:= actual;
        end;
    end;
    total:=0;
    for i:=200 to 255 do
        if (vecViajesxCamion[i] > 5000)then begin
            total:= total + 1;
        end;
        writeln('La cantida de camiones que recorrieron mas de 5000km fue: ', total);
        writeln('La provincia desde la cual partieron mas viajes fue: ', nombre);
        writeln('La cantida de clientes con DNI impar... fue: ', totalDNI);
end;

{Programa Principal}
Var 
    lis:lista;
begin
    cargarLista(lis);{SE DISPONE}
    recorrerLista(lis);
end.