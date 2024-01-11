.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckPhysObFamily
/* 5973C 80068F3C 2400848C */  lw         $a0, 0x24($a0)
/* 59740 80068F40 00000000 */  nop
/* 59744 80068F44 0B008010 */  beqz       $a0, .L80068F74
/* 59748 80068F48 0BB00234 */   ori       $v0, $zero, 0xB00B
/* 5974C 80068F4C 04008394 */  lhu        $v1, 0x4($a0)
/* 59750 80068F50 00000000 */  nop
/* 59754 80068F54 03006210 */  beq        $v1, $v0, .L80068F64
/* 59758 80068F58 FFFFA330 */   andi      $v1, $a1, 0xFFFF
/* 5975C 80068F5C 0800E003 */  jr         $ra
/* 59760 80068F60 21100000 */   addu      $v0, $zero, $zero
.L80068F64:
/* 59764 80068F64 02008494 */  lhu        $a0, 0x2($a0)
/* 59768 80068F68 00000000 */  nop
/* 5976C 80068F6C 02008310 */  beq        $a0, $v1, .L80068F78
/* 59770 80068F70 01000224 */   addiu     $v0, $zero, 0x1
.L80068F74:
/* 59774 80068F74 21100000 */  addu       $v0, $zero, $zero
.L80068F78:
/* 59778 80068F78 0800E003 */  jr         $ra
/* 5977C 80068F7C 00000000 */   nop
.size CheckPhysObFamily, . - CheckPhysObFamily
