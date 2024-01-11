.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_GetSavedEvent
/* A6070 800B5870 E0FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A6074 800B5874 E4FD868F */  lw         $a2, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6078 800B5878 00000000 */  nop
/* A607C 800B587C 2B106600 */  sltu       $v0, $v1, $a2
/* A6080 800B5880 23004010 */  beqz       $v0, .L800B5910
/* A6084 800B5884 02000824 */   addiu     $t0, $zero, 0x2
/* A6088 800B5888 09000724 */  addiu      $a3, $zero, 0x9
.L800B588C:
/* A608C 800B588C 00006290 */  lbu        $v0, 0x0($v1)
/* A6090 800B5890 00000000 */  nop
/* A6094 800B5894 0A004814 */  bne        $v0, $t0, .L800B58C0
/* A6098 800B5898 00000000 */   nop
/* A609C 800B589C 02006284 */  lh         $v0, 0x2($v1)
/* A60A0 800B58A0 00000000 */  nop
/* A60A4 800B58A4 05004414 */  bne        $v0, $a0, .L800B58BC
/* A60A8 800B58A8 00000000 */   nop
/* A60AC 800B58AC 04006284 */  lh         $v0, 0x4($v1)
/* A60B0 800B58B0 00000000 */  nop
/* A60B4 800B58B4 0D004510 */  beq        $v0, $a1, .L800B58EC
/* A60B8 800B58B8 00000000 */   nop
.L800B58BC:
/* A60BC 800B58BC 00006290 */  lbu        $v0, 0x0($v1)
.L800B58C0:
/* A60C0 800B58C0 00000000 */  nop
/* A60C4 800B58C4 0B004714 */  bne        $v0, $a3, .L800B58F4
/* A60C8 800B58C8 00000000 */   nop
/* A60CC 800B58CC 02006284 */  lh         $v0, 0x2($v1)
/* A60D0 800B58D0 00000000 */  nop
/* A60D4 800B58D4 07004414 */  bne        $v0, $a0, .L800B58F4
/* A60D8 800B58D8 00000000 */   nop
/* A60DC 800B58DC 04006290 */  lbu        $v0, 0x4($v1)
/* A60E0 800B58E0 00000000 */  nop
/* A60E4 800B58E4 03004514 */  bne        $v0, $a1, .L800B58F4
/* A60E8 800B58E8 00000000 */   nop
.L800B58EC:
/* A60EC 800B58EC 0800E003 */  jr         $ra
/* A60F0 800B58F0 21106000 */   addu      $v0, $v1, $zero
.L800B58F4:
/* A60F4 800B58F4 01006290 */  lbu        $v0, 0x1($v1)
/* A60F8 800B58F8 00000000 */  nop
/* A60FC 800B58FC 80100200 */  sll        $v0, $v0, 2
/* A6100 800B5900 21186200 */  addu       $v1, $v1, $v0
/* A6104 800B5904 2B106600 */  sltu       $v0, $v1, $a2
/* A6108 800B5908 E0FF4014 */  bnez       $v0, .L800B588C
/* A610C 800B590C 00000000 */   nop
.L800B5910:
/* A6110 800B5910 0800E003 */  jr         $ra
/* A6114 800B5914 21100000 */   addu      $v0, $zero, $zero
.size SAVE_GetSavedEvent, . - SAVE_GetSavedEvent
