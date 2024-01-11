.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_RestoreGlobalSavePointer
/* A6C74 800B6474 E0FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A6C78 800B6478 E4FD848F */  lw         $a0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6C7C 800B647C 40A880AF */  sw         $zero, %gp_rel(GlobalSave)($gp)
/* A6C80 800B6480 2B106400 */  sltu       $v0, $v1, $a0
/* A6C84 800B6484 06004010 */  beqz       $v0, .L800B64A0
/* A6C88 800B6488 06000524 */   addiu     $a1, $zero, 0x6
.L800B648C:
/* A6C8C 800B648C 00006290 */  lbu        $v0, 0x0($v1)
/* A6C90 800B6490 00000000 */  nop
/* A6C94 800B6494 04004514 */  bne        $v0, $a1, .L800B64A8
/* A6C98 800B6498 00000000 */   nop
/* A6C9C 800B649C 40A883AF */  sw         $v1, %gp_rel(GlobalSave)($gp)
.L800B64A0:
/* A6CA0 800B64A0 0800E003 */  jr         $ra
/* A6CA4 800B64A4 00000000 */   nop
.L800B64A8:
/* A6CA8 800B64A8 01006290 */  lbu        $v0, 0x1($v1)
/* A6CAC 800B64AC 00000000 */  nop
/* A6CB0 800B64B0 80100200 */  sll        $v0, $v0, 2
/* A6CB4 800B64B4 21186200 */  addu       $v1, $v1, $v0
/* A6CB8 800B64B8 2B106400 */  sltu       $v0, $v1, $a0
/* A6CBC 800B64BC F3FF4014 */  bnez       $v0, .L800B648C
/* A6CC0 800B64C0 00000000 */   nop
/* A6CC4 800B64C4 0800E003 */  jr         $ra
/* A6CC8 800B64C8 00000000 */   nop
.size SAVE_RestoreGlobalSavePointer, . - SAVE_RestoreGlobalSavePointer
