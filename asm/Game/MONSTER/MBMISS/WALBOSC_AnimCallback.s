.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WALBOSC_AnimCallback
/* 801C4 8008F9C4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 801C8 8008F9C8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 801CC 8008F9CC 2188E000 */  addu       $s1, $a3, $zero
/* 801D0 8008F9D0 1800B0AF */  sw         $s0, 0x18($sp)
/* 801D4 8008F9D4 3C00B08F */  lw         $s0, 0x3C($sp)
/* 801D8 8008F9D8 01000224 */  addiu      $v0, $zero, 0x1
/* 801DC 8008F9DC 0E00C214 */  bne        $a2, $v0, .L8008FA18
/* 801E0 8008F9E0 2000BFAF */   sw        $ra, 0x20($sp)
/* 801E4 8008F9E4 21200002 */  addu       $a0, $s0, $zero
/* 801E8 8008F9E8 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 801EC 8008F9EC 21284000 */   addu      $a1, $v0, $zero
/* 801F0 8008F9F0 1400028E */  lw         $v0, 0x14($s0)
/* 801F4 8008F9F4 00000000 */  nop
/* 801F8 8008F9F8 00084234 */  ori        $v0, $v0, 0x800
/* 801FC 8008F9FC 140002AE */  sw         $v0, 0x14($s0)
/* 80200 8008FA00 1800028E */  lw         $v0, 0x18($s0)
/* 80204 8008FA04 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 80208 8008FA08 3A0100A6 */  sh         $zero, 0x13A($s0)
/* 8020C 8008FA0C 25104300 */  or         $v0, $v0, $v1
/* 80210 8008FA10 8B3E0208 */  j          .L8008FA2C
/* 80214 8008FA14 180002AE */   sw        $v0, 0x18($s0)
.L8008FA18:
/* 80218 8008FA18 3800A28F */  lw         $v0, 0x38($sp)
/* 8021C 8008FA1C 21382002 */  addu       $a3, $s1, $zero
/* 80220 8008FA20 1400B0AF */  sw         $s0, 0x14($sp)
/* 80224 8008FA24 72D6000C */  jal        INSTANCE_DefaultAnimCallback
/* 80228 8008FA28 1000A2AF */   sw        $v0, 0x10($sp)
.L8008FA2C:
/* 8022C 8008FA2C 21102002 */  addu       $v0, $s1, $zero
/* 80230 8008FA30 2000BF8F */  lw         $ra, 0x20($sp)
/* 80234 8008FA34 1C00B18F */  lw         $s1, 0x1C($sp)
/* 80238 8008FA38 1800B08F */  lw         $s0, 0x18($sp)
/* 8023C 8008FA3C 0800E003 */  jr         $ra
/* 80240 8008FA40 2800BD27 */   addiu     $sp, $sp, 0x28
.size WALBOSC_AnimCallback, . - WALBOSC_AnimCallback
