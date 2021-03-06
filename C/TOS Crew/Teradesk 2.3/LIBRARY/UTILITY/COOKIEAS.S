;*
;* Utility functions for Teradesk. Copyright 1993, 2002 W. Klaren.
;*
;* This file is part of Teradesk.
;*
;* Teradesk is free software; you can redistribute it and/or modify
;* it under the terms of the GNU General Public License as published by
;* the Free Software Foundation; either version 2 of the License, or
;* (at your option) any later version.
;*
;* Teradesk is distributed in the hope that it will be useful,
;* but WITHOUT ANY WARRANTY; without even the implied warranty of
;* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;* GNU General Public License for more details.
;*
;* You should have received a copy of the GNU General Public License
;* along with Teradesk; if not, write to the Free Software
;* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
;*

		XDEF		cookie_reset
		XREF		o_resvector,o_resvalid

		MODULE		cookie_reset

		clr.l		$5A0.w
		move.l		o_resvector,$42A.w
		move.l		o_resvalid,$426.w
		jmp			(a6)

		ENDMOD
