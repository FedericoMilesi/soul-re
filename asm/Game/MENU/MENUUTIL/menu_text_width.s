.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_text_width
/* A8D9C 800B859C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8DA0 800B85A0 1000BFAF */  sw         $ra, 0x10($sp)
/* A8DA4 800B85A4 FBB5000C */  jal        FONT_GetStringWidth
/* A8DA8 800B85A8 00000000 */   nop
/* A8DAC 800B85AC 1000BF8F */  lw         $ra, 0x10($sp)
/* A8DB0 800B85B0 00000000 */  nop
/* A8DB4 800B85B4 0800E003 */  jr         $ra
/* A8DB8 800B85B8 1800BD27 */   addiu     $sp, $sp, 0x18
.size menu_text_width, . - menu_text_width
