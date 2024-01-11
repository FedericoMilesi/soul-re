.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnableWristCollision
/* A42E8 800B3AE8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A42EC 800B3AEC 1400B1AF */  sw         $s1, 0x14($sp)
/* A42F0 800B3AF0 21888000 */  addu       $s1, $a0, $zero
/* A42F4 800B3AF4 1000B0AF */  sw         $s0, 0x10($sp)
/* A42F8 800B3AF8 2180A000 */  addu       $s0, $a1, $zero
/* A42FC 800B3AFC 01000232 */  andi       $v0, $s0, 0x1
/* A4300 800B3B00 03004010 */  beqz       $v0, .L800B3B10
/* A4304 800B3B04 1800BFAF */   sw        $ra, 0x18($sp)
/* A4308 800B3B08 EC92000C */  jal        COLLIDE_SegmentCollisionOn
/* A430C 800B3B0C 1F000524 */   addiu     $a1, $zero, 0x1F
.L800B3B10:
/* A4310 800B3B10 02000232 */  andi       $v0, $s0, 0x2
/* A4314 800B3B14 03004010 */  beqz       $v0, .L800B3B24
/* A4318 800B3B18 21202002 */   addu      $a0, $s1, $zero
/* A431C 800B3B1C EC92000C */  jal        COLLIDE_SegmentCollisionOn
/* A4320 800B3B20 29000524 */   addiu     $a1, $zero, 0x29
.L800B3B24:
/* A4324 800B3B24 1800BF8F */  lw         $ra, 0x18($sp)
/* A4328 800B3B28 1400B18F */  lw         $s1, 0x14($sp)
/* A432C 800B3B2C 1000B08F */  lw         $s0, 0x10($sp)
/* A4330 800B3B30 0800E003 */  jr         $ra
/* A4334 800B3B34 2000BD27 */   addiu     $sp, $sp, 0x20
.size EnableWristCollision, . - EnableWristCollision
