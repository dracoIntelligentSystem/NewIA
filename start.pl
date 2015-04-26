:-([matrice,agenti,oneDirection]).

flush:-
	abolish(direzione/2),
	abolish(coordX_attuale/2),
	abolish(coordY_attuale/2),
	abolish(numero_passi_effettuati/2).

start :- 
	%b_setval(file, 'C:\\Users\\dragoSI\\git\\expertsistem\\file.txt'),
	b_setval(file, 'C:\\Copy\\eclipse\\workspace\\Sistema Esperto\\file.txt'),
	b_getval(file, File),!,
	delete_file(File),
	make_dim_matrix(10,10,Matrix),
	update_on_file(File,Matrix),
	bagof(Agente,è_un(Agente,agente),Agenti), %redigi elenco/lista agenti smith
	insert_agents(Agenti,Matrix,MatrixUpdate),%inserisci gli agenti nell'ambiente
	insert_theOneAndTarget(MatrixUpdate,NeoEnv),%inserisci Neo nell'ambiente e il target/telefono con cui uscire da Matrix
	update_on_file(File,NeoEnv),
	muovi_agenti(30,Agenti,NeoEnv,_MatrixFinal),%impostate 30 iterazioni a scopo di test
						%la condizione di stop sarà se le coordinate di NEO sono identiche al target, se non lo sono, muovere tutto il carroccio
	%update_on_file(File,MatrixFinal),
	flush.