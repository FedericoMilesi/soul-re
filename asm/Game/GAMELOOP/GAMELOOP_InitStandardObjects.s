.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_InitStandardObjects
/* 1E9C0 8002E1C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1E9C4 8002E1C4 1800BFAF */  sw         $ra, 0x18($sp)
/* 1E9C8 8002E1C8 1400B1AF */  sw         $s1, 0x14($sp)
/* 1E9CC 8002E1CC C7E0000C */  jal        LOAD_DumpCurrentDir
/* 1E9D0 8002E1D0 1000B0AF */   sw        $s0, 0x10($sp)
/* 1E9D4 8002E1D4 21880000 */  addu       $s1, $zero, $zero
/* 1E9D8 8002E1D8 0D80023C */  lui        $v0, %hi(charMap + 0x114)
/* 1E9DC 8002E1DC F4A15024 */  addiu      $s0, $v0, %lo(charMap + 0x114)
.L8002E1E0:
/* 1E9E0 8002E1E0 0000048E */  lw         $a0, 0x0($s0)
/* 1E9E4 8002E1E4 04001026 */  addiu      $s0, $s0, 0x4
/* 1E9E8 8002E1E8 C8BD8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX)
/* 1E9EC 8002E1EC F563010C */  jal        InsertGlobalObject
/* 1E9F0 8002E1F0 01003126 */   addiu     $s1, $s1, 0x1
/* 1E9F4 8002E1F4 0A00222E */  sltiu      $v0, $s1, 0xA
/* 1E9F8 8002E1F8 F9FF4014 */  bnez       $v0, .L8002E1E0
/* 1E9FC 8002E1FC 00000000 */   nop
/* 1EA00 8002E200 1800BF8F */  lw         $ra, 0x18($sp)
/* 1EA04 8002E204 1400B18F */  lw         $s1, 0x14($sp)
/* 1EA08 8002E208 1000B08F */  lw         $s0, 0x10($sp)
/* 1EA0C 8002E20C 0800E003 */  jr         $ra
/* 1EA10 8002E210 2000BD27 */   addiu     $sp, $sp, 0x20
.size GAMELOOP_InitStandardObjects, . - GAMELOOP_InitStandardObjects
