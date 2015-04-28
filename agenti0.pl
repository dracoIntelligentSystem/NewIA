:-dynamic direzione/2.
:-dynamic coordX_attuale/2.
:-dynamic coordY_attuale/2.
:-dynamic numero_passi_effettuati/2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
è_un(smith0,agente).
id(smith0,'X').
tipo_ostacolo(smith0,mobile).
coordX_attuale(smith0,3).
coordY_attuale(smith0,1).
direzione(smith0,'E').
numero_passi_in_direz(smith0,8).
numero_passi_x_step(smith0,1).
numero_passi_effettuati(smith0,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
è_un(smith1,agente).
id(smith1,'Y').
tipo_ostacolo(smith1,mobile).
coordX_attuale(smith1,1).
coordY_attuale(smith1,3).
direzione(smith1,'S').
numero_passi_in_direz(smith1,5).
numero_passi_x_step(smith1,1).
numero_passi_effettuati(smith1,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
è_un(smith2,agente).
id(smith2,'Z').
tipo_ostacolo(smith2,mobile).
coordX_attuale(smith2,2).
coordY_attuale(smith2,1).
direzione(smith2,'SE').
numero_passi_in_direz(smith2,6).
numero_passi_x_step(smith2,1).
numero_passi_effettuati(smith2,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
è_un(neo,eletto).
id(neo,'N').
coordX_attuale(neo,8).%3 INCOCCIA SMITH0
coordY_attuale(neo,6).%7 INCOCCIA SMITH0
%direzione(neo,Boh).
numero_passi_x_step(neo,1).
numero_passi_effettuati(neo,0).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
id(target,'T').
coord_goal(target,1,9).

%%%%%%%%%%%%%%%%%%%%%%OSTACOLI FISSI%%%%%%%%%%%%%%%%%%%%%%%
/*è_un(smith2,agente).
id(smith2,'D').
coordX_attuale(smith2,7).
coordY_attuale(smith2,7).
è_un(smith3,agente).
id(smith3,'E').
coordX_attuale(smith3,7).
coordY_attuale(smith3,6).
è_un(smith4,agente).
id(smith4,'F').
coordX_attuale(smith4,3).
coordY_attuale(smith4,8).
è_un(smith5,agente).
id(smith5,'G').
coordX_attuale(smith5,3).
coordY_attuale(smith5,9).
è_un(smith6,agente).
id(smith6,'H').
coordX_attuale(smith6,3).
coordY_attuale(smith6,7).*/
%QUI SI IMPALLA PERCHè NON TROVANDO UN CORRIDOIO LIBERO SUBITO 
%NON AGGIRA L'OSTACOLO MA RICADE NELLE STESSE MOSSE
%è_un(smith7,agente).
%id(smith7,'L').
%coordX_attuale(smith7,3).
%coordY_attuale(smith7,10).	