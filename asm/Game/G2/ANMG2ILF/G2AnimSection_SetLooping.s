.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_SetLooping
/* 80954 80090154 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 80958 80090158 1000B0AF */  sw         $s0, 0x10($sp)
/* 8095C 8009015C 21808000 */  addu       $s0, $a0, $zero
/* 80960 80090160 1400BFAF */  sw         $ra, 0x14($sp)
/* 80964 80090164 EB3F020C */  jal        G2AnimSection_ClearAlarm
/* 80968 80090168 03000524 */   addiu     $a1, $zero, 0x3
/* 8096C 8009016C 6540020C */  jal        G2AnimSection_SetLoopRangeAll
/* 80970 80090170 21200002 */   addu      $a0, $s0, $zero
/* 80974 80090174 00000292 */  lbu        $v0, 0x0($s0)
/* 80978 80090178 00000000 */  nop
/* 8097C 8009017C 02004234 */  ori        $v0, $v0, 0x2
/* 80980 80090180 000002A2 */  sb         $v0, 0x0($s0)
/* 80984 80090184 1400BF8F */  lw         $ra, 0x14($sp)
/* 80988 80090188 1000B08F */  lw         $s0, 0x10($sp)
/* 8098C 8009018C 0800E003 */  jr         $ra
/* 80990 80090190 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2AnimSection_SetLooping, . - G2AnimSection_SetLooping
