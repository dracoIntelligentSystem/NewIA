:- use_module(library(sort)).
adjust_goniometric_angle(Angle_degree,Goniometric_Angle,X,Y,X_goal,Y_goal):-
	X_goal<X, Y_goal>Y, Goniometric_Angle is Angle_degree,!;
	X_goal<X, Y_goal<Y, Goniometric_Angle is 180-Angle_degree,!;
	X_goal>X, Y_goal<Y, Goniometric_Angle is 180+Angle_degree,!;
	X_goal>X, Y_goal>Y, Goniometric_Angle is 360-Angle_degree,!;
	X_goal<X, Y_goal=Y, Goniometric_Angle is 90,!;
	X_goal=X, Y_goal<Y, Goniometric_Angle is 180,!;
	X_goal>X, Y_goal=Y, Goniometric_Angle is 270,!;
	X_goal=X, Y_goal>Y, Goniometric_Angle is 0,!.
	
direction_from_degree(-22.4,22.5,0,'E').
direction_from_degree(22.6,67.5,45,'NE').
direction_from_degree(67.6,112.5,90,'N').
direction_from_degree(112.6,157.5,135,'NO').
direction_from_degree(157.6,202.5,180,'O').
direction_from_degree(202.6,247.5,225,'SO').
direction_from_degree(247.6,292.5,270,'S').
direction_from_degree(292.6,337.5,315,'SE').

find_Sort_direction_List(Goniometric_Angle,Rank_Direction):-
	find_alternative(Goniometric_Angle,['E','NE','N','NO','O','SO','S','SE'],AllDistanceDirection),
	predsort(compareDistances, AllDistanceDirection, Rank_Direction).%sto metodo fottuto mi elimina i duplicati
	
between_floatValue(MinValue,MaxValue,Value):-
	Value>MinValue,
	Value<MaxValue.
	
compareDistances(X,[_,Distance1],[_,Distance2]):-Distance1==Distance2;compare(X,Distance1,Distance2).

find_alternative(_,[],[]):-!.
find_alternative(Goniometric_Angle,[Direction|Other_Direction],[[Direction,Distance]|Other_data]):-
	direction_from_degree(_,_,AngleCardinalDirection,Direction),
	DistanceBeta is abs(Goniometric_Angle-AngleCardinalDirection),
	distance2add(DistanceBeta,Distance),!,
	find_alternative(Goniometric_Angle,Other_Direction,Other_data).
	
distance2add(DistanceBeta,Distance):-
	DistanceBeta >180,
	Distance is 360 - DistanceBeta;
	Distance is DistanceBeta.