/*
   Modul: M_MSGFIL (Headerdatei)

   geschrieben von:
   
   Thomas K�nneth
   Friedrich-Neuper-Str. 2b
   90552 R�thenbach
    
   Diese Datei ist Bestandteil der C-Version von Magic 4.0 von
   Peter Hellinger und Thomas K�nneth und darf nur gem�� den
   Nutzungsbedingungen von Magic f�r C verwendet werden

   Alle Rechte beim Autor
*/

#ifndef _MPADVANC_
#define _MPADVANC_

#include <magic\m_types.h>

BOOLEAN ReadMsgfile(char *name,int *date_ptr,int *time_ptr);
void FreeMsgfile(void);
void GetMsgString(int num,char *msg);
void *GetMsgPtr(int num);

#endif /*_MPADVANC_*/