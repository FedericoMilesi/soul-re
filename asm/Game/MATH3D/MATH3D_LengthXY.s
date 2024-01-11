.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_LengthXY
/* 2A3AC 80039BAC 02008104 */  bgez       $a0, .L80039BB8
/* 2A3B0 80039BB0 00000000 */   nop
/* 2A3B4 80039BB4 23200400 */  negu       $a0, $a0
.L80039BB8:
/* 2A3B8 80039BB8 0200A104 */  bgez       $a1, .L80039BC4
/* 2A3BC 80039BBC 00000000 */   nop
/* 2A3C0 80039BC0 23280500 */  negu       $a1, $a1
.L80039BC4:
/* 2A3C4 80039BC4 2A10A400 */  slt        $v0, $a1, $a0
/* 2A3C8 80039BC8 05004010 */  beqz       $v0, .L80039BE0
/* 2A3CC 80039BCC 00190500 */   sll       $v1, $a1, 4
/* 2A3D0 80039BD0 26208500 */  xor        $a0, $a0, $a1
/* 2A3D4 80039BD4 2628A400 */  xor        $a1, $a1, $a0
/* 2A3D8 80039BD8 26208500 */  xor        $a0, $a0, $a1
/* 2A3DC 80039BDC 00190500 */  sll        $v1, $a1, 4
.L80039BE0:
/* 2A3E0 80039BE0 23186500 */  subu       $v1, $v1, $a1
/* 2A3E4 80039BE4 40180300 */  sll        $v1, $v1, 1
/* 2A3E8 80039BE8 40100400 */  sll        $v0, $a0, 1
/* 2A3EC 80039BEC 21104400 */  addu       $v0, $v0, $a0
/* 2A3F0 80039BF0 80100200 */  sll        $v0, $v0, 2
/* 2A3F4 80039BF4 21106200 */  addu       $v0, $v1, $v0
/* 2A3F8 80039BF8 02004104 */  bgez       $v0, .L80039C04
/* 2A3FC 80039BFC 00000000 */   nop
/* 2A400 80039C00 1F004224 */  addiu      $v0, $v0, 0x1F
.L80039C04:
/* 2A404 80039C04 0800E003 */  jr         $ra
/* 2A408 80039C08 43110200 */   sra       $v0, $v0, 5
.size MATH3D_LengthXY, . - MATH3D_LengthXY
