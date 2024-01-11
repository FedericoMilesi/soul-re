.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TurnOffCollisionPhysOb
/* 5E7AC 8006DFAC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5E7B0 8006DFB0 1400B1AF */  sw         $s1, 0x14($sp)
/* 5E7B4 8006DFB4 21888000 */  addu       $s1, $a0, $zero
/* 5E7B8 8006DFB8 1800B2AF */  sw         $s2, 0x18($sp)
/* 5E7BC 8006DFBC 2190A000 */  addu       $s2, $a1, $zero
/* 5E7C0 8006DFC0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 5E7C4 8006DFC4 7EB7010C */  jal        PhysObGetWeapon
/* 5E7C8 8006DFC8 1000B0AF */   sw        $s0, 0x10($sp)
/* 5E7CC 8006DFCC 21804000 */  addu       $s0, $v0, $zero
/* 5E7D0 8006DFD0 12000012 */  beqz       $s0, .L8006E01C
/* 5E7D4 8006DFD4 02004232 */   andi      $v0, $s2, 0x2
/* 5E7D8 8006DFD8 05004010 */  beqz       $v0, .L8006DFF0
/* 5E7DC 8006DFDC 01004232 */   andi      $v0, $s2, 0x1
/* 5E7E0 8006DFE0 0E000582 */  lb         $a1, 0xE($s0)
/* 5E7E4 8006DFE4 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 5E7E8 8006DFE8 21202002 */   addu      $a0, $s1, $zero
/* 5E7EC 8006DFEC 01004232 */  andi       $v0, $s2, 0x1
.L8006DFF0:
/* 5E7F0 8006DFF0 05004010 */  beqz       $v0, .L8006E008
/* 5E7F4 8006DFF4 04004232 */   andi      $v0, $s2, 0x4
/* 5E7F8 8006DFF8 0F000582 */  lb         $a1, 0xF($s0)
/* 5E7FC 8006DFFC 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 5E800 8006E000 21202002 */   addu      $a0, $s1, $zero
/* 5E804 8006E004 04004232 */  andi       $v0, $s2, 0x4
.L8006E008:
/* 5E808 8006E008 04004010 */  beqz       $v0, .L8006E01C
/* 5E80C 8006E00C 00000000 */   nop
/* 5E810 8006E010 0D000582 */  lb         $a1, 0xD($s0)
/* 5E814 8006E014 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 5E818 8006E018 21202002 */   addu      $a0, $s1, $zero
.L8006E01C:
/* 5E81C 8006E01C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5E820 8006E020 1800B28F */  lw         $s2, 0x18($sp)
/* 5E824 8006E024 1400B18F */  lw         $s1, 0x14($sp)
/* 5E828 8006E028 1000B08F */  lw         $s0, 0x10($sp)
/* 5E82C 8006E02C 0800E003 */  jr         $ra
/* 5E830 8006E030 2000BD27 */   addiu     $sp, $sp, 0x20
.size TurnOffCollisionPhysOb, . - TurnOffCollisionPhysOb
