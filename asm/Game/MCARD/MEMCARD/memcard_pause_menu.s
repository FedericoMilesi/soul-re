.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memcard_pause_menu
/* AA09C 800B989C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AA0A0 800B98A0 1800BFAF */  sw         $ra, 0x18($sp)
/* AA0A4 800B98A4 1400B1AF */  sw         $s1, 0x14($sp)
/* AA0A8 800B98A8 1000B0AF */  sw         $s0, 0x10($sp)
/* AA0AC 800B98AC 2400908C */  lw         $s0, 0x24($a0)
/* AA0B0 800B98B0 2188A000 */  addu       $s1, $a1, $zero
/* AA0B4 800B98B4 F7E5020C */  jal        maybe_start
/* AA0B8 800B98B8 21200002 */   addu      $a0, $s0, $zero
/* AA0BC 800B98BC 07004010 */  beqz       $v0, .L800B98DC
/* AA0C0 800B98C0 FFFF0224 */   addiu     $v0, $zero, -0x1
/* AA0C4 800B98C4 0400028E */  lw         $v0, 0x4($s0)
/* AA0C8 800B98C8 0800048E */  lw         $a0, 0x8($s0)
/* AA0CC 800B98CC 1C00428C */  lw         $v0, 0x1C($v0)
/* AA0D0 800B98D0 00000000 */  nop
/* AA0D4 800B98D4 09F84000 */  jalr       $v0
/* AA0D8 800B98D8 21282002 */   addu      $a1, $s1, $zero
.L800B98DC:
/* AA0DC 800B98DC 1800BF8F */  lw         $ra, 0x18($sp)
/* AA0E0 800B98E0 1400B18F */  lw         $s1, 0x14($sp)
/* AA0E4 800B98E4 1000B08F */  lw         $s0, 0x10($sp)
/* AA0E8 800B98E8 0800E003 */  jr         $ra
/* AA0EC 800B98EC 2000BD27 */   addiu     $sp, $sp, 0x20
.size memcard_pause_menu, . - memcard_pause_menu
