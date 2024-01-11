.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel isOkayToPlaySound
/* 2F7E4 8003EFE4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 2F7E8 8003EFE8 1000B0AF */  sw         $s0, 0x10($sp)
/* 2F7EC 8003EFEC 21808000 */  addu       $s0, $a0, $zero
/* 2F7F0 8003EFF0 1400B1AF */  sw         $s1, 0x14($sp)
/* 2F7F4 8003EFF4 2188A000 */  addu       $s1, $a1, $zero
/* 2F7F8 8003EFF8 1800B2AF */  sw         $s2, 0x18($sp)
/* 2F7FC 8003EFFC 2190C000 */  addu       $s2, $a2, $zero
/* 2F800 8003F000 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2F804 8003F004 2198E000 */  addu       $s3, $a3, $zero
/* 2F808 8003F008 0F000232 */  andi       $v0, $s0, 0xF
/* 2F80C 8003F00C 1E004010 */  beqz       $v0, .L8003F088
/* 2F810 8003F010 2000BFAF */   sw        $ra, 0x20($sp)
/* 2F814 8003F014 BEB7000C */  jal        GAMELOOP_GetTimeOfDay
/* 2F818 8003F018 00000000 */   nop
/* 2F81C 8003F01C 21184000 */  addu       $v1, $v0, $zero
/* 2F820 8003F020 BC020224 */  addiu      $v0, $zero, 0x2BC
/* 2F824 8003F024 10006210 */  beq        $v1, $v0, .L8003F068
/* 2F828 8003F028 BD026228 */   slti      $v0, $v1, 0x2BD
/* 2F82C 8003F02C 05004010 */  beqz       $v0, .L8003F044
/* 2F830 8003F030 58020224 */   addiu     $v0, $zero, 0x258
/* 2F834 8003F034 0A006210 */  beq        $v1, $v0, .L8003F060
/* 2F838 8003F038 02000224 */   addiu     $v0, $zero, 0x2
/* 2F83C 8003F03C 20FC0008 */  j          .L8003F080
/* 2F840 8003F040 24100202 */   and       $v0, $s0, $v0
.L8003F044:
/* 2F844 8003F044 08070224 */  addiu      $v0, $zero, 0x708
/* 2F848 8003F048 09006210 */  beq        $v1, $v0, .L8003F070
/* 2F84C 8003F04C 6C070224 */   addiu     $v0, $zero, 0x76C
/* 2F850 8003F050 09006210 */  beq        $v1, $v0, .L8003F078
/* 2F854 8003F054 02000224 */   addiu     $v0, $zero, 0x2
/* 2F858 8003F058 20FC0008 */  j          .L8003F080
/* 2F85C 8003F05C 24100202 */   and       $v0, $s0, $v0
.L8003F060:
/* 2F860 8003F060 1FFC0008 */  j          .L8003F07C
/* 2F864 8003F064 01000224 */   addiu     $v0, $zero, 0x1
.L8003F068:
/* 2F868 8003F068 1FFC0008 */  j          .L8003F07C
/* 2F86C 8003F06C 02000224 */   addiu     $v0, $zero, 0x2
.L8003F070:
/* 2F870 8003F070 1FFC0008 */  j          .L8003F07C
/* 2F874 8003F074 04000224 */   addiu     $v0, $zero, 0x4
.L8003F078:
/* 2F878 8003F078 08000224 */  addiu      $v0, $zero, 0x8
.L8003F07C:
/* 2F87C 8003F07C 24100202 */  and        $v0, $s0, $v0
.L8003F080:
/* 2F880 8003F080 16004010 */  beqz       $v0, .L8003F0DC
/* 2F884 8003F084 21100000 */   addu      $v0, $zero, $zero
.L8003F088:
/* 2F888 8003F088 10000232 */  andi       $v0, $s0, 0x10
/* 2F88C 8003F08C 04004010 */  beqz       $v0, .L8003F0A0
/* 2F890 8003F090 20000232 */   andi      $v0, $s0, 0x20
/* 2F894 8003F094 11002012 */  beqz       $s1, .L8003F0DC
/* 2F898 8003F098 21100000 */   addu      $v0, $zero, $zero
/* 2F89C 8003F09C 20000232 */  andi       $v0, $s0, 0x20
.L8003F0A0:
/* 2F8A0 8003F0A0 04004010 */  beqz       $v0, .L8003F0B4
/* 2F8A4 8003F0A4 40000232 */   andi      $v0, $s0, 0x40
/* 2F8A8 8003F0A8 0C002016 */  bnez       $s1, .L8003F0DC
/* 2F8AC 8003F0AC 21100000 */   addu      $v0, $zero, $zero
/* 2F8B0 8003F0B0 40000232 */  andi       $v0, $s0, 0x40
.L8003F0B4:
/* 2F8B4 8003F0B4 04004010 */  beqz       $v0, .L8003F0C8
/* 2F8B8 8003F0B8 80000232 */   andi      $v0, $s0, 0x80
/* 2F8BC 8003F0BC 07004016 */  bnez       $s2, .L8003F0DC
/* 2F8C0 8003F0C0 21100000 */   addu      $v0, $zero, $zero
/* 2F8C4 8003F0C4 80000232 */  andi       $v0, $s0, 0x80
.L8003F0C8:
/* 2F8C8 8003F0C8 04004010 */  beqz       $v0, .L8003F0DC
/* 2F8CC 8003F0CC 01000224 */   addiu     $v0, $zero, 0x1
/* 2F8D0 8003F0D0 02006012 */  beqz       $s3, .L8003F0DC
/* 2F8D4 8003F0D4 21100000 */   addu      $v0, $zero, $zero
/* 2F8D8 8003F0D8 01000224 */  addiu      $v0, $zero, 0x1
.L8003F0DC:
/* 2F8DC 8003F0DC 2000BF8F */  lw         $ra, 0x20($sp)
/* 2F8E0 8003F0E0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2F8E4 8003F0E4 1800B28F */  lw         $s2, 0x18($sp)
/* 2F8E8 8003F0E8 1400B18F */  lw         $s1, 0x14($sp)
/* 2F8EC 8003F0EC 1000B08F */  lw         $s0, 0x10($sp)
/* 2F8F0 8003F0F0 0800E003 */  jr         $ra
/* 2F8F4 8003F0F4 2800BD27 */   addiu     $sp, $sp, 0x28
.size isOkayToPlaySound, . - isOkayToPlaySound
