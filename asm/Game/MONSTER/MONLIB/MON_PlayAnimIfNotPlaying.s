.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_PlayAnimIfNotPlaying
/* 70740 8007FF40 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 70744 8007FF44 1000BFAF */  sw         $ra, 0x10($sp)
/* 70748 8007FF48 6C01828C */  lw         $v0, 0x16C($a0)
/* 7074C 8007FF4C 2138C000 */  addu       $a3, $a2, $zero
/* 70750 8007FF50 6801428C */  lw         $v0, 0x168($v0)
/* 70754 8007FF54 2130A000 */  addu       $a2, $a1, $zero
/* 70758 8007FF58 0000458C */  lw         $a1, 0x0($v0)
/* 7075C 8007FF5C A0FF010C */  jal        MON_PlayAnimFromListIfNotPlaying
/* 70760 8007FF60 00000000 */   nop
/* 70764 8007FF64 1000BF8F */  lw         $ra, 0x10($sp)
/* 70768 8007FF68 00000000 */  nop
/* 7076C 8007FF6C 0800E003 */  jr         $ra
/* 70770 8007FF70 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_PlayAnimIfNotPlaying, . - MON_PlayAnimIfNotPlaying
