.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_AddSection
/* 83438 80092C38 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 8343C 80092C3C 1400B1AF */  sw         $s1, 0x14($sp)
/* 83440 80092C40 21888000 */  addu       $s1, $a0, $zero
/* 83444 80092C44 1800B2AF */  sw         $s2, 0x18($sp)
/* 83448 80092C48 2190A000 */  addu       $s2, $a1, $zero
/* 8344C 80092C4C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 83450 80092C50 2198C000 */  addu       $s3, $a2, $zero
/* 83454 80092C54 21280000 */  addu       $a1, $zero, $zero
/* 83458 80092C58 2000BFAF */  sw         $ra, 0x20($sp)
/* 8345C 80092C5C 1000B0AF */  sw         $s0, 0x10($sp)
/* 83460 80092C60 00002292 */  lbu        $v0, 0x0($s1)
/* 83464 80092C64 30000624 */  addiu      $a2, $zero, 0x30
/* 83468 80092C68 40800200 */  sll        $s0, $v0, 1
/* 8346C 80092C6C 21800202 */  addu       $s0, $s0, $v0
/* 83470 80092C70 00811000 */  sll        $s0, $s0, 4
/* 83474 80092C74 24001026 */  addiu      $s0, $s0, 0x24
/* 83478 80092C78 21803002 */  addu       $s0, $s1, $s0
/* 8347C 80092C7C 2EF2020C */  jal        memset
/* 83480 80092C80 21200002 */   addu      $a0, $s0, $zero
/* 83484 80092C84 00002392 */  lbu        $v1, 0x0($s1)
/* 83488 80092C88 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 8348C 80092C8C 060002A6 */  sh         $v0, 0x6($s0)
/* 83490 80092C90 00100224 */  addiu      $v0, $zero, 0x1000
/* 83494 80092C94 020012A2 */  sb         $s2, 0x2($s0)
/* 83498 80092C98 030013A2 */  sb         $s3, 0x3($s0)
/* 8349C 80092C9C 0C0000AE */  sw         $zero, 0xC($s0)
/* 834A0 80092CA0 100002AE */  sw         $v0, 0x10($s0)
/* 834A4 80092CA4 010003A2 */  sb         $v1, 0x1($s0)
/* 834A8 80092CA8 00002392 */  lbu        $v1, 0x0($s1)
/* 834AC 80092CAC 21100002 */  addu       $v0, $s0, $zero
/* 834B0 80092CB0 01006324 */  addiu      $v1, $v1, 0x1
/* 834B4 80092CB4 000023A2 */  sb         $v1, 0x0($s1)
/* 834B8 80092CB8 2000BF8F */  lw         $ra, 0x20($sp)
/* 834BC 80092CBC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 834C0 80092CC0 1800B28F */  lw         $s2, 0x18($sp)
/* 834C4 80092CC4 1400B18F */  lw         $s1, 0x14($sp)
/* 834C8 80092CC8 1000B08F */  lw         $s0, 0x10($sp)
/* 834CC 80092CCC 0800E003 */  jr         $ra
/* 834D0 80092CD0 2800BD27 */   addiu     $sp, $sp, 0x28
.size G2Anim_AddSection, . - G2Anim_AddSection
