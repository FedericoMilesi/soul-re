.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSENSE_InitIRList
/* 76FF0 800867F0 FFFFC624 */  addiu      $a2, $a2, -0x1
/* 76FF4 800867F4 0600C010 */  beqz       $a2, .L80086810
/* 76FF8 800867F8 6C0185AC */   sw        $a1, 0x16C($a0)
.L800867FC:
/* 76FFC 800867FC 2400A224 */  addiu      $v0, $a1, 0x24
/* 77000 80086800 0000A2AC */  sw         $v0, 0x0($a1)
/* 77004 80086804 FFFFC624 */  addiu      $a2, $a2, -0x1
/* 77008 80086808 FCFFC014 */  bnez       $a2, .L800867FC
/* 7700C 8008680C 21284000 */   addu      $a1, $v0, $zero
.L80086810:
/* 77010 80086810 0000A0AC */  sw         $zero, 0x0($a1)
/* 77014 80086814 0800E003 */  jr         $ra
/* 77018 80086818 900080AC */   sw        $zero, 0x90($a0)
.size MONSENSE_InitIRList, . - MONSENSE_InitIRList
