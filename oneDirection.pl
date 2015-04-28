calculate_newCoord(I,J,Direction,Step,NewI,NewJ):-
	Direction = 'N', NewI is I-Step, NewJ is J,!;
	Direction = 'NE', NewI is I-Step, NewJ is J+Step,!;
	Direction = 'E', NewI is I, NewJ is J+Step,!;
	Direction = 'SE', NewI is I+Step, NewJ is J+Step,!;
	Direction = 'S', NewI is I+Step, NewJ is J,!;
	Direction = 'SO', NewI is I+Step, NewJ is J-Step,!;
	Direction = 'O', NewI is I, NewJ is J-Step,!;
	Direction = 'NO', NewI is I-Step, NewJ is J-Step,!.
	
/*calculate_newCoord(I,J,Direction,Step,NewI,NewJ):-
	Direction = 'N', NewI is I+Step, NewJ is J,!;
	Direction = 'NE', NewI is I+Step, NewJ is J+Step,!;
	Direction = 'E', NewI is I, NewJ is J+Step,!;
	Direction = 'SE', NewI is I-Step, NewJ is J+Step,!;
	Direction = 'S', NewI is I-Step, NewJ is J,!;
	Direction = 'SO', NewI is I-Step, NewJ is J-Step,!;
	Direction = 'O', NewI is I, NewJ is J-Step,!;
	Direction = 'NO', NewI is I+Step, NewJ is J-Step,!.*/

/*nuova_posizione(I,J,Direction,Step,NewI,NewJ):-%FORSE MATRIX NON SERVE NEANCHE METTERLO
	%estrai_dim(Matrix,M,N),!,
	calculate_newCoord(I,J,Direction,Step,NewI,NewJ).
	%write(NewI),write('X'),writeln(NewJ).*/
	
	dir_opposta('N','S'):-!.
	dir_opposta('E','O'):-!.
	dir_opposta('S','N'):-!.
	dir_opposta('O','E'):-!.
	dir_opposta('NE','SO'):-!.
	dir_opposta('SO','NE'):-!.
	dir_opposta('SE','NO'):-!.
	dir_opposta('NO','SE'):-!.