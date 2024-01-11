.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_veclen2
/* 2AB88 8003A388 21188000 */  addu       $v1, $a0, $zero
/* 2AB8C 8003A38C 02006104 */  bgez       $v1, .L8003A398
/* 2AB90 8003A390 00000000 */   nop
/* 2AB94 8003A394 23180300 */  negu       $v1, $v1
.L8003A398:
/* 2AB98 8003A398 0300A104 */  bgez       $a1, .L8003A3A8
/* 2AB9C 8003A39C 2A106500 */   slt       $v0, $v1, $a1
/* 2ABA0 8003A3A0 23280500 */  negu       $a1, $a1
/* 2ABA4 8003A3A4 2A106500 */  slt        $v0, $v1, $a1
.L8003A3A8:
/* 2ABA8 8003A3A8 05004010 */  beqz       $v0, .L8003A3C0
/* 2ABAC 8003A3AC 43200500 */   sra       $a0, $a1, 1
/* 2ABB0 8003A3B0 26186500 */  xor        $v1, $v1, $a1
/* 2ABB4 8003A3B4 2628A300 */  xor        $a1, $a1, $v1
/* 2ABB8 8003A3B8 26186500 */  xor        $v1, $v1, $a1
/* 2ABBC 8003A3BC 43200500 */  sra        $a0, $a1, 1
.L8003A3C0:
/* 2ABC0 8003A3C0 2120A400 */  addu       $a0, $a1, $a0
/* 2ABC4 8003A3C4 43110300 */  sra        $v0, $v1, 5
/* 2ABC8 8003A3C8 23106200 */  subu       $v0, $v1, $v0
/* 2ABCC 8003A3CC C3190300 */  sra        $v1, $v1, 7
/* 2ABD0 8003A3D0 23104300 */  subu       $v0, $v0, $v1
/* 2ABD4 8003A3D4 83180400 */  sra        $v1, $a0, 2
/* 2ABD8 8003A3D8 21104300 */  addu       $v0, $v0, $v1
/* 2ABDC 8003A3DC 83210400 */  sra        $a0, $a0, 6
/* 2ABE0 8003A3E0 0800E003 */  jr         $ra
/* 2ABE4 8003A3E4 21104400 */   addu      $v0, $v0, $a0
.size MATH3D_veclen2, . - MATH3D_veclen2
