.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CriticalDampAngle
/* 81F8 800179F8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 81FC 800179FC 2000B0AF */  sw         $s0, 0x20($sp)
/* 8200 80017A00 2180A000 */  addu       $s0, $a1, $zero
/* 8204 80017A04 FF0FC630 */  andi       $a2, $a2, 0xFFF
/* 8208 80017A08 2148C000 */  addu       $t1, $a2, $zero
/* 820C 80017A0C 2140C000 */  addu       $t0, $a2, $zero
/* 8210 80017A10 2400BFAF */  sw         $ra, 0x24($sp)
/* 8214 80017A14 00000296 */  lhu        $v0, 0x0($s0)
/* 8218 80017A18 3C00AA97 */  lhu        $t2, 0x3C($sp)
/* 821C 80017A1C FF0F4330 */  andi       $v1, $v0, 0xFFF
/* 8220 80017A20 21286000 */  addu       $a1, $v1, $zero
/* 8224 80017A24 23100501 */  subu       $v0, $t0, $a1
/* 8228 80017A28 00084228 */  slti       $v0, $v0, 0x800
/* 822C 80017A2C 04004014 */  bnez       $v0, .L80017A40
/* 8230 80017A30 1800A3A7 */   sh        $v1, 0x18($sp)
/* 8234 80017A34 00106224 */  addiu      $v0, $v1, 0x1000
/* 8238 80017A38 955E0008 */  j          .L80017A54
/* 823C 80017A3C 1800A2A7 */   sh        $v0, 0x18($sp)
.L80017A40:
/* 8240 80017A40 2310A800 */  subu       $v0, $a1, $t0
/* 8244 80017A44 01084228 */  slti       $v0, $v0, 0x801
/* 8248 80017A48 03004014 */  bnez       $v0, .L80017A58
/* 824C 80017A4C 1800A527 */   addiu     $a1, $sp, 0x18
/* 8250 80017A50 0010C934 */  ori        $t1, $a2, 0x1000
.L80017A54:
/* 8254 80017A54 1800A527 */  addiu      $a1, $sp, 0x18
.L80017A58:
/* 8258 80017A58 3800A28F */  lw         $v0, 0x38($sp)
/* 825C 80017A5C 21302001 */  addu       $a2, $t1, $zero
/* 8260 80017A60 1000A2AF */  sw         $v0, 0x10($sp)
/* 8264 80017A64 00140A00 */  sll        $v0, $t2, 16
/* 8268 80017A68 03140200 */  sra        $v0, $v0, 16
/* 826C 80017A6C 605C000C */  jal        CriticalDampValue
/* 8270 80017A70 1400A2AF */   sw        $v0, 0x14($sp)
/* 8274 80017A74 1800A297 */  lhu        $v0, 0x18($sp)
/* 8278 80017A78 00000000 */  nop
/* 827C 80017A7C FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 8280 80017A80 1800A2A7 */  sh         $v0, 0x18($sp)
/* 8284 80017A84 000002A6 */  sh         $v0, 0x0($s0)
/* 8288 80017A88 2400BF8F */  lw         $ra, 0x24($sp)
/* 828C 80017A8C 2000B08F */  lw         $s0, 0x20($sp)
/* 8290 80017A90 0800E003 */  jr         $ra
/* 8294 80017A94 2800BD27 */   addiu     $sp, $sp, 0x28
.size CriticalDampAngle, . - CriticalDampAngle
