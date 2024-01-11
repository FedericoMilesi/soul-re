.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_AreTwoNodesConnected
/* 89F28 80099728 21388000 */  addu       $a3, $a0, $zero
/* 89F2C 8009972C 2328A600 */  subu       $a1, $a1, $a2
/* 89F30 80099730 C0100500 */  sll        $v0, $a1, 3
/* 89F34 80099734 21104500 */  addu       $v0, $v0, $a1
/* 89F38 80099738 80190200 */  sll        $v1, $v0, 6
/* 89F3C 8009973C 21104300 */  addu       $v0, $v0, $v1
/* 89F40 80099740 C0100200 */  sll        $v0, $v0, 3
/* 89F44 80099744 21104500 */  addu       $v0, $v0, $a1
/* 89F48 80099748 C01B0200 */  sll        $v1, $v0, 15
/* 89F4C 8009974C 21104300 */  addu       $v0, $v0, $v1
/* 89F50 80099750 C0100200 */  sll        $v0, $v0, 3
/* 89F54 80099754 21104500 */  addu       $v0, $v0, $a1
/* 89F58 80099758 23100200 */  negu       $v0, $v0
/* 89F5C 8009975C 83100200 */  sra        $v0, $v0, 2
/* 89F60 80099760 01000424 */  addiu      $a0, $zero, 0x1
/* 89F64 80099764 0800E38C */  lw         $v1, 0x8($a3)
/* 89F68 80099768 04204400 */  sllv       $a0, $a0, $v0
/* 89F6C 8009976C 24186400 */  and        $v1, $v1, $a0
/* 89F70 80099770 07006010 */  beqz       $v1, .L80099790
/* 89F74 80099774 21100000 */   addu      $v0, $zero, $zero
/* 89F78 80099778 0C00E38C */  lw         $v1, 0xC($a3)
/* 89F7C 8009977C 00000000 */  nop
/* 89F80 80099780 24186400 */  and        $v1, $v1, $a0
/* 89F84 80099784 02006014 */  bnez       $v1, .L80099790
/* 89F88 80099788 01000224 */   addiu     $v0, $zero, 0x1
/* 89F8C 8009978C 21100000 */  addu       $v0, $zero, $zero
.L80099790:
/* 89F90 80099790 0800E003 */  jr         $ra
/* 89F94 80099794 00000000 */   nop
.size PLANPOOL_AreTwoNodesConnected, . - PLANPOOL_AreTwoNodesConnected
