.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_ChangeToUnderWater
/* CB18 8001C318 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* CB1C 8001C31C 1000B0AF */  sw         $s0, 0x10($sp)
/* CB20 8001C320 21808000 */  addu       $s0, $a0, $zero
/* CB24 8001C324 1400BFAF */  sw         $ra, 0x14($sp)
/* CB28 8001C328 0801028E */  lw         $v0, 0x108($s0)
/* CB2C 8001C32C 00000000 */  nop
/* CB30 8001C330 2000A214 */  bne        $a1, $v0, .L8001C3B4
/* CB34 8001C334 04000224 */   addiu     $v0, $zero, 0x4
/* CB38 8001C338 F0000386 */  lh         $v1, 0xF0($s0)
/* CB3C 8001C33C 00000000 */  nop
/* CB40 8001C340 18006210 */  beq        $v1, $v0, .L8001C3A4
/* CB44 8001C344 05000224 */   addiu     $v0, $zero, 0x5
/* CB48 8001C348 13006210 */  beq        $v1, $v0, .L8001C398
/* CB4C 8001C34C 0D000224 */   addiu     $v0, $zero, 0xD
/* CB50 8001C350 05006210 */  beq        $v1, $v0, .L8001C368
/* CB54 8001C354 00000000 */   nop
/* CB58 8001C358 8F56000C */  jal        CAMERA_SetMode
/* CB5C 8001C35C 21284000 */   addu      $a1, $v0, $zero
/* CB60 8001C360 DD700008 */  j          .L8001C374
/* CB64 8001C364 08000224 */   addiu     $v0, $zero, 0x8
.L8001C368:
/* CB68 8001C368 F453000C */  jal        CAMERA_CreateNewFocuspoint
/* CB6C 8001C36C 21200002 */   addu      $a0, $s0, $zero
/* CB70 8001C370 08000224 */  addiu      $v0, $zero, 0x8
.L8001C374:
/* CB74 8001C374 C40102A6 */  sh         $v0, 0x1C4($s0)
/* CB78 8001C378 40060224 */  addiu      $v0, $zero, 0x640
/* CB7C 8001C37C A80102A6 */  sh         $v0, 0x1A8($s0)
/* CB80 8001C380 B00102A6 */  sh         $v0, 0x1B0($s0)
/* CB84 8001C384 9E0202A6 */  sh         $v0, 0x29E($s0)
/* CB88 8001C388 20000224 */  addiu      $v0, $zero, 0x20
/* CB8C 8001C38C 880102A6 */  sh         $v0, 0x188($s0)
/* CB90 8001C390 E9700008 */  j          .L8001C3A4
/* CB94 8001C394 AE0400A6 */   sh        $zero, 0x4AE($s0)
.L8001C398:
/* CB98 8001C398 21200002 */  addu       $a0, $s0, $zero
/* CB9C 8001C39C 1D54000C */  jal        CAMERA_SaveMode
/* CBA0 8001C3A0 0D000524 */   addiu     $a1, $zero, 0xD
.L8001C3A4:
/* CBA4 8001C3A4 E800028E */  lw         $v0, 0xE8($s0)
/* CBA8 8001C3A8 0100033C */  lui        $v1, (0x10000 >> 16)
/* CBAC 8001C3AC 25104300 */  or         $v0, $v0, $v1
/* CBB0 8001C3B0 E80002AE */  sw         $v0, 0xE8($s0)
.L8001C3B4:
/* CBB4 8001C3B4 1400BF8F */  lw         $ra, 0x14($sp)
/* CBB8 8001C3B8 1000B08F */  lw         $s0, 0x10($sp)
/* CBBC 8001C3BC 0800E003 */  jr         $ra
/* CBC0 8001C3C0 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_ChangeToUnderWater, . - CAMERA_ChangeToUnderWater
