.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadGetMemorySize
/* 42290 80051A90 0400828C */  lw         $v0, 0x4($a0)
/* 42294 80051A94 00000000 */  nop
/* 42298 80051A98 40180200 */  sll        $v1, $v0, 1
/* 4229C 80051A9C 21186200 */  addu       $v1, $v1, $v0
/* 422A0 80051AA0 40110300 */  sll        $v0, $v1, 5
/* 422A4 80051AA4 23104300 */  subu       $v0, $v0, $v1
/* 422A8 80051AA8 00110200 */  sll        $v0, $v0, 4
/* 422AC 80051AAC 0800E003 */  jr         $ra
/* 422B0 80051AB0 881C4224 */   addiu     $v0, $v0, 0x1C88
.size aadGetMemorySize, . - aadGetMemorySize
