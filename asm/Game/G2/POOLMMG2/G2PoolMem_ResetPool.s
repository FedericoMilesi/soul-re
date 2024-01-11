.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2PoolMem_ResetPool
/* 86748 80095F48 04008294 */  lhu        $v0, 0x4($a0)
/* 8674C 80095F4C 21280000 */  addu       $a1, $zero, $zero
/* 86750 80095F50 0A004010 */  beqz       $v0, .L80095F7C
/* 86754 80095F54 020080A4 */   sh        $zero, 0x2($a0)
.L80095F58:
/* 86758 80095F58 0800828C */  lw         $v0, 0x8($a0)
/* 8675C 80095F5C 40180500 */  sll        $v1, $a1, 1
/* 86760 80095F60 21186200 */  addu       $v1, $v1, $v0
/* 86764 80095F64 000065A4 */  sh         $a1, 0x0($v1)
/* 86768 80095F68 04008294 */  lhu        $v0, 0x4($a0)
/* 8676C 80095F6C 0100A524 */  addiu      $a1, $a1, 0x1
/* 86770 80095F70 2A10A200 */  slt        $v0, $a1, $v0
/* 86774 80095F74 F8FF4014 */  bnez       $v0, .L80095F58
/* 86778 80095F78 00000000 */   nop
.L80095F7C:
/* 8677C 80095F7C 0800E003 */  jr         $ra
/* 86780 80095F80 00000000 */   nop
.size G2PoolMem_ResetPool, . - G2PoolMem_ResetPool
