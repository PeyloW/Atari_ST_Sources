X:
	clr.l	-(sp)
	move.w	#$20,-(sp)
	trap	#1
	addq.l	#6,sp
	move.l	d0,s_sp

	move.l	#clr,-(sp)
	move.w	#9,-(sp)
	trap	#1
	addq.l	#2,sp
	
	move.w	#$2700,sr
	move.b	#02,$ffff820a.w
	move.w	#$8240,a0
	move.w	(a0),old_back
	moveq	#-1,d0

Loop:

	move.w	#$777,(a0)
	move.w	#$766,(a0)
	move.w	#$755,(a0)
	move.w	#$744,(a0)
	move.w	#$733,(a0)
	move.w	#$722,(a0)
	move.w	#$700,(a0)
	move.w	#$710,(a0)
	move.w	#$720,(a0)
	move.w	#$730,(a0)
	move.w	#$740,(a0)
	move.w	#$750,(a0)
	move.w	#$760,(a0)
	move.w	#$770,(a0)
	move.w	#$761,(a0)
	move.w	#$752,(a0)
	move.w	#$743,(a0)
	move.w	#$734,(a0)
	move.w	#$725,(a0)
	move.w	#$716,(a0)
	move.w	#$727,(a0)
	move.w	#$737,(a0)
	move.w	#$747,(a0)
	move.w	#$757,(a0)
	move.w	#$767,(a0)

	move.w	#$577,(a0)
	move.w	#$566,(a0)
	move.w	#$555,(a0)
	move.w	#$544,(a0)
	move.w	#$533,(a0)
	move.w	#$522,(a0)
	move.w	#$500,(a0)
	move.w	#$510,(a0)
	move.w	#$520,(a0)
	move.w	#$530,(a0)
	move.w	#$540,(a0)
	move.w	#$550,(a0)
	move.w	#$560,(a0)
	0move.w	#$570,(a0)
	move.w	#$561,(a0)
	move.w	#$552,(a0)
	
	nop
	nop
	dbf	d0,loop
	
	move.w	#$2300,sr
	move.w	old_back,(a0)
	move.l	s_sp,-(sp)
	move.w	#$20,-(sp)
	trap	#1
	
	addq.l	#6,sp

Illegal:
	clr.w	-(sp)
	trap	#1

	
s_sp:	dc.l	0
old_back:	dc.w 0
clr:	dc.b	27,"E",0
even

	
