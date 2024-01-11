.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_StopLighting
/* 5B6C8 8006AEC8 6C01828C */  lw         $v0, 0x16C($a0)
/* 5B6CC 8006AECC 00000000 */  nop
/* 5B6D0 8006AED0 0000438C */  lw         $v1, 0x0($v0)
/* 5B6D4 8006AED4 00F00424 */  addiu      $a0, $zero, -0x1000
/* 5B6D8 8006AED8 340044A4 */  sh         $a0, 0x34($v0)
/* 5B6DC 8006AEDC 00806334 */  ori        $v1, $v1, 0x8000
/* 5B6E0 8006AEE0 0800E003 */  jr         $ra
/* 5B6E4 8006AEE4 000043AC */   sw        $v1, 0x0($v0)
.size PHYSOB_StopLighting, . - PHYSOB_StopLighting
