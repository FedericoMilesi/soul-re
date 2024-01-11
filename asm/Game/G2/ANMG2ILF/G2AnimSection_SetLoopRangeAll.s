.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_SetLoopRangeAll
/* 80994 80090194 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 80998 80090198 1000B0AF */  sw         $s0, 0x10($sp)
/* 8099C 8009019C 21808000 */  addu       $s0, $a0, $zero
/* 809A0 800901A0 1400BFAF */  sw         $ra, 0x14($sp)
/* 809A4 800901A4 2400048E */  lw         $a0, 0x24($s0)
/* 809A8 800901A8 D33F020C */  jal        G2AnimKeylist_GetDuration
/* 809AC 800901AC 080000A6 */   sh        $zero, 0x8($s0)
/* 809B0 800901B0 0A0002A6 */  sh         $v0, 0xA($s0)
/* 809B4 800901B4 1400BF8F */  lw         $ra, 0x14($sp)
/* 809B8 800901B8 1000B08F */  lw         $s0, 0x10($sp)
/* 809BC 800901BC 0800E003 */  jr         $ra
/* 809C0 800901C0 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2AnimSection_SetLoopRangeAll, . - G2AnimSection_SetLoopRangeAll
