.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetChannelVolume
/* 46EB0 800566B0 06008490 */  lbu        $a0, 0x6($a0)
/* 46EB4 800566B4 3D05A390 */  lbu        $v1, 0x53D($a1)
/* 46EB8 800566B8 80008228 */  slti       $v0, $a0, 0x80
/* 46EBC 800566BC 08004010 */  beqz       $v0, .L800566E0
/* 46EC0 800566C0 00000000 */   nop
/* 46EC4 800566C4 3805A28C */  lw         $v0, 0x538($a1)
/* 46EC8 800566C8 00000000 */  nop
/* 46ECC 800566CC 21104300 */  addu       $v0, $v0, $v1
/* 46ED0 800566D0 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 46ED4 800566D4 A0054290 */  lbu        $v0, 0x5A0($v0)
/* 46ED8 800566D8 21186400 */  addu       $v1, $v1, $a0
/* 46EDC 800566DC 081C62A0 */  sb         $v0, 0x1C08($v1)
.L800566E0:
/* 46EE0 800566E0 0800E003 */  jr         $ra
/* 46EE4 800566E4 00000000 */   nop
.size metaCmdGetChannelVolume, . - metaCmdGetChannelVolume
