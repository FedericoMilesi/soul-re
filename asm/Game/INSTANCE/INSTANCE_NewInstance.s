.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_NewInstance
/* 22E60 80032660 0800838C */  lw         $v1, 0x8($a0)
/* 22E64 80032664 00000000 */  nop
/* 22E68 80032668 0400628C */  lw         $v0, 0x4($v1)
/* 22E6C 8003266C 00000000 */  nop
/* 22E70 80032670 1C004010 */  beqz       $v0, .L800326E4
/* 22E74 80032674 FFFF4224 */   addiu     $v0, $v0, -0x1
/* 22E78 80032678 040062AC */  sw         $v0, 0x4($v1)
/* 22E7C 8003267C 0800828C */  lw         $v0, 0x8($a0)
/* 22E80 80032680 00800334 */  ori        $v1, $zero, 0x8000
/* 22E84 80032684 21104300 */  addu       $v0, $v0, $v1
/* 22E88 80032688 981C458C */  lw         $a1, 0x1C98($v0)
/* 22E8C 8003268C 00000000 */  nop
/* 22E90 80032690 0800A38C */  lw         $v1, 0x8($a1)
/* 22E94 80032694 00000000 */  nop
/* 22E98 80032698 981C43AC */  sw         $v1, 0x1C98($v0)
/* 22E9C 8003269C 0400828C */  lw         $v0, 0x4($a0)
/* 22EA0 800326A0 040085AC */  sw         $a1, 0x4($a0)
/* 22EA4 800326A4 02004010 */  beqz       $v0, .L800326B0
/* 22EA8 800326A8 0800A2AC */   sw        $v0, 0x8($a1)
/* 22EAC 800326AC 0C0045AC */  sw         $a1, 0xC($v0)
.L800326B0:
/* 22EB0 800326B0 0C00A0AC */  sw         $zero, 0xC($a1)
/* 22EB4 800326B4 0800828C */  lw         $v0, 0x8($a0)
/* 22EB8 800326B8 00000000 */  nop
/* 22EBC 800326BC 0000438C */  lw         $v1, 0x0($v0)
/* 22EC0 800326C0 00000000 */  nop
/* 22EC4 800326C4 1000A3AC */  sw         $v1, 0x10($a1)
/* 22EC8 800326C8 01006324 */  addiu      $v1, $v1, 0x1
/* 22ECC 800326CC 000043AC */  sw         $v1, 0x0($v0)
/* 22ED0 800326D0 0000838C */  lw         $v1, 0x0($a0)
/* 22ED4 800326D4 2110A000 */  addu       $v0, $a1, $zero
/* 22ED8 800326D8 01006324 */  addiu      $v1, $v1, 0x1
/* 22EDC 800326DC 0800E003 */  jr         $ra
/* 22EE0 800326E0 000083AC */   sw        $v1, 0x0($a0)
.L800326E4:
/* 22EE4 800326E4 0800E003 */  jr         $ra
/* 22EE8 800326E8 21100000 */   addu      $v0, $zero, $zero
.size INSTANCE_NewInstance, . - INSTANCE_NewInstance
