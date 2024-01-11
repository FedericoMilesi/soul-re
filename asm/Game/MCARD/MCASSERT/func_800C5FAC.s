.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C5FAC
/* B67AC 800C5FAC 0D80023C */  lui        $v0, %hi(_spu_isCalled)
/* B67B0 800C5FB0 4CED428C */  lw         $v0, %lo(_spu_isCalled)($v0)
/* B67B4 800C5FB4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B67B8 800C5FB8 14004014 */  bnez       $v0, .L800C600C
/* B67BC 800C5FBC 1000BFAF */   sw        $ra, 0x10($sp)
/* B67C0 800C5FC0 01000224 */  addiu      $v0, $zero, 0x1
/* B67C4 800C5FC4 0D80013C */  lui        $at, %hi(_spu_isCalled)
/* B67C8 800C5FC8 A5FC020C */  jal        func_800BF294
/* B67CC 800C5FCC 4CED22AC */   sw        $v0, %lo(_spu_isCalled)($at)
/* B67D0 800C5FD0 0C80043C */  lui        $a0, %hi(func_800C6464)
/* B67D4 800C5FD4 B41B030C */  jal        func_800C6ED0
/* B67D8 800C5FD8 64648424 */   addiu     $a0, $a0, %lo(func_800C6464)
/* B67DC 800C5FDC 00F0043C */  lui        $a0, (0xF0000009 >> 16)
/* B67E0 800C5FE0 09008434 */  ori        $a0, $a0, (0xF0000009 & 0xFFFF)
/* B67E4 800C5FE4 20000524 */  addiu      $a1, $zero, 0x20
/* B67E8 800C5FE8 00200624 */  addiu      $a2, $zero, 0x2000
/* B67EC 800C5FEC D9FC020C */  jal        func_800BF364
/* B67F0 800C5FF0 21380000 */   addu      $a3, $zero, $zero
/* B67F4 800C5FF4 21204000 */  addu       $a0, $v0, $zero
/* B67F8 800C5FF8 0D80013C */  lui        $at, %hi(_spu_EVdma)
/* B67FC 800C5FFC D5FC020C */  jal        func_800BF354
/* B6800 800C6000 E4EC24AC */   sw        $a0, %lo(_spu_EVdma)($at)
/* B6804 800C6004 11FC020C */  jal        func_800BF044
/* B6808 800C6008 00000000 */   nop
.L800C600C:
/* B680C 800C600C 1000BF8F */  lw         $ra, 0x10($sp)
/* B6810 800C6010 1800BD27 */  addiu      $sp, $sp, 0x18
/* B6814 800C6014 0800E003 */  jr         $ra
/* B6818 800C6018 00000000 */   nop
/* B681C 800C601C 00000000 */  nop
/* B6820 800C6020 00000000 */  nop
.size func_800C5FAC, . - func_800C5FAC
