
char *al_text =
"_ Erweiterte Alertboxen: |^|"\
"^- bis zu 16 Zeilen Text u. 5 Buttons|"\
"^- 18 vordefinierte Icons, benutzerdefinierte Icons|"\
"^  beliebiger Gr��e|"\
"^- Tastaturbedienung per Hotkeys, Undo-/Default-Button|"\
"^- beliebige Textattribute, gro�er/kleiner Systemfont|"\
"^- sonstige M�glichkeiten s. Alert-Dialog|^|"\
"</linksb�ndig|:%zentriert|@!>rechtsb�ndig";

char *al_button = "[Huh-Huh|[This sucks!";

char *paula_text = "_ Paula V2.4: ";

char *paula_button = "[Terminate|[Stop|[Play|Cancel";

char *ci_text =
"^|^:When I look into your eyes|"\
"^:I can see a love restrained.|"\
"^:But darlin\' when I hold you|"\
"^:don\'t you know I feel the same.|"\
"^:Cause nothin\' lasts forever|"\
"^:and we both know hearts can change|"\
"^:and it\'s hard to hold a candle|"\
"^:in the cold november rain.|"\
"^:We\'ve been through this such a long long time|"\
"^:just tryin\' to kill the pain.|"\
"^:But lovers always come and lovers always go|"\
"^:an\' no one\'s really sure who\'s lettin\' go today -|"\
"^:walking away.|"\
"^:If we could take the time to lay it on the line|"\
"^:I could rest my head|"\
"^:just knowin\' that you were mine -|"\
"^:all mine!|"\
"^:So if you want to love me|"\
"^:then darlin\' don\'t refrain|"\
"^:or I\'ll just end up walkin\'|"\
"^:in the cold november rain.|";

char *ci_button = "[Guns \'n roses";

