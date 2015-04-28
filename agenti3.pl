%SCENARIO SINGOLO OSTACOLO
%OSTACOLO DIRETTO E FRONTALE
:-dynamic direzione/2.
:-dynamic coordX_attuale/2.
:-dynamic coordY_attuale/2.
:-dynamic numero_passi_effettuati/2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
è_un(smith0,agente).
id(smith0,'X').
tipo_ostacolo(smith0,mobile).
coordX_attuale(smith0,3).
coordY_attuale(smith0,2).
direzione(smith0,'SE').
numero_passi_in_direz(smith0,5).
numero_passi_x_step(smith0,1).
numero_passi_effettuati(smith0,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
è_un(smith1,agente).
id(smith1,'Y').
tipo_ostacolo(smith1,mobile).
coordX_attuale(smith1,4).
coordY_attuale(smith1,6).
direzione(smith1,'O').
numero_passi_in_direz(smith1,5).
numero_passi_x_step(smith1,1).
numero_passi_effettuati(smith1,1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
è_un(neo,eletto).
id(neo,'N').
coordX_attuale(neo,5).
coordY_attuale(neo,4).
%direzione(neo,Boh).
numero_passi_x_step(neo,1).
numero_passi_effettuati(neo,0).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
id(target,'T').
coord_goal(target,1,3).