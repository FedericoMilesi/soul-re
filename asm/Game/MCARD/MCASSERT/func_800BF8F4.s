.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BF8F4
/* B00F4 800BF8F4 19008010 */  beqz       $a0, .L800BF95C
/* B00F8 800BF8F8 21100000 */   addu      $v0, $zero, $zero
/* B00FC 800BF8FC 1700A010 */  beqz       $a1, .L800BF95C
/* B0100 800BF900 21180000 */   addu      $v1, $zero, $zero
/* B0104 800BF904 1400C018 */  blez       $a2, .L800BF958
/* B0108 800BF908 21388000 */   addu      $a3, $a0, $zero
.L800BF90C:
/* B010C 800BF90C 0000A290 */  lbu        $v0, 0x0($a1)
/* B0110 800BF910 0100A524 */  addiu      $a1, $a1, 0x1
/* B0114 800BF914 000082A0 */  sb         $v0, 0x0($a0)
/* B0118 800BF918 0B004014 */  bnez       $v0, .L800BF948
/* B011C 800BF91C 01008424 */   addiu     $a0, $a0, 0x1
/* B0120 800BF920 4DFE0208 */  j          .L800BF934
/* B0124 800BF924 01006324 */   addiu     $v1, $v1, 0x1
.L800BF928:
/* B0128 800BF928 000080A0 */  sb         $zero, 0x0($a0)
/* B012C 800BF92C 01008424 */  addiu      $a0, $a0, 0x1
/* B0130 800BF930 01006324 */  addiu      $v1, $v1, 0x1
.L800BF934:
/* B0134 800BF934 2A106600 */  slt        $v0, $v1, $a2
/* B0138 800BF938 FBFF4014 */  bnez       $v0, .L800BF928
/* B013C 800BF93C 2110E000 */   addu      $v0, $a3, $zero
/* B0140 800BF940 57FE0208 */  j          .L800BF95C
/* B0144 800BF944 00000000 */   nop
.L800BF948:
/* B0148 800BF948 01006324 */  addiu      $v1, $v1, 0x1
/* B014C 800BF94C 2A106600 */  slt        $v0, $v1, $a2
/* B0150 800BF950 EEFF4014 */  bnez       $v0, .L800BF90C
/* B0154 800BF954 00000000 */   nop
.L800BF958:
/* B0158 800BF958 2110E000 */  addu       $v0, $a3, $zero
.L800BF95C:
/* B015C 800BF95C 0800E003 */  jr         $ra
/* B0160 800BF960 00000000 */   nop
.size func_800BF8F4, . - func_800BF8F4
