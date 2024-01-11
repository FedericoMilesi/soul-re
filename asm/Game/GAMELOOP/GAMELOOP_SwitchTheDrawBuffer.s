.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_SwitchTheDrawBuffer
/* 1FE00 8002F600 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1FE04 8002F604 1000BFAF */  sw         $ra, 0x10($sp)
/* 1FE08 8002F608 56BD000C */  jal        GAMELOOP_AddClearPrim
/* 1FE0C 8002F60C 21280000 */   addu      $a1, $zero, $zero
/* 1FE10 8002F610 0FE9020C */  jal        DrawSync
/* 1FE14 8002F614 21200000 */   addu      $a0, $zero, $zero
/* 1FE18 8002F618 E4BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x11C)($gp)
/* 1FE1C 8002F61C 00000000 */  nop
/* 1FE20 8002F620 09004010 */  beqz       $v0, .L8002F648
/* 1FE24 8002F624 00000000 */   nop
/* 1FE28 8002F628 CCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x4)($gp)
/* 1FE2C 8002F62C E4BE80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x11C)($gp)
/* 1FE30 8002F630 80180200 */  sll        $v1, $v0, 2
/* 1FE34 8002F634 21186200 */  addu       $v1, $v1, $v0
/* 1FE38 8002F638 ECBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x124)($gp)
/* 1FE3C 8002F63C 80180300 */  sll        $v1, $v1, 2
/* 1FE40 8002F640 21104300 */  addu       $v0, $v0, $v1
/* 1FE44 8002F644 E0BE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x118)($gp)
.L8002F648:
/* 1FE48 8002F648 F8BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x30)($gp)
/* 1FE4C 8002F64C 00000000 */  nop
/* 1FE50 8002F650 40200200 */  sll        $a0, $v0, 1
/* 1FE54 8002F654 21208200 */  addu       $a0, $a0, $v0
/* 1FE58 8002F658 C0200400 */  sll        $a0, $a0, 3
/* 1FE5C 8002F65C 23208200 */  subu       $a0, $a0, $v0
/* 1FE60 8002F660 80200400 */  sll        $a0, $a0, 2
/* 1FE64 8002F664 88BC8227 */  addiu      $v0, $gp, %gp_rel(draw)
/* 1FE68 8002F668 38EA020C */  jal        PutDrawEnv
/* 1FE6C 8002F66C 21208200 */   addu      $a0, $a0, $v0
/* 1FE70 8002F670 1000BF8F */  lw         $ra, 0x10($sp)
/* 1FE74 8002F674 00000000 */  nop
/* 1FE78 8002F678 0800E003 */  jr         $ra
/* 1FE7C 8002F67C 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_SwitchTheDrawBuffer, . - GAMELOOP_SwitchTheDrawBuffer
