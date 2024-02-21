.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WCBEGG_ExplodeProcess
/* 7FC78 8008F478 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7FC7C 8008F47C 1000B0AF */  sw         $s0, 0x10($sp)
/* 7FC80 8008F480 21808000 */  addu       $s0, $a0, $zero
/* 7FC84 8008F484 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7FC88 8008F488 2000BFAF */  sw         $ra, 0x20($sp)
/* 7FC8C 8008F48C 1800B2AF */  sw         $s2, 0x18($sp)
/* 7FC90 8008F490 1400B1AF */  sw         $s1, 0x14($sp)
/* 7FC94 8008F494 6C01118E */  lw         $s1, 0x16C($s0)
/* 7FC98 8008F498 9006020C */  jal        MON_GetTime
/* 7FC9C 8008F49C 2198A000 */   addu      $s3, $a1, $zero
/* 7FCA0 8008F4A0 21904000 */  addu       $s2, $v0, $zero
/* 7FCA4 8008F4A4 0980023C */  lui        $v0, %hi(WCBEGG_Collide)
/* 7FCA8 8008F4A8 0C01038E */  lw         $v1, 0x10C($s0)
/* 7FCAC 8008F4AC 3CF94224 */  addiu      $v0, $v0, %lo(WCBEGG_Collide)
/* 7FCB0 8008F4B0 09006214 */  bne        $v1, $v0, .L8008F4D8
/* 7FCB4 8008F4B4 0D80043C */   lui       $a0, %hi(D_800D1BFC)
/* 7FCB8 8008F4B8 4801038E */  lw         $v1, 0x148($s0)
/* 7FCBC 8008F4BC F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 7FCC0 8008F4C0 00000000 */  nop
/* 7FCC4 8008F4C4 04006214 */  bne        $v1, $v0, .L8008F4D8
/* 7FCC8 8008F4C8 0980023C */   lui       $v0, %hi(WCBEGG_ExplodeCollide)
/* 7FCCC 8008F4CC B8F74224 */  addiu      $v0, $v0, %lo(WCBEGG_ExplodeCollide)
/* 7FCD0 8008F4D0 0C0102AE */  sw         $v0, 0x10C($s0)
/* 7FCD4 8008F4D4 0D80043C */  lui        $a0, %hi(D_800D1BFC)
.L8008F4D8:
/* 7FCD8 8008F4D8 14F9000C */  jal        OBTABLE_FindObject
/* 7FCDC 8008F4DC FC1B8424 */   addiu     $a0, $a0, %lo(D_800D1BFC)
/* 7FCE0 8008F4E0 21184000 */  addu       $v1, $v0, $zero
/* 7FCE4 8008F4E4 29006010 */  beqz       $v1, .L8008F58C
/* 7FCE8 8008F4E8 00000000 */   nop
/* 7FCEC 8008F4EC 2800228E */  lw         $v0, 0x28($s1)
/* 7FCF0 8008F4F0 1C00638C */  lw         $v1, 0x1C($v1)
/* 7FCF4 8008F4F4 4A014224 */  addiu      $v0, $v0, 0x14A
/* 7FCF8 8008F4F8 2A104202 */  slt        $v0, $s2, $v0
/* 7FCFC 8008F4FC 0400638C */  lw         $v1, 0x4($v1)
/* 7FD00 8008F500 1E004014 */  bnez       $v0, .L8008F57C
/* 7FD04 8008F504 21200002 */   addu      $a0, $s0, $zero
/* 7FD08 8008F508 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 7FD0C 8008F50C 4801028E */  lw         $v0, 0x148($s0)
/* 7FD10 8008F510 00000000 */  nop
/* 7FD14 8008F514 10008214 */  bne        $a0, $v0, .L8008F558
/* 7FD18 8008F518 0400053C */   lui       $a1, (0x40005 >> 16)
/* 7FD1C 8008F51C 12006284 */  lh         $v0, 0x12($v1)
/* 7FD20 8008F520 0500A534 */  ori        $a1, $a1, (0x40005 & 0xFFFF)
/* 7FD24 8008F524 40310200 */  sll        $a2, $v0, 5
/* 7FD28 8008F528 A1D1000C */  jal        INSTANCE_Post
/* 7FD2C 8008F52C 2130C200 */   addu      $a2, $a2, $v0
/* 7FD30 8008F530 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 7FD34 8008F534 21200002 */   addu      $a0, $s0, $zero
/* 7FD38 8008F538 0000228E */  lw         $v0, 0x0($s1)
/* 7FD3C 8008F53C FFBF0324 */  addiu      $v1, $zero, -0x4001
/* 7FD40 8008F540 01104234 */  ori        $v0, $v0, 0x1001
/* 7FD44 8008F544 24104300 */  and        $v0, $v0, $v1
/* 7FD48 8008F548 000022AE */  sw         $v0, 0x0($s1)
/* 7FD4C 8008F54C 0980023C */  lui        $v0, %hi(WCBEGG_CommonPostProcess)
/* 7FD50 8008F550 583D0208 */  j          .L8008F560
/* 7FD54 8008F554 B4F64224 */   addiu     $v0, $v0, %lo(WCBEGG_CommonPostProcess)
.L8008F558:
/* 7FD58 8008F558 0980023C */  lui        $v0, %hi(WCBEGG_CommonPostProcess2)
/* 7FD5C 8008F55C 44F74224 */  addiu      $v0, $v0, %lo(WCBEGG_CommonPostProcess2)
.L8008F560:
/* 7FD60 8008F560 080102AE */  sw         $v0, 0x108($s0)
/* 7FD64 8008F564 21200002 */  addu       $a0, $s0, $zero
/* 7FD68 8008F568 8000053C */  lui        $a1, (0x800029 >> 16)
/* 7FD6C 8008F56C 2900A534 */  ori        $a1, $a1, (0x800029 & 0xFFFF)
/* 7FD70 8008F570 A1D1000C */  jal        INSTANCE_Post
/* 7FD74 8008F574 21300000 */   addu      $a2, $zero, $zero
/* 7FD78 8008F578 21200002 */  addu       $a0, $s0, $zero
.L8008F57C:
/* 7FD7C 8008F57C 09AE010C */  jal        ProcessPhysicalObject
/* 7FD80 8008F580 21286002 */   addu      $a1, $s3, $zero
/* 7FD84 8008F584 673D0208 */  j          .L8008F59C
/* 7FD88 8008F588 00000000 */   nop
.L8008F58C:
/* 7FD8C 8008F58C 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 7FD90 8008F590 21200002 */   addu      $a0, $s0, $zero
/* 7FD94 8008F594 85D1000C */  jal        INSTANCE_KillInstance
/* 7FD98 8008F598 21200002 */   addu      $a0, $s0, $zero
.L8008F59C:
/* 7FD9C 8008F59C 2000BF8F */  lw         $ra, 0x20($sp)
/* 7FDA0 8008F5A0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7FDA4 8008F5A4 1800B28F */  lw         $s2, 0x18($sp)
/* 7FDA8 8008F5A8 1400B18F */  lw         $s1, 0x14($sp)
/* 7FDAC 8008F5AC 1000B08F */  lw         $s0, 0x10($sp)
/* 7FDB0 8008F5B0 0800E003 */  jr         $ra
/* 7FDB4 8008F5B4 2800BD27 */   addiu     $sp, $sp, 0x28
.size WCBEGG_ExplodeProcess, . - WCBEGG_ExplodeProcess
