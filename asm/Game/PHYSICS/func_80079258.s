.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_80079258
/* 69A58 80079258 0000888C */  lw         $t0, 0x0($a0)
/* 69A5C 8007925C 04008A8C */  lw         $t2, 0x4($a0)
/* 69A60 80079260 08008C8C */  lw         $t4, 0x8($a0)
/* 69A64 80079264 0C008E8C */  lw         $t6, 0xC($a0)
/* 69A68 80079268 034C0800 */  sra        $t1, $t0, 16
/* 69A6C 8007926C 00440800 */  sll        $t0, $t0, 16
/* 69A70 80079270 03440800 */  sra        $t0, $t0, 16
/* 69A74 80079274 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 69A78 80079278 0000A28C */  lw         $v0, 0x0($a1)
/* 69A7C 8007927C 035C0A00 */  sra        $t3, $t2, 16
/* 69A80 80079280 00508B48 */  mtc2       $t3, $10 # handwritten instruction
/* 69A84 80079284 037C0E00 */  sra        $t7, $t6, 16
/* 69A88 80079288 00740E00 */  sll        $t6, $t6, 16
/* 69A8C 8007928C 03740E00 */  sra        $t6, $t6, 16
/* 69A90 80079290 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 69A94 80079294 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 69A98 80079298 036C0C00 */  sra        $t5, $t4, 16
/* 69A9C 8007929C 00000000 */  nop
/* 69AA0 800792A0 3D00984B */  GPF        1
/* 69AA4 800792A4 0400A28C */  lw         $v0, 0x4($a1)
/* 69AA8 800792A8 00640C00 */  sll        $t4, $t4, 16
/* 69AAC 800792AC 03640C00 */  sra        $t4, $t4, 16
/* 69AB0 800792B0 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 69AB4 800792B4 00500B48 */  mfc2       $t3, $10 # handwritten instruction
/* 69AB8 800792B8 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 69ABC 800792BC 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 69AC0 800792C0 00488948 */  mtc2       $t1, $9 # handwritten instruction
/* 69AC4 800792C4 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 69AC8 800792C8 00588F48 */  mtc2       $t7, $11 # handwritten instruction
/* 69ACC 800792CC 000088A4 */  sh         $t0, 0x0($a0)
/* 69AD0 800792D0 00000000 */  nop
/* 69AD4 800792D4 3D00984B */  GPF        1
/* 69AD8 800792D8 10009884 */  lh         $t8, 0x10($a0)
/* 69ADC 800792DC 0800A28C */  lw         $v0, 0x8($a1)
/* 69AE0 800792E0 06008BA4 */  sh         $t3, 0x6($a0)
/* 69AE4 800792E4 00540A00 */  sll        $t2, $t2, 16
/* 69AE8 800792E8 03540A00 */  sra        $t2, $t2, 16
/* 69AEC 800792EC 00480948 */  mfc2       $t1, $9 # handwritten instruction
/* 69AF0 800792F0 00500C48 */  mfc2       $t4, $10 # handwritten instruction
/* 69AF4 800792F4 00580F48 */  mfc2       $t7, $11 # handwritten instruction
/* 69AF8 800792F8 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 69AFC 800792FC 00488A48 */  mtc2       $t2, $9 # handwritten instruction
/* 69B00 80079300 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 69B04 80079304 00589848 */  mtc2       $t8, $11 # handwritten instruction
/* 69B08 80079308 21108000 */  addu       $v0, $a0, $zero
/* 69B0C 8007930C 00000000 */  nop
/* 69B10 80079310 3D00984B */  GPF        1
/* 69B14 80079314 0C008EA4 */  sh         $t6, 0xC($a0)
/* 69B18 80079318 020089A4 */  sh         $t1, 0x2($a0)
/* 69B1C 8007931C 08008CA4 */  sh         $t4, 0x8($a0)
/* 69B20 80079320 0E008FA4 */  sh         $t7, 0xE($a0)
/* 69B24 80079324 00480A48 */  mfc2       $t2, $9 # handwritten instruction
/* 69B28 80079328 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 69B2C 8007932C 00581848 */  mfc2       $t8, $11 # handwritten instruction
/* 69B30 80079330 04008AA4 */  sh         $t2, 0x4($a0)
/* 69B34 80079334 0A008DA4 */  sh         $t5, 0xA($a0)
/* 69B38 80079338 0800E003 */  jr         $ra
/* 69B3C 8007933C 100098A4 */   sh        $t8, 0x10($a0)
.size func_80079258, . - func_80079258
