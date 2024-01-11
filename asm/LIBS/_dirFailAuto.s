.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _dirFailAuto
/* B3BE0 800C33E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B3BE4 800C33E4 1000B0AF */  sw         $s0, 0x10($sp)
/* B3BE8 800C33E8 21808000 */  addu       $s0, $a0, $zero
/* B3BEC 800C33EC 1400BFAF */  sw         $ra, 0x14($sp)
/* B3BF0 800C33F0 4C00028E */  lw         $v0, 0x4C($s0)
/* B3BF4 800C33F4 46000392 */  lbu        $v1, 0x46($s0)
/* B3BF8 800C33F8 01004224 */  addiu      $v0, $v0, 0x1
/* B3BFC 800C33FC 1E006010 */  beqz       $v1, .L800C3478
/* B3C00 800C3400 4C0002AE */   sw        $v0, 0x4C($s0)
/* B3C04 800C3404 01000224 */  addiu      $v0, $zero, 0x1
/* B3C08 800C3408 0B006214 */  bne        $v1, $v0, .L800C3438
/* B3C0C 800C340C 00000000 */   nop
/* B3C10 800C3410 4A000392 */  lbu        $v1, 0x4A($s0)
/* B3C14 800C3414 00000000 */  nop
/* B3C18 800C3418 0B00622C */  sltiu      $v0, $v1, 0xB
/* B3C1C 800C341C 0B004014 */  bnez       $v0, .L800C344C
/* B3C20 800C3420 01006224 */   addiu     $v0, $v1, 0x1
/* B3C24 800C3424 02000224 */  addiu      $v0, $zero, 0x2
/* B3C28 800C3428 490002A2 */  sb         $v0, 0x49($s0)
/* B3C2C 800C342C FF000224 */  addiu      $v0, $zero, 0xFF
/* B3C30 800C3430 2C0D0308 */  j          .L800C34B0
/* B3C34 800C3434 460002A2 */   sb        $v0, 0x46($s0)
.L800C3438:
/* B3C38 800C3438 4A000392 */  lbu        $v1, 0x4A($s0)
/* B3C3C 800C343C 00000000 */  nop
/* B3C40 800C3440 0B00622C */  sltiu      $v0, $v1, 0xB
/* B3C44 800C3444 03004010 */  beqz       $v0, .L800C3454
/* B3C48 800C3448 01006224 */   addiu     $v0, $v1, 0x1
.L800C344C:
/* B3C4C 800C344C 2C0D0308 */  j          .L800C34B0
/* B3C50 800C3450 4A0002A2 */   sb        $v0, 0x4A($s0)
.L800C3454:
/* B3C54 800C3454 49000292 */  lbu        $v0, 0x49($s0)
/* B3C58 800C3458 00000000 */  nop
/* B3C5C 800C345C 06004010 */  beqz       $v0, .L800C3478
/* B3C60 800C3460 00000000 */   nop
/* B3C64 800C3464 0D80023C */  lui        $v0, %hi(_padFuncClrInfo)
/* B3C68 800C3468 08E9428C */  lw         $v0, %lo(_padFuncClrInfo)($v0)
/* B3C6C 800C346C 00000000 */  nop
/* B3C70 800C3470 09F84000 */  jalr       $v0
/* B3C74 800C3474 21200002 */   addu      $a0, $s0, $zero
.L800C3478:
/* B3C78 800C3478 3C00028E */  lw         $v0, 0x3C($s0)
/* B3C7C 800C347C 00000000 */  nop
/* B3C80 800C3480 00004390 */  lbu        $v1, 0x0($v0)
/* B3C84 800C3484 F3000224 */  addiu      $v0, $zero, 0xF3
/* B3C88 800C3488 09006210 */  beq        $v1, $v0, .L800C34B0
/* B3C8C 800C348C FF000324 */   addiu     $v1, $zero, 0xFF
/* B3C90 800C3490 3000028E */  lw         $v0, 0x30($s0)
/* B3C94 800C3494 00000000 */  nop
/* B3C98 800C3498 000043A0 */  sb         $v1, 0x0($v0)
/* B3C9C 800C349C 3000028E */  lw         $v0, 0x30($s0)
/* B3CA0 800C34A0 00000000 */  nop
/* B3CA4 800C34A4 010040A0 */  sb         $zero, 0x1($v0)
/* B3CA8 800C34A8 E80000A2 */  sb         $zero, 0xE8($s0)
/* B3CAC 800C34AC 350000A2 */  sb         $zero, 0x35($s0)
.L800C34B0:
/* B3CB0 800C34B0 1400BF8F */  lw         $ra, 0x14($sp)
/* B3CB4 800C34B4 1000B08F */  lw         $s0, 0x10($sp)
/* B3CB8 800C34B8 0800E003 */  jr         $ra
/* B3CBC 800C34BC 1800BD27 */   addiu     $sp, $sp, 0x18
.size _dirFailAuto, . - _dirFailAuto
