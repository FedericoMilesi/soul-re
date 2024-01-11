.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_QueryMode
/* 6F98 80016798 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6F9C 8001679C 1000B0AF */  sw         $s0, 0x10($sp)
/* 6FA0 800167A0 21808000 */  addu       $s0, $a0, $zero
/* 6FA4 800167A4 1400BFAF */  sw         $ra, 0x14($sp)
/* 6FA8 800167A8 0801048E */  lw         $a0, 0x108($s0)
/* 6FAC 800167AC 92D1000C */  jal        INSTANCE_Query
/* 6FB0 800167B0 0A000524 */   addiu     $a1, $zero, 0xA
/* 6FB4 800167B4 0801048E */  lw         $a0, 0x108($s0)
/* 6FB8 800167B8 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6FBC 800167BC 00000000 */  nop
/* 6FC0 800167C0 0F008314 */  bne        $a0, $v1, .L80016800
/* 6FC4 800167C4 21804000 */   addu      $s0, $v0, $zero
/* 6FC8 800167C8 0002043C */  lui        $a0, (0x2000000 >> 16)
/* 6FCC 800167CC 24100402 */  and        $v0, $s0, $a0
/* 6FD0 800167D0 04004010 */  beqz       $v0, .L800167E4
/* 6FD4 800167D4 01000224 */   addiu     $v0, $zero, 0x1
/* 6FD8 800167D8 DAAB82A7 */  sh         $v0, %gp_rel(combat_cam_debounce)($gp)
/* 6FDC 800167DC 035A0008 */  j          .L8001680C
/* 6FE0 800167E0 00000000 */   nop
.L800167E4:
/* 6FE4 800167E4 DAAB8287 */  lh         $v0, %gp_rel(combat_cam_debounce)($gp)
/* 6FE8 800167E8 DAAB8397 */  lhu        $v1, %gp_rel(combat_cam_debounce)($gp)
/* 6FEC 800167EC 07004018 */  blez       $v0, .L8001680C
/* 6FF0 800167F0 FFFF6224 */   addiu     $v0, $v1, -0x1
/* 6FF4 800167F4 DAAB82A7 */  sh         $v0, %gp_rel(combat_cam_debounce)($gp)
/* 6FF8 800167F8 035A0008 */  j          .L8001680C
/* 6FFC 800167FC 25800402 */   or        $s0, $s0, $a0
.L80016800:
/* 7000 80016800 FFFD023C */  lui        $v0, (0xFDFFFFFF >> 16)
/* 7004 80016804 FFFF4234 */  ori        $v0, $v0, (0xFDFFFFFF & 0xFFFF)
/* 7008 80016808 24800202 */  and        $s0, $s0, $v0
.L8001680C:
/* 700C 8001680C 1A6D010C */  jal        WARPGATE_IsWarpgateActive
/* 7010 80016810 00000000 */   nop
/* 7014 80016814 02004010 */  beqz       $v0, .L80016820
/* 7018 80016818 0080023C */   lui       $v0, (0x80000000 >> 16)
/* 701C 8001681C 25800202 */  or         $s0, $s0, $v0
.L80016820:
/* 7020 80016820 21100002 */  addu       $v0, $s0, $zero
/* 7024 80016824 1400BF8F */  lw         $ra, 0x14($sp)
/* 7028 80016828 1000B08F */  lw         $s0, 0x10($sp)
/* 702C 8001682C 0800E003 */  jr         $ra
/* 7030 80016830 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_QueryMode, . - CAMERA_QueryMode
