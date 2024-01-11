.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_ContinueSnow
/* 39D1C 8004951C B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 39D20 80049520 4400B1AF */  sw         $s1, 0x44($sp)
/* 39D24 80049524 21888000 */  addu       $s1, $a0, $zero
/* 39D28 80049528 D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 39D2C 8004952C E8030224 */  addiu      $v0, $zero, 0x3E8
/* 39D30 80049530 4800BFAF */  sw         $ra, 0x48($sp)
/* 39D34 80049534 07006210 */  beq        $v1, $v0, .L80049554
/* 39D38 80049538 4000B0AF */   sw        $s0, 0x40($sp)
/* 39D3C 8004953C D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 39D40 80049540 00000000 */  nop
/* 39D44 80049544 46004010 */  beqz       $v0, .L80049660
/* 39D48 80049548 00000000 */   nop
/* 39D4C 8004954C 59250108 */  j          .L80049564
/* 39D50 80049550 00000000 */   nop
.L80049554:
/* 39D54 80049554 D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 39D58 80049558 01000224 */  addiu      $v0, $zero, 0x1
/* 39D5C 8004955C 40006210 */  beq        $v1, $v0, .L80049660
/* 39D60 80049560 00000000 */   nop
.L80049564:
/* 39D64 80049564 3AF2020C */  jal        rand
/* 39D68 80049568 00000000 */   nop
/* 39D6C 8004956C 749A8387 */  lh         $v1, %gp_rel(snow_amount)($gp)
/* 39D70 80049570 FF034230 */  andi       $v0, $v0, 0x3FF
/* 39D74 80049574 2A186200 */  slt        $v1, $v1, $v0
/* 39D78 80049578 39006014 */  bnez       $v1, .L80049660
/* 39D7C 8004957C 00000000 */   nop
/* 39D80 80049580 44BA848F */  lw         $a0, %gp_rel(gFXT)($gp)
/* 39D84 80049584 C009010C */  jal        FX_GetPrim
/* 39D88 80049588 00000000 */   nop
/* 39D8C 8004958C 21804000 */  addu       $s0, $v0, $zero
/* 39D90 80049590 33000012 */  beqz       $s0, .L80049660
/* 39D94 80049594 00000000 */   nop
/* 39D98 80049598 3000A0A7 */  sh         $zero, 0x30($sp)
/* 39D9C 8004959C 3AF2020C */  jal        rand
/* 39DA0 800495A0 3200A0A7 */   sh        $zero, 0x32($sp)
/* 39DA4 800495A4 03004230 */  andi       $v0, $v0, 0x3
/* 39DA8 800495A8 F3FF0324 */  addiu      $v1, $zero, -0xD
/* 39DAC 800495AC 23186200 */  subu       $v1, $v1, $v0
/* 39DB0 800495B0 3AF2020C */  jal        rand
/* 39DB4 800495B4 3400A3A7 */   sh        $v1, 0x34($sp)
/* 39DB8 800495B8 21184000 */  addu       $v1, $v0, $zero
/* 39DBC 800495BC 03006104 */  bgez       $v1, .L800495CC
/* 39DC0 800495C0 43120200 */   sra       $v0, $v0, 9
/* 39DC4 800495C4 FF016224 */  addiu      $v0, $v1, 0x1FF
/* 39DC8 800495C8 43120200 */  sra        $v0, $v0, 9
.L800495CC:
/* 39DCC 800495CC 40120200 */  sll        $v0, $v0, 9
/* 39DD0 800495D0 23106200 */  subu       $v0, $v1, $v0
/* 39DD4 800495D4 3800A2A7 */  sh         $v0, 0x38($sp)
/* 39DD8 800495D8 05000224 */  addiu      $v0, $zero, 0x5
/* 39DDC 800495DC 3AF2020C */  jal        rand
/* 39DE0 800495E0 3A00A2A7 */   sh        $v0, 0x3A($sp)
/* 39DE4 800495E4 3800A427 */  addiu      $a0, $sp, 0x38
/* 39DE8 800495E8 2800A527 */  addiu      $a1, $sp, 0x28
/* 39DEC 800495EC FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 39DF0 800495F0 80014224 */  addiu      $v0, $v0, 0x180
/* 39DF4 800495F4 9124010C */  jal        FX_ConvertCamPersToWorld
/* 39DF8 800495F8 3C00A2A7 */   sh        $v0, 0x3C($sp)
/* 39DFC 800495FC FF00023C */  lui        $v0, (0xFFFFFF >> 16)
/* 39E00 80049600 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* 39E04 80049604 21200002 */  addu       $a0, $s0, $zero
/* 39E08 80049608 2800A527 */  addiu      $a1, $sp, 0x28
/* 39E0C 8004960C 1000A2AF */  sw         $v0, 0x10($sp)
/* 39E10 80049610 3000A227 */  addiu      $v0, $sp, 0x30
/* 39E14 80049614 1400A2AF */  sw         $v0, 0x14($sp)
/* 39E18 80049618 96000224 */  addiu      $v0, $zero, 0x96
/* 39E1C 8004961C 01000624 */  addiu      $a2, $zero, 0x1
/* 39E20 80049620 2138C000 */  addu       $a3, $a2, $zero
/* 39E24 80049624 1800A0AF */  sw         $zero, 0x18($sp)
/* 39E28 80049628 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 39E2C 8004962C 5C22010C */  jal        FX_DFacadeParticleSetup
/* 39E30 80049630 2000A2AF */   sw        $v0, 0x20($sp)
/* 39E34 80049634 986D2426 */  addiu      $a0, $s1, 0x6D98
/* 39E38 80049638 21280002 */  addu       $a1, $s0, $zero
/* 39E3C 8004963C 0580023C */  lui        $v0, %hi(FX_ProcessSnow)
/* 39E40 80049640 E8934224 */  addiu      $v0, $v0, %lo(FX_ProcessSnow)
/* 39E44 80049644 1400A2AC */  sw         $v0, 0x14($a1)
/* 39E48 80049648 0C00A28C */  lw         $v0, 0xC($a1)
/* 39E4C 8004964C 8000033C */  lui        $v1, (0x800000 >> 16)
/* 39E50 80049650 4200A0A4 */  sh         $zero, 0x42($a1)
/* 39E54 80049654 25104300 */  or         $v0, $v0, $v1
/* 39E58 80049658 8F19010C */  jal        FX_Sprite_Insert
/* 39E5C 8004965C 0C00A2AC */   sw        $v0, 0xC($a1)
.L80049660:
/* 39E60 80049660 4800BF8F */  lw         $ra, 0x48($sp)
/* 39E64 80049664 4400B18F */  lw         $s1, 0x44($sp)
/* 39E68 80049668 4000B08F */  lw         $s0, 0x40($sp)
/* 39E6C 8004966C 0800E003 */  jr         $ra
/* 39E70 80049670 5000BD27 */   addiu     $sp, $sp, 0x50
.size FX_ContinueSnow, . - FX_ContinueSnow
