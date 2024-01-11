.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel _FX_DoLighting
/* 336C0 80042EC0 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 336C4 80042EC4 07008390 */  lbu        $v1, 0x7($a0)
/* 336C8 80042EC8 00000000 */  nop
/* 336CC 80042ECC 02006230 */  andi       $v0, $v1, 0x2
/* 336D0 80042ED0 1F004010 */  beqz       $v0, .L80042F50
/* 336D4 80042ED4 21300000 */   addu      $a2, $zero, $zero
/* 336D8 80042ED8 0800858C */  lw         $a1, 0x8($a0)
/* 336DC 80042EDC 08006230 */  andi       $v0, $v1, 0x8
/* 336E0 80042EE0 04004010 */  beqz       $v0, .L80042EF4
/* 336E4 80042EE4 0D80033C */   lui       $v1, %hi(gNormalList)
/* 336E8 80042EE8 0C00A28C */  lw         $v0, 0xC($a1)
/* 336EC 80042EEC CA0B0108 */  j          .L80042F28
/* 336F0 80042EF0 0000A2AF */   sw        $v0, 0x0($sp)
.L80042EF4:
/* 336F4 80042EF4 06008290 */  lbu        $v0, 0x6($a0)
/* 336F8 80042EF8 54A46324 */  addiu      $v1, $v1, %lo(gNormalList)
/* 336FC 80042EFC C0100200 */  sll        $v0, $v0, 3
/* 33700 80042F00 21104300 */  addu       $v0, $v0, $v1
/* 33704 80042F04 000040C8 */  lwc2       $0, 0x0($v0)
/* 33708 80042F08 040041C8 */  lwc2       $1, 0x4($v0)
/* 3370C 80042F0C 0C00A224 */  addiu      $v0, $a1, 0xC
/* 33710 80042F10 000046C8 */  lwc2       $6, 0x0($v0)
/* 33714 80042F14 00408648 */  mtc2       $a2, $8 # handwritten instruction
/* 33718 80042F18 00000000 */  nop
/* 3371C 80042F1C 00000000 */  nop
/* 33720 80042F20 1304E84A */  NCDS
/* 33724 80042F24 0000B6EB */  swc2       $22, 0x0($sp)
.L80042F28:
/* 33728 80042F28 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* 3372C 80042F2C 0000A28F */  lw         $v0, 0x0($sp)
/* 33730 80042F30 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 33734 80042F34 24104300 */  and        $v0, $v0, $v1
/* 33738 80042F38 0024033C */  lui        $v1, (0x24000000 >> 16)
/* 3373C 80042F3C 0000A2AF */  sw         $v0, 0x0($sp)
/* 33740 80042F40 25104300 */  or         $v0, $v0, $v1
/* 33744 80042F44 0C00A38C */  lw         $v1, 0xC($a1)
/* 33748 80042F48 F00B0108 */  j          .L80042FC0
/* 3374C 80042F4C 0003043C */   lui       $a0, (0x3000000 >> 16)
.L80042F50:
/* 33750 80042F50 08006230 */  andi       $v0, $v1, 0x8
/* 33754 80042F54 04004010 */  beqz       $v0, .L80042F68
/* 33758 80042F58 0D80033C */   lui       $v1, %hi(gNormalList)
/* 3375C 80042F5C 0800828C */  lw         $v0, 0x8($a0)
/* 33760 80042F60 E70B0108 */  j          .L80042F9C
/* 33764 80042F64 0000A2AF */   sw        $v0, 0x0($sp)
.L80042F68:
/* 33768 80042F68 06008290 */  lbu        $v0, 0x6($a0)
/* 3376C 80042F6C 54A46324 */  addiu      $v1, $v1, %lo(gNormalList)
/* 33770 80042F70 C0100200 */  sll        $v0, $v0, 3
/* 33774 80042F74 21104300 */  addu       $v0, $v0, $v1
/* 33778 80042F78 000040C8 */  lwc2       $0, 0x0($v0)
/* 3377C 80042F7C 040041C8 */  lwc2       $1, 0x4($v0)
/* 33780 80042F80 08008224 */  addiu      $v0, $a0, 0x8
/* 33784 80042F84 000046C8 */  lwc2       $6, 0x0($v0)
/* 33788 80042F88 00408648 */  mtc2       $a2, $8 # handwritten instruction
/* 3378C 80042F8C 00000000 */  nop
/* 33790 80042F90 00000000 */  nop
/* 33794 80042F94 1304E84A */  NCDS
/* 33798 80042F98 0000B6EB */  swc2       $22, 0x0($sp)
.L80042F9C:
/* 3379C 80042F9C FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* 337A0 80042FA0 0000A28F */  lw         $v0, 0x0($sp)
/* 337A4 80042FA4 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 337A8 80042FA8 24104300 */  and        $v0, $v0, $v1
/* 337AC 80042FAC 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 337B0 80042FB0 0000A2AF */  sw         $v0, 0x0($sp)
/* 337B4 80042FB4 25104300 */  or         $v0, $v0, $v1
/* 337B8 80042FB8 0800838C */  lw         $v1, 0x8($a0)
/* 337BC 80042FBC 0003043C */  lui        $a0, (0x3000000 >> 16)
.L80042FC0:
/* 337C0 80042FC0 24186400 */  and        $v1, $v1, $a0
/* 337C4 80042FC4 25104300 */  or         $v0, $v0, $v1
/* 337C8 80042FC8 0000A2AF */  sw         $v0, 0x0($sp)
/* 337CC 80042FCC 0000A28F */  lw         $v0, 0x0($sp)
/* 337D0 80042FD0 0800E003 */  jr         $ra
/* 337D4 80042FD4 0800BD27 */   addiu     $sp, $sp, 0x8
.size _FX_DoLighting, . - _FX_DoLighting
