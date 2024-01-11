.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocateCameras
/* 4C434 8005BC34 2200A018 */  blez       $a1, .L8005BCC0
/* 4C438 8005BC38 21380000 */   addu      $a3, $zero, $zero
.L8005BC3C:
/* 4C43C 8005BC3C 00008294 */  lhu        $v0, 0x0($a0)
/* 4C440 8005BC40 0000C394 */  lhu        $v1, 0x0($a2)
/* 4C444 8005BC44 00000000 */  nop
/* 4C448 8005BC48 21104300 */  addu       $v0, $v0, $v1
/* 4C44C 8005BC4C 000082A4 */  sh         $v0, 0x0($a0)
/* 4C450 8005BC50 02008294 */  lhu        $v0, 0x2($a0)
/* 4C454 8005BC54 0200C394 */  lhu        $v1, 0x2($a2)
/* 4C458 8005BC58 00000000 */  nop
/* 4C45C 8005BC5C 21104300 */  addu       $v0, $v0, $v1
/* 4C460 8005BC60 020082A4 */  sh         $v0, 0x2($a0)
/* 4C464 8005BC64 04008294 */  lhu        $v0, 0x4($a0)
/* 4C468 8005BC68 0400C394 */  lhu        $v1, 0x4($a2)
/* 4C46C 8005BC6C 00000000 */  nop
/* 4C470 8005BC70 21104300 */  addu       $v0, $v0, $v1
/* 4C474 8005BC74 040082A4 */  sh         $v0, 0x4($a0)
/* 4C478 8005BC78 10008294 */  lhu        $v0, 0x10($a0)
/* 4C47C 8005BC7C 0000C394 */  lhu        $v1, 0x0($a2)
/* 4C480 8005BC80 00000000 */  nop
/* 4C484 8005BC84 21104300 */  addu       $v0, $v0, $v1
/* 4C488 8005BC88 100082A4 */  sh         $v0, 0x10($a0)
/* 4C48C 8005BC8C 12008294 */  lhu        $v0, 0x12($a0)
/* 4C490 8005BC90 0200C394 */  lhu        $v1, 0x2($a2)
/* 4C494 8005BC94 00000000 */  nop
/* 4C498 8005BC98 21104300 */  addu       $v0, $v0, $v1
/* 4C49C 8005BC9C 120082A4 */  sh         $v0, 0x12($a0)
/* 4C4A0 8005BCA0 14008294 */  lhu        $v0, 0x14($a0)
/* 4C4A4 8005BCA4 0400C394 */  lhu        $v1, 0x4($a2)
/* 4C4A8 8005BCA8 0100E724 */  addiu      $a3, $a3, 0x1
/* 4C4AC 8005BCAC 21104300 */  addu       $v0, $v0, $v1
/* 4C4B0 8005BCB0 140082A4 */  sh         $v0, 0x14($a0)
/* 4C4B4 8005BCB4 2A10E500 */  slt        $v0, $a3, $a1
/* 4C4B8 8005BCB8 E0FF4014 */  bnez       $v0, .L8005BC3C
/* 4C4BC 8005BCBC 18008424 */   addiu     $a0, $a0, 0x18
.L8005BCC0:
/* 4C4C0 8005BCC0 0800E003 */  jr         $ra
/* 4C4C4 8005BCC4 00000000 */   nop
.size RelocateCameras, . - RelocateCameras
