.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSENSE_GetDistanceInDirection
/* 778A4 800870A4 002C0500 */  sll        $a1, $a1, 16
/* 778A8 800870A8 032C0500 */  sra        $a1, $a1, 16
/* 778AC 800870AC 0001A524 */  addiu      $a1, $a1, 0x100
/* 778B0 800870B0 FF0FA230 */  andi       $v0, $a1, 0xFFF
/* 778B4 800870B4 6C01838C */  lw         $v1, 0x16C($a0)
/* 778B8 800870B8 02004104 */  bgez       $v0, .L800870C4
/* 778BC 800870BC 00000000 */   nop
/* 778C0 800870C0 FF014224 */  addiu      $v0, $v0, 0x1FF
.L800870C4:
/* 778C4 800870C4 43120200 */  sra        $v0, $v0, 9
/* 778C8 800870C8 40100200 */  sll        $v0, $v0, 1
/* 778CC 800870CC 21106200 */  addu       $v0, $v1, $v0
/* 778D0 800870D0 E8004284 */  lh         $v0, 0xE8($v0)
/* 778D4 800870D4 0800E003 */  jr         $ra
/* 778D8 800870D8 00000000 */   nop
.size MONSENSE_GetDistanceInDirection, . - MONSENSE_GetDistanceInDirection
