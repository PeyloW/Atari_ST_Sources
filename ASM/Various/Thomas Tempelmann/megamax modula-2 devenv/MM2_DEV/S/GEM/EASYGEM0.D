DEFINITION MODULE EasyGEM0;


(*  System              : Megamax Modula-2 (MOS 2.0)
 *  Autor & Copyright   : Manuel Chakravarty
 *  Vertrieb            : Application Systems Heidelberg
 *  Version             : 1.2
 *)

(*  Dieses Modul stellt eine Reihe von oft gebrauchten GEM-Funktionen zur
 *  Verf�gung, die auf den verschiedenen AES-Funktionen und den Routinen
 *  des Moduls 'ObjHandler' aufbauen.
 *)


FROM    SYSTEM     IMPORT WORD;

FROM    GrafBase   IMPORT Rectangle;

FROM    GEMGlobals IMPORT PtrObjTree, ObjState, ObjFlag, PtrMaxStr;

FROM    GEMEnv     IMPORT DeviceHandle;


                (*  Routinen zum Erfragen von GEM-Parametern  *)
                (*  ========================================  *)

PROCEDURE DeskSize (): Rectangle;

        (*  Liefert die Ausma�e des Desktops (Arbeitsbereich).
         *)

PROCEDURE CharSize (    devHandle: DeviceHandle;
                    VAR boxWidth,
                        boxHeight: CARDINAL);

        (*  Liefert die Ausma�e der gr��ten Zeichenbox des aktuellen
         *  Fonts auf dem bezeichneten Ger�t.
         *)


                        (*  Mauszeiger  *)
                        (*  ==========  *)

PROCEDURE ShowArrow;

        (*  Verwandelt den Mauszeiger in einen Pfeil.
         *)

PROCEDURE ShowBee;

        (*  Verwandelt den Mauszeiger in eine Biene.
         *)

PROCEDURE HideMouse;

        (*  Macht den Mauszeiger unsichtbar (mittels 'AESGraphics.GrafMouse').
         *)

PROCEDURE ShowMouse;

        (*  Macht den Mauszeiger sichtbar (mittels 'AESGraphics.GrafMouse').
         *)


                        (*  Alert-Box  *)
                        (*  =========  *)

PROCEDURE WrapAlert (VAR s: ARRAY OF CHAR; width: CARDINAL);

        (*  Bricht eine Zeichenkette f�r eine Alert-Box um.
         *
         *  Dabei werden '|'-Zeichen derart in die Zeichenkette eingef�gt,
         *  da� keine Zeile breiter als 'width' ist.
         *  Ist 'width = 0', so wird die Maximalbreite (29) genommen.
         *)

PROCEDURE FormAlert (    defBut: CARDINAL;
                     REF str   : ARRAY OF CHAR;
                     VAR retBut: CARDINAL     );

        (*  Stellt eine Alert-Box dar.
         *
         *  Die Funktion besitzt dieselben Eigenschaften wie 'AESForms.
         *  FormAlert', allerdings ist es bei dieser Routine nicht
         *  n�tig, vorher das GEM (mit 'InitGem') zu initalisieren.
         *)

PROCEDURE TextStringAddress (idx: CARDINAL): PtrMaxStr;

        (*  Liefert die Adresse des Zeichenkette in der aktuellen Resource-
         *  Datei.
         *
         *  Die Resource-Datei mu� vorher mittels 'AESResources.LoadResource'
         *  geladen worden sein.
         *)


                (*  Routinen f�r den Umgang mit Objektb�umen  *)
                (*  ========================================  *)

PROCEDURE TreeAddress (idx: CARDINAL): PtrObjTree;

        (*  Liefert die Adresse des bezeichneten Objektbaums in der aktuellen
         *  Resource-Datei.
         *
         *  Die Resource-Datei mu� vorher mittels 'AESResources.LoadResource'
         *  geladen worden sein.
         *)

PROCEDURE ObjectSpaceWithAttrs (tree: PtrObjTree; obj: CARDINAL): Rectangle;

        (*  Ermittelt die Position und Ausma�e eines Objektes relativ
         *  zum �bergeordneten Objekt unter Ber�cksichtigung der Objekt-
         *  attribute, wie Schatten, Ausgangsobjekt, etc.
         *)

PROCEDURE AbsObjectSpace (tree: PtrObjTree; obj: CARDINAL): Rectangle;

        (*  Ermittelt die Position und Ausma�e eines Objektes bez�glich
         *  des Koordinatennullpunktes (Attribute werden ber�cksichtigt).
         *)

PROCEDURE SetObjStateElem (tree : PtrObjTree;
                           obj  : CARDINAL;
                           elem : ObjState;
                           value: BOOLEAN);

        (*  Setzt oder l�scht ein Element des Objektstatus-Sets, je nach
         *  Wert von 'value'.
         *)

