program ejBasquet;
type

procedure cargarLista(var L:lista);
var
    j: jugador; 
Begin
    leerJugador(j); 
    while(j.dni <> 0) do begin
    insertarOrdenado(L, j);
    leerJugador(j);
  end;
end;

procedure insertarOrdenado(var L:lista; j:jugador);
var
    nue: lista; 
    act, ant: lista;    {punteros auxiliares para recorrido}
begin
    new (nue); 
    nue^.dato := j; 
    act := L;           {ubico act y ant al inicio de la lista}
    ant := L; 
    while( act <> nil)and(j.altura > act^.dato.altura)do 
    begin
        ant := act;
        act:= act^.sig;
    end;
    if (act = ant) then
    begin {al inicio o lista vacía}
        L:= nue;
    end 
    else                {al medio o al final}
        ant^.sig:= nue;
    nue^.sig:= act; 
end;

var
begin
  
end.