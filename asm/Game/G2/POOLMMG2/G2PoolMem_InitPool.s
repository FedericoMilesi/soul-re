.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2PoolMem_InitPool
/* 866DC 80095EDC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 866E0 80095EE0 1000B0AF */  sw         $s0, 0x10($sp)
/* 866E4 80095EE4 2180A000 */  addu       $s0, $a1, $zero
/* 866E8 80095EE8 1800B2AF */  sw         $s2, 0x18($sp)
/* 866EC 80095EEC 2190C000 */  addu       $s2, $a2, $zero
/* 866F0 80095EF0 18001202 */  mult       $s0, $s2
/* 866F4 80095EF4 1400B1AF */  sw         $s1, 0x14($sp)
/* 866F8 80095EF8 21888000 */  addu       $s1, $a0, $zero
/* 866FC 80095EFC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 86700 80095F00 12200000 */  mflo       $a0
/* 86704 80095F04 8140010C */  jal        MEMPACK_Malloc
/* 86708 80095F08 19000524 */   addiu     $a1, $zero, 0x19
/* 8670C 80095F0C 40201000 */  sll        $a0, $s0, 1
/* 86710 80095F10 19000524 */  addiu      $a1, $zero, 0x19
/* 86714 80095F14 8140010C */  jal        MEMPACK_Malloc
/* 86718 80095F18 0C0022AE */   sw        $v0, 0xC($s1)
/* 8671C 80095F1C 21202002 */  addu       $a0, $s1, $zero
/* 86720 80095F20 080082AC */  sw         $v0, 0x8($a0)
/* 86724 80095F24 000092A4 */  sh         $s2, 0x0($a0)
/* 86728 80095F28 D257020C */  jal        G2PoolMem_ResetPool
/* 8672C 80095F2C 040090A4 */   sh        $s0, 0x4($a0)
/* 86730 80095F30 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 86734 80095F34 1800B28F */  lw         $s2, 0x18($sp)
/* 86738 80095F38 1400B18F */  lw         $s1, 0x14($sp)
/* 8673C 80095F3C 1000B08F */  lw         $s0, 0x10($sp)
/* 86740 80095F40 0800E003 */  jr         $ra
/* 86744 80095F44 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2PoolMem_InitPool, . - G2PoolMem_InitPool
