.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_StopBurning
/* 5B6E8 8006AEE8 0400053C */  lui        $a1, (0x48000 >> 16)
/* 5B6EC 8006AEEC 6C01848C */  lw         $a0, 0x16C($a0)
/* 5B6F0 8006AEF0 0080A534 */  ori        $a1, $a1, (0x48000 & 0xFFFF)
/* 5B6F4 8006AEF4 0000828C */  lw         $v0, 0x0($a0)
/* 5B6F8 8006AEF8 00F00324 */  addiu      $v1, $zero, -0x1000
/* 5B6FC 8006AEFC 340083A4 */  sh         $v1, 0x34($a0)
/* 5B700 8006AF00 25104500 */  or         $v0, $v0, $a1
/* 5B704 8006AF04 0800E003 */  jr         $ra
/* 5B708 8006AF08 000082AC */   sw        $v0, 0x0($a0)
.size PHYSOB_StopBurning, . - PHYSOB_StopBurning
