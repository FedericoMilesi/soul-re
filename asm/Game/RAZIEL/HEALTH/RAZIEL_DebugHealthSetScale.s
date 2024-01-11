.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_DebugHealthSetScale
/* 95664 800A4E64 0100053C */  lui        $a1, (0x186A0 >> 16)
/* 95668 800A4E68 A086A534 */  ori        $a1, $a1, (0x186A0 & 0xFFFF)
/* 9566C 800A4E6C FFFF8324 */  addiu      $v1, $a0, -0x1
/* 95670 800A4E70 80100300 */  sll        $v0, $v1, 2
/* 95674 800A4E74 21104300 */  addu       $v0, $v0, $v1
/* 95678 800A4E78 28FA84A7 */  sh         $a0, %gp_rel(Raziel + 0x3F8)($gp)
/* 9567C 800A4E7C 00240400 */  sll        $a0, $a0, 16
/* 95680 800A4E80 03240400 */  sra        $a0, $a0, 16
/* 95684 800A4E84 2AFA82A7 */  sh         $v0, %gp_rel(Raziel + 0x3FA)($gp)
/* 95688 800A4E88 40100400 */  sll        $v0, $a0, 1
/* 9568C 800A4E8C 21104400 */  addu       $v0, $v0, $a0
/* 95690 800A4E90 80190200 */  sll        $v1, $v0, 6
/* 95694 800A4E94 21104300 */  addu       $v0, $v0, $v1
/* 95698 800A4E98 80100200 */  sll        $v0, $v0, 2
/* 9569C 800A4E9C 21104400 */  addu       $v0, $v0, $a0
/* 956A0 800A4EA0 80100200 */  sll        $v0, $v0, 2
/* 956A4 800A4EA4 21104400 */  addu       $v0, $v0, $a0
/* 956A8 800A4EA8 40110200 */  sll        $v0, $v0, 5
/* 956AC 800A4EAC 21104500 */  addu       $v0, $v0, $a1
/* 956B0 800A4EB0 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 956B4 800A4EB4 0800E003 */  jr         $ra
/* 956B8 800A4EB8 00000000 */   nop
.size RAZIEL_DebugHealthSetScale, . - RAZIEL_DebugHealthSetScale
