.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSICS_SetVAndAFromRot
/* 683B8 80077BB8 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 683BC 80077BBC 4800B0AF */  sw         $s0, 0x48($sp)
/* 683C0 80077BC0 21808000 */  addu       $s0, $a0, $zero
/* 683C4 80077BC4 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 683C8 80077BC8 2188C000 */  addu       $s1, $a2, $zero
/* 683CC 80077BCC 5000B2AF */  sw         $s2, 0x50($sp)
/* 683D0 80077BD0 2190E000 */  addu       $s2, $a3, $zero
/* 683D4 80077BD4 03002016 */  bnez       $s1, .L80077BE4
/* 683D8 80077BD8 5400BFAF */   sw        $ra, 0x54($sp)
/* 683DC 80077BDC 06004012 */  beqz       $s2, .L80077BF8
/* 683E0 80077BE0 00000000 */   nop
.L80077BE4:
/* 683E4 80077BE4 74000426 */  addiu      $a0, $s0, 0x74
/* 683E8 80077BE8 3DE3010C */  jal        func_80078CF4
/* 683EC 80077BEC 1800A527 */   addiu     $a1, $sp, 0x18
/* 683F0 80077BF0 1000A0A7 */  sh         $zero, 0x10($sp)
/* 683F4 80077BF4 1400A0A7 */  sh         $zero, 0x14($sp)
.L80077BF8:
/* 683F8 80077BF8 0F002012 */  beqz       $s1, .L80077C38
/* 683FC 80077BFC 1800A427 */   addiu     $a0, $sp, 0x18
/* 68400 80077C00 1000A527 */  addiu      $a1, $sp, 0x10
/* 68404 80077C04 3800A627 */  addiu      $a2, $sp, 0x38
/* 68408 80077C08 23101100 */  negu       $v0, $s1
/* 6840C 80077C0C 0EF3020C */  jal        func_800BCC38
/* 68410 80077C10 1200A2A7 */   sh        $v0, 0x12($sp)
/* 68414 80077C14 3800A287 */  lh         $v0, 0x38($sp)
/* 68418 80077C18 00000000 */  nop
/* 6841C 80077C1C 740102AE */  sw         $v0, 0x174($s0)
/* 68420 80077C20 3A00A287 */  lh         $v0, 0x3A($sp)
/* 68424 80077C24 00000000 */  nop
/* 68428 80077C28 780102AE */  sw         $v0, 0x178($s0)
/* 6842C 80077C2C 3C00A287 */  lh         $v0, 0x3C($sp)
/* 68430 80077C30 11DF0108 */  j          .L80077C44
/* 68434 80077C34 7C0102AE */   sw        $v0, 0x17C($s0)
.L80077C38:
/* 68438 80077C38 740100AE */  sw         $zero, 0x174($s0)
/* 6843C 80077C3C 780100AE */  sw         $zero, 0x178($s0)
/* 68440 80077C40 7C0100AE */  sw         $zero, 0x17C($s0)
.L80077C44:
/* 68444 80077C44 0F004012 */  beqz       $s2, .L80077C84
/* 68448 80077C48 1800A427 */   addiu     $a0, $sp, 0x18
/* 6844C 80077C4C 1000A527 */  addiu      $a1, $sp, 0x10
/* 68450 80077C50 4000A627 */  addiu      $a2, $sp, 0x40
/* 68454 80077C54 23101200 */  negu       $v0, $s2
/* 68458 80077C58 0EF3020C */  jal        func_800BCC38
/* 6845C 80077C5C 1200A2A7 */   sh        $v0, 0x12($sp)
/* 68460 80077C60 4000A287 */  lh         $v0, 0x40($sp)
/* 68464 80077C64 00000000 */  nop
/* 68468 80077C68 800102AE */  sw         $v0, 0x180($s0)
/* 6846C 80077C6C 4200A287 */  lh         $v0, 0x42($sp)
/* 68470 80077C70 00000000 */  nop
/* 68474 80077C74 840102AE */  sw         $v0, 0x184($s0)
/* 68478 80077C78 4400A287 */  lh         $v0, 0x44($sp)
/* 6847C 80077C7C 24DF0108 */  j          .L80077C90
/* 68480 80077C80 880102AE */   sw        $v0, 0x188($s0)
.L80077C84:
/* 68484 80077C84 800100AE */  sw         $zero, 0x180($s0)
/* 68488 80077C88 840100AE */  sw         $zero, 0x184($s0)
/* 6848C 80077C8C 880100AE */  sw         $zero, 0x188($s0)
.L80077C90:
/* 68490 80077C90 5400BF8F */  lw         $ra, 0x54($sp)
/* 68494 80077C94 5000B28F */  lw         $s2, 0x50($sp)
/* 68498 80077C98 4C00B18F */  lw         $s1, 0x4C($sp)
/* 6849C 80077C9C 4800B08F */  lw         $s0, 0x48($sp)
/* 684A0 80077CA0 0800E003 */  jr         $ra
/* 684A4 80077CA4 5800BD27 */   addiu     $sp, $sp, 0x58
.size PHYSICS_SetVAndAFromRot, . - PHYSICS_SetVAndAFromRot
