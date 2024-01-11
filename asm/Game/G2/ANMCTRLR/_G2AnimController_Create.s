.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2AnimController_Create
/* 82484 80091C84 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 82488 80091C88 1400B1AF */  sw         $s1, 0x14($sp)
/* 8248C 80091C8C 21888000 */  addu       $s1, $a0, $zero
/* 82490 80091C90 1800B2AF */  sw         $s2, 0x18($sp)
/* 82494 80091C94 2190A000 */  addu       $s2, $a1, $zero
/* 82498 80091C98 78F58427 */  addiu      $a0, $gp, %gp_rel(_controllerPool)
/* 8249C 80091C9C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 824A0 80091CA0 E157020C */  jal        G2PoolMem_Allocate
/* 824A4 80091CA4 1000B0AF */   sw        $s0, 0x10($sp)
/* 824A8 80091CA8 21804000 */  addu       $s0, $v0, $zero
/* 824AC 80091CAC 21200002 */  addu       $a0, $s0, $zero
/* 824B0 80091CB0 21280000 */  addu       $a1, $zero, $zero
/* 824B4 80091CB4 2EF2020C */  jal        func_800BC8B8
/* 824B8 80091CB8 24000624 */   addiu     $a2, $zero, 0x24
/* 824BC 80091CBC 21100002 */  addu       $v0, $s0, $zero
/* 824C0 80091CC0 15000324 */  addiu      $v1, $zero, 0x15
/* 824C4 80091CC4 000040A4 */  sh         $zero, 0x0($v0)
/* 824C8 80091CC8 030051A0 */  sb         $s1, 0x3($v0)
/* 824CC 80091CCC 020052A0 */  sb         $s2, 0x2($v0)
/* 824D0 80091CD0 080043A4 */  sh         $v1, 0x8($v0)
/* 824D4 80091CD4 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 824D8 80091CD8 1800B28F */  lw         $s2, 0x18($sp)
/* 824DC 80091CDC 1400B18F */  lw         $s1, 0x14($sp)
/* 824E0 80091CE0 1000B08F */  lw         $s0, 0x10($sp)
/* 824E4 80091CE4 0800E003 */  jr         $ra
/* 824E8 80091CE8 2000BD27 */   addiu     $sp, $sp, 0x20
.size _G2AnimController_Create, . - _G2AnimController_Create
