.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSubstituteVariableParam3
/* 47664 80056E64 04008290 */  lbu        $v0, 0x4($a0)
/* 47668 80056E68 00000000 */  nop
/* 4766C 80056E6C 2128A200 */  addu       $a1, $a1, $v0
/* 47670 80056E70 D803A290 */  lbu        $v0, 0x3D8($a1)
/* 47674 80056E74 00000000 */  nop
/* 47678 80056E78 04004234 */  ori        $v0, $v0, 0x4
/* 4767C 80056E7C 0800E003 */  jr         $ra
/* 47680 80056E80 D803A2A0 */   sb        $v0, 0x3D8($a1)
.size metaCmdSubstituteVariableParam3, . - metaCmdSubstituteVariableParam3
