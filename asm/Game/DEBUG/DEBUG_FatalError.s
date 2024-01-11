.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_FatalError
/* 50AC 800148AC 0000A4AF */  sw         $a0, 0x0($sp)
/* 50B0 800148B0 0400A5AF */  sw         $a1, 0x4($sp)
/* 50B4 800148B4 0800A6AF */  sw         $a2, 0x8($sp)
/* 50B8 800148B8 0C00A7AF */  sw         $a3, 0xC($sp)
/* 50BC 800148BC E8FEBD27 */  addiu      $sp, $sp, -0x118
/* 50C0 800148C0 1001BFAF */  sw         $ra, 0x110($sp)
/* 50C4 800148C4 18B6000C */  jal        FONT_Flush
/* 50C8 800148C8 1801A4AF */   sw        $a0, 0x118($sp)
/* 50CC 800148CC 1000A427 */  addiu      $a0, $sp, 0x10
/* 50D0 800148D0 1801A58F */  lw         $a1, 0x118($sp)
/* 50D4 800148D4 26D1010C */  jal        vsprintf
/* 50D8 800148D8 1C01A627 */   addiu     $a2, $sp, 0x11C
/* 50DC 800148DC C3B5000C */  jal        FONT_Print
/* 50E0 800148E0 1000A427 */   addiu     $a0, $sp, 0x10
/* 50E4 800148E4 E951000C */  jal        DEBUG_PageFlip
/* 50E8 800148E8 00000000 */   nop
/* 50EC 800148EC CD010100 */  break      1, 7
/* 50F0 800148F0 1001BF8F */  lw         $ra, 0x110($sp)
/* 50F4 800148F4 00000000 */  nop
/* 50F8 800148F8 0800E003 */  jr         $ra
/* 50FC 800148FC 1801BD27 */   addiu     $sp, $sp, 0x118
.size DEBUG_FatalError, . - DEBUG_FatalError
