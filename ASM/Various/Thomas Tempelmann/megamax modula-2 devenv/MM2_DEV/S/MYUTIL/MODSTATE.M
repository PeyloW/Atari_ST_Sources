MODULE ModState;

IMPORT TOSIO; (*$E MOS *)

(* internes Programm! zeigt ModState an *)

FROM SYSTEM IMPORT ADDRESS;

FROM Lists IMPORT ResetList, PrevEntry, RemoveEntry, DeleteList, List,
        ScanEntries, LDir;

FROM ModBase IMPORT ModRef, ModState, ModLst;

FROM InOut IMPORT
  WriteLn, Write, WriteString, WriteLHex, WriteCard, Read, FlushKbd, BusyRead;

FROM Strings IMPORT Length;

FROM ArgCVIO IMPORT InitArgCV, PtrArgStr;


PROCEDURE listIt (ref: ModRef);
  
  VAR i: CARDINAL;  c: CHAR;
  
  BEGIN
    WITH ref^ DO
      IF TRUE (* NOT (linked IN state) *) THEN
        WriteString ( codeName^ );
        FOR i:= 1 TO 18 - Length (codeName^) DO Write (' ') END;
        WriteString (' Code: ');
        WriteLHex (codeStart, 7);
        WriteLHex (codeStart+codeLen, 7);
        WriteString (', Len: ');
        WriteCard (codeLen, 6);
        WriteString (', Header: ');
        WriteLHex (header, 7);
        (*
        WriteString (', HeadLen: ');
        WriteCard (ADDRESS(codeStart)-ADDRESS(header), 6);
        *)
        (*
        IF mainMod IN state THEN WriteString ('main ') END;
        IF installed IN state THEN WriteString ('inst ') END;
        IF loaded IN state THEN WriteString ('load ') END;
        IF running IN state THEN WriteString ('run ') END;
        IF initialized IN state THEN WriteString ('ini ') END;
        IF firstCall IN state THEN WriteString ('1st ') END;
        IF crunched IN state THEN WriteString ('crun ') END;
        IF msr1 IN state THEN WriteString ('msr1 ') END;
        IF msr2 IN state THEN WriteString ('msr2 ') END;
        *)
        WriteLn;
        BusyRead (c);
        IF c # 0C THEN REPEAT BusyRead (c) UNTIL c # 0C END
      END
    END
  END listIt;


TYPE ModQueryProc= PROCEDURE ( ModRef );

PROCEDURE scanMod ( i:ADDRESS; c:ADDRESS ): BOOLEAN;
  VAR m: ModRef; call: ModQueryProc;
  BEGIN
    m:=i;
    call:= ModQueryProc (c);
    call (m);
    RETURN FALSE
  END scanMod;

PROCEDURE ModQuery ( call: ModQueryProc );
  VAR ok: BOOLEAN; l:List;
  BEGIN
    l:=ModLst;
    ResetList (l);
    ScanEntries (l, forward, scanMod, ADDRESS (call), ok)
  END ModQuery;

VAR ch:CHAR;
    dummyArg: PtrArgStr;
    dummyC: CARDINAL;

BEGIN
  InitArgCV (dummyC, dummyArg); (* Damit E/A-Umleitung m�glich ist. *)
  WriteLn;
  ModQuery (listIt);
  WriteString ('<CR>...');
  FlushKbd;
  REPEAT Read (ch) UNTIL ch = CHR (13);
END ModState.
 
(* $FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$00000258$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259$FFF8B259�$00000238T.......T.......T.......T.......T.......T.......T.......T.......T.......T.......$0000041F$00000295$FFE802DE$0000030D$0000032E$000003CC$0000043A$0000023B$00000254$FFEDC8BE$FFEDC8BE$00000238$000003E0$0000035A$FFEC6940$0000043A���*)
