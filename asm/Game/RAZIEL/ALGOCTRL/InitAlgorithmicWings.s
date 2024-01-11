.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitAlgorithmicWings
/* 92354 800A1B54 7CA7828F */  lw         $v0, %gp_rel(AlgoControlFlag)($gp)
/* 92358 800A1B58 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9235C 800A1B5C 2800B2AF */  sw         $s2, 0x28($sp)
/* 92360 800A1B60 21908000 */  addu       $s2, $a0, $zero
/* 92364 800A1B64 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 92368 800A1B68 2400B1AF */  sw         $s1, 0x24($sp)
/* 9236C 800A1B6C 01004230 */  andi       $v0, $v0, 0x1
/* 92370 800A1B70 58004014 */  bnez       $v0, .L800A1CD4
/* 92374 800A1B74 2000B0AF */   sw        $s0, 0x20($sp)
/* 92378 800A1B78 4000428E */  lw         $v0, 0x40($s2)
/* 9237C 800A1B7C 00000000 */  nop
/* 92380 800A1B80 08004014 */  bnez       $v0, .L800A1BA4
/* 92384 800A1B84 33001124 */   addiu     $s1, $zero, 0x33
/* 92388 800A1B88 1000053C */  lui        $a1, (0x100006 >> 16)
/* 9238C 800A1B8C 0600A534 */  ori        $a1, $a1, (0x100006 & 0xFFFF)
/* 92390 800A1B90 A1D1000C */  jal        INSTANCE_Post
/* 92394 800A1B94 21300000 */   addu      $a2, $zero, $zero
/* 92398 800A1B98 35870208 */  j          .L800A1CD4
/* 9239C 800A1B9C 00000000 */   nop
.L800A1BA0:
/* 923A0 800A1BA0 4000428E */  lw         $v0, 0x40($s2)
.L800A1BA4:
/* 923A4 800A1BA4 00000000 */  nop
/* 923A8 800A1BA8 05004014 */  bnez       $v0, .L800A1BC0
/* 923AC 800A1BAC 1800A427 */   addiu     $a0, $sp, 0x18
/* 923B0 800A1BB0 1C00A0A7 */  sh         $zero, 0x1C($sp)
/* 923B4 800A1BB4 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 923B8 800A1BB8 F7860208 */  j          .L800A1BDC
/* 923BC 800A1BBC 1800A0A7 */   sh        $zero, 0x18($sp)
.L800A1BC0:
/* 923C0 800A1BC0 15000624 */  addiu      $a2, $zero, 0x15
/* 923C4 800A1BC4 FF002532 */  andi       $a1, $s1, 0xFF
/* 923C8 800A1BC8 40290500 */  sll        $a1, $a1, 5
/* 923CC 800A1BCC DC01428E */  lw         $v0, 0x1DC($s2)
/* 923D0 800A1BD0 E0FFA524 */  addiu      $a1, $a1, -0x20
/* 923D4 800A1BD4 1758020C */  jal        G2EulerAngles_FromMatrix
/* 923D8 800A1BD8 21284500 */   addu      $a1, $v0, $a1
.L800A1BDC:
/* 923DC 800A1BDC C8014426 */  addiu      $a0, $s2, 0x1C8
/* 923E0 800A1BE0 FF003032 */  andi       $s0, $s1, 0xFF
/* 923E4 800A1BE4 21280002 */  addu       $a1, $s0, $zero
/* 923E8 800A1BE8 5641020C */  jal        G2Anim_EnableController
/* 923EC 800A1BEC 08000624 */   addiu     $a2, $zero, 0x8
/* 923F0 800A1BF0 21204002 */  addu       $a0, $s2, $zero
/* 923F4 800A1BF4 21280002 */  addu       $a1, $s0, $zero
/* 923F8 800A1BF8 08000624 */  addiu      $a2, $zero, 0x8
/* 923FC 800A1BFC 1800A727 */  addiu      $a3, $sp, 0x18
/* 92400 800A1C00 CEFFA324 */  addiu      $v1, $a1, -0x32
/* 92404 800A1C04 40100300 */  sll        $v0, $v1, 1
/* 92408 800A1C08 21104300 */  addu       $v0, $v0, $v1
/* 9240C 800A1C0C 1000A2AF */  sw         $v0, 0x10($sp)
/* 92410 800A1C10 02000224 */  addiu      $v0, $zero, 0x2
/* 92414 800A1C14 67CA010C */  jal        G2EmulationSetInterpController_Vector
/* 92418 800A1C18 1400A2AF */   sw        $v0, 0x14($sp)
/* 9241C 800A1C1C 01003126 */  addiu      $s1, $s1, 0x1
/* 92420 800A1C20 FF002232 */  andi       $v0, $s1, 0xFF
/* 92424 800A1C24 3600422C */  sltiu      $v0, $v0, 0x36
/* 92428 800A1C28 DDFF4014 */  bnez       $v0, .L800A1BA0
/* 9242C 800A1C2C 00000000 */   nop
/* 92430 800A1C30 3B001124 */  addiu      $s1, $zero, 0x3B
.L800A1C34:
/* 92434 800A1C34 4000428E */  lw         $v0, 0x40($s2)
/* 92438 800A1C38 00000000 */  nop
/* 9243C 800A1C3C 05004014 */  bnez       $v0, .L800A1C54
/* 92440 800A1C40 1800A427 */   addiu     $a0, $sp, 0x18
/* 92444 800A1C44 1C00A0A7 */  sh         $zero, 0x1C($sp)
/* 92448 800A1C48 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 9244C 800A1C4C 1C870208 */  j          .L800A1C70
/* 92450 800A1C50 1800A0A7 */   sh        $zero, 0x18($sp)
.L800A1C54:
/* 92454 800A1C54 15000624 */  addiu      $a2, $zero, 0x15
/* 92458 800A1C58 FF002532 */  andi       $a1, $s1, 0xFF
/* 9245C 800A1C5C 40290500 */  sll        $a1, $a1, 5
/* 92460 800A1C60 DC01428E */  lw         $v0, 0x1DC($s2)
/* 92464 800A1C64 E0FFA524 */  addiu      $a1, $a1, -0x20
/* 92468 800A1C68 1758020C */  jal        G2EulerAngles_FromMatrix
/* 9246C 800A1C6C 21284500 */   addu      $a1, $v0, $a1
.L800A1C70:
/* 92470 800A1C70 C8014426 */  addiu      $a0, $s2, 0x1C8
/* 92474 800A1C74 FF003032 */  andi       $s0, $s1, 0xFF
/* 92478 800A1C78 21280002 */  addu       $a1, $s0, $zero
/* 9247C 800A1C7C 5641020C */  jal        G2Anim_EnableController
/* 92480 800A1C80 08000624 */   addiu     $a2, $zero, 0x8
/* 92484 800A1C84 21204002 */  addu       $a0, $s2, $zero
/* 92488 800A1C88 21280002 */  addu       $a1, $s0, $zero
/* 9248C 800A1C8C 08000624 */  addiu      $a2, $zero, 0x8
/* 92490 800A1C90 1800A727 */  addiu      $a3, $sp, 0x18
/* 92494 800A1C94 C6FFA324 */  addiu      $v1, $a1, -0x3A
/* 92498 800A1C98 40100300 */  sll        $v0, $v1, 1
/* 9249C 800A1C9C 21104300 */  addu       $v0, $v0, $v1
/* 924A0 800A1CA0 1000A2AF */  sw         $v0, 0x10($sp)
/* 924A4 800A1CA4 02000224 */  addiu      $v0, $zero, 0x2
/* 924A8 800A1CA8 67CA010C */  jal        G2EmulationSetInterpController_Vector
/* 924AC 800A1CAC 1400A2AF */   sw        $v0, 0x14($sp)
/* 924B0 800A1CB0 01003126 */  addiu      $s1, $s1, 0x1
/* 924B4 800A1CB4 FF002232 */  andi       $v0, $s1, 0xFF
/* 924B8 800A1CB8 3E00422C */  sltiu      $v0, $v0, 0x3E
/* 924BC 800A1CBC DDFF4014 */  bnez       $v0, .L800A1C34
/* 924C0 800A1CC0 00000000 */   nop
/* 924C4 800A1CC4 7CA7828F */  lw         $v0, %gp_rel(AlgoControlFlag)($gp)
/* 924C8 800A1CC8 00000000 */  nop
/* 924CC 800A1CCC 01004234 */  ori        $v0, $v0, 0x1
/* 924D0 800A1CD0 7CA782AF */  sw         $v0, %gp_rel(AlgoControlFlag)($gp)
.L800A1CD4:
/* 924D4 800A1CD4 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 924D8 800A1CD8 2800B28F */  lw         $s2, 0x28($sp)
/* 924DC 800A1CDC 2400B18F */  lw         $s1, 0x24($sp)
/* 924E0 800A1CE0 2000B08F */  lw         $s0, 0x20($sp)
/* 924E4 800A1CE4 0800E003 */  jr         $ra
/* 924E8 800A1CE8 3000BD27 */   addiu     $sp, $sp, 0x30
.size InitAlgorithmicWings, . - InitAlgorithmicWings