char *help[] =
{
"",
" Bedienung der Demonstrations-Dialoge: ",
"=====================================================================",
" (genaue Beschreibung u. weitere M�glichkeiten s. Anleitung) ",
"",
" - Tastaturbedienung (Hotkeys) der Dialoge, wobei in Dialogen mit",
"   Eingabefeldern sowie in nicht-modalen Fensterdialogen zus�tzlich",
"   die Alternate-Taste gedr�ckt werden mu�",
"   (Doppelklick-/Rechtsklick-Simulation durch zus�tzlich gedr�ckte",
"   Shift-/Control-Taste)",
" - Tastendr�cke gehen an den Dialog unter dem Mauszeiger",
" - Rechtsklick auf ein Dialog-Objekt simuliert Doppelklick",
" - fliegende Dialoge springen zur Mausposition bei Mausklick",
"   au�erhalb des Dialogs (u.a. system-modale Alertboxen), k�nnen",
"   bei gedr�ckter Maustaste oder durch einen kurzen Klick auf das",
"   Flugobjekt und einen nochmaligen Klick oder durch Anklicken eines",
"   nicht selektier-/editierbaren Objekts mit der linken Maustaste",
"   verschoben werden",
" - Fensterdialoge sind auch im Hintergrund bedienbar",
" - Fensterdialoge (u.a. applikations-modale Alertboxen) lassen sich",
"   durch Anklicken eines nicht selektier-/editierbaren Objekts und",
"   Gedr�ckthalten der linken Maustaste verschieben",
" - Hintergrundfenster werden nach einem kurzen Linksklick auf ein",
"   nicht selektier-/editierbares Objekt nach vorne gebracht",
"",
"  MTOS-Ikonifizierung:",
"   - Anklicken des Ikonifizierungsbuttons",
"     -> ein einzelnes Fenster verkleinern",
"   - Anklicken des Ikonifizierungsbuttons bei gedr�ckter Control-Taste",
"     -> alle Fenster in ein Fenster verkleiner",
"   - Doppelklick in ein ikonifiziertes Fenster �ffnet es wieder",
"     an der alten Position (Hotkey: CTRL-Space)",
"",
"  ICFS-(kompatible-) Ikonifizierung:",
"   - [Alternate]-Closer - ein einzelnes Fenster verkleinern",
"     (Hotkey: Ctrl-Space)",
"   - [Shift]-Closer     - alle Fenster einzeln verkleinern",
"     (Hotkey: Ctrl-Shift-Space)",
"   - [Control]-Closer   - alle Fenster in ein Fenster verkleinern",
"     (alternativ: [Alternate-Shift]-Closer unter Winx)",
"   - Mausklick in ein verkleinertes Fenster �ffnet es wieder an der",
"     alten Position (Hotkey: Ctrl-Space). Durch eine zus�tzlich ge-",
"     dr�ckte Shift-Taste werden alle Fenster an der alten Position",
"     ge�ffnet.",
"",
" - erweiterte M�glichkeiten in Eingabe-Feldern:",
"   - Text kann per ACC_TEXT-Nachricht eingegeben werden",
"   - exakte Cursorpositionierung per Maus",
"   - Cursor kann in ein Eingabefeld gezielt per Alternate+Hotkey",
"     gesetzt werden",
"   - Mauscursor wird �ber Eingabefeldern zum Textcursor",
"   - Enth�lt die Eingabemaske eines der Zeichen \',.;:\\/\' und wird",
"     dieses Zeichen eingegeben, wenn der Cursor VOR diesem Zeichen",
"     steht, so wird das Eingabefeld bis zu diesem Zeichen mit",
"     Leerzeichen gef�llt und der Cursor hinter dieses Zeichen",
"     gesetzt (Beispiel: Punkt '.' in Dateimasken)",
"   - Wird in einem Eingabefeld, in dem Leerzeichen nicht eingegeben",
"     werden k�nnen, ein Leerzeichen eingegeben, so wird das Eingabe-",
"     feld bis zum n�chsten festen Maskenzeichen mit Leerzeichen ge-",
"     f�llt. Wurde das ganze Eingabefeld gef�llt, so wird anschlie�end",
"     zum n�chsten Feld gesprungen.",
"   - erstes/letztes (bei Shift-Home an das Ende, bei Shift-Down",
"     an den Anfang) Eingabefeld (Home/Shift-Home, Shift-Up/Down)",
"   - Wort vor/zur�ck (Ctrl-Left/Right)",
"   - Anfang/Ende des Eingabesfeldes (Shift-Left/Right)",
"   - vorheriges Eingabesfeld (Up,Shift-Tab/Enter/Return)",
"   - n�chstes Eingabefeld (Down/Tab/Enter)",
"   - Cursor ein Zeichen nach links/rechts (Left/Right)",
"   - Eingabefeld l�schen (Esc)",
"   - alle Eingabefelder l�schen (Shift-Esc)",
"   - Eingabefeld ab Cursor l�schen (Shift-Del)",
"   - Eingabefeld bis Cursor l�schen (Shift-Backspace)",
"   - Eingabebox f�r alle Ascii-Zeichen (Shift-Insert)",
"   - Sonderzeicheneingabe durch Eingabe des dezimalen ASCII-Wertes",
"     bei gedr�ckter Alternate-Taste auf dem Ziffernblock",
"     => sofern der ASCII-Wert nicht eindeutig ist (ASCII<=25), m�ssen",
"        alle drei Stellen (evtl. mit f�hrenden Nullen) eingegeben",
"        werden",
"   - Undo (Undo bzw. Shift-Undo, sofern Undo-Button vorhanden)",
"   - History-Funktion der letzten eingegebenen Texte (Ctrl-Up/Down)",
"     => mit Shift-Taste: Text in History suchen",
"   - Clipboardunterst�tzung:",
"     => mit Shift-Taste: Text an Clipboard/Eingabe-Feld anh�ngen",
"       -> Ctrl-X: Text ausschneiden und in Clipboard ablegen",
"       -> Ctrl-C: Text in Clipboard ablegen",
"       -> Ctrl-V: Text in Eingabefeld einf�gen",
"   - Einf�ge-/�berschreibenmodus (Insert -> Strich-/Block-Cursor)",
"   - Return selektiert beim letzten Eingabefeld das DEFAULT-Objekt",
"",
" - Slider-Bedienung:",
"   - Pfeile (links/rechts,hoch/runter,Minus/Plus,usw.):",
"      -> Einzelklick: Zeile hoch/runter (bzw. Wert erniedrigen/-h�hen)",
"      -> Doppelklick: Anfang/Ende (bzw. minimaler/maximaler Wert)",
"   - Hintergrundelement (grauer Bereich):",
"      -> Einzelklick: Seite hoch/runter",
"      -> Doppelklick: Slider positionieren",
"   - Slider:",
"      -> Echtzeitverschieben w�hrend Maustaste gedr�ckt ist oder",
"         durch einen kurzen Klick und einen weiteren Klick zur Posi-",
"         tionierung",
"",
" - Popup-Men�s:",
"   - Auswahl eines Eintrags per Maus (Bereich au�erhalb des Popups",
"     f�r Abbruch):",
"     -> kurzer Klick auf Popup-Button/-Text und nochmaliger Klick",
"        auf gew�nschten Eintrag oder",
"     -> Gedr�ckthalten der Maustaste beim Anklicken des",
"        Popup-Buttons/-Textes und Loslassen der Maustaste �ber",
"        gew�nschtem Eintrag",
"   - Cycle-Button:",
"       -> n�chsten (Einfachklick)/vorherigen (Doppel-/Rechtsklick)",
"          Eintrag w�hlen",
"       -> per Alternate-Shift-Hotkey (n�chster Eintrag) bzw.",
"          Alternate-Control-Shift-Hotkey (vorheriger Eintrag) anw�hlbar",
"   - Hotkeys (unterstrichener Buchstabe, optional mit gedr�ckter",
"     Alternate-Taste)",
"   - vorheriger Eintrag (Cursor links/hoch)",
"   - n�chster Eintrag (Cursor rechts/runter)",
"   - erster Eintrag (Home)",
"   - letzter Eintrag (Shift-Home)",
"   - Abbruch (Escape/Undo)",
"   - aktuellen Eintrag ausw�hlen (Space,Return,Enter)",
"   - Doppel-/Rechtsklicksimulation durch zus�tzlich gedr�ckte",
"     Shift-/Control-Taste",
"   - Submen�s:",
"       -> Aufklappen per Selektion des entsprechenden Eintrags",
"          (Return, Enter, Space, Hotkeys, Cursor-Right) oder nach",
"          einer kurzen Verz�gerung, wenn der Mauszeiger �ber dem",
"          entsprechenden Eintrag steht",
"       -> Submen�s lassen sich i.A. wie Popups bedienen, aber zus�tz-",
"          lich per Cursor-Left (entspricht dann Escape/Undo) wieder",
"          verlassen",
""
};

