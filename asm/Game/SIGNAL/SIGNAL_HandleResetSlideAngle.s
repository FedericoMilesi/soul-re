.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleResetSlideAngle
/* EA9C 8001E29C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* EAA0 8001E2A0 05008010 */  beqz       $a0, .L8001E2B8
/* EAA4 8001E2A4 1000BFAF */   sw        $ra, 0x10($sp)
/* EAA8 8001E2A8 0004053C */  lui        $a1, (0x4000006 >> 16)
/* EAAC 8001E2AC 0600A534 */  ori        $a1, $a1, (0x4000006 & 0xFFFF)
/* EAB0 8001E2B0 A1D1000C */  jal        INSTANCE_Post
/* EAB4 8001E2B4 21300000 */   addu      $a2, $zero, $zero
.L8001E2B8:
/* EAB8 8001E2B8 1000BF8F */  lw         $ra, 0x10($sp)
/* EABC 8001E2BC 01000224 */  addiu      $v0, $zero, 0x1
/* EAC0 8001E2C0 0800E003 */  jr         $ra
/* EAC4 8001E2C4 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleResetSlideAngle, . - SIGNAL_HandleResetSlideAngle
