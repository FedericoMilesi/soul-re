.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_DumpNonResidentObjects
/* 50584 8005FD84 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 50588 8005FD88 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 5058C 8005FD8C 2000BFAF */  sw         $ra, 0x20($sp)
/* 50590 8005FD90 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 50594 8005FD94 1800B2AF */  sw         $s2, 0x18($sp)
/* 50598 8005FD98 1400B1AF */  sw         $s1, 0x14($sp)
/* 5059C 8005FD9C 1000B0AF */  sw         $s0, 0x10($sp)
/* 505A0 8005FDA0 0400508C */  lw         $s0, 0x4($v0)
/* 505A4 8005FDA4 00000000 */  nop
/* 505A8 8005FDA8 19000012 */  beqz       $s0, .L8005FE10
/* 505AC 8005FDAC 0002133C */   lui       $s3, (0x2000000 >> 16)
.L8005FDB0:
/* 505B0 8005FDB0 1C00118E */  lw         $s1, 0x1C($s0)
/* 505B4 8005FDB4 00000000 */  nop
/* 505B8 8005FDB8 0000228E */  lw         $v0, 0x0($s1)
/* 505BC 8005FDBC 0800128E */  lw         $s2, 0x8($s0)
/* 505C0 8005FDC0 24105300 */  and        $v0, $v0, $s3
/* 505C4 8005FDC4 0F004014 */  bnez       $v0, .L8005FE04
/* 505C8 8005FDC8 00000000 */   nop
/* 505CC 8005FDCC 3400048E */  lw         $a0, 0x34($s0)
/* 505D0 8005FDD0 3266010C */  jal        STREAM_GetStreamUnitWithID
/* 505D4 8005FDD4 00000000 */   nop
/* 505D8 8005FDD8 0A004014 */  bnez       $v0, .L8005FE04
/* 505DC 8005FDDC 00000000 */   nop
/* 505E0 8005FDE0 E862010C */  jal        FindObjectInTracker
/* 505E4 8005FDE4 21202002 */   addu      $a0, $s1, $zero
/* 505E8 8005FDE8 2665010C */  jal        STREAM_IsObjectInAnyUnit
/* 505EC 8005FDEC 21204000 */   addu      $a0, $v0, $zero
/* 505F0 8005FDF0 04004014 */  bnez       $v0, .L8005FE04
/* 505F4 8005FDF4 21280002 */   addu      $a1, $s0, $zero
/* 505F8 8005FDF8 FCBD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 505FC 8005FDFC 14CA000C */  jal        INSTANCE_ReallyRemoveInstance
/* 50600 8005FE00 21300000 */   addu      $a2, $zero, $zero
.L8005FE04:
/* 50604 8005FE04 21804002 */  addu       $s0, $s2, $zero
/* 50608 8005FE08 E9FF0016 */  bnez       $s0, .L8005FDB0
/* 5060C 8005FE0C 00000000 */   nop
.L8005FE10:
/* 50610 8005FE10 5665010C */  jal        STREAM_RemoveAllObjectsNotInUse
/* 50614 8005FE14 00000000 */   nop
/* 50618 8005FE18 2000BF8F */  lw         $ra, 0x20($sp)
/* 5061C 8005FE1C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 50620 8005FE20 1800B28F */  lw         $s2, 0x18($sp)
/* 50624 8005FE24 1400B18F */  lw         $s1, 0x14($sp)
/* 50628 8005FE28 1000B08F */  lw         $s0, 0x10($sp)
/* 5062C 8005FE2C 0800E003 */  jr         $ra
/* 50630 8005FE30 2800BD27 */   addiu     $sp, $sp, 0x28
.size STREAM_DumpNonResidentObjects, . - STREAM_DumpNonResidentObjects
