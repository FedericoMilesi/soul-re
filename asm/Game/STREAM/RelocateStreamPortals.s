.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocateStreamPortals
/* 4CC3C 8005C43C 4900A018 */  blez       $a1, .L8005C564
/* 4CC40 8005C440 21480000 */   addu      $t1, $zero, $zero
.L8005C444:
/* 4CC44 8005C444 20008294 */  lhu        $v0, 0x20($a0)
/* 4CC48 8005C448 0000C394 */  lhu        $v1, 0x0($a2)
/* 4CC4C 8005C44C 00000000 */  nop
/* 4CC50 8005C450 21104300 */  addu       $v0, $v0, $v1
/* 4CC54 8005C454 200082A4 */  sh         $v0, 0x20($a0)
/* 4CC58 8005C458 22008294 */  lhu        $v0, 0x22($a0)
/* 4CC5C 8005C45C 0200C394 */  lhu        $v1, 0x2($a2)
/* 4CC60 8005C460 00000000 */  nop
/* 4CC64 8005C464 21104300 */  addu       $v0, $v0, $v1
/* 4CC68 8005C468 220082A4 */  sh         $v0, 0x22($a0)
/* 4CC6C 8005C46C 24008294 */  lhu        $v0, 0x24($a0)
/* 4CC70 8005C470 0400C394 */  lhu        $v1, 0x4($a2)
/* 4CC74 8005C474 00000000 */  nop
/* 4CC78 8005C478 21104300 */  addu       $v0, $v0, $v1
/* 4CC7C 8005C47C 240082A4 */  sh         $v0, 0x24($a0)
/* 4CC80 8005C480 18008294 */  lhu        $v0, 0x18($a0)
/* 4CC84 8005C484 0000C394 */  lhu        $v1, 0x0($a2)
/* 4CC88 8005C488 00000000 */  nop
/* 4CC8C 8005C48C 21104300 */  addu       $v0, $v0, $v1
/* 4CC90 8005C490 180082A4 */  sh         $v0, 0x18($a0)
/* 4CC94 8005C494 1A008294 */  lhu        $v0, 0x1A($a0)
/* 4CC98 8005C498 0200C394 */  lhu        $v1, 0x2($a2)
/* 4CC9C 8005C49C 21400000 */  addu       $t0, $zero, $zero
/* 4CCA0 8005C4A0 21104300 */  addu       $v0, $v0, $v1
/* 4CCA4 8005C4A4 1A0082A4 */  sh         $v0, 0x1A($a0)
/* 4CCA8 8005C4A8 1C008294 */  lhu        $v0, 0x1C($a0)
/* 4CCAC 8005C4AC 0400C394 */  lhu        $v1, 0x4($a2)
/* 4CCB0 8005C4B0 21388000 */  addu       $a3, $a0, $zero
/* 4CCB4 8005C4B4 21104300 */  addu       $v0, $v0, $v1
/* 4CCB8 8005C4B8 1C0082A4 */  sh         $v0, 0x1C($a0)
.L8005C4BC:
/* 4CCBC 8005C4BC 2C00E294 */  lhu        $v0, 0x2C($a3)
/* 4CCC0 8005C4C0 0000C394 */  lhu        $v1, 0x0($a2)
/* 4CCC4 8005C4C4 00000000 */  nop
/* 4CCC8 8005C4C8 21104300 */  addu       $v0, $v0, $v1
/* 4CCCC 8005C4CC 2C00E2A4 */  sh         $v0, 0x2C($a3)
/* 4CCD0 8005C4D0 2E00E294 */  lhu        $v0, 0x2E($a3)
/* 4CCD4 8005C4D4 0200C394 */  lhu        $v1, 0x2($a2)
/* 4CCD8 8005C4D8 00000000 */  nop
/* 4CCDC 8005C4DC 21104300 */  addu       $v0, $v0, $v1
/* 4CCE0 8005C4E0 2E00E2A4 */  sh         $v0, 0x2E($a3)
/* 4CCE4 8005C4E4 3000E294 */  lhu        $v0, 0x30($a3)
/* 4CCE8 8005C4E8 0400C394 */  lhu        $v1, 0x4($a2)
/* 4CCEC 8005C4EC 01000825 */  addiu      $t0, $t0, 0x1
/* 4CCF0 8005C4F0 21104300 */  addu       $v0, $v0, $v1
/* 4CCF4 8005C4F4 3000E2A4 */  sh         $v0, 0x30($a3)
/* 4CCF8 8005C4F8 03000229 */  slti       $v0, $t0, 0x3
/* 4CCFC 8005C4FC EFFF4014 */  bnez       $v0, .L8005C4BC
/* 4CD00 8005C500 0800E724 */   addiu     $a3, $a3, 0x8
/* 4CD04 8005C504 21400000 */  addu       $t0, $zero, $zero
/* 4CD08 8005C508 21388000 */  addu       $a3, $a0, $zero
.L8005C50C:
/* 4CD0C 8005C50C 4400E294 */  lhu        $v0, 0x44($a3)
/* 4CD10 8005C510 0000C394 */  lhu        $v1, 0x0($a2)
/* 4CD14 8005C514 00000000 */  nop
/* 4CD18 8005C518 21104300 */  addu       $v0, $v0, $v1
/* 4CD1C 8005C51C 4400E2A4 */  sh         $v0, 0x44($a3)
/* 4CD20 8005C520 4600E294 */  lhu        $v0, 0x46($a3)
/* 4CD24 8005C524 0200C394 */  lhu        $v1, 0x2($a2)
/* 4CD28 8005C528 00000000 */  nop
/* 4CD2C 8005C52C 21104300 */  addu       $v0, $v0, $v1
/* 4CD30 8005C530 4600E2A4 */  sh         $v0, 0x46($a3)
/* 4CD34 8005C534 4800E294 */  lhu        $v0, 0x48($a3)
/* 4CD38 8005C538 0400C394 */  lhu        $v1, 0x4($a2)
/* 4CD3C 8005C53C 01000825 */  addiu      $t0, $t0, 0x1
/* 4CD40 8005C540 21104300 */  addu       $v0, $v0, $v1
/* 4CD44 8005C544 4800E2A4 */  sh         $v0, 0x48($a3)
/* 4CD48 8005C548 03000229 */  slti       $v0, $t0, 0x3
/* 4CD4C 8005C54C EFFF4014 */  bnez       $v0, .L8005C50C
/* 4CD50 8005C550 0800E724 */   addiu     $a3, $a3, 0x8
/* 4CD54 8005C554 01002925 */  addiu      $t1, $t1, 0x1
/* 4CD58 8005C558 2A102501 */  slt        $v0, $t1, $a1
/* 4CD5C 8005C55C B9FF4014 */  bnez       $v0, .L8005C444
/* 4CD60 8005C560 5C008424 */   addiu     $a0, $a0, 0x5C
.L8005C564:
/* 4CD64 8005C564 0800E003 */  jr         $ra
/* 4CD68 8005C568 00000000 */   nop
.size RelocateStreamPortals, . - RelocateStreamPortals
