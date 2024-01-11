.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetCallback
/* 804DC 8008FCDC 00008290 */  lbu        $v0, 0x0($a0)
/* 804E0 8008FCE0 00000000 */  nop
/* 804E4 8008FCE4 0A004010 */  beqz       $v0, .L8008FD10
/* 804E8 8008FCE8 21180000 */   addu      $v1, $zero, $zero
/* 804EC 8008FCEC 21388000 */  addu       $a3, $a0, $zero
.L8008FCF0:
/* 804F0 8008FCF0 2400E224 */  addiu      $v0, $a3, 0x24
/* 804F4 8008FCF4 1C0045AC */  sw         $a1, 0x1C($v0)
/* 804F8 8008FCF8 200046AC */  sw         $a2, 0x20($v0)
/* 804FC 8008FCFC 00008290 */  lbu        $v0, 0x0($a0)
/* 80500 8008FD00 01006324 */  addiu      $v1, $v1, 0x1
/* 80504 8008FD04 2A106200 */  slt        $v0, $v1, $v0
/* 80508 8008FD08 F9FF4014 */  bnez       $v0, .L8008FCF0
/* 8050C 8008FD0C 3000E724 */   addiu     $a3, $a3, 0x30
.L8008FD10:
/* 80510 8008FD10 0800E003 */  jr         $ra
/* 80514 8008FD14 00000000 */   nop
.size G2Anim_SetCallback, . - G2Anim_SetCallback
