.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_FleeEntry
/* 7EDD4 8008E5D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7EDD8 8008E5D8 0F000224 */  addiu      $v0, $zero, 0xF
/* 7EDDC 8008E5DC 1000BFAF */  sw         $ra, 0x10($sp)
/* 7EDE0 8008E5E0 8C0182AC */  sw         $v0, 0x18C($a0)
/* 7EDE4 8008E5E4 900182AC */  sw         $v0, 0x190($a0)
/* 7EDE8 8008E5E8 11000224 */  addiu      $v0, $zero, 0x11
/* 7EDEC 8008E5EC 6C29020C */  jal        MON_FleeEntry
/* 7EDF0 8008E5F0 940182AC */   sw        $v0, 0x194($a0)
/* 7EDF4 8008E5F4 1000BF8F */  lw         $ra, 0x10($sp)
/* 7EDF8 8008E5F8 00000000 */  nop
/* 7EDFC 8008E5FC 0800E003 */  jr         $ra
/* 7EE00 8008E600 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUL_FleeEntry, . - SOUL_FleeEntry
