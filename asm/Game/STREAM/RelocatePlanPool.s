.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocatePlanPool
/* 4C824 8005C024 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4C828 8005C028 1000B0AF */  sw         $s0, 0x10($sp)
/* 4C82C 8005C02C 2000BFAF */  sw         $ra, 0x20($sp)
/* 4C830 8005C030 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4C834 8005C034 1800B2AF */  sw         $s2, 0x18($sp)
/* 4C838 8005C038 1400B1AF */  sw         $s1, 0x14($sp)
/* 4C83C 8005C03C 0000B194 */  lhu        $s1, 0x0($a1)
/* 4C840 8005C040 0200B294 */  lhu        $s2, 0x2($a1)
/* 4C844 8005C044 0400B394 */  lhu        $s3, 0x4($a1)
/* 4C848 8005C048 C661020C */  jal        PLANAPI_NumNodesInPool
/* 4C84C 8005C04C 21808000 */   addu      $s0, $a0, $zero
/* 4C850 8005C050 21284000 */  addu       $a1, $v0, $zero
/* 4C854 8005C054 0E00A010 */  beqz       $a1, .L8005C090
/* 4C858 8005C058 04000426 */   addiu     $a0, $s0, 0x4
.L8005C05C:
/* 4C85C 8005C05C 00000296 */  lhu        $v0, 0x0($s0)
/* 4C860 8005C060 FFFFA524 */  addiu      $a1, $a1, -0x1
/* 4C864 8005C064 21105100 */  addu       $v0, $v0, $s1
/* 4C868 8005C068 000002A6 */  sh         $v0, 0x0($s0)
/* 4C86C 8005C06C 1C001026 */  addiu      $s0, $s0, 0x1C
/* 4C870 8005C070 FEFF8294 */  lhu        $v0, -0x2($a0)
/* 4C874 8005C074 00008394 */  lhu        $v1, 0x0($a0)
/* 4C878 8005C078 21105200 */  addu       $v0, $v0, $s2
/* 4C87C 8005C07C 21187300 */  addu       $v1, $v1, $s3
/* 4C880 8005C080 FEFF82A4 */  sh         $v0, -0x2($a0)
/* 4C884 8005C084 000083A4 */  sh         $v1, 0x0($a0)
/* 4C888 8005C088 F4FFA014 */  bnez       $a1, .L8005C05C
/* 4C88C 8005C08C 1C008424 */   addiu     $a0, $a0, 0x1C
.L8005C090:
/* 4C890 8005C090 ECF5848F */  lw         $a0, %gp_rel(poolManagementData)($gp)
/* 4C894 8005C094 00000000 */  nop
/* 4C898 8005C098 02008294 */  lhu        $v0, 0x2($a0)
/* 4C89C 8005C09C 06008394 */  lhu        $v1, 0x6($a0)
/* 4C8A0 8005C0A0 21105100 */  addu       $v0, $v0, $s1
/* 4C8A4 8005C0A4 020082A4 */  sh         $v0, 0x2($a0)
/* 4C8A8 8005C0A8 04008294 */  lhu        $v0, 0x4($a0)
/* 4C8AC 8005C0AC 21187300 */  addu       $v1, $v1, $s3
/* 4C8B0 8005C0B0 060083A4 */  sh         $v1, 0x6($a0)
/* 4C8B4 8005C0B4 21105200 */  addu       $v0, $v0, $s2
/* 4C8B8 8005C0B8 040082A4 */  sh         $v0, 0x4($a0)
/* 4C8BC 8005C0BC 2000BF8F */  lw         $ra, 0x20($sp)
/* 4C8C0 8005C0C0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4C8C4 8005C0C4 1800B28F */  lw         $s2, 0x18($sp)
/* 4C8C8 8005C0C8 1400B18F */  lw         $s1, 0x14($sp)
/* 4C8CC 8005C0CC 1000B08F */  lw         $s0, 0x10($sp)
/* 4C8D0 8005C0D0 0800E003 */  jr         $ra
/* 4C8D4 8005C0D4 2800BD27 */   addiu     $sp, $sp, 0x28
.size RelocatePlanPool, . - RelocatePlanPool
