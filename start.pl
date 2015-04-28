:-([matrice,agenti4,funz_agenti,oneDirection,rosa_dei_venti]).

flush:-
	abolish(direzione/2),
	abolish(coordX_attuale/2),
	abolish(coordY_attuale/2),
	abolish(numero_passi_effettuati/2),
	abolish(ambiente/1).

start :- 
	%b_setval(file, 'C:\\Users\\dragoSI\\git\\expertsistem\\file.txt'),
	b_setval(file, 'C:\\Copy\\eclipse\\workspace\\Copy of Sistema Esperto\\file.txt'),
	b_setval(neo_intercept,f),
	b_getval(file, File),!,
	delete_file(File),
	make_dim_matrix(10,10,Matrix),assert(ambiente(Matrix)),
	update_on_file(File,Matrix),
	bagof(Agente,è_un(Agente,agente),Agenti), %redigi elenco/lista agenti smith
	insert_agents(Agenti,Matrix,Enviroment),%QUI FACCIO ANCHE L'INSERIMENTO DEL TARGET E DI NEO
	update_on_file(File,Enviroment),
	%raggiungi_traguardo(Enviroment,Final),%%VA INSERITO IN MUOVI AGENTI
		%update_on_file(File,NeoEnv),
	muovi_agenti(Agenti,Enviroment,_MatrixFinal),%impostate 30 iterazioni a scopo di test
						%la condizione di stop sarà se le coordinate di NEO sono identiche al target, se non lo sono, muovere tutto il carroccio
	%update_on_file(File,MatrixFinal),
	write('Passi effettuati da Neo per uscire da Matrix: '),numero_passi_effettuati(neo, X),writeln(X), 
	flush.
	
	%A VOLTE SCADE XKè NON HO GESTITO UN INVERTI DIREZIONE