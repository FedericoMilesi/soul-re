.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel COLLIDE_NearestPointOnLine_S
/* 689E4 800781E4 0000A88C */  lw         $t0, 0x0($a1)
/* 689E8 800781E8 0400A994 */  lhu        $t1, 0x4($a1)
/* 689EC 800781EC 0000CA8C */  lw         $t2, 0x0($a2)
/* 689F0 800781F0 0400CB94 */  lhu        $t3, 0x4($a2)
/* 689F4 800781F4 0000F88C */  lw         $t8, 0x0($a3)
/* 689F8 800781F8 0400F994 */  lhu        $t9, 0x4($a3)
/* 689FC 800781FC 02640800 */  srl        $t4, $t0, 16
/* 68A00 80078200 FFFF0D31 */  andi       $t5, $t0, 0xFFFF
/* 68A04 80078204 02740A00 */  srl        $t6, $t2, 16
/* 68A08 80078208 FFFF4F31 */  andi       $t7, $t2, 0xFFFF
/* 68A0C 8007820C 00141800 */  sll        $v0, $t8, 16
/* 68A10 80078210 25104900 */  or         $v0, $v0, $t1
/* 68A14 80078214 001C1900 */  sll        $v1, $t9, 16
/* 68A18 80078218 02C41800 */  srl        $t8, $t8, 16
/* 68A1C 8007821C 25187800 */  or         $v1, $v1, $t8
/* 68A20 80078220 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* 68A24 80078224 0008C248 */  ctc2       $v0, $1 # handwritten instruction
/* 68A28 80078228 0010C348 */  ctc2       $v1, $2 # handwritten instruction
/* 68A2C 8007822C 2378ED01 */  subu       $t7, $t7, $t5
/* 68A30 80078230 23C0CC01 */  subu       $t8, $t6, $t4
/* 68A34 80078234 23C86901 */  subu       $t9, $t3, $t1
/* 68A38 80078238 00141800 */  sll        $v0, $t8, 16
/* 68A3C 8007823C FFFFE331 */  andi       $v1, $t7, 0xFFFF
/* 68A40 80078240 25104300 */  or         $v0, $v0, $v1
/* 68A44 80078244 0018C248 */  ctc2       $v0, $3 # handwritten instruction
/* 68A48 80078248 0020D948 */  ctc2       $t9, $4 # handwritten instruction
/* 68A4C 8007824C 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 68A50 80078250 00089948 */  mtc2       $t9, $1 # handwritten instruction
/* 68A54 80078254 00000000 */  nop
/* 68A58 80078258 00000000 */  nop
/* 68A5C 8007825C 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 68A60 80078260 00C80548 */  mfc2       $a1, $25 # handwritten instruction
/* 68A64 80078264 00D00648 */  mfc2       $a2, $26 # handwritten instruction
/* 68A68 80078268 00D80748 */  mfc2       $a3, $27 # handwritten instruction
/* 68A6C 8007826C 2228A600 */  sub        $a1, $a1, $a2 # handwritten instruction
/* 68A70 80078270 0700E010 */  beqz       $a3, .L80078290
/* 68A74 80078274 002B0500 */   sll       $a1, $a1, 12
/* 68A78 80078278 22280500 */  sub        $a1, $zero, $a1 # handwritten instruction
/* 68A7C 8007827C 1A00A700 */  div        $zero, $a1, $a3
/* 68A80 80078280 00488F48 */  mtc2       $t7, $9 # handwritten instruction
/* 68A84 80078284 00509848 */  mtc2       $t8, $10 # handwritten instruction
/* 68A88 80078288 00589948 */  mtc2       $t9, $11 # handwritten instruction
/* 68A8C 8007828C 12100000 */  mflo       $v0
.L80078290:
/* 68A90 80078290 0110452C */  sltiu      $a1, $v0, 0x1001
/* 68A94 80078294 0900A014 */  bnez       $a1, .L800782BC
/* 68A98 80078298 00000000 */   nop
/* 68A9C 8007829C 0400401C */  bgtz       $v0, .L800782B0
/* 68AA0 800782A0 00000000 */   nop
/* 68AA4 800782A4 000088AC */  sw         $t0, 0x0($a0)
/* 68AA8 800782A8 0800E003 */  jr         $ra
/* 68AAC 800782AC 040089A4 */   sh        $t1, 0x4($a0)
.L800782B0:
/* 68AB0 800782B0 00008AAC */  sw         $t2, 0x0($a0)
/* 68AB4 800782B4 0800E003 */  jr         $ra
/* 68AB8 800782B8 04008BA4 */   sh        $t3, 0x4($a0)
.L800782BC:
/* 68ABC 800782BC 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 68AC0 800782C0 00000000 */  nop
/* 68AC4 800782C4 00000000 */  nop
/* 68AC8 800782C8 3D00984B */  GPF        1
/* 68ACC 800782CC 00480F48 */  mfc2       $t7, $9 # handwritten instruction
/* 68AD0 800782D0 00501848 */  mfc2       $t8, $10 # handwritten instruction
/* 68AD4 800782D4 00581948 */  mfc2       $t9, $11 # handwritten instruction
/* 68AD8 800782D8 2078AF01 */  add        $t7, $t5, $t7 # handwritten instruction
/* 68ADC 800782DC 20C09801 */  add        $t8, $t4, $t8 # handwritten instruction
/* 68AE0 800782E0 20C83901 */  add        $t9, $t1, $t9 # handwritten instruction
/* 68AE4 800782E4 00008FA4 */  sh         $t7, 0x0($a0)
/* 68AE8 800782E8 020098A4 */  sh         $t8, 0x2($a0)
/* 68AEC 800782EC 0800E003 */  jr         $ra
/* 68AF0 800782F0 040099A4 */   sh        $t9, 0x4($a0)
.size COLLIDE_NearestPointOnLine_S, . - COLLIDE_NearestPointOnLine_S
