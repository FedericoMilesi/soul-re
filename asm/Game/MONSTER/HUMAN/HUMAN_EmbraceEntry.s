.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_EmbraceEntry
/* 6DB3C 8007D33C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6DB40 8007D340 1000B0AF */  sw         $s0, 0x10($sp)
/* 6DB44 8007D344 21808000 */  addu       $s0, $a0, $zero
/* 6DB48 8007D348 25000524 */  addiu      $a1, $zero, 0x25
/* 6DB4C 8007D34C 1800BFAF */  sw         $ra, 0x18($sp)
/* 6DB50 8007D350 1400B1AF */  sw         $s1, 0x14($sp)
/* 6DB54 8007D354 6C01118E */  lw         $s1, 0x16C($s0)
/* 6DB58 8007D358 B6FF010C */  jal        MON_PlayAnim
/* 6DB5C 8007D35C 01000624 */   addiu     $a2, $zero, 0x1
/* 6DB60 8007D360 24FE010C */  jal        MON_TurnOffBodySpheres
/* 6DB64 8007D364 21200002 */   addu      $a0, $s0, $zero
/* 6DB68 8007D368 48012286 */  lh         $v0, 0x148($s1)
/* 6DB6C 8007D36C 00000000 */  nop
/* 6DB70 8007D370 02004104 */  bgez       $v0, .L8007D37C
/* 6DB74 8007D374 00000000 */   nop
/* 6DB78 8007D378 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8007D37C:
/* 6DB7C 8007D37C 03130200 */  sra        $v0, $v0, 12
/* 6DB80 8007D380 140122AE */  sw         $v0, 0x114($s1)
/* 6DB84 8007D384 1800BF8F */  lw         $ra, 0x18($sp)
/* 6DB88 8007D388 1400B18F */  lw         $s1, 0x14($sp)
/* 6DB8C 8007D38C 1000B08F */  lw         $s0, 0x10($sp)
/* 6DB90 8007D390 0800E003 */  jr         $ra
/* 6DB94 8007D394 2000BD27 */   addiu     $sp, $sp, 0x20
.size HUMAN_EmbraceEntry, . - HUMAN_EmbraceEntry
