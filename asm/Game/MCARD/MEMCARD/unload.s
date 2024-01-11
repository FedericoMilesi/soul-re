.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel unload
/* A9E7C 800B967C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A9E80 800B9680 1000B0AF */  sw         $s0, 0x10($sp)
/* A9E84 800B9684 21808000 */  addu       $s0, $a0, $zero
/* A9E88 800B9688 1400BFAF */  sw         $ra, 0x14($sp)
/* A9E8C 800B968C 0000048E */  lw         $a0, 0x0($s0)
/* A9E90 800B9690 00000000 */  nop
/* A9E94 800B9694 09008010 */  beqz       $a0, .L800B96BC
/* A9E98 800B9698 0D80023C */   lui       $v0, %hi(gameTrackerX + 0x40)
/* A9E9C 800B969C A033428C */  lw         $v0, %lo(gameTrackerX + 0x40)($v0)
/* A9EA0 800B96A0 00000000 */  nop
/* A9EA4 800B96A4 0C004224 */  addiu      $v0, $v0, 0xC
/* A9EA8 800B96A8 03008210 */  beq        $a0, $v0, .L800B96B8
/* A9EAC 800B96AC 00000000 */   nop
/* A9EB0 800B96B0 2641010C */  jal        MEMPACK_Free
/* A9EB4 800B96B4 00000000 */   nop
.L800B96B8:
/* A9EB8 800B96B8 000000AE */  sw         $zero, 0x0($s0)
.L800B96BC:
/* A9EBC 800B96BC 040000AE */  sw         $zero, 0x4($s0)
/* A9EC0 800B96C0 1400BF8F */  lw         $ra, 0x14($sp)
/* A9EC4 800B96C4 1000B08F */  lw         $s0, 0x10($sp)
/* A9EC8 800B96C8 0800E003 */  jr         $ra
/* A9ECC 800B96CC 1800BD27 */   addiu     $sp, $sp, 0x18
.size unload, . - unload
