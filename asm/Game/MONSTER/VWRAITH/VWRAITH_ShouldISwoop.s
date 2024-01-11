.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VWRAITH_ShouldISwoop
/* 7F340 8008EB40 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7F344 8008EB44 1000BFAF */  sw         $ra, 0x10($sp)
/* 7F348 8008EB48 6C01838C */  lw         $v1, 0x16C($a0)
/* 7F34C 8008EB4C 00000000 */  nop
/* 7F350 8008EB50 0000628C */  lw         $v0, 0x0($v1)
/* 7F354 8008EB54 2400878C */  lw         $a3, 0x24($a0)
/* 7F358 8008EB58 04004230 */  andi       $v0, $v0, 0x4
/* 7F35C 8008EB5C 15004014 */  bnez       $v0, .L8008EBB4
/* 7F360 8008EB60 21100000 */   addu      $v0, $zero, $zero
/* 7F364 8008EB64 C400668C */  lw         $a2, 0xC4($v1)
/* 7F368 8008EB68 00000000 */  nop
/* 7F36C 8008EB6C 1100C010 */  beqz       $a2, .L8008EBB4
/* 7F370 8008EB70 00000000 */   nop
/* 7F374 8008EB74 0400C58C */  lw         $a1, 0x4($a2)
/* 7F378 8008EB78 60008284 */  lh         $v0, 0x60($a0)
/* 7F37C 8008EB7C 6000A384 */  lh         $v1, 0x60($a1)
/* 7F380 8008EB80 00000000 */  nop
/* 7F384 8008EB84 2A104300 */  slt        $v0, $v0, $v1
/* 7F388 8008EB88 0A004014 */  bnez       $v0, .L8008EBB4
/* 7F38C 8008EB8C 21100000 */   addu      $v0, $zero, $zero
/* 7F390 8008EB90 0400E28C */  lw         $v0, 0x4($a3)
/* 7F394 8008EB94 1400C384 */  lh         $v1, 0x14($a2)
/* 7F398 8008EB98 0C004284 */  lh         $v0, 0xC($v0)
/* 7F39C 8008EB9C 00000000 */  nop
/* 7F3A0 8008EBA0 2A104300 */  slt        $v0, $v0, $v1
/* 7F3A4 8008EBA4 03004010 */  beqz       $v0, .L8008EBB4
/* 7F3A8 8008EBA8 21100000 */   addu      $v0, $zero, $zero
/* 7F3AC 8008EBAC AC00020C */  jal        MON_ShouldIAttackInstance
/* 7F3B0 8008EBB0 00000000 */   nop
.L8008EBB4:
/* 7F3B4 8008EBB4 1000BF8F */  lw         $ra, 0x10($sp)
/* 7F3B8 8008EBB8 00000000 */  nop
/* 7F3BC 8008EBBC 0800E003 */  jr         $ra
/* 7F3C0 8008EBC0 1800BD27 */   addiu     $sp, $sp, 0x18
.size VWRAITH_ShouldISwoop, . - VWRAITH_ShouldISwoop
