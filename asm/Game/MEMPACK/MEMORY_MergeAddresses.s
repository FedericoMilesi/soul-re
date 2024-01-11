.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMORY_MergeAddresses
/* 40BCC 800503CC 02008290 */  lbu        $v0, 0x2($a0)
/* 40BD0 800503D0 00000000 */  nop
/* 40BD4 800503D4 0D004014 */  bnez       $v0, .L8005040C
/* 40BD8 800503D8 00000000 */   nop
/* 40BDC 800503DC 0200A290 */  lbu        $v0, 0x2($a1)
/* 40BE0 800503E0 00000000 */  nop
/* 40BE4 800503E4 09004014 */  bnez       $v0, .L8005040C
/* 40BE8 800503E8 00000000 */   nop
/* 40BEC 800503EC 0400828C */  lw         $v0, 0x4($a0)
/* 40BF0 800503F0 0400A38C */  lw         $v1, 0x4($a1)
/* 40BF4 800503F4 00000000 */  nop
/* 40BF8 800503F8 21104300 */  addu       $v0, $v0, $v1
/* 40BFC 800503FC 040082AC */  sw         $v0, 0x4($a0)
/* 40C00 80050400 01000224 */  addiu      $v0, $zero, 0x1
/* 40C04 80050404 0000A0A4 */  sh         $zero, 0x0($a1)
/* 40C08 80050408 0200A2A0 */  sb         $v0, 0x2($a1)
.L8005040C:
/* 40C0C 8005040C 0800E003 */  jr         $ra
/* 40C10 80050410 00000000 */   nop
.size MEMORY_MergeAddresses, . - MEMORY_MergeAddresses
