

#include "datatypes.h"


#ifndef __display
#define __display


/* Width and Height of the window */
#define XW	320
#define YW	200


#endif


extern u32 rgbBuffer[YW][XW];
extern u8  chunkyBuffer[YW][XW];

extern u32 colortable[256];



int chunky_to_rgb();
void colorclip(int *color);

