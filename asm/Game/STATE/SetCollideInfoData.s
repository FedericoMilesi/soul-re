.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetCollideInfoData
/* 615F8 80070DF8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 615FC 80070DFC 1000B0AF */  sw         $s0, 0x10($sp)
/* 61600 80070E00 21808000 */  addu       $s0, $a0, $zero
/* 61604 80070E04 1400BFAF */  sw         $ra, 0x14($sp)
/* 61608 80070E08 6DC3010C */  jal        CIRC_Alloc
/* 6160C 80070E0C 30000424 */   addiu     $a0, $zero, 0x30
/* 61610 80070E10 21184000 */  addu       $v1, $v0, $zero
/* 61614 80070E14 30000426 */  addiu      $a0, $s0, 0x30
.L80070E18:
/* 61618 80070E18 0000058E */  lw         $a1, 0x0($s0)
/* 6161C 80070E1C 0400068E */  lw         $a2, 0x4($s0)
/* 61620 80070E20 0800078E */  lw         $a3, 0x8($s0)
/* 61624 80070E24 0C00088E */  lw         $t0, 0xC($s0)
/* 61628 80070E28 000065AC */  sw         $a1, 0x0($v1)
/* 6162C 80070E2C 040066AC */  sw         $a2, 0x4($v1)
/* 61630 80070E30 080067AC */  sw         $a3, 0x8($v1)
/* 61634 80070E34 0C0068AC */  sw         $t0, 0xC($v1)
/* 61638 80070E38 10001026 */  addiu      $s0, $s0, 0x10
/* 6163C 80070E3C F6FF0416 */  bne        $s0, $a0, .L80070E18
/* 61640 80070E40 10006324 */   addiu     $v1, $v1, 0x10
/* 61644 80070E44 1400BF8F */  lw         $ra, 0x14($sp)
/* 61648 80070E48 1000B08F */  lw         $s0, 0x10($sp)
/* 6164C 80070E4C 0800E003 */  jr         $ra
/* 61650 80070E50 1800BD27 */   addiu     $sp, $sp, 0x18
.size SetCollideInfoData, . - SetCollideInfoData
