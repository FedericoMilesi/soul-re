.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSubstituteVariableParam2
/* 47644 80056E44 04008290 */  lbu        $v0, 0x4($a0)
/* 47648 80056E48 00000000 */  nop
/* 4764C 80056E4C 2128A200 */  addu       $a1, $a1, $v0
/* 47650 80056E50 D803A290 */  lbu        $v0, 0x3D8($a1)
/* 47654 80056E54 00000000 */  nop
/* 47658 80056E58 02004234 */  ori        $v0, $v0, 0x2
/* 4765C 80056E5C 0800E003 */  jr         $ra
/* 47660 80056E60 D803A2A0 */   sb        $v0, 0x3D8($a1)
.size metaCmdSubstituteVariableParam2, . - metaCmdSubstituteVariableParam2
