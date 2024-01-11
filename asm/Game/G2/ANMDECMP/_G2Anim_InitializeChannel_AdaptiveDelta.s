.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_InitializeChannel_AdaptiveDelta
/* 80BF4 800903F4 0000828C */  lw         $v0, 0x0($a0)
/* 80BF8 800903F8 0400838C */  lw         $v1, 0x4($a0)
/* 80BFC 800903FC 04004294 */  lhu        $v0, 0x4($v0)
/* 80C00 80090400 00006690 */  lbu        $a2, 0x0($v1)
/* 80C04 80090404 03004224 */  addiu      $v0, $v0, 0x3
/* 80C08 80090408 83100200 */  sra        $v0, $v0, 2
/* 80C0C 8009040C 40100200 */  sll        $v0, $v0, 1
/* 80C10 80090410 0200A6A4 */  sh         $a2, 0x2($a1)
/* 80C14 80090414 02006694 */  lhu        $a2, 0x2($v1)
/* 80C18 80090418 21186200 */  addu       $v1, $v1, $v0
/* 80C1C 8009041C 04006324 */  addiu      $v1, $v1, 0x4
/* 80C20 80090420 0000A6A4 */  sh         $a2, 0x0($a1)
/* 80C24 80090424 0800E003 */  jr         $ra
/* 80C28 80090428 040083AC */   sw        $v1, 0x4($a0)
.size _G2Anim_InitializeChannel_AdaptiveDelta, . - _G2Anim_InitializeChannel_AdaptiveDelta
