.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_CheckDirectedLineCollision
/* 5F9EC 8006F1EC A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 5F9F0 8006F1F0 5000BFAF */  sw         $ra, 0x50($sp)
/* 5F9F4 8006F1F4 4000828C */  lw         $v0, 0x40($a0)
/* 5F9F8 8006F1F8 00000000 */  nop
/* 5F9FC 8006F1FC 20004224 */  addiu      $v0, $v0, 0x20
/* 5FA00 8006F200 14004394 */  lhu        $v1, 0x14($v0)
/* 5FA04 8006F204 00000000 */  nop
/* 5FA08 8006F208 4800A3A7 */  sh         $v1, 0x48($sp)
/* 5FA0C 8006F20C 21186500 */  addu       $v1, $v1, $a1
/* 5FA10 8006F210 18004894 */  lhu        $t0, 0x18($v0)
/* 5FA14 8006F214 1000A527 */  addiu      $a1, $sp, 0x10
/* 5FA18 8006F218 4A00A8A7 */  sh         $t0, 0x4A($sp)
/* 5FA1C 8006F21C 21400601 */  addu       $t0, $t0, $a2
/* 5FA20 8006F220 1C004994 */  lhu        $t1, 0x1C($v0)
/* 5FA24 8006F224 4000A227 */  addiu      $v0, $sp, 0x40
/* 5FA28 8006F228 2400A2AF */  sw         $v0, 0x24($sp)
/* 5FA2C 8006F22C 4800A227 */  addiu      $v0, $sp, 0x48
/* 5FA30 8006F230 4000A3A7 */  sh         $v1, 0x40($sp)
/* 5FA34 8006F234 4200A8A7 */  sh         $t0, 0x42($sp)
/* 5FA38 8006F238 2800A2AF */  sw         $v0, 0x28($sp)
/* 5FA3C 8006F23C 21482701 */  addu       $t1, $t1, $a3
/* 5FA40 8006F240 4C00A9A7 */  sh         $t1, 0x4C($sp)
/* 5FA44 8006F244 59D2010C */  jal        PHYSICS_CheckLineInWorld
/* 5FA48 8006F248 4400A9A7 */   sh        $t1, 0x44($sp)
/* 5FA4C 8006F24C 1000A287 */  lh         $v0, 0x10($sp)
/* 5FA50 8006F250 5000BF8F */  lw         $ra, 0x50($sp)
/* 5FA54 8006F254 00000000 */  nop
/* 5FA58 8006F258 0800E003 */  jr         $ra
/* 5FA5C 8006F25C 5800BD27 */   addiu     $sp, $sp, 0x58
.size PHYSOB_CheckDirectedLineCollision, . - PHYSOB_CheckDirectedLineCollision
