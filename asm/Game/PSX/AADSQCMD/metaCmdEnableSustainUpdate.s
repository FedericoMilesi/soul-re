.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdEnableSustainUpdate
/* 46AE0 800562E0 01000324 */  addiu      $v1, $zero, 0x1
/* 46AE4 800562E4 3805A68C */  lw         $a2, 0x538($a1)
/* 46AE8 800562E8 3D05A490 */  lbu        $a0, 0x53D($a1)
/* 46AEC 800562EC 4C05C294 */  lhu        $v0, 0x54C($a2)
/* 46AF0 800562F0 04188300 */  sllv       $v1, $v1, $a0
/* 46AF4 800562F4 25104300 */  or         $v0, $v0, $v1
/* 46AF8 800562F8 0800E003 */  jr         $ra
/* 46AFC 800562FC 4C05C2A4 */   sh        $v0, 0x54C($a2)
.size metaCmdEnableSustainUpdate, . - metaCmdEnableSustainUpdate
