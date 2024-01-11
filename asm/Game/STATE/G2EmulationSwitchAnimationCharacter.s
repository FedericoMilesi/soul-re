.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationSwitchAnimationCharacter
/* 62BF0 800723F0 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 62BF4 800723F4 2800B4AF */  sw         $s4, 0x28($sp)
/* 62BF8 800723F8 4800B48F */  lw         $s4, 0x48($sp)
/* 62BFC 800723FC 2000B2AF */  sw         $s2, 0x20($sp)
/* 62C00 80072400 2190A000 */  addu       $s2, $a1, $zero
/* 62C04 80072404 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 62C08 80072408 21A8C000 */  addu       $s5, $a2, $zero
/* 62C0C 8007240C 2400B3AF */  sw         $s3, 0x24($sp)
/* 62C10 80072410 2198E000 */  addu       $s3, $a3, $zero
/* 62C14 80072414 3000BFAF */  sw         $ra, 0x30($sp)
/* 62C18 80072418 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 62C1C 8007241C 02004106 */  bgez       $s2, .L80072428
/* 62C20 80072420 1800B0AF */   sw        $s0, 0x18($sp)
/* 62C24 80072424 21900000 */  addu       $s2, $zero, $zero
.L80072428:
/* 62C28 80072428 0000908C */  lw         $s0, 0x0($a0)
/* 62C2C 8007242C 21284002 */  addu       $a1, $s2, $zero
/* 62C30 80072430 4154020C */  jal        G2Instance_GetKeylist
/* 62C34 80072434 21200002 */   addu      $a0, $s0, $zero
/* 62C38 80072438 C8011126 */  addiu      $s1, $s0, 0x1C8
/* 62C3C 8007243C 21202002 */  addu       $a0, $s1, $zero
/* 62C40 80072440 21280000 */  addu       $a1, $zero, $zero
/* 62C44 80072444 1B3F020C */  jal        G2Anim_SetAlphaTable
/* 62C48 80072448 21804000 */   addu      $s0, $v0, $zero
/* 62C4C 8007244C 21202002 */  addu       $a0, $s1, $zero
/* 62C50 80072450 21280002 */  addu       $a1, $s0, $zero
/* 62C54 80072454 40101300 */  sll        $v0, $s3, 1
/* 62C58 80072458 21105300 */  addu       $v0, $v0, $s3
/* 62C5C 8007245C C0100200 */  sll        $v0, $v0, 3
/* 62C60 80072460 21105300 */  addu       $v0, $v0, $s3
/* 62C64 80072464 80140200 */  sll        $v0, $v0, 18
/* 62C68 80072468 03140200 */  sra        $v0, $v0, 16
/* 62C6C 8007246C 21304002 */  addu       $a2, $s2, $zero
/* 62C70 80072470 2138A002 */  addu       $a3, $s5, $zero
/* 62C74 80072474 F23E020C */  jal        G2Anim_InterpToKeylistFrame
/* 62C78 80072478 1000A2AF */   sw        $v0, 0x10($sp)
/* 62C7C 8007247C 05008016 */  bnez       $s4, .L80072494
/* 62C80 80072480 00000000 */   nop
/* 62C84 80072484 763F020C */  jal        G2Anim_SetPaused
/* 62C88 80072488 21202002 */   addu      $a0, $s1, $zero
/* 62C8C 8007248C 30C90108 */  j          .L800724C0
/* 62C90 80072490 00000000 */   nop
.L80072494:
/* 62C94 80072494 9B3F020C */  jal        G2Anim_SetUnpaused
/* 62C98 80072498 21202002 */   addu      $a0, $s1, $zero
/* 62C9C 8007249C 02000224 */  addiu      $v0, $zero, 0x2
/* 62CA0 800724A0 05008216 */  bne        $s4, $v0, .L800724B8
/* 62CA4 800724A4 00000000 */   nop
/* 62CA8 800724A8 463F020C */  jal        G2Anim_SetLooping
/* 62CAC 800724AC 21202002 */   addu      $a0, $s1, $zero
/* 62CB0 800724B0 30C90108 */  j          .L800724C0
/* 62CB4 800724B4 00000000 */   nop
.L800724B8:
/* 62CB8 800724B8 5E3F020C */  jal        G2Anim_SetNoLooping
/* 62CBC 800724BC 21202002 */   addu      $a0, $s1, $zero
.L800724C0:
/* 62CC0 800724C0 3000BF8F */  lw         $ra, 0x30($sp)
/* 62CC4 800724C4 2C00B58F */  lw         $s5, 0x2C($sp)
/* 62CC8 800724C8 2800B48F */  lw         $s4, 0x28($sp)
/* 62CCC 800724CC 2400B38F */  lw         $s3, 0x24($sp)
/* 62CD0 800724D0 2000B28F */  lw         $s2, 0x20($sp)
/* 62CD4 800724D4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 62CD8 800724D8 1800B08F */  lw         $s0, 0x18($sp)
/* 62CDC 800724DC 0800E003 */  jr         $ra
/* 62CE0 800724E0 3800BD27 */   addiu     $sp, $sp, 0x38
.size G2EmulationSwitchAnimationCharacter, . - G2EmulationSwitchAnimationCharacter
