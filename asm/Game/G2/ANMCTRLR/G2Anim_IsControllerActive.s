.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_IsControllerActive
/* 80F94 80090794 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 80F98 80090798 1000BFAF */  sw         $ra, 0x10($sp)
/* 80F9C 8009079C 02008224 */  addiu      $v0, $a0, 0x2
/* 80FA0 800907A0 2120A000 */  addu       $a0, $a1, $zero
/* 80FA4 800907A4 2128C000 */  addu       $a1, $a2, $zero
/* 80FA8 800907A8 0F48020C */  jal        _G2AnimControllerST_FindInList
/* 80FAC 800907AC 21304000 */   addu      $a2, $v0, $zero
/* 80FB0 800907B0 06004010 */  beqz       $v0, .L800907CC
/* 80FB4 800907B4 00000000 */   nop
/* 80FB8 800907B8 08004294 */  lhu        $v0, 0x8($v0)
/* 80FBC 800907BC 00000000 */  nop
/* 80FC0 800907C0 00804230 */  andi       $v0, $v0, 0x8000
/* 80FC4 800907C4 F4410208 */  j          .L800907D0
/* 80FC8 800907C8 0100422C */   sltiu     $v0, $v0, 0x1
.L800907CC:
/* 80FCC 800907CC 21100000 */  addu       $v0, $zero, $zero
.L800907D0:
/* 80FD0 800907D0 1000BF8F */  lw         $ra, 0x10($sp)
/* 80FD4 800907D4 00000000 */  nop
/* 80FD8 800907D8 0800E003 */  jr         $ra
/* 80FDC 800907DC 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Anim_IsControllerActive, . - G2Anim_IsControllerActive
