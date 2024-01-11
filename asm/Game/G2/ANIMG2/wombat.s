.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel wombat
/* 84BC8 800943C8 43390500 */  sra        $a3, $a1, 5
/* 84BCC 800943CC 80100700 */  sll        $v0, $a3, 2
/* 84BD0 800943D0 21208200 */  addu       $a0, $a0, $v0
/* 84BD4 800943D4 1F00A830 */  andi       $t0, $a1, 0x1F
/* 84BD8 800943D8 20000224 */  addiu      $v0, $zero, 0x20
/* 84BDC 800943DC 23104800 */  subu       $v0, $v0, $t0
/* 84BE0 800943E0 40390700 */  sll        $a3, $a3, 5
/* 84BE4 800943E4 0000C4AC */  sw         $a0, 0x0($a2)
/* 84BE8 800943E8 0000838C */  lw         $v1, 0x0($a0)
/* 84BEC 800943EC 2328A700 */  subu       $a1, $a1, $a3
/* 84BF0 800943F0 0800C2AC */  sw         $v0, 0x8($a2)
/* 84BF4 800943F4 0618A300 */  srlv       $v1, $v1, $a1
/* 84BF8 800943F8 0800E003 */  jr         $ra
/* 84BFC 800943FC 0400C3AC */   sw        $v1, 0x4($a2)
.size wombat, . - wombat
