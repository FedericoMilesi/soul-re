.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_UpdateGlobalSaveTracker
/* A6EDC 800B66DC 40A8838F */  lw         $v1, %gp_rel(GlobalSave)($gp)
/* A6EE0 800B66E0 F4BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x22C)($gp)
/* A6EE4 800B66E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A6EE8 800B66E8 1000BFAF */  sw         $ra, 0x10($sp)
/* A6EEC 800B66EC 080062AC */  sw         $v0, 0x8($v1)
/* A6EF0 800B66F0 78BF8727 */  addiu      $a3, $gp, %gp_rel(gameTrackerX + 0x1B0)
/* A6EF4 800B66F4 0000E48C */  lw         $a0, 0x0($a3)
/* A6EF8 800B66F8 0400E58C */  lw         $a1, 0x4($a3)
/* A6EFC 800B66FC 0800E68C */  lw         $a2, 0x8($a3)
/* A6F00 800B6700 600064AC */  sw         $a0, 0x60($v1)
/* A6F04 800B6704 640065AC */  sw         $a1, 0x64($v1)
/* A6F08 800B6708 680066AC */  sw         $a2, 0x68($v1)
/* A6F0C 800B670C 0C00E48C */  lw         $a0, 0xC($a3)
/* A6F10 800B6710 1000E58C */  lw         $a1, 0x10($a3)
/* A6F14 800B6714 6C0064AC */  sw         $a0, 0x6C($v1)
/* A6F18 800B6718 700065AC */  sw         $a1, 0x70($v1)
/* A6F1C 800B671C 40A8838F */  lw         $v1, %gp_rel(GlobalSave)($gp)
/* A6F20 800B6720 21550224 */  addiu      $v0, $zero, 0x5521
/* A6F24 800B6724 83C5000C */  jal        GAMEPAD_DualShockEnabled
/* A6F28 800B6728 060062A4 */   sh        $v0, 0x6($v1)
/* A6F2C 800B672C 06004010 */  beqz       $v0, .L800B6748
/* A6F30 800B6730 00000000 */   nop
/* A6F34 800B6734 40A8838F */  lw         $v1, %gp_rel(GlobalSave)($gp)
/* A6F38 800B6738 00000000 */  nop
/* A6F3C 800B673C 04006294 */  lhu        $v0, 0x4($v1)
/* A6F40 800B6740 D7D90208 */  j          .L800B675C
/* A6F44 800B6744 02004234 */   ori       $v0, $v0, 0x2
.L800B6748:
/* A6F48 800B6748 40A8838F */  lw         $v1, %gp_rel(GlobalSave)($gp)
/* A6F4C 800B674C 00000000 */  nop
/* A6F50 800B6750 04006294 */  lhu        $v0, 0x4($v1)
/* A6F54 800B6754 00000000 */  nop
/* A6F58 800B6758 FDFF4230 */  andi       $v0, $v0, 0xFFFD
.L800B675C:
/* A6F5C 800B675C 040062A4 */  sh         $v0, 0x4($v1)
/* A6F60 800B6760 1000BF8F */  lw         $ra, 0x10($sp)
/* A6F64 800B6764 00000000 */  nop
/* A6F68 800B6768 0800E003 */  jr         $ra
/* A6F6C 800B676C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_UpdateGlobalSaveTracker, . - SAVE_UpdateGlobalSaveTracker
