.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_HasSavedLevel
/* A64B4 800B5CB4 E0FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A64B8 800B5CB8 E4FD858F */  lw         $a1, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A64BC 800B5CBC 00000000 */  nop
/* A64C0 800B5CC0 2B106500 */  sltu       $v0, $v1, $a1
/* A64C4 800B5CC4 10004010 */  beqz       $v0, .L800B5D08
/* A64C8 800B5CC8 03000624 */   addiu     $a2, $zero, 0x3
.L800B5CCC:
/* A64CC 800B5CCC 00006290 */  lbu        $v0, 0x0($v1)
/* A64D0 800B5CD0 00000000 */  nop
/* A64D4 800B5CD4 05004614 */  bne        $v0, $a2, .L800B5CEC
/* A64D8 800B5CD8 00000000 */   nop
/* A64DC 800B5CDC 02006284 */  lh         $v0, 0x2($v1)
/* A64E0 800B5CE0 00000000 */  nop
/* A64E4 800B5CE4 0A004410 */  beq        $v0, $a0, .L800B5D10
/* A64E8 800B5CE8 21106000 */   addu      $v0, $v1, $zero
.L800B5CEC:
/* A64EC 800B5CEC 01006290 */  lbu        $v0, 0x1($v1)
/* A64F0 800B5CF0 00000000 */  nop
/* A64F4 800B5CF4 80100200 */  sll        $v0, $v0, 2
/* A64F8 800B5CF8 21186200 */  addu       $v1, $v1, $v0
/* A64FC 800B5CFC 2B106500 */  sltu       $v0, $v1, $a1
/* A6500 800B5D00 F2FF4014 */  bnez       $v0, .L800B5CCC
/* A6504 800B5D04 00000000 */   nop
.L800B5D08:
/* A6508 800B5D08 0800E003 */  jr         $ra
/* A650C 800B5D0C 21100000 */   addu      $v0, $zero, $zero
.L800B5D10:
/* A6510 800B5D10 0800E003 */  jr         $ra
/* A6514 800B5D14 00000000 */   nop
.size SAVE_HasSavedLevel, . - SAVE_HasSavedLevel
