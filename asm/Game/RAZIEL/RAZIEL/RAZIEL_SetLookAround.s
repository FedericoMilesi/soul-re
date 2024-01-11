.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_SetLookAround
/* A4B64 800B4364 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A4B68 800B4368 1400B1AF */  sw         $s1, 0x14($sp)
/* A4B6C 800B436C 21888000 */  addu       $s1, $a0, $zero
/* A4B70 800B4370 1000B0AF */  sw         $s0, 0x10($sp)
/* A4B74 800B4374 C8013026 */  addiu      $s0, $s1, 0x1C8
/* A4B78 800B4378 21200002 */  addu       $a0, $s0, $zero
/* A4B7C 800B437C 11000524 */  addiu      $a1, $zero, 0x11
/* A4B80 800B4380 1800BFAF */  sw         $ra, 0x18($sp)
/* A4B84 800B4384 5641020C */  jal        G2Anim_EnableController
/* A4B88 800B4388 0E000624 */   addiu     $a2, $zero, 0xE
/* A4B8C 800B438C 21200002 */  addu       $a0, $s0, $zero
/* A4B90 800B4390 10000524 */  addiu      $a1, $zero, 0x10
/* A4B94 800B4394 5641020C */  jal        G2Anim_EnableController
/* A4B98 800B4398 0E000624 */   addiu     $a2, $zero, 0xE
/* A4B9C 800B439C 21200002 */  addu       $a0, $s0, $zero
/* A4BA0 800B43A0 0E000524 */  addiu      $a1, $zero, 0xE
/* A4BA4 800B43A4 5641020C */  jal        G2Anim_EnableController
/* A4BA8 800B43A8 2130A000 */   addu      $a2, $a1, $zero
/* A4BAC 800B43AC 21202002 */  addu       $a0, $s1, $zero
/* A4BB0 800B43B0 1000053C */  lui        $a1, (0x100009 >> 16)
/* A4BB4 800B43B4 0900A534 */  ori        $a1, $a1, (0x100009 & 0xFFFF)
/* A4BB8 800B43B8 A1D1000C */  jal        INSTANCE_Post
/* A4BBC 800B43BC 01000624 */   addiu     $a2, $zero, 0x1
/* A4BC0 800B43C0 1800BF8F */  lw         $ra, 0x18($sp)
/* A4BC4 800B43C4 1400B18F */  lw         $s1, 0x14($sp)
/* A4BC8 800B43C8 1000B08F */  lw         $s0, 0x10($sp)
/* A4BCC 800B43CC A8FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x478)($gp)
/* A4BD0 800B43D0 AAFA80A7 */  sh         $zero, %gp_rel(Raziel + 0x47A)($gp)
/* A4BD4 800B43D4 0800E003 */  jr         $ra
/* A4BD8 800B43D8 2000BD27 */   addiu     $sp, $sp, 0x20
.size RAZIEL_SetLookAround, . - RAZIEL_SetLookAround
