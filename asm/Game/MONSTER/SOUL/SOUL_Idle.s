.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_Idle
/* 7F00C 8008E80C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7F010 8008E810 1000B0AF */  sw         $s0, 0x10($sp)
/* 7F014 8008E814 21808000 */  addu       $s0, $a0, $zero
/* 7F018 8008E818 1800BFAF */  sw         $ra, 0x18($sp)
/* 7F01C 8008E81C 1400B1AF */  sw         $s1, 0x14($sp)
/* 7F020 8008E820 7401038E */  lw         $v1, 0x174($s0)
/* 7F024 8008E824 6C01118E */  lw         $s1, 0x16C($s0)
/* 7F028 8008E828 FDFF6228 */  slti       $v0, $v1, -0x3
/* 7F02C 8008E82C 05004014 */  bnez       $v0, .L8008E844
/* 7F030 8008E830 03000524 */   addiu     $a1, $zero, 0x3
/* 7F034 8008E834 04006228 */  slti       $v0, $v1, 0x4
/* 7F038 8008E838 02004010 */  beqz       $v0, .L8008E844
/* 7F03C 8008E83C FDFF0524 */   addiu     $a1, $zero, -0x3
/* 7F040 8008E840 23280300 */  negu       $a1, $v1
.L8008E844:
/* 7F044 8008E844 7801038E */  lw         $v1, 0x178($s0)
/* 7F048 8008E848 00000000 */  nop
/* 7F04C 8008E84C FDFF6228 */  slti       $v0, $v1, -0x3
/* 7F050 8008E850 05004014 */  bnez       $v0, .L8008E868
/* 7F054 8008E854 03000424 */   addiu     $a0, $zero, 0x3
/* 7F058 8008E858 04006228 */  slti       $v0, $v1, 0x4
/* 7F05C 8008E85C 02004010 */  beqz       $v0, .L8008E868
/* 7F060 8008E860 FDFF0424 */   addiu     $a0, $zero, -0x3
/* 7F064 8008E864 23200300 */  negu       $a0, $v1
.L8008E868:
/* 7F068 8008E868 800105AE */  sw         $a1, 0x180($s0)
/* 7F06C 8008E86C 840104AE */  sw         $a0, 0x184($s0)
/* 7F070 8008E870 880100AE */  sw         $zero, 0x188($s0)
/* 7F074 8008E874 08C0858F */  lw         $a1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 7F078 8008E878 4B36020C */  jal        SOUL_Physics
/* 7F07C 8008E87C 21200002 */   addu      $a0, $s0, $zero
/* 7F080 8008E880 0000228E */  lw         $v0, 0x0($s1)
/* 7F084 8008E884 00000000 */  nop
/* 7F088 8008E888 04004230 */  andi       $v0, $v0, 0x4
/* 7F08C 8008E88C 18004014 */  bnez       $v0, .L8008E8F0
/* 7F090 8008E890 00000000 */   nop
/* 7F094 8008E894 C400228E */  lw         $v0, 0xC4($s1)
/* 7F098 8008E898 00000000 */  nop
/* 7F09C 8008E89C 03004010 */  beqz       $v0, .L8008E8AC
/* 7F0A0 8008E8A0 21200002 */   addu      $a0, $s0, $zero
/* 7F0A4 8008E8A4 333A0208 */  j          .L8008E8CC
/* 7F0A8 8008E8A8 13000524 */   addiu     $a1, $zero, 0x13
.L8008E8AC:
/* 7F0AC 8008E8AC 9006020C */  jal        MON_GetTime
/* 7F0B0 8008E8B0 21200002 */   addu      $a0, $s0, $zero
/* 7F0B4 8008E8B4 1401238E */  lw         $v1, 0x114($s1)
/* 7F0B8 8008E8B8 00000000 */  nop
/* 7F0BC 8008E8BC 2B186200 */  sltu       $v1, $v1, $v0
/* 7F0C0 8008E8C0 04006010 */  beqz       $v1, .L8008E8D4
/* 7F0C4 8008E8C4 21200002 */   addu      $a0, $s0, $zero
/* 7F0C8 8008E8C8 05000524 */  addiu      $a1, $zero, 0x5
.L8008E8CC:
/* 7F0CC 8008E8CC 91FE010C */  jal        MON_SwitchState
/* 7F0D0 8008E8D0 00000000 */   nop
.L8008E8D4:
/* 7F0D4 8008E8D4 1800028E */  lw         $v0, 0x18($s0)
/* 7F0D8 8008E8D8 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 7F0DC 8008E8DC 24104300 */  and        $v0, $v0, $v1
/* 7F0E0 8008E8E0 03004014 */  bnez       $v0, .L8008E8F0
/* 7F0E4 8008E8E4 00000000 */   nop
/* 7F0E8 8008E8E8 6336020C */  jal        SOUL_Fade
/* 7F0EC 8008E8EC 21200002 */   addu      $a0, $s0, $zero
.L8008E8F0:
/* 7F0F0 8008E8F0 2436020C */  jal        SOUL_QueueHandler
/* 7F0F4 8008E8F4 21200002 */   addu      $a0, $s0, $zero
/* 7F0F8 8008E8F8 1800BF8F */  lw         $ra, 0x18($sp)
/* 7F0FC 8008E8FC 1400B18F */  lw         $s1, 0x14($sp)
/* 7F100 8008E900 1000B08F */  lw         $s0, 0x10($sp)
/* 7F104 8008E904 0800E003 */  jr         $ra
/* 7F108 8008E908 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUL_Idle, . - SOUL_Idle
