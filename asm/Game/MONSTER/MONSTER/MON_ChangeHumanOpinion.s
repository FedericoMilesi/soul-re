.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ChangeHumanOpinion
/* 77DA0 800875A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 77DA4 800875A4 01000524 */  addiu      $a1, $zero, 0x1
/* 77DA8 800875A8 1400BFAF */  sw         $ra, 0x14($sp)
/* 77DAC 800875AC 92D1000C */  jal        INSTANCE_Query
/* 77DB0 800875B0 1000B0AF */   sw        $s0, 0x10($sp)
/* 77DB4 800875B4 00C04230 */  andi       $v0, $v0, 0xC000
/* 77DB8 800875B8 1F004010 */  beqz       $v0, .L80087638
/* 77DBC 800875BC 00000000 */   nop
/* 77DC0 800875C0 40A8828F */  lw         $v0, %gp_rel(GlobalSave)($gp)
/* 77DC4 800875C4 00000000 */  nop
/* 77DC8 800875C8 0C005084 */  lh         $s0, 0xC($v0)
/* 77DCC 800875CC 00000000 */  nop
/* 77DD0 800875D0 D8FF022A */  slti       $v0, $s0, -0x28
/* 77DD4 800875D4 02004014 */  bnez       $v0, .L800875E0
/* 77DD8 800875D8 FBFF1026 */   addiu     $s0, $s0, -0x5
/* 77DDC 800875DC D8FF1024 */  addiu      $s0, $zero, -0x28
.L800875E0:
/* 77DE0 800875E0 0180022A */  slti       $v0, $s0, -0x7FFF
/* 77DE4 800875E4 03004010 */  beqz       $v0, .L800875F4
/* 77DE8 800875E8 FF7F0224 */   addiu     $v0, $zero, 0x7FFF
/* 77DEC 800875EC 811D0208 */  j          .L80087604
/* 77DF0 800875F0 01801024 */   addiu     $s0, $zero, -0x7FFF
.L800875F4:
/* 77DF4 800875F4 2A105000 */  slt        $v0, $v0, $s0
/* 77DF8 800875F8 02004010 */  beqz       $v0, .L80087604
/* 77DFC 800875FC 00000000 */   nop
/* 77E00 80087600 FF7F1024 */  addiu      $s0, $zero, 0x7FFF
.L80087604:
/* 77E04 80087604 0900001E */  bgtz       $s0, .L8008762C
/* 77E08 80087608 00000000 */   nop
/* 77E0C 8008760C 40A8828F */  lw         $v0, %gp_rel(GlobalSave)($gp)
/* 77E10 80087610 00000000 */  nop
/* 77E14 80087614 0C004284 */  lh         $v0, 0xC($v0)
/* 77E18 80087618 00000000 */  nop
/* 77E1C 8008761C 03004018 */  blez       $v0, .L8008762C
/* 77E20 80087620 00000000 */   nop
/* 77E24 80087624 2EF6010C */  jal        HUMAN_GetAngry
/* 77E28 80087628 00000000 */   nop
.L8008762C:
/* 77E2C 8008762C 40A8828F */  lw         $v0, %gp_rel(GlobalSave)($gp)
/* 77E30 80087630 00000000 */  nop
/* 77E34 80087634 0C0050A4 */  sh         $s0, 0xC($v0)
.L80087638:
/* 77E38 80087638 1400BF8F */  lw         $ra, 0x14($sp)
/* 77E3C 8008763C 1000B08F */  lw         $s0, 0x10($sp)
/* 77E40 80087640 0800E003 */  jr         $ra
/* 77E44 80087644 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_ChangeHumanOpinion, . - MON_ChangeHumanOpinion
