.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C22F0
/* B2AF0 800C22F0 50730000 */ .word 0x00007350 /* invalid instruction */
/* B2AF4 800C22F4 00004500 */ .word 0x00450000 /* invalid instruction */
.size func_800C22F0, . - func_800C22F0
