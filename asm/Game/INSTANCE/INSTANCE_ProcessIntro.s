.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_ProcessIntro
/* 234A4 80032CA4 2800838C */  lw         $v1, 0x28($a0)
/* 234A8 80032CA8 00000000 */  nop
/* 234AC 80032CAC 1A006010 */  beqz       $v1, .L80032D18
/* 234B0 80032CB0 00000000 */   nop
/* 234B4 80032CB4 1400828C */  lw         $v0, 0x14($a0)
/* 234B8 80032CB8 00000000 */  nop
/* 234BC 80032CBC 02004230 */  andi       $v0, $v0, 0x2
/* 234C0 80032CC0 15004014 */  bnez       $v0, .L80032D18
/* 234C4 80032CC4 21286000 */   addu      $a1, $v1, $zero
/* 234C8 80032CC8 0000A284 */  lh         $v0, 0x0($a1)
/* 234CC 80032CCC 0000A394 */  lhu        $v1, 0x0($a1)
/* 234D0 80032CD0 11004010 */  beqz       $v0, .L80032D18
/* 234D4 80032CD4 12000624 */   addiu     $a2, $zero, 0x12
/* 234D8 80032CD8 00140300 */  sll        $v0, $v1, 16
.L80032CDC:
/* 234DC 80032CDC 03140200 */  sra        $v0, $v0, 16
/* 234E0 80032CE0 04004614 */  bne        $v0, $a2, .L80032CF4
/* 234E4 80032CE4 00000000 */   nop
/* 234E8 80032CE8 0400A294 */  lhu        $v0, 0x4($a1)
/* 234EC 80032CEC 00000000 */  nop
/* 234F0 80032CF0 260182A4 */  sh         $v0, 0x126($a0)
.L80032CF4:
/* 234F4 80032CF4 0200A284 */  lh         $v0, 0x2($a1)
/* 234F8 80032CF8 00000000 */  nop
/* 234FC 80032CFC 80100200 */  sll        $v0, $v0, 2
/* 23500 80032D00 04004224 */  addiu      $v0, $v0, 0x4
/* 23504 80032D04 2128A200 */  addu       $a1, $a1, $v0
/* 23508 80032D08 0000A284 */  lh         $v0, 0x0($a1)
/* 2350C 80032D0C 0000A394 */  lhu        $v1, 0x0($a1)
/* 23510 80032D10 F2FF4014 */  bnez       $v0, .L80032CDC
/* 23514 80032D14 00140300 */   sll       $v0, $v1, 16
.L80032D18:
/* 23518 80032D18 0800E003 */  jr         $ra
/* 2351C 80032D1C 00000000 */   nop
.size INSTANCE_ProcessIntro, . - INSTANCE_ProcessIntro