PROCEDURE ObjectStateElem (tree : PtrObjTree;
                           obj  : CARDINAL;
                           elem : ObjState  ): BOOLEAN;

        (*  Liefert den Zustand eines Elements des Objektstatus-Sets.
         *)

PROCEDURE ToggleObjState (tree  : PtrObjTree;
                          obj   : CARDINAL;
                          elem  : ObjState;
                          redraw: BOOLEAN);

        (*  Kippt den Zustand eines Elements des Objektstatus-Sets.
         *  Und zeichnet das Objekt falls gew�nscht neu.
         *)

PROCEDURE SetObjFlag (tree : PtrObjTree;
                      obj  : CARDINAL;
                      elem : ObjFlag;
                      value: BOOLEAN);

        (*  Setzt oder l�scht ein Element des Objektflags-Sets, je nach
         *  Wert von 'value'.
         *)

PROCEDURE ObjectFlag (tree : PtrObjTree;
                      obj  : CARDINAL;
                      elem : ObjFlag   ): BOOLEAN;

        (*  Liefert den Zustand eines Elements des Objektflags-Sets.
         *)
         
PROCEDURE SetTextString (    tree: PtrObjTree;
                             obj : CARDINAL;
                         REF str : ARRAY OF CHAR);

        (*  Liefert den Text eines Objektes vom Typ 'textObj', 'boxTextObj',
         *  'fTextObj', 'fBoxTextObj', 'buttonObj', 'stringObj' oder
         *  'titleObj'.
         *)

PROCEDURE GetTextString (    tree: PtrObjTree;
                             obj : CARDINAL;
                         VAR str : ARRAY OF CHAR);

        (*  Liefert den Text eines Objektes vom Typ 'textObj', 'boxTextObj',
         *  'fTextObj', 'fBoxTextObj', 'buttonObj', 'stringObj' oder
         *  'titleObj'.
         *)


                (*  Routinen zum Animieren von Dialogboxen  *)
                (*  ======================================  *)

PROCEDURE PrepareBox (    box   : PtrObjTree;
                          origin: Rectangle;
                      VAR space : Rectangle);

        (*  Macht eine Dialogbox sichtbar. Dabei wird ein rechteckiger
         *  Rahmen animiert (GrowBox), der seinen Ursprung bei 'origin'
         *  hat. Ist die Breite von 'origin' negativ, so wird der Rahmen
         *  nicht animiert.
         *  Die Prozedur liefert in 'space' den von der Box belegten
         *  Bildschirmbereich.
         *)

PROCEDURE ReleaseBox (box   : PtrObjTree;
                      origin,
                      space : Rectangle);

        (*  Entfernt eine Dialogbox vom Bildschirm. Dabei wird ein recht-
         *  eckiger Rahmen animiert, der sich zu 'origin' bewegt (ShrinkBox),
         *  falls die Breite nicht negativ ist. In 'space' wird der von der
         *  Box belegte Bildschirmbereich �bergeben.
         *)

PROCEDURE DoSimpleBox (    box    : PtrObjTree;
                           origin : Rectangle;
                       VAR exitBut: CARDINAL);

        (*  F�hrt einen kompletten Dialog durch. 'origin' ist dabei der
         *  Ausgangspunkt des animierten Rechtecks. Ist die Breite von
         *  'origin' negativ, so wird der Rahmen (Grow/ShrinkBox) nicht
         *  animiert.
         *  Die Prozedur liefert den Objektindex des Objektes in 'exitBut',
         *  dessen Selektion den Abbruch des Dialoges bewirkt hat.
         *)


(*  Grundfunktionen f�r komplexe Dialogboxen  *)

PROCEDURE DeselectButton (tree: PtrObjTree; button: CARDINAL);

        (*  Deselektiert einen Dialogboxknopf und zeichnet ihn neu.
         *)

PROCEDURE ToggleSelectBox (tree: PtrObjTree; selectBox: CARDINAL);

        (*  Je nach aktuellem Zustand des Objektes wird das Objekt
         *  selektiert oder deselektiert. Mit Neuzeichnen.
         *)

PROCEDURE ToggleCheckBox (tree: PtrObjTree; checkBox: CARDINAL);

        (*  Schaltet je nach Zustand den Haken eines Objektes an oder
         *  aus. Mit Neuzeichnen.
         *)

PROCEDURE ToggleCheckPlus (    tree    : PtrObjTree;
                               checkBox: CARDINAL;
                           REF fellows : ARRAY OF CARDINAL);

        (*  Schaltet den Haken eines Objektes an oder aus. Dabei werden
         *  abh�nige Objekte 'fellows' aktiviert oder deaktiviert. Alle
         *  ver�nderten Objekte werden neu gezeichnet.
         *)

