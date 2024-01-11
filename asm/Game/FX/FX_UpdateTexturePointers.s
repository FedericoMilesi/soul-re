.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_UpdateTexturePointers
/* 353EC 80044BEC 15008010 */  beqz       $a0, .L80044C44
/* 353F0 80044BF0 2130A600 */   addu      $a2, $a1, $a2
.L80044BF4:
/* 353F4 80044BF4 0C00828C */  lw         $v0, 0xC($a0)
/* 353F8 80044BF8 00000000 */  nop
/* 353FC 80044BFC 01004230 */  andi       $v0, $v0, 0x1
/* 35400 80044C00 0C004010 */  beqz       $v0, .L80044C34
/* 35404 80044C04 00000000 */   nop
/* 35408 80044C08 0800838C */  lw         $v1, 0x8($a0)
/* 3540C 80044C0C 00000000 */  nop
/* 35410 80044C10 2B106500 */  sltu       $v0, $v1, $a1
/* 35414 80044C14 07004014 */  bnez       $v0, .L80044C34
/* 35418 80044C18 2B10C300 */   sltu      $v0, $a2, $v1
/* 3541C 80044C1C 05004014 */  bnez       $v0, .L80044C34
/* 35420 80044C20 00000000 */   nop
/* 35424 80044C24 02006010 */  beqz       $v1, .L80044C30
/* 35428 80044C28 21100000 */   addu      $v0, $zero, $zero
/* 3542C 80044C2C 21106700 */  addu       $v0, $v1, $a3
.L80044C30:
/* 35430 80044C30 080082AC */  sw         $v0, 0x8($a0)
.L80044C34:
/* 35434 80044C34 0400848C */  lw         $a0, 0x4($a0)
/* 35438 80044C38 00000000 */  nop
/* 3543C 80044C3C EDFF8014 */  bnez       $a0, .L80044BF4
/* 35440 80044C40 00000000 */   nop
.L80044C44:
/* 35444 80044C44 0800E003 */  jr         $ra
/* 35448 80044C48 00000000 */   nop
.size FX_UpdateTexturePointers, . - FX_UpdateTexturePointers
