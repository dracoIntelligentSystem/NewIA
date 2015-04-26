library(lists).
%:-([oneDirection]).
make_dim_matrix(M,N,Matrix) :- make_matrix(M,N,Matrix).

make_matrix(_, N, []) :- N =< 0, !.
make_matrix(M, _, []) :- M =< 0, !.
make_matrix(M, N, [R|Rs]) :-
    make_list(M,R),
    N2 is N - 1,!,
    make_matrix(M, N2, Rs).

make_list(N, [ ]) :- N =< 0, !.
make_list(N, ['0' | Rest]) :-
    N > 0,
    N2 is N - 1,!,
    make_list(N2, Rest).
    
update_on_file(NameFile,Matrix):- 
	open(NameFile,append,Stream),
	write(Stream,Matrix), nl(Stream),
	close(Stream).
	
change_value_matrix(Matrix, I, J, NewValue,Upd):-
	nth1(I,Matrix,OldRow,RestRows),
	nth1(J,OldRow,_,RestRow),
	nth1(J,NewRow,NewValue,RestRow),
	nth1(I, Upd, NewRow, RestRows).

posizione_attuale(Matrice,Agente,I,J):-posizione_attuale_fw(Matrice,Agente,1,I,J).
posizione_attuale_fw(Matrice,Agente,Row,I,J):-
	nth1(Row,Matrice,Riga),
	nth1(J,Riga,Agente),I is Row,!;
	NextRow is Row+1,
	posizione_attuale_fw(Matrice,Agente,NextRow,I,J).

insert_agents([],AgentEnv,AgentEnv):-!.
insert_agents([Agente|Restanti_Agenti],Matrix,NewUp):-
	è_un(Agente,agente),
	prendi_coord_attuali(Agente, X, Y), 
	id(Agente,Id),
	change_value_matrix(Matrix, X, Y, Id, Upd),!,
	insert_agents(Restanti_Agenti,Upd,NewUp).
	
insert_theOneAndTarget(Matrix,Filled):-
	è_un(Neo,eletto),!,
	prendi_coord_attuali(Neo, X, Y),
	id(Neo,Id),
	change_value_matrix(Matrix, X, Y, Id, WithNeo),
	id(target,IdTarget),
	coord_goal(target, X_goal, Y_goal),
	change_value_matrix(WithNeo, X_goal, Y_goal, IdTarget, Filled).

simulazione_sposta_light(Matrix,Agente,MatrixUpdate,AgentedaInserire):-
	prendi_coord_attuali(Agente, I, J),
	direzione(Agente,Direction),
	id(Agente, Id),
	%writeln(Agente),
	numero_passi_x_step(Agente, Step),
	posizione_attuale(Matrix,Id,I,J),
	nuova_posizione(I,J,Direction,Step,NewI,NewJ),
	posizione_attuale(Matrix,InfoPosizione,NewI,NewJ),%write(Agente),
	InfoPosizione='0', AgentedaInserire=Agente,
	%
	%isPossibleAdvance(Upd,NewI,NewJ,AgentedaInserire),
	change_value_matrix(Matrix,I,J,'0',Upd),
	change_value_matrix(Upd,NewI,NewJ,Id,MatrixUpdate),!;
	AgentedaInserire=[],MatrixUpdate=Matrix.

