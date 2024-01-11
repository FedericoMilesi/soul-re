.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_AveragePoint
/* 4E5B4 8005DDB4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4E5B8 8005DDB8 1800BFAF */  sw         $ra, 0x18($sp)
/* 4E5BC 8005DDBC 2118C000 */  addu       $v1, $a2, $zero
/* 4E5C0 8005DDC0 0B006004 */  bltz       $v1, .L8005DDF0
/* 4E5C4 8005DDC4 21408000 */   addu      $t0, $a0, $zero
/* 4E5C8 8005DDC8 01106228 */  slti       $v0, $v1, 0x1001
/* 4E5CC 8005DDCC 02004014 */  bnez       $v0, .L8005DDD8
/* 4E5D0 8005DDD0 00000000 */   nop
/* 4E5D4 8005DDD4 00100324 */  addiu      $v1, $zero, 0x1000
.L8005DDD8:
/* 4E5D8 8005DDD8 1000A7AF */  sw         $a3, 0x10($sp)
/* 4E5DC 8005DDDC 21200001 */  addu       $a0, $t0, $zero
/* 4E5E0 8005DDE0 00100624 */  addiu      $a2, $zero, 0x1000
/* 4E5E4 8005DDE4 2330C300 */  subu       $a2, $a2, $v1
/* 4E5E8 8005DDE8 85770108 */  j          .L8005DE14
/* 4E5EC 8005DDEC 21386000 */   addu      $a3, $v1, $zero
.L8005DDF0:
/* 4E5F0 8005DDF0 00F06228 */  slti       $v0, $v1, -0x1000
/* 4E5F4 8005DDF4 02004010 */  beqz       $v0, .L8005DE00
/* 4E5F8 8005DDF8 00000000 */   nop
/* 4E5FC 8005DDFC 00F00324 */  addiu      $v1, $zero, -0x1000
.L8005DE00:
/* 4E600 8005DE00 1000A7AF */  sw         $a3, 0x10($sp)
/* 4E604 8005DE04 2120A000 */  addu       $a0, $a1, $zero
/* 4E608 8005DE08 21280001 */  addu       $a1, $t0, $zero
/* 4E60C 8005DE0C 00106624 */  addiu      $a2, $v1, 0x1000
/* 4E610 8005DE10 23380300 */  negu       $a3, $v1
.L8005DE14:
/* 4E614 8005DE14 86F3020C */  jal        LoadAverageShort12
/* 4E618 8005DE18 00000000 */   nop
/* 4E61C 8005DE1C 1800BF8F */  lw         $ra, 0x18($sp)
/* 4E620 8005DE20 00000000 */  nop
/* 4E624 8005DE24 0800E003 */  jr         $ra
/* 4E628 8005DE28 2000BD27 */   addiu     $sp, $sp, 0x20
.size MORPH_AveragePoint, . - MORPH_AveragePoint
