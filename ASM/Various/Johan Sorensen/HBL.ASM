*
* File: HBL.ASM
* Intended for use with an Atari ST.
* Author: Johan Sorensen, Lund, Sweden
*
* This is a Public Domain horisontal blank routine source example.
*
* Example of application: change border color for a part of the screen
* The source code is not very well documented, but it may help some lost
* soul with his (or her) own programs, as I have gathered that the Atari
* ST:s interrupt structure is not all that simple to grasp for beginners.
*
* Written originally for use with Metacomco macro assembler.
* Observe that if you assemble this file in its original state, it will NOT
* work as a stand-alone program. This source-code is intended for you to
* modifify and include into other programs.
*

IERA:  EQU  $FFFA07
ISRA:  EQU  $FFFA0F
IMRA:  EQU  $FFFA13
IMRB:  EQU  $FFFA15
TBCR:  EQU  $FFFA1B
TBDR:  EQU  $FFFA21

   TEXT

insthbl:
   movem.l  d1-d7/a0-a6,regsav
   pea      _insthbl
   move.w   #38,-(sp)
   trap     #14
   addq.l   #6,sp
   movem.l  regsav,d1-d7/a0-a6
   rts

_insthbl:
   bclr     #5,IMRB        ;disable 200 Hz clock
   move.l   $70,__savvbl+2
   move.l   #newvbl,$70
   bsr.s    vsync
   bset     #5,IMRB
   rts

vsync:
   move.l   $466,d0        ;_frclock
vsyncl:
   cmp.l    $466,d0
   beq.s    vsyncl
   rts

newvbl:
   clr.b    TBCR
   move.l   #newlrc,$120
   move.b   #50-4,TBDR
   move.b   #8,TBCR
   bset     #0,IMRA        ;Interrupt mask register A
   bset     #0,IERA        ;Interrupt enable register A
   move.b   #4,TBDR

   move.l   __savvbl+2,$70
__savvbl:
   jmp      $fc0634

newlrc:
   move.b   #20-4,TBDR
   move.l   #newlrc1,$120
   bclr     #5,IMRB
   bclr     #0,ISRA
   rte

newlrc1:
   move.w   #$642,$ffff8240
   move.b   #4,TBDR
   move.l   #newlrc2,$120
   bset     #5,IMRB
   bclr     #0,ISRA
   rte

newlrc2:
   move.b   #200-20-4,TBDR
   move.l   #newlrc3,$120
   bclr     #5,IMRB
   bclr     #0,ISRA
   rte

newlrc3:
   clr.w    $ffff8240
   move.b   #4,TBDR
   move.l   #newlrc,$120
   bset     #5,IMRB
   bclr     #0,ISRA
   rte

   END
                                                                  