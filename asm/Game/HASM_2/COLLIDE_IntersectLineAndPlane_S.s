.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel COLLIDE_IntersectLineAndPlane_S
/* 68AF4 800782F4 0000A28C */  lw         $v0, 0x0($a1)
/* 68AF8 800782F8 0400AA94 */  lhu        $t2, 0x4($a1)
/* 68AFC 800782FC 0000CC8C */  lw         $t4, 0x0($a2)
/* 68B00 80078300 0400CE94 */  lhu        $t6, 0x4($a2)
/* 68B04 80078304 024C0200 */  srl        $t1, $v0, 16
/* 68B08 80078308 FFFF4830 */  andi       $t0, $v0, 0xFFFF
/* 68B0C 8007830C 026C0C00 */  srl        $t5, $t4, 16
/* 68B10 80078310 FFFF8C31 */  andi       $t4, $t4, 0xFFFF
/* 68B14 80078314 23608801 */  subu       $t4, $t4, $t0
/* 68B18 80078318 2368A901 */  subu       $t5, $t5, $t1
/* 68B1C 8007831C 2370CA01 */  subu       $t6, $t6, $t2
/* 68B20 80078320 001C0C00 */  sll        $v1, $t4, 16
/* 68B24 80078324 25784301 */  or         $t7, $t2, $v1
/* 68B28 80078328 001C0E00 */  sll        $v1, $t6, 16
/* 68B2C 8007832C FFFFA531 */  andi       $a1, $t5, 0xFFFF
/* 68B30 80078330 25286500 */  or         $a1, $v1, $a1
/* 68B34 80078334 0000E0C8 */  lwc2       $0, 0x0($a3)
/* 68B38 80078338 0400E1C8 */  lwc2       $1, 0x4($a3)
/* 68B3C 8007833C 0000C248 */  ctc2       $v0, $0 # handwritten instruction
/* 68B40 80078340 0008CF48 */  ctc2       $t7, $1 # handwritten instruction
/* 68B44 80078344 0010C548 */  ctc2       $a1, $2 # handwritten instruction
/* 68B48 80078348 1000B98F */  lw         $t9, 0x10($sp)
/* 68B4C 8007834C 00000000 */  nop
/* 68B50 80078350 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 68B54 80078354 00C80248 */  mfc2       $v0, $25 # handwritten instruction
/* 68B58 80078358 00D00348 */  mfc2       $v1, $26 # handwritten instruction
/* 68B5C 8007835C 23785900 */  subu       $t7, $v0, $t9
/* 68B60 80078360 18006010 */  beqz       $v1, .L800783C4
/* 68B64 80078364 007B0F00 */   sll       $t7, $t7, 12
/* 68B68 80078368 23100F00 */  negu       $v0, $t7
/* 68B6C 8007836C 1A004300 */  div        $zero, $v0, $v1
/* 68B70 80078370 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 68B74 80078374 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 68B78 80078378 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 68B7C 8007837C 12780000 */  mflo       $t7
/* 68B80 80078380 0110E22D */  sltiu      $v0, $t7, 0x1001
/* 68B84 80078384 0F004010 */  beqz       $v0, .L800783C4
/* 68B88 80078388 00000000 */   nop
/* 68B8C 8007838C 00408F48 */  mtc2       $t7, $8 # handwritten instruction
/* 68B90 80078390 01000224 */  addiu      $v0, $zero, 0x1
/* 68B94 80078394 00000000 */  nop
/* 68B98 80078398 3D00984B */  GPF        1
/* 68B9C 8007839C 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 68BA0 800783A0 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 68BA4 800783A4 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 68BA8 800783A8 21400C01 */  addu       $t0, $t0, $t4
/* 68BAC 800783AC 000088A4 */  sh         $t0, 0x0($a0)
/* 68BB0 800783B0 21482D01 */  addu       $t1, $t1, $t5
/* 68BB4 800783B4 020089A4 */  sh         $t1, 0x2($a0)
/* 68BB8 800783B8 21504E01 */  addu       $t2, $t2, $t6
/* 68BBC 800783BC 0800E003 */  jr         $ra
/* 68BC0 800783C0 04008AA4 */   sh        $t2, 0x4($a0)
.L800783C4:
/* 68BC4 800783C4 0800E003 */  jr         $ra
/* 68BC8 800783C8 21100000 */   addu      $v0, $zero, $zero
.size COLLIDE_IntersectLineAndPlane_S, . - COLLIDE_IntersectLineAndPlane_S
