.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razLaunchForce
/* 963F4 800A5BF4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 963F8 800A5BF8 2800B0AF */  sw         $s0, 0x28($sp)
/* 963FC 800A5BFC 21808000 */  addu       $s0, $a0, $zero
/* 96400 800A5C00 39FA8693 */  lbu        $a2, %gp_rel(Raziel + 0x409)($gp)
/* 96404 800A5C04 31000524 */  addiu      $a1, $zero, 0x31
/* 96408 800A5C08 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 9640C 800A5C0C 77AA010C */  jal        PHYSOB_BirthProjectile
/* 96410 800A5C10 0100C630 */   andi      $a2, $a2, 0x1
/* 96414 800A5C14 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* 96418 800A5C18 E8FB838F */  lw         $v1, %gp_rel(PlayerData)($gp)
/* 9641C 800A5C1C 04004234 */  ori        $v0, $v0, 0x4
/* 96420 800A5C20 4CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* 96424 800A5C24 38006784 */  lh         $a3, 0x38($v1)
/* 96428 800A5C28 3A006284 */  lh         $v0, 0x3A($v1)
/* 9642C 800A5C2C 21200002 */  addu       $a0, $s0, $zero
/* 96430 800A5C30 1000A2AF */  sw         $v0, 0x10($sp)
/* 96434 800A5C34 3C006284 */  lh         $v0, 0x3C($v1)
/* 96438 800A5C38 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* 9643C 800A5C3C 1400A2AF */  sw         $v0, 0x14($sp)
/* 96440 800A5C40 3E006284 */  lh         $v0, 0x3E($v1)
/* 96444 800A5C44 0C000624 */  addiu      $a2, $zero, 0xC
/* 96448 800A5C48 1800A2AF */  sw         $v0, 0x18($sp)
/* 9644C 800A5C4C 4000638C */  lw         $v1, 0x40($v1)
/* 96450 800A5C50 10270224 */  addiu      $v0, $zero, 0x2710
/* 96454 800A5C54 2000A2AF */  sw         $v0, 0x20($sp)
/* 96458 800A5C58 00110300 */  sll        $v0, $v1, 4
/* 9645C 800A5C5C 23104300 */  subu       $v0, $v0, $v1
/* 96460 800A5C60 40100200 */  sll        $v0, $v0, 1
/* 96464 800A5C64 509F020C */  jal        razSetupSoundRamp
/* 96468 800A5C68 1C00A2AF */   sw        $v0, 0x1C($sp)
/* 9646C 800A5C6C 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 96470 800A5C70 2800B08F */  lw         $s0, 0x28($sp)
/* 96474 800A5C74 C4FB80AF */  sw         $zero, %gp_rel(Raziel + 0x594)($gp)
/* 96478 800A5C78 C8FB80AF */  sw         $zero, %gp_rel(Raziel + 0x598)($gp)
/* 9647C 800A5C7C 0800E003 */  jr         $ra
/* 96480 800A5C80 3000BD27 */   addiu     $sp, $sp, 0x30
.size razLaunchForce, . - razLaunchForce
