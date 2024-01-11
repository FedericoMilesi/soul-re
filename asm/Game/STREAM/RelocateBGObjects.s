.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocateBGObjects
/* 4C780 8005BF80 2150A000 */  addu       $t2, $a1, $zero
/* 4C784 8005BF84 25004019 */  blez       $t2, .L8005C01C
/* 4C788 8005BF88 21480000 */   addu      $t1, $zero, $zero
/* 4C78C 8005BF8C 21408000 */  addu       $t0, $a0, $zero
.L8005BF90:
/* 4C790 8005BF90 1400028D */  lw         $v0, 0x14($t0)
/* 4C794 8005BF94 00000000 */  nop
/* 4C798 8005BF98 1C004018 */  blez       $v0, .L8005C00C
/* 4C79C 8005BF9C 21380000 */   addu      $a3, $zero, $zero
/* 4C7A0 8005BFA0 C0280700 */  sll        $a1, $a3, 3
.L8005BFA4:
/* 4C7A4 8005BFA4 0400048D */  lw         $a0, 0x4($t0)
/* 4C7A8 8005BFA8 0000C394 */  lhu        $v1, 0x0($a2)
/* 4C7AC 8005BFAC 2120A400 */  addu       $a0, $a1, $a0
/* 4C7B0 8005BFB0 00008294 */  lhu        $v0, 0x0($a0)
/* 4C7B4 8005BFB4 00000000 */  nop
/* 4C7B8 8005BFB8 21104300 */  addu       $v0, $v0, $v1
/* 4C7BC 8005BFBC 000082A4 */  sh         $v0, 0x0($a0)
/* 4C7C0 8005BFC0 0400048D */  lw         $a0, 0x4($t0)
/* 4C7C4 8005BFC4 0200C394 */  lhu        $v1, 0x2($a2)
/* 4C7C8 8005BFC8 2120A400 */  addu       $a0, $a1, $a0
/* 4C7CC 8005BFCC 02008294 */  lhu        $v0, 0x2($a0)
/* 4C7D0 8005BFD0 00000000 */  nop
/* 4C7D4 8005BFD4 21104300 */  addu       $v0, $v0, $v1
/* 4C7D8 8005BFD8 020082A4 */  sh         $v0, 0x2($a0)
/* 4C7DC 8005BFDC 0400028D */  lw         $v0, 0x4($t0)
/* 4C7E0 8005BFE0 0400C394 */  lhu        $v1, 0x4($a2)
/* 4C7E4 8005BFE4 2128A200 */  addu       $a1, $a1, $v0
/* 4C7E8 8005BFE8 0400A294 */  lhu        $v0, 0x4($a1)
/* 4C7EC 8005BFEC 00000000 */  nop
/* 4C7F0 8005BFF0 21104300 */  addu       $v0, $v0, $v1
/* 4C7F4 8005BFF4 0400A2A4 */  sh         $v0, 0x4($a1)
/* 4C7F8 8005BFF8 1400028D */  lw         $v0, 0x14($t0)
/* 4C7FC 8005BFFC 0100E724 */  addiu      $a3, $a3, 0x1
/* 4C800 8005C000 2A10E200 */  slt        $v0, $a3, $v0
/* 4C804 8005C004 E7FF4014 */  bnez       $v0, .L8005BFA4
/* 4C808 8005C008 C0280700 */   sll       $a1, $a3, 3
.L8005C00C:
/* 4C80C 8005C00C 01002925 */  addiu      $t1, $t1, 0x1
/* 4C810 8005C010 2A102A01 */  slt        $v0, $t1, $t2
/* 4C814 8005C014 DEFF4014 */  bnez       $v0, .L8005BF90
/* 4C818 8005C018 18000825 */   addiu     $t0, $t0, 0x18
.L8005C01C:
/* 4C81C 8005C01C 0800E003 */  jr         $ra
/* 4C820 8005C020 00000000 */   nop
.size RelocateBGObjects, . - RelocateBGObjects
