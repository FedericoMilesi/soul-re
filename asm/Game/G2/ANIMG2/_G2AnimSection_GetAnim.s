.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2AnimSection_GetAnim
/* 854E0 80094CE0 01008390 */  lbu        $v1, 0x1($a0)
/* 854E4 80094CE4 00000000 */  nop
/* 854E8 80094CE8 40100300 */  sll        $v0, $v1, 1
/* 854EC 80094CEC 21104300 */  addu       $v0, $v0, $v1
/* 854F0 80094CF0 00110200 */  sll        $v0, $v0, 4
/* 854F4 80094CF4 24004224 */  addiu      $v0, $v0, 0x24
/* 854F8 80094CF8 0800E003 */  jr         $ra
/* 854FC 80094CFC 23108200 */   subu      $v0, $a0, $v0
.size _G2AnimSection_GetAnim, . - _G2AnimSection_GetAnim
