.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_IsItActive
/* 4BD3C 8005B53C 06008294 */  lhu        $v0, 0x6($a0)
/* 4BD40 8005B540 0800898C */  lw         $t1, 0x8($a0)
/* 4BD44 8005B544 01004234 */  ori        $v0, $v0, 0x1
/* 4BD48 8005B548 060082A4 */  sh         $v0, 0x6($a0)
/* 4BD4C 8005B54C DC00228D */  lw         $v0, 0xDC($t1)
/* 4BD50 8005B550 00000000 */  nop
/* 4BD54 8005B554 29004010 */  beqz       $v0, .L8005B5FC
/* 4BD58 8005B558 00000000 */   nop
/* 4BD5C 8005B55C 0000428C */  lw         $v0, 0x0($v0)
/* 4BD60 8005B560 00000000 */  nop
/* 4BD64 8005B564 25004018 */  blez       $v0, .L8005B5FC
/* 4BD68 8005B568 21280000 */   addu      $a1, $zero, $zero
/* 4BD6C 8005B56C 01000A24 */  addiu      $t2, $zero, 0x1
/* 4BD70 8005B570 40000B3C */  lui        $t3, (0x400000 >> 16)
.L8005B574:
/* 4BD74 8005B574 DC00268D */  lw         $a2, 0xDC($t1)
/* 4BD78 8005B578 80400500 */  sll        $t0, $a1, 2
/* 4BD7C 8005B57C 2110C800 */  addu       $v0, $a2, $t0
/* 4BD80 8005B580 0400478C */  lw         $a3, 0x4($v0)
/* 4BD84 8005B584 00000000 */  nop
/* 4BD88 8005B588 0000E384 */  lh         $v1, 0x0($a3)
/* 4BD8C 8005B58C 00000000 */  nop
/* 4BD90 8005B590 15006A14 */  bne        $v1, $t2, .L8005B5E8
/* 4BD94 8005B594 00000000 */   nop
/* 4BD98 8005B598 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 4BD9C 8005B59C 00000000 */  nop
/* 4BDA0 8005B5A0 24104B00 */  and        $v0, $v0, $t3
/* 4BDA4 8005B5A4 02004010 */  beqz       $v0, .L8005B5B0
/* 4BDA8 8005B5A8 00000000 */   nop
/* 4BDAC 8005B5AC 0600E3A4 */  sh         $v1, 0x6($a3)
.L8005B5B0:
/* 4BDB0 8005B5B0 DC00228D */  lw         $v0, 0xDC($t1)
/* 4BDB4 8005B5B4 00000000 */  nop
/* 4BDB8 8005B5B8 21104800 */  addu       $v0, $v0, $t0
/* 4BDBC 8005B5BC 0400428C */  lw         $v0, 0x4($v0)
/* 4BDC0 8005B5C0 00000000 */  nop
/* 4BDC4 8005B5C4 06004284 */  lh         $v0, 0x6($v0)
/* 4BDC8 8005B5C8 00000000 */  nop
/* 4BDCC 8005B5CC 0B004314 */  bne        $v0, $v1, .L8005B5FC
/* 4BDD0 8005B5D0 00000000 */   nop
/* 4BDD4 8005B5D4 06008294 */  lhu        $v0, 0x6($a0)
/* 4BDD8 8005B5D8 00000000 */  nop
/* 4BDDC 8005B5DC 08004234 */  ori        $v0, $v0, 0x8
/* 4BDE0 8005B5E0 0800E003 */  jr         $ra
/* 4BDE4 8005B5E4 060082A4 */   sh        $v0, 0x6($a0)
.L8005B5E8:
/* 4BDE8 8005B5E8 0000C28C */  lw         $v0, 0x0($a2)
/* 4BDEC 8005B5EC 0100A524 */  addiu      $a1, $a1, 0x1
/* 4BDF0 8005B5F0 2A10A200 */  slt        $v0, $a1, $v0
/* 4BDF4 8005B5F4 DFFF4014 */  bnez       $v0, .L8005B574
/* 4BDF8 8005B5F8 00000000 */   nop
.L8005B5FC:
/* 4BDFC 8005B5FC 0800E003 */  jr         $ra
/* 4BE00 8005B600 00000000 */   nop
.size WARPGATE_IsItActive, . - WARPGATE_IsItActive
