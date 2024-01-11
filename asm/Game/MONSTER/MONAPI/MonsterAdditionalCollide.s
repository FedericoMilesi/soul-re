.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterAdditionalCollide
/* 6EDC8 8007E5C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6EDCC 8007E5CC 1000BFAF */  sw         $ra, 0x10($sp)
/* 6EDD0 8007E5D0 2400828C */  lw         $v0, 0x24($a0)
/* 6EDD4 8007E5D4 00000000 */  nop
/* 6EDD8 8007E5D8 03004010 */  beqz       $v0, .L8007E5E8
/* 6EDDC 8007E5DC 00000000 */   nop
/* 6EDE0 8007E5E0 FA04020C */  jal        MON_CheckEnvironment
/* 6EDE4 8007E5E4 00000000 */   nop
.L8007E5E8:
/* 6EDE8 8007E5E8 1000BF8F */  lw         $ra, 0x10($sp)
/* 6EDEC 8007E5EC 00000000 */  nop
/* 6EDF0 8007E5F0 0800E003 */  jr         $ra
/* 6EDF4 8007E5F4 1800BD27 */   addiu     $sp, $sp, 0x18
.size MonsterAdditionalCollide, . - MonsterAdditionalCollide
