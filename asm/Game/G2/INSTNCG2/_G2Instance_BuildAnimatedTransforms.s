.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Instance_BuildAnimatedTransforms
/* 85DAC 800955AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 85DB0 800955B0 1000B0AF */  sw         $s0, 0x10($sp)
/* 85DB4 800955B4 21808000 */  addu       $s0, $a0, $zero
/* 85DB8 800955B8 1400BFAF */  sw         $ra, 0x14($sp)
/* 85DBC 800955BC 1800038E */  lw         $v1, 0x18($s0)
/* 85DC0 800955C0 0010023C */  lui        $v0, (0x10000000 >> 16)
/* 85DC4 800955C4 24106200 */  and        $v0, $v1, $v0
/* 85DC8 800955C8 10004010 */  beqz       $v0, .L8009560C
/* 85DCC 800955CC 0004023C */   lui       $v0, (0x4000000 >> 16)
/* 85DD0 800955D0 24106200 */  and        $v0, $v1, $v0
/* 85DD4 800955D4 09004014 */  bnez       $v0, .L800955FC
/* 85DD8 800955D8 0020023C */   lui       $v0, (0x20000000 >> 16)
/* 85DDC 800955DC 24106200 */  and        $v0, $v1, $v0
/* 85DE0 800955E0 0A004010 */  beqz       $v0, .L8009560C
/* 85DE4 800955E4 00000000 */   nop
/* 85DE8 800955E8 1400028E */  lw         $v0, 0x14($s0)
/* 85DEC 800955EC 00000000 */  nop
/* 85DF0 800955F0 00084230 */  andi       $v0, $v0, 0x800
/* 85DF4 800955F4 05004010 */  beqz       $v0, .L8009560C
/* 85DF8 800955F8 00000000 */   nop
.L800955FC:
/* 85DFC 800955FC 5655020C */  jal        G2Instance_ClearMatrices
/* 85E00 80095600 21200002 */   addu      $a0, $s0, $zero
/* 85E04 80095604 96550208 */  j          .L80095658
/* 85E08 80095608 00000000 */   nop
.L8009560C:
/* 85E0C 8009560C 1C00038E */  lw         $v1, 0x1C($s0)
/* 85E10 80095610 26010286 */  lh         $v0, 0x126($s0)
/* 85E14 80095614 0C00638C */  lw         $v1, 0xC($v1)
/* 85E18 80095618 80100200 */  sll        $v0, $v0, 2
/* 85E1C 8009561C 21104300 */  addu       $v0, $v0, $v1
/* 85E20 80095620 0000428C */  lw         $v0, 0x0($v0)
/* 85E24 80095624 00000000 */  nop
/* 85E28 80095628 1800448C */  lw         $a0, 0x18($v0)
/* 85E2C 8009562C 81C4000C */  jal        GAMELOOP_GetMatrices
/* 85E30 80095630 01008424 */   addiu     $a0, $a0, 0x1
/* 85E34 80095634 03004014 */  bnez       $v0, .L80095644
/* 85E38 80095638 21200002 */   addu      $a0, $s0, $zero
/* 85E3C 8009563C 96550208 */  j          .L80095658
/* 85E40 80095640 400000AE */   sw        $zero, 0x40($s0)
.L80095644:
/* 85E44 80095644 4000838C */  lw         $v1, 0x40($a0)
/* 85E48 80095648 20004224 */  addiu      $v0, $v0, 0x20
/* 85E4C 8009564C 400082AC */  sw         $v0, 0x40($a0)
/* 85E50 80095650 4954020C */  jal        _G2Instance_RebuildAnimatedTransforms
/* 85E54 80095654 440083AC */   sw        $v1, 0x44($a0)
.L80095658:
/* 85E58 80095658 1400BF8F */  lw         $ra, 0x14($sp)
/* 85E5C 8009565C 1000B08F */  lw         $s0, 0x10($sp)
/* 85E60 80095660 0800E003 */  jr         $ra
/* 85E64 80095664 1800BD27 */   addiu     $sp, $sp, 0x18
.size _G2Instance_BuildAnimatedTransforms, . - _G2Instance_BuildAnimatedTransforms
