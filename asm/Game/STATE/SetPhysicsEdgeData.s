.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPhysicsEdgeData
/* 619B8 800711B8 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 619BC 800711BC 1000B0AF */  sw         $s0, 0x10($sp)
/* 619C0 800711C0 4800B08F */  lw         $s0, 0x48($sp)
/* 619C4 800711C4 1400B1AF */  sw         $s1, 0x14($sp)
/* 619C8 800711C8 4C00B18F */  lw         $s1, 0x4C($sp)
/* 619CC 800711CC 1800B2AF */  sw         $s2, 0x18($sp)
/* 619D0 800711D0 5000B28F */  lw         $s2, 0x50($sp)
/* 619D4 800711D4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 619D8 800711D8 5400B38F */  lw         $s3, 0x54($sp)
/* 619DC 800711DC 2400B5AF */  sw         $s5, 0x24($sp)
/* 619E0 800711E0 21A88000 */  addu       $s5, $a0, $zero
/* 619E4 800711E4 2800B6AF */  sw         $s6, 0x28($sp)
/* 619E8 800711E8 21B0A000 */  addu       $s6, $a1, $zero
/* 619EC 800711EC 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 619F0 800711F0 21B8C000 */  addu       $s7, $a2, $zero
/* 619F4 800711F4 3000BEAF */  sw         $fp, 0x30($sp)
/* 619F8 800711F8 21F0E000 */  addu       $fp, $a3, $zero
/* 619FC 800711FC 2000B4AF */  sw         $s4, 0x20($sp)
/* 61A00 80071200 5800B48F */  lw         $s4, 0x58($sp)
/* 61A04 80071204 3400BFAF */  sw         $ra, 0x34($sp)
/* 61A08 80071208 6DC3010C */  jal        CIRC_Alloc
/* 61A0C 8007120C 24000424 */   addiu     $a0, $zero, 0x24
/* 61A10 80071210 000055A4 */  sh         $s5, 0x0($v0)
/* 61A14 80071214 020056A4 */  sh         $s6, 0x2($v0)
/* 61A18 80071218 040057A4 */  sh         $s7, 0x4($v0)
/* 61A1C 8007121C 06005EA4 */  sh         $fp, 0x6($v0)
/* 61A20 80071220 080050A4 */  sh         $s0, 0x8($v0)
/* 61A24 80071224 0A0051A4 */  sh         $s1, 0xA($v0)
/* 61A28 80071228 0C0052AC */  sw         $s2, 0xC($v0)
/* 61A2C 8007122C 100053AC */  sw         $s3, 0x10($v0)
/* 61A30 80071230 140054AC */  sw         $s4, 0x14($v0)
/* 61A34 80071234 3400BF8F */  lw         $ra, 0x34($sp)
/* 61A38 80071238 3000BE8F */  lw         $fp, 0x30($sp)
/* 61A3C 8007123C 2C00B78F */  lw         $s7, 0x2C($sp)
/* 61A40 80071240 2800B68F */  lw         $s6, 0x28($sp)
/* 61A44 80071244 2400B58F */  lw         $s5, 0x24($sp)
/* 61A48 80071248 2000B48F */  lw         $s4, 0x20($sp)
/* 61A4C 8007124C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 61A50 80071250 1800B28F */  lw         $s2, 0x18($sp)
/* 61A54 80071254 1400B18F */  lw         $s1, 0x14($sp)
/* 61A58 80071258 1000B08F */  lw         $s0, 0x10($sp)
/* 61A5C 8007125C 0800E003 */  jr         $ra
/* 61A60 80071260 3800BD27 */   addiu     $sp, $sp, 0x38
.size SetPhysicsEdgeData, . - SetPhysicsEdgeData
