{
Se lee desde teclado una secuencia de sitios turísticos hasta que llegue el sitio con nombre ‘fin’. De cada sitio se conoce: nombre, provincia a la que pertenece, cantidad de actividades, cantidad de personas que lo visitaron en un mes.
Se pide:
El nombre del sitio con mayor cantidad de actividades.
La cantidad de sitios con más de 20.000 personas que lo visitaron en un mes.
}
program ejercicioejemplo;

type
    sitio = record
        nombre: string;
        prov: string;
        cantAct: integer;
        cantVis: integer;
    end;
    
Procedure LeerRegistro (var s:sitio);
begin
  With s do begin {con esto me ahorro poner s.nombre s.prov en cada parte}
    write('Ingrese el nombre de la provincia');
    readln(nombre);
    if (nombre <> 'fin')then 
    begin
        write('Ingrese el nombre de la provincia');
        readln(prov);
        write('Ingrese la cantidad de actividades');
        readln(cantAct);
        write('Ingrese la cantidad de visitantes');
        readln(cantVis);
    end;
  end;
end;

Procedure actualizarMax (cantAct: integer; nombreAct: string;      
                         var max: integer; var nommax: string ); 
begin
  if (cantAct > max) then 
  begin
    max:= cantAct;
    nommax:= nombreAct;
  end;
end; 

var
    sitioTur: sitio;
    cant, max: integer;
    nomMax: string;
begin
  cant:= 0;
  nomMax:= ' ';
  max:= -1;
  LeerRegistro(sitioTur);
  while (sitioTur.nombre <> 'fin') do begin
    actualizarMax(sitioTur.cantAct, sitioTur.nombre, max, nomMax);
    if (sitioTur.cantVis > 20000) then 
      cant:= cant + 1;
    LeerRegistro(sitioTur); {se lee otro registro}
  end;   
  Write ('Sitio con mas actividades:  ', nomMax);
  Write ('Sitios con más de 20000 visitas:  ', cant);
End.

end.

