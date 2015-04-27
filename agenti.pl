:-dynamic direzione/2.
:-dynamic coordX_attuale/2.
:-dynamic coordY_attuale/2.
:-dynamic numero_passi_effettuati/2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
è_un(smith0,agente).
id(smith0,'X').
coordX_attuale(smith0,3).
coordY_attuale(smith0,1).
direzione(smith0,'E').
numero_passi_in_direz(smith0,8).
numero_passi_x_step(smith0,1).
numero_passi_effettuati(smith0,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
è_un(smith1,agente).
id(smith1,'Y').
coordX_attuale(smith1,1).
coordY_attuale(smith1,3).
direzione(smith1,'S').
numero_passi_in_direz(smith1,5).
numero_passi_x_step(smith1,1).
numero_passi_effettuati(smith1,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
è_un(neo,eletto).
id(neo,'N').
coordX_attuale(neo,8).
coordY_attuale(neo,6).
%direzione(neo,Boh).
numero_passi_x_step(neo,1).
numero_passi_effettuati(neo,0).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
id(target,'T').
coord_goal(target,1,9).

inverti_direzione(Agente):-
	%id(Agente,IdAgente),
	direzione(Agente, Dir),
	dir_opposta(Dir,Opp),
	retract(direzione(Agente, Dir)),
	assert(direzione(Agente,Opp)),
	retract(numero_passi_effettuati(Agente,_)),
	assert(numero_passi_effettuati(Agente,1)).
	
prendi_coord_attuali(Agente,X,Y):-
	coordX_attuale(Agente,X),
	coordY_attuale(Agente,Y).
	
cambia_coord_attuali(Agente,NewX,NewY):-
	%id(Agente,IdAgente),
	retract(coordX_attuale(Agente,_)),
	assert(coordX_attuale(Agente,NewX)),
	retract(coordY_attuale(Agente,_)),
	assert(coordY_attuale(Agente,NewY)).
	
upd_done_steps(Agente):-
	numero_passi_effettuati(Agente,Done),
	numero_passi_x_step(Agente,OneMove),
	NewDone is Done + OneMove,
	retract(numero_passi_effettuati(Agente,_)),
	assert(numero_passi_effettuati(Agente,NewDone)).
	