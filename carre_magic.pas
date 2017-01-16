
{
//ALGO carre_magic

//BUT crée un carré magic de dimention impair ( 5 ou 7 )
//ENTRE un tableau en 2d ,
//SORTIE un carré magic en 2D

CONST
		TAILLE : entier <- 5

Type <Tab1> = Tableau[1..taille,1..taille] de entier

Procedure InitTab1(var T1 : Tableau[1..taille,1..taille] de  ENTIER; colonne,ligne : ENTIER)

//BUT Le but est d'initialiser le tableau a 0 
//ENTRE	 un tableau en 2D 
//SORTIE un tableau en 2D remplie de 0

VAR
i : entier
j : entier


DEBUT
	clrscr
	POUR i DE 1 A TAILLE FAIRE
	
		POUR j DE 1 A TAILLE FAIRE 
			
				T1[i,j] <- 0 
		FINPOUR
	FINPOUR
	
	colonne <- TAILLE div 2 
	ligne <- (TAILLE div 2) + 1 

FINPROCEDURE

procedure verif (var colonne,ligne : ENTIER )

//BUT Verification des case du tableau pour quil devient sphérique
//ENTRE ligne et colonne 
//SORTIE 2 entier

DEBUT
	SI ligne > TAILLE ALORS
		ligne <- ligne - TAILLE
	FINSI
		SI ligne < 1 ALORS
			ligne <- ligne + TAILLE
		FINSI
			SI colonne > TAILLE ALORS
				colonne <- colonne - TAILLE
			FINSI
				SI colonne < 1  ALORS
					colonne <- colonne - TAILLE
				FINSI
FINPROCEDURE
				
procedure avancer (var T1 : Tableau[1..taille,1..taille] de  ENTIER; var colonne,ligne:ENTIER)

//BUT UNE BOUCLE QUI VA ECRIRE LES NUMERO
//ENTRE un tableau et 2 entier 
//SORTIE 25 numero 

VAR 
i : ENTIER

DEBUT	

	POUR i DE 1 A TAILLE*TAILLE FAIRE
		verif(colonne,ligne)
	SI T1[ligne,colonne]<> 0 ALORS
		colonne<- colonne -1 
		ligne <- ligne - 1 
		verif(colonne,ligne)
	FINSI
	FINPOUR
T1[ligne,colonne]<- i 

colonne <- colonne + 1
ligne <- ligne - 1 

FINPROCEDURE

procedure affichage (var T1 : Tableau[1..taille,1..taille] de  ENTIER)

//BUT AFFICHER LE CARRE
//ENTRE LE TABLEAU 
//SORTIE LE CARRE COMPLETER

VAR 
i , j : ENTIER

DEBUT

POUR i DE 1 A TAILLE FAIRE
	POUR j DE 1 A TAILLE FAIRE
		ECRIRE (T1[i,j],' ')
	FINPOUR
FINPOUR
FINPROCEDURE

//PROGRAMME PRINCIPALE

//BUT Afficher un carre magic
//ENTRE 4 procedure
//SORTIE le carre magic 

VAR
	carre : Tab1
	i , j , ligne , colonne : ENTIER
	
DEBUT

clrscr
InitTab1 (T1 , ligne , colonne)
avancer (T1,ligne,colonne)
affichage(T1)
	
FIN

}

program Carre_magic;

uses crt;

CONST

        	TAILLE = 5 ;

TYPE

	Tab1 = array [1..TAILLE,1..TAILLE] of integer ;
	

procedure initTab1(var carre:Tab1; VAR ligne,colonne : Integer);         		//Initialisation tableau

var

i : integer;
j : integer;

BEGIN

	clrscr;



	for i:=1 TO TAILLE DO
	begin
		FOR j:=1 TO taille DO
		BEGIN
			carre[i,j]:=0 ;
		END;
	END;
	colonne:= TAILLE div 2 ;
	ligne := (TAILLE Div 2) + 1 ;

END;

procedure verif (var colonne,ligne:integer);		//procedure de verification pour que notre tableau soit sphérique


BEGIN
	IF ligne > taille THEN
	ligne:= ligne - TAILLE ;

	IF ligne < 1 THEN
	ligne := ligne + TAILLE ;

	IF colonne > TAILLE THEN
	colonne := colonne - TAILLE;

	IF colonne < 1 THEN
	colonne := colonne + TAILLE;
END;

procedure avancer(var carre:Tab1 ; var colonne,ligne:integer); 			//Procedure pour avancer

VAR
 i : integer;

BEGIN
For i:=1 TO TAILLE*TAILLE DO
	BEGIN
// le tableau va devenir sphérique
		verif(colonne,ligne);

	IF carre[ligne,colonne] <> 0 THEN		// Vérification du tableau si il est set a 0 ou si la place est occuper
		BEGIN
		colonne:= colonne - 1 ;
		ligne := ligne - 1 ;
		verif(colonne,ligne);
		END;
	

carre[ligne,colonne]:= i ;

colonne:= colonne + 1 ;
ligne := ligne - 1 ;
END;
END;



procedure affichage (var carre:Tab1 ) ;			// procedure pour afficher le tableau

VAR
i : INTEGER;
j : INTEGER;

BEGIN
FOR i:= 1 TO TAILLE DO
	BEGIN
		FOR j := 1 TO TAILLE DO
		BEGIN
			Write (carre[i,j],' ');
		END;
		Writeln;
	END;
END;

//programme principale

VAR 					//Variable
	carre : Tab1;
	i : integer;
	j : integer ;
        ligne : integer;
        colonne: integer ;

BEGIN

Clrscr ;
initTab1 (carre,ligne,colonne);
avancer(carre,ligne,colonne);
affichage(carre);

readln;

END.