(*  Die folgenden f�nf Prozeduren erlauben das Setzen und Auslesen
 *  verschiedener Datentypen in bzw. aus Objektb�umen.
 *  Dabei bezeichnet 'tree' den zu verwendenden Objektbaum und 'obj'
 *  das angesprochene Objekt, das immer eine Zeichenkette enthalten
 *  mu�.
 *  Wird ein Wert gesetzt, d.h. 'mode = setValue', so wird 'value'/'str'
 *  nicht ver�ndert.
 *)

TYPE    SetGetMode      = (setValue, getValue); (*  Wert setzen/lesen  *)

PROCEDURE SetGetBoxCard (    tree : PtrObjTree;
                             obj  : CARDINAL;
                             mode : SetGetMode;
                         VAR value: CARDINAL);

PROCEDURE SetGetBoxLCard (    tree : PtrObjTree;
                              obj  : CARDINAL;
                              mode : SetGetMode;
                          VAR value: LONGCARD);

PROCEDURE SetGetBoxInt (    tree : PtrObjTree;
                            obj  : CARDINAL;
                            mode : SetGetMode;
                        VAR value: INTEGER);

PROCEDURE SetGetBoxLInt (    tree : PtrObjTree;
                             obj  : CARDINAL;
                             mode : SetGetMode;
                         VAR value: LONGINT);

PROCEDURE SetGetBoxStr (    tree : PtrObjTree;
                            obj  : CARDINAL;
                            mode : SetGetMode;
                        VAR str  : ARRAY OF CHAR);

PROCEDURE SetGetBoxState (    tree : PtrObjTree;
                              obj  : CARDINAL;
                              mode : SetGetMode;
                              state: ObjState;
                          VAR value: BOOLEAN);

        (*  Diese Routinen dient zum Setzen oder Auslesen eines Objekt-
         *  status. Dabei gibt 'state' an welcher Status, also welches
         *  Element der Statusmenge, beeinflu�t werden soll. 'value' be-
         *  sagt ob der Status gesetzt 'TRUE' oder gel�scht 'FALSE' ist.
         *  Wird ein Wert gesetzt, d.h. 'mode = setValue', so wird 'value'
         *  nicht ver�ndert.
         *)

TYPE    ObjEnumRef      = RECORD
                            obj  : CARDINAL;
                            value: WORD;
                          END;
                          
PROCEDURE SetGetBoxEnum (    tree : PtrObjTree;
                         REF refs : ARRAY OF ObjEnumRef;
                             mode : SetGetMode;
                         VAR value: WORD);

        (*  Dient zum Setzen oder Auslesen einer Gruppe von Radiokn�pfen.
         *  Dazu wird in 'refs' die Zuordnung der einzelnen Kn�pfe zu den
         *  Werten eines Aufz�hlungstyps festgelegt. 'value' gibt den aktu-
         *  ellen Wert des Aufz�hlungstyps wieder. Beispiel:
         *
         *      TYPE        color       = (red, green, blue);
         *      VAR         refs        = ARRAY[1..3] OF ObjEnumRef;
         *                  currColor   = color;
         *
         *      refs [1|2|3|] = {redButIdx, red}|{greenButIdx, green}|
         *                      {blueButIdx, blue}
         *
         *  Ist nun das Objekt, welches den Index 'greenButIdx' besitzt,
         *  selektiert, so gilt nach dem Aufruf
         *
         *      SetGetBoxEnum (tree, refs, getValue, currColor);
         *
         *  f�r 'currColor': currColor = green
         *
         *  Wird ein Wert gesetzt, d.h. 'mode = setValue', so wird 'value'
         *  nicht ver�ndert.
         *)


                (*  Routinen f�r das Desktop- und Wdw-Managment  *)
                (*  ===========================================  *)

PROCEDURE ForceDeskRedraw;

        (*  Erwirkt das Neuzeichnen des gesamten Desktopbereichs.
         *  (Durch Absetzen einer Redraw-Message)
         *)

PROCEDURE DrawObjInWdw (tree  : PtrObjTree;
                        obj   : CARDINAL;
                        drawBg: BOOLEAN;
                        window: CARDINAL);

        (*  Zeichnet einen Ausschnitt eines Objektbaumes unter Ber�cksichtig-
         *  ung der Sichtbarkeit des Fensters 'window'. Dabei geben die Aus-
         *  ma�e von 'obj' den Ausschnitt an und 'drawBg' bestimmt, ob die
         *  Objekte, die auf gleicher oder h�herer Ebene als 'obj' liegen
         *  auch gezeichnet werden.
         *)


END EasyGEM0.
