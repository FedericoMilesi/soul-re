.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_WaitForWeapon
/* 6D570 8007CD70 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6D574 8007CD74 1000B0AF */  sw         $s0, 0x10($sp)
/* 6D578 8007CD78 1400BFAF */  sw         $ra, 0x14($sp)
/* 6D57C 8007CD7C 4E34020C */  jal        MONTABLE_GetInitFunc
/* 6D580 8007CD80 21808000 */   addu      $s0, $a0, $zero
/* 6D584 8007CD84 09F84000 */  jalr       $v0
/* 6D588 8007CD88 21200002 */   addu      $a0, $s0, $zero
/* 6D58C 8007CD8C 4C01028E */  lw         $v0, 0x14C($s0)
/* 6D590 8007CD90 00000000 */  nop
/* 6D594 8007CD94 0E004010 */  beqz       $v0, .L8007CDD0
/* 6D598 8007CD98 FFDF053C */   lui       $a1, (0xDFFFFFFF >> 16)
/* 6D59C 8007CD9C FFFFA534 */  ori        $a1, $a1, (0xDFFFFFFF & 0xFFFF)
/* 6D5A0 8007CDA0 0880023C */  lui        $v0, %hi(MonsterProcess)
/* 6D5A4 8007CDA4 B0DC4224 */  addiu      $v0, $v0, %lo(MonsterProcess)
/* 6D5A8 8007CDA8 FFF70424 */  addiu      $a0, $zero, -0x801
/* 6D5AC 8007CDAC 080102AE */  sw         $v0, 0x108($s0)
/* 6D5B0 8007CDB0 1400028E */  lw         $v0, 0x14($s0)
/* 6D5B4 8007CDB4 1800038E */  lw         $v1, 0x18($s0)
/* 6D5B8 8007CDB8 24104400 */  and        $v0, $v0, $a0
/* 6D5BC 8007CDBC 24186500 */  and        $v1, $v1, $a1
/* 6D5C0 8007CDC0 140002AE */  sw         $v0, 0x14($s0)
/* 6D5C4 8007CDC4 7FFF0224 */  addiu      $v0, $zero, -0x81
/* 6D5C8 8007CDC8 24186200 */  and        $v1, $v1, $v0
/* 6D5CC 8007CDCC 180003AE */  sw         $v1, 0x18($s0)
.L8007CDD0:
/* 6D5D0 8007CDD0 1400BF8F */  lw         $ra, 0x14($sp)
/* 6D5D4 8007CDD4 1000B08F */  lw         $s0, 0x10($sp)
/* 6D5D8 8007CDD8 0800E003 */  jr         $ra
/* 6D5DC 8007CDDC 1800BD27 */   addiu     $sp, $sp, 0x18
.size HUMAN_WaitForWeapon, . - HUMAN_WaitForWeapon
