.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Impact
/* 790D8 800888D8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 790DC 800888DC 1000B0AF */  sw         $s0, 0x10($sp)
/* 790E0 800888E0 21808000 */  addu       $s0, $a0, $zero
/* 790E4 800888E4 1800BFAF */  sw         $ra, 0x18($sp)
/* 790E8 800888E8 1400B1AF */  sw         $s1, 0x14($sp)
/* 790EC 800888EC 1800028E */  lw         $v0, 0x18($s0)
/* 790F0 800888F0 6C01118E */  lw         $s1, 0x16C($s0)
/* 790F4 800888F4 10004230 */  andi       $v0, $v0, 0x10
/* 790F8 800888F8 03004010 */  beqz       $v0, .L80088908
/* 790FC 800888FC 00000000 */   nop
/* 79100 80088900 91FE010C */  jal        MON_SwitchState
/* 79104 80088904 04000524 */   addiu     $a1, $zero, 0x4
.L80088908:
/* 79108 80088908 0917020C */  jal        MON_DefaultQueueHandler
/* 7910C 8008890C 21200002 */   addu      $a0, $s0, $zero
/* 79110 80088910 9801038E */  lw         $v1, 0x198($s0)
/* 79114 80088914 10000224 */  addiu      $v0, $zero, 0x10
/* 79118 80088918 0A006214 */  bne        $v1, $v0, .L80088944
/* 7911C 8008891C 20000224 */   addiu     $v0, $zero, 0x20
/* 79120 80088920 54012396 */  lhu        $v1, 0x154($s1)
/* 79124 80088924 00000000 */  nop
/* 79128 80088928 03006210 */  beq        $v1, $v0, .L80088938
/* 7912C 8008892C 40000224 */   addiu     $v0, $zero, 0x40
/* 79130 80088930 04006214 */  bne        $v1, $v0, .L80088944
/* 79134 80088934 00000000 */   nop
.L80088938:
/* 79138 80088938 21200002 */  addu       $a0, $s0, $zero
/* 7913C 8008893C BA10020C */  jal        MON_BurnInAir
/* 79140 80088940 0C000524 */   addiu     $a1, $zero, 0xC
.L80088944:
/* 79144 80088944 1800BF8F */  lw         $ra, 0x18($sp)
/* 79148 80088948 1400B18F */  lw         $s1, 0x14($sp)
/* 7914C 8008894C 1000B08F */  lw         $s0, 0x10($sp)
/* 79150 80088950 0800E003 */  jr         $ra
/* 79154 80088954 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_Impact, . - MON_Impact
