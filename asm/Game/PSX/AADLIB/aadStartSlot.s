.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadStartSlot
/* 44FD0 800547D0 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 44FD4 800547D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 44FD8 800547D8 1400BFAF */  sw         $ra, 0x14($sp)
/* 44FDC 800547DC 1000B0AF */  sw         $s0, 0x10($sp)
/* 44FE0 800547E0 0400628C */  lw         $v0, 0x4($v1)
/* 44FE4 800547E4 00000000 */  nop
/* 44FE8 800547E8 2A108200 */  slt        $v0, $a0, $v0
/* 44FEC 800547EC 13004010 */  beqz       $v0, .L8005483C
/* 44FF0 800547F0 80100400 */   sll       $v0, $a0, 2
/* 44FF4 800547F4 21106200 */  addu       $v0, $v1, $v0
/* 44FF8 800547F8 3400508C */  lw         $s0, 0x34($v0)
/* 44FFC 800547FC 00000000 */  nop
/* 45000 80054800 40050296 */  lhu        $v0, 0x540($s0)
/* 45004 80054804 00000000 */  nop
/* 45008 80054808 01004230 */  andi       $v0, $v0, 0x1
/* 4500C 8005480C 0B004014 */  bnez       $v0, .L8005483C
/* 45010 80054810 FF000224 */   addiu     $v0, $zero, 0xFF
/* 45014 80054814 3E050392 */  lbu        $v1, 0x53E($s0)
/* 45018 80054818 00000000 */  nop
/* 4501C 8005481C 07006210 */  beq        $v1, $v0, .L8005483C
/* 45020 80054820 00000000 */   nop
/* 45024 80054824 DE50010C */  jal        aadInitSequenceSlot
/* 45028 80054828 21200002 */   addu      $a0, $s0, $zero
/* 4502C 8005482C 40050296 */  lhu        $v0, 0x540($s0)
/* 45030 80054830 00000000 */  nop
/* 45034 80054834 01004234 */  ori        $v0, $v0, 0x1
/* 45038 80054838 400502A6 */  sh         $v0, 0x540($s0)
.L8005483C:
/* 4503C 8005483C 1400BF8F */  lw         $ra, 0x14($sp)
/* 45040 80054840 1000B08F */  lw         $s0, 0x10($sp)
/* 45044 80054844 0800E003 */  jr         $ra
/* 45048 80054848 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadStartSlot, . - aadStartSlot
