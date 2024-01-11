.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetObliqueDirection
/* 5DD48 8006D548 74018294 */  lhu        $v0, 0x174($a0)
/* 5DD4C 8006D54C F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 5DD50 8006D550 0000A2A7 */  sh         $v0, 0x0($sp)
/* 5DD54 8006D554 78018694 */  lhu        $a2, 0x178($a0)
/* 5DD58 8006D558 21380000 */  addu       $a3, $zero, $zero
/* 5DD5C 8006D55C 0200A6A7 */  sh         $a2, 0x2($sp)
/* 5DD60 8006D560 7C018394 */  lhu        $v1, 0x17C($a0)
/* 5DD64 8006D564 00140200 */  sll        $v0, $v0, 16
/* 5DD68 8006D568 04004014 */  bnez       $v0, .L8006D57C
/* 5DD6C 8006D56C 0400A3A7 */   sh        $v1, 0x4($sp)
/* 5DD70 8006D570 00140600 */  sll        $v0, $a2, 16
/* 5DD74 8006D574 25004010 */  beqz       $v0, .L8006D60C
/* 5DD78 8006D578 00000000 */   nop
.L8006D57C:
/* 5DD7C 8006D57C 7401828C */  lw         $v0, 0x174($a0)
/* 5DD80 8006D580 7801838C */  lw         $v1, 0x178($a0)
/* 5DD84 8006D584 02004104 */  bgez       $v0, .L8006D590
/* 5DD88 8006D588 21304000 */   addu      $a2, $v0, $zero
/* 5DD8C 8006D58C 23300600 */  negu       $a2, $a2
.L8006D590:
/* 5DD90 8006D590 02006104 */  bgez       $v1, .L8006D59C
/* 5DD94 8006D594 00000000 */   nop
/* 5DD98 8006D598 23180300 */  negu       $v1, $v1
.L8006D59C:
/* 5DD9C 8006D59C 2A106600 */  slt        $v0, $v1, $a2
/* 5DDA0 8006D5A0 0D004010 */  beqz       $v0, .L8006D5D8
/* 5DDA4 8006D5A4 0400A0A4 */   sh        $zero, 0x4($a1)
/* 5DDA8 8006D5A8 7401828C */  lw         $v0, 0x174($a0)
/* 5DDAC 8006D5AC 00000000 */  nop
/* 5DDB0 8006D5B0 03004018 */  blez       $v0, .L8006D5C0
/* 5DDB4 8006D5B4 00000000 */   nop
/* 5DDB8 8006D5B8 71B50108 */  j          .L8006D5C4
/* 5DDBC 8006D5BC 00100224 */   addiu     $v0, $zero, 0x1000
.L8006D5C0:
/* 5DDC0 8006D5C0 00F00224 */  addiu      $v0, $zero, -0x1000
.L8006D5C4:
/* 5DDC4 8006D5C4 0000A2A4 */  sh         $v0, 0x0($a1)
/* 5DDC8 8006D5C8 0200A0A4 */  sh         $zero, 0x2($a1)
/* 5DDCC 8006D5CC 43100600 */  sra        $v0, $a2, 1
/* 5DDD0 8006D5D0 7FB50108 */  j          .L8006D5FC
/* 5DDD4 8006D5D4 2A106200 */   slt       $v0, $v1, $v0
.L8006D5D8:
/* 5DDD8 8006D5D8 7801828C */  lw         $v0, 0x178($a0)
/* 5DDDC 8006D5DC 00000000 */  nop
/* 5DDE0 8006D5E0 0200401C */  bgtz       $v0, .L8006D5EC
/* 5DDE4 8006D5E4 00100224 */   addiu     $v0, $zero, 0x1000
/* 5DDE8 8006D5E8 00F00224 */  addiu      $v0, $zero, -0x1000
.L8006D5EC:
/* 5DDEC 8006D5EC 0200A2A4 */  sh         $v0, 0x2($a1)
/* 5DDF0 8006D5F0 0000A0A4 */  sh         $zero, 0x0($a1)
/* 5DDF4 8006D5F4 43100300 */  sra        $v0, $v1, 1
/* 5DDF8 8006D5F8 2A10C200 */  slt        $v0, $a2, $v0
.L8006D5FC:
/* 5DDFC 8006D5FC 07004014 */  bnez       $v0, .L8006D61C
/* 5DE00 8006D600 2110E000 */   addu      $v0, $a3, $zero
/* 5DE04 8006D604 86B50108 */  j          .L8006D618
/* 5DE08 8006D608 01000724 */   addiu     $a3, $zero, 0x1
.L8006D60C:
/* 5DE0C 8006D60C 0400A0A4 */  sh         $zero, 0x4($a1)
/* 5DE10 8006D610 0200A0A4 */  sh         $zero, 0x2($a1)
/* 5DE14 8006D614 0000A0A4 */  sh         $zero, 0x0($a1)
.L8006D618:
/* 5DE18 8006D618 2110E000 */  addu       $v0, $a3, $zero
.L8006D61C:
/* 5DE1C 8006D61C 0800E003 */  jr         $ra
/* 5DE20 8006D620 0800BD27 */   addiu     $sp, $sp, 0x8
.size GetObliqueDirection, . - GetObliqueDirection