%isPossibleAdvance(Ambiente,NewX,NewY,Agente
%posizione_attuale(Matrice,Agente,I,J)

sposta(Matrix,Agente,MatrixUpdate):-
	numero_passi_effettuati(Agente,StepDone),
	numero_passi_in_direz(Agente, Step2Do),
	StepDone==Step2Do,fail,!;
	prendi_coord_attuali(Agente, I, J),
	change_value_matrix(Matrix,I,J,'0',Upd),
	direzione(Agente, Direction),
	numero_passi_x_step(Agente, Step),
	nuova_posizione(I,J,Direction,Step,NewX,NewY),
	cambia_coord_attuali(Agente,NewX,NewY),
	upd_done_steps(Agente),
	id(Agente, Id),
	change_value_matrix(Upd,NewX,NewY,Id,MatrixUpdate).

muovi_agenti_single_step([],Fin,Fin):-!.
muovi_agenti_single_step([Agente|Restanti_Agenti],Matrix,NewUp):-
	Agente=[],
	%muovi_agenti_single_step(Restanti_Agenti,MatrixUpdate,NewUp);
	muovi_agenti_single_step(Restanti_Agenti,Matrix,NewUp);
	sposta(Matrix,Agente,MatrixUpdate),!,
	muovi_agenti_single_step(Restanti_Agenti,MatrixUpdate,NewUp).
	
muovi_agenti(0,_,FinalMatrix,FinalMatrix):-!.	
muovi_agenti(Counter,ListaAgenti,Matrix,Final):-%FORSE NON MI SERVE LA NOTAZIONE BASSA DI LISTA [Agente|Restanti_Agenti] -> PROVO UNA VARIABILE
	who_has2change_direction(ListaAgenti,[],_Consentiti),%se devono cambiare direzione LA CAMBIANO, NON MI INTERESSA SAPERE CHI L'HA CAMBIATA.
	choiseBestMove(Matrix,ListaAgenti,BestMove),%to substitute SORTED with BESTMOVE
	/*sort_move(Matrix,[],Consentiti,[],Sorted),%se la nuova posizione è occupata devi aspettare... è una simulazione di muovi_agenti_single_step
	muovi_agenti_single_step(Sorted,Matrix,Upd),
	print_situation(Sorted,Upd),
	UpdCounter is Counter-1,!,
	muovi_agenti(UpdCounter,Consentiti,Upd,Final).*/
	muovi_agenti_single_step(BestMove,Matrix,Upd),%dopo di questo costruisci la virtualizzazione della matrice e ragiona sulle angolazioni dopodicchè decidi una direzione o meglio redigi una lista delle direzioni privilegiate
	print_situation(BestMove,Upd),
	UpdCounter is Counter-1,!,
	muovi_agenti(UpdCounter,ListaAgenti,Upd,Final).
	
who_has2change_direction([],Consentiti,Consentiti):-!.
who_has2change_direction([Agente|Restanti],Parziale,Consentiti):-
	numero_passi_effettuati(Agente, DoneStep),numero_passi_in_direz(Agente, DoneStep),!,
	inverti_direzione(Agente),
	who_has2change_direction(Restanti, [Agente|Parziale],Consentiti);
	who_has2change_direction(Restanti, [Agente|Parziale],Consentiti).
	
print_situation(Consentiti,MatriceIntermedia):-
	length(Consentiti, 0);
	update_on_file('C:\\Copy\\eclipse\\workspace\\Sistema Esperto\\file.txt',MatriceIntermedia).
	
sort_move(_,_,[],Agenti_che_possono_muoversiBeta,Agenti_che_possono_muoversi):-reverse(Agenti_che_possono_muoversiBeta,Agenti_che_possono_muoversi),!.
sort_move(Ambiente,AmbienteSimulato,[Agente|Restanti_Agenti],Parziale,Esegui):-
	simulazione_sposta_light(Ambiente,Agente,AmbienteParzSimulato,Agente_da_Inserire),
	Agente_da_Inserire=[],!,
	sort_move(AmbienteParzSimulato,AmbienteSimulato,Restanti_Agenti,Parziale,Esegui);
	simulazione_sposta_light(Ambiente,Agente,AmbienteParzSimulato,Agente_da_Inserire),
	sort_move(AmbienteParzSimulato,AmbienteSimulato,Restanti_Agenti,[Agente_da_Inserire|Parziale],Esegui).
	%
	%virtualizza ambiente
	
choiseBestMove(Ambiente,ListaAgenti,MigliorCombinazione):-
	bagof(Combinazione, permutation(ListaAgenti, Combinazione), TutteLeCombinazioni),
	writeln(ListaAgenti),
	schedulazioneCombinazioni(Ambiente,TutteLeCombinazioni,[],MigliorCombinazione).

schedulazioneCombinazioni(_,[],TheBest,TheBest):-!.
schedulazioneCombinazioni(Ambiente,[Combinazione|Restanti_Combinazioni],PartialTheBest,TheBest):-
	sort_move(Ambiente, [], Combinazione, [], RisultatoCombinazione),%%POTREBBE ESSERE PER IL FATTO CHE IL METODO SORT CAMBIA LA COMBINAZIONE ORIGINARIA CHE INTENDO COMPIERE
	%RisultatoCombinazione mi restituisci CHI può muoversi, ma mi ha cambiato il QUANDO, INVERTENDOMI LA LISTA.
	writeln('Migliore'),
	%
	length(RisultatoCombinazione, NumeroMosse),
	length(PartialTheBest, AttualeMaggiorNumeroMosse),
	NumeroMosse>=AttualeMaggiorNumeroMosse,!,
	schedulazioneCombinazioni(Ambiente,Restanti_Combinazioni,RisultatoCombinazione,TheBest);
	writeln('Nulla di fatto'),
	schedulazioneCombinazioni(Ambiente,Restanti_Combinazioni,PartialTheBest,TheBest).