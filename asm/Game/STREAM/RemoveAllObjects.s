.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RemoveAllObjects
/* 4A018 80059818 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4A01C 8005981C 1400B1AF */  sw         $s1, 0x14($sp)
/* 4A020 80059820 21880000 */  addu       $s1, $zero, $zero
/* 4A024 80059824 1800BFAF */  sw         $ra, 0x18($sp)
/* 4A028 80059828 1000B0AF */  sw         $s0, 0x10($sp)
/* 4A02C 8005982C 4400908C */  lw         $s0, 0x44($a0)
.L80059830:
/* 4A030 80059830 00000000 */  nop
/* 4A034 80059834 14000286 */  lh         $v0, 0x14($s0)
/* 4A038 80059838 00000000 */  nop
/* 4A03C 8005983C 03004010 */  beqz       $v0, .L8005984C
/* 4A040 80059840 00000000 */   nop
/* 4A044 80059844 EC64010C */  jal        STREAM_DumpObject
/* 4A048 80059848 21200002 */   addu      $a0, $s0, $zero
.L8005984C:
/* 4A04C 8005984C 01003126 */  addiu      $s1, $s1, 0x1
/* 4A050 80059850 3000222A */  slti       $v0, $s1, 0x30
/* 4A054 80059854 F6FF4014 */  bnez       $v0, .L80059830
/* 4A058 80059858 24001026 */   addiu     $s0, $s0, 0x24
/* 4A05C 8005985C 1800BF8F */  lw         $ra, 0x18($sp)
/* 4A060 80059860 1400B18F */  lw         $s1, 0x14($sp)
/* 4A064 80059864 1000B08F */  lw         $s0, 0x10($sp)
/* 4A068 80059868 0800E003 */  jr         $ra
/* 4A06C 8005986C 2000BD27 */   addiu     $sp, $sp, 0x20
.size RemoveAllObjects, . - RemoveAllObjects
