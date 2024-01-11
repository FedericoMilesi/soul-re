.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_SegmentCollisionOn
/* 153B0 80024BB0 0001838C */  lw         $v1, 0x100($a0)
/* 153B4 80024BB4 00000000 */  nop
/* 153B8 80024BB8 19006010 */  beqz       $v1, .L80024C20
/* 153BC 80024BBC 00000000 */   nop
/* 153C0 80024BC0 26018284 */  lh         $v0, 0x126($a0)
/* 153C4 80024BC4 00000000 */  nop
/* 153C8 80024BC8 C0100200 */  sll        $v0, $v0, 3
/* 153CC 80024BCC 21106200 */  addu       $v0, $v1, $v0
/* 153D0 80024BD0 0400468C */  lw         $a2, 0x4($v0)
/* 153D4 80024BD4 0000438C */  lw         $v1, 0x0($v0)
/* 153D8 80024BD8 0C00C010 */  beqz       $a2, .L80024C0C
/* 153DC 80024BDC 00000000 */   nop
.L80024BE0:
/* 153E0 80024BE0 03006290 */  lbu        $v0, 0x3($v1)
/* 153E4 80024BE4 00000000 */  nop
/* 153E8 80024BE8 05004514 */  bne        $v0, $a1, .L80024C00
/* 153EC 80024BEC 00000000 */   nop
/* 153F0 80024BF0 00006290 */  lbu        $v0, 0x0($v1)
/* 153F4 80024BF4 00000000 */  nop
/* 153F8 80024BF8 01004234 */  ori        $v0, $v0, 0x1
/* 153FC 80024BFC 000062A0 */  sb         $v0, 0x0($v1)
.L80024C00:
/* 15400 80024C00 FFFFC624 */  addiu      $a2, $a2, -0x1
/* 15404 80024C04 F6FFC014 */  bnez       $a2, .L80024BE0
/* 15408 80024C08 08006324 */   addiu     $v1, $v1, 0x8
.L80024C0C:
/* 1540C 80024C0C FBFF033C */  lui        $v1, (0xFFFBFFFF >> 16)
/* 15410 80024C10 1800828C */  lw         $v0, 0x18($a0)
/* 15414 80024C14 FFFF6334 */  ori        $v1, $v1, (0xFFFBFFFF & 0xFFFF)
/* 15418 80024C18 24104300 */  and        $v0, $v0, $v1
/* 1541C 80024C1C 180082AC */  sw         $v0, 0x18($a0)
.L80024C20:
/* 15420 80024C20 0800E003 */  jr         $ra
/* 15424 80024C24 00000000 */   nop
.size COLLIDE_SegmentCollisionOn, . - COLLIDE_SegmentCollisionOn
