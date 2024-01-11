.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSubstituteVariableParam1
/* 47624 80056E24 04008290 */  lbu        $v0, 0x4($a0)
/* 47628 80056E28 00000000 */  nop
/* 4762C 80056E2C 2128A200 */  addu       $a1, $a1, $v0
/* 47630 80056E30 D803A290 */  lbu        $v0, 0x3D8($a1)
/* 47634 80056E34 00000000 */  nop
/* 47638 80056E38 01004234 */  ori        $v0, $v0, 0x1
/* 4763C 80056E3C 0800E003 */  jr         $ra
/* 47640 80056E40 D803A2A0 */   sb        $v0, 0x3D8($a1)
.size metaCmdSubstituteVariableParam1, . - metaCmdSubstituteVariableParam1