char scroll_text[] =
"When I look into your eyes "\
"I can see a love restrained. "\
"But darlin\' when I hold you "\
"don\'t you know I feel the same. "\
"Cause nothin\' lasts forever "\
"and we both know hearts can change "\
"and it\'s hard to hold a candle "\
"in the cold november rain. "\
"We\'ve been through this such a long long time "\
"just tryin\' to kill the pain. "\
"But lovers always come and lovers always go "\
"an\' no one\'s really sure who\'s lettin\' go today - "\
"walking away. "\
"If we could take the time to lay it on the line "\
"I could rest my head "\
"just knowin\' that you were mine - "\
"all mine! "\
"So if you want to love me "\
"then darlin\' don\'t refrain "\
"or I\'ll just end up walkin\' "\
"in the cold november rain. "\
"Do you need some time on your own, "\
"do you need some time all alone? "\
"Everybody needs some time on their own! "\
"Don\'t you know you need some time all alone? "\
"I know it\'s hard to keep an\' open heart "\
"when even friends seem out to harm you. " \
"But if you could heal a broken heart "\
"wouldn't time be out to charm you? "\
"Sometimes I need some time on my own, "\
"sometimes I need some time all alone. "\
"Everybody needs some time on their own! "\
"Don\'t you know you need some time all alone? "\
"And when your tears subside "\
"and shadows still remain "\
"I know that you can love me "\
"when there's no one left to blame. "\
"So never mind the darkness "\
"we still can find a way "\
"cause nothin\' lasts forever "\
"even cold november rain! "\
"Don\'t ya think that you need somebody, "\
"don\'t ya think that you need someone? "\
"Everybody needs somebody! "\
"You\'re not the only one, "\
"you\'re not the only one! "\
" (The end)   ---   ";
