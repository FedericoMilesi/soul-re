.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExecuteDrag
/* 5EC80 8006E480 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5EC84 8006E484 1400B1AF */  sw         $s1, 0x14($sp)
/* 5EC88 8006E488 21888000 */  addu       $s1, $a0, $zero
/* 5EC8C 8006E48C 1800BFAF */  sw         $ra, 0x18($sp)
/* 5EC90 8006E490 1000B0AF */  sw         $s0, 0x10($sp)
/* 5EC94 8006E494 6C01308E */  lw         $s0, 0x16C($s1)
/* 5EC98 8006E498 00000000 */  nop
/* 5EC9C 8006E49C 0000038E */  lw         $v1, 0x0($s0)
/* 5ECA0 8006E4A0 00000000 */  nop
/* 5ECA4 8006E4A4 02006230 */  andi       $v0, $v1, 0x2
/* 5ECA8 8006E4A8 03004010 */  beqz       $v0, .L8006E4B8
/* 5ECAC 8006E4AC FDFF0224 */   addiu     $v0, $zero, -0x3
/* 5ECB0 8006E4B0 24106200 */  and        $v0, $v1, $v0
/* 5ECB4 8006E4B4 000002AE */  sw         $v0, 0x0($s0)
.L8006E4B8:
/* 5ECB8 8006E4B8 0000028E */  lw         $v0, 0x0($s0)
/* 5ECBC 8006E4BC 1000033C */  lui        $v1, (0x100000 >> 16)
/* 5ECC0 8006E4C0 24104300 */  and        $v0, $v0, $v1
/* 5ECC4 8006E4C4 11004010 */  beqz       $v0, .L8006E50C
/* 5ECC8 8006E4C8 21202002 */   addu      $a0, $s1, $zero
/* 5ECCC 8006E4CC F0A8010C */  jal        FinishPush
/* 5ECD0 8006E4D0 080000AE */   sw        $zero, 0x8($s0)
/* 5ECD4 8006E4D4 EFFF033C */  lui        $v1, (0xFFEFFEB5 >> 16)
/* 5ECD8 8006E4D8 0000028E */  lw         $v0, 0x0($s0)
/* 5ECDC 8006E4DC B5FE6334 */  ori        $v1, $v1, (0xFFEFFEB5 & 0xFFFF)
/* 5ECE0 8006E4E0 24104300 */  and        $v0, $v0, $v1
/* 5ECE4 8006E4E4 01004234 */  ori        $v0, $v0, 0x1
/* 5ECE8 8006E4E8 000002AE */  sw         $v0, 0x0($s0)
/* 5ECEC 8006E4EC 5F00258A */  lwl        $a1, 0x5F($s1)
/* 5ECF0 8006E4F0 5C00259A */  lwr        $a1, 0x5C($s1)
/* 5ECF4 8006E4F4 60002686 */  lh         $a2, 0x60($s1)
/* 5ECF8 8006E4F8 710025AA */  swl        $a1, 0x71($s1)
/* 5ECFC 8006E4FC 6E0025BA */  swr        $a1, 0x6E($s1)
/* 5ED00 8006E500 720026A6 */  sh         $a2, 0x72($s1)
/* 5ED04 8006E504 45B90108 */  j          .L8006E514
/* 5ED08 8006E508 00000000 */   nop
.L8006E50C:
/* 5ED0C 8006E50C 67C7010C */  jal        G2EmulationInstancePlayAnimation
/* 5ED10 8006E510 21202002 */   addu      $a0, $s1, $zero
.L8006E514:
/* 5ED14 8006E514 1800BF8F */  lw         $ra, 0x18($sp)
/* 5ED18 8006E518 1400B18F */  lw         $s1, 0x14($sp)
/* 5ED1C 8006E51C 1000B08F */  lw         $s0, 0x10($sp)
/* 5ED20 8006E520 0800E003 */  jr         $ra
/* 5ED24 8006E524 2000BD27 */   addiu     $sp, $sp, 0x20
.size ExecuteDrag, . - ExecuteDrag
