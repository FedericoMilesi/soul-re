.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_GetInstanceAdditionalCollideFunc
/* 2E8E4 8003E0E4 1C00828C */  lw         $v0, 0x1C($a0)
/* 2E8E8 8003E0E8 00000000 */  nop
/* 2E8EC 8003E0EC 04004584 */  lh         $a1, 0x4($v0)
/* 2E8F0 8003E0F0 00000000 */  nop
/* 2E8F4 8003E0F4 0900A004 */  bltz       $a1, .L8003E11C
/* 2E8F8 8003E0F8 0D80023C */   lui       $v0, %hi(objectFunc)
/* 2E8FC 8003E0FC 1CA34224 */  addiu      $v0, $v0, %lo(objectFunc)
/* 2E900 8003E100 C0180500 */  sll        $v1, $a1, 3
/* 2E904 8003E104 21186500 */  addu       $v1, $v1, $a1
/* 2E908 8003E108 80180300 */  sll        $v1, $v1, 2
/* 2E90C 8003E10C 21186200 */  addu       $v1, $v1, $v0
/* 2E910 8003E110 1800628C */  lw         $v0, 0x18($v1)
/* 2E914 8003E114 0800E003 */  jr         $ra
/* 2E918 8003E118 100182AC */   sw        $v0, 0x110($a0)
.L8003E11C:
/* 2E91C 8003E11C 0800E003 */  jr         $ra
/* 2E920 8003E120 100180AC */   sw        $zero, 0x110($a0)
.size OBTABLE_GetInstanceAdditionalCollideFunc, . - OBTABLE_GetInstanceAdditionalCollideFunc
