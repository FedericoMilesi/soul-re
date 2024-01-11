.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSwitchVAnimGroup
/* 97978 800A7178 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 9797C 800A717C 1CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3EC)($gp)
/* 97980 800A7180 01000324 */  addiu      $v1, $zero, 0x1
/* 97984 800A7184 0F004010 */  beqz       $v0, .L800A71C4
/* 97988 800A7188 1800BFAF */   sw        $ra, 0x18($sp)
/* 9798C 800A718C FFFF4824 */  addiu      $t0, $v0, -0x1
/* 97990 800A7190 03000229 */  slti       $v0, $t0, 0x3
/* 97994 800A7194 02004014 */  bnez       $v0, .L800A71A0
/* 97998 800A7198 00000000 */   nop
/* 9799C 800A719C 03000824 */  addiu      $t0, $zero, 0x3
.L800A71A0:
/* 979A0 800A71A0 2130C800 */  addu       $a2, $a2, $t0
/* 979A4 800A71A4 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 979A8 800A71A8 C0300600 */  sll        $a2, $a2, 3
/* 979AC 800A71AC 1800438C */  lw         $v1, 0x18($v0)
/* 979B0 800A71B0 3000A28F */  lw         $v0, 0x30($sp)
/* 979B4 800A71B4 21306600 */  addu       $a2, $v1, $a2
/* 979B8 800A71B8 B09C020C */  jal        razSwitchVAnim
/* 979BC 800A71BC 1000A2AF */   sw        $v0, 0x10($sp)
/* 979C0 800A71C0 21180000 */  addu       $v1, $zero, $zero
.L800A71C4:
/* 979C4 800A71C4 1800BF8F */  lw         $ra, 0x18($sp)
/* 979C8 800A71C8 21106000 */  addu       $v0, $v1, $zero
/* 979CC 800A71CC 0800E003 */  jr         $ra
/* 979D0 800A71D0 2000BD27 */   addiu     $sp, $sp, 0x20
.size razSwitchVAnimGroup, . - razSwitchVAnimGroup
