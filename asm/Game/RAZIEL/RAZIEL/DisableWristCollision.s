.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DisableWristCollision
/* A4298 800B3A98 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A429C 800B3A9C 1400B1AF */  sw         $s1, 0x14($sp)
/* A42A0 800B3AA0 21888000 */  addu       $s1, $a0, $zero
/* A42A4 800B3AA4 1000B0AF */  sw         $s0, 0x10($sp)
/* A42A8 800B3AA8 2180A000 */  addu       $s0, $a1, $zero
/* A42AC 800B3AAC 01000232 */  andi       $v0, $s0, 0x1
/* A42B0 800B3AB0 03004010 */  beqz       $v0, .L800B3AC0
/* A42B4 800B3AB4 1800BFAF */   sw        $ra, 0x18($sp)
/* A42B8 800B3AB8 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* A42BC 800B3ABC 1F000524 */   addiu     $a1, $zero, 0x1F
.L800B3AC0:
/* A42C0 800B3AC0 02000232 */  andi       $v0, $s0, 0x2
/* A42C4 800B3AC4 03004010 */  beqz       $v0, .L800B3AD4
/* A42C8 800B3AC8 21202002 */   addu      $a0, $s1, $zero
/* A42CC 800B3ACC 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* A42D0 800B3AD0 29000524 */   addiu     $a1, $zero, 0x29
.L800B3AD4:
/* A42D4 800B3AD4 1800BF8F */  lw         $ra, 0x18($sp)
/* A42D8 800B3AD8 1400B18F */  lw         $s1, 0x14($sp)
/* A42DC 800B3ADC 1000B08F */  lw         $s0, 0x10($sp)
/* A42E0 800B3AE0 0800E003 */  jr         $ra
/* A42E4 800B3AE4 2000BD27 */   addiu     $sp, $sp, 0x20
.size DisableWristCollision, . - DisableWristCollision
