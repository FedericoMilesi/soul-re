.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadStopAllSlots
/* 450B8 800548B8 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 450BC 800548BC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 450C0 800548C0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 450C4 800548C4 1800B2AF */  sw         $s2, 0x18($sp)
/* 450C8 800548C8 1400B1AF */  sw         $s1, 0x14($sp)
/* 450CC 800548CC 1000B0AF */  sw         $s0, 0x10($sp)
/* 450D0 800548D0 0400628C */  lw         $v0, 0x4($v1)
/* 450D4 800548D4 00000000 */  nop
/* 450D8 800548D8 15004018 */  blez       $v0, .L80054930
/* 450DC 800548DC 21800000 */   addu      $s0, $zero, $zero
/* 450E0 800548E0 FF001224 */  addiu      $s2, $zero, 0xFF
/* 450E4 800548E4 80101000 */  sll        $v0, $s0, 2
.L800548E8:
/* 450E8 800548E8 21106200 */  addu       $v0, $v1, $v0
/* 450EC 800548EC 3400518C */  lw         $s1, 0x34($v0)
/* 450F0 800548F0 00000000 */  nop
/* 450F4 800548F4 40052296 */  lhu        $v0, 0x540($s1)
/* 450F8 800548F8 00000000 */  nop
/* 450FC 800548FC 01004230 */  andi       $v0, $v0, 0x1
/* 45100 80054900 03004010 */  beqz       $v0, .L80054910
/* 45104 80054904 00000000 */   nop
/* 45108 80054908 1352010C */  jal        aadStopSlot
/* 4510C 8005490C 21200002 */   addu      $a0, $s0, $zero
.L80054910:
/* 45110 80054910 3E0532A2 */  sb         $s2, 0x53E($s1)
/* 45114 80054914 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 45118 80054918 00000000 */  nop
/* 4511C 8005491C 0400628C */  lw         $v0, 0x4($v1)
/* 45120 80054920 01001026 */  addiu      $s0, $s0, 0x1
/* 45124 80054924 2A100202 */  slt        $v0, $s0, $v0
/* 45128 80054928 EFFF4014 */  bnez       $v0, .L800548E8
/* 4512C 8005492C 80101000 */   sll       $v0, $s0, 2
.L80054930:
/* 45130 80054930 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 45134 80054934 1800B28F */  lw         $s2, 0x18($sp)
/* 45138 80054938 1400B18F */  lw         $s1, 0x14($sp)
/* 4513C 8005493C 1000B08F */  lw         $s0, 0x10($sp)
/* 45140 80054940 0800E003 */  jr         $ra
/* 45144 80054944 2000BD27 */   addiu     $sp, $sp, 0x20
.size aadStopAllSlots, . - aadStopAllSlots
