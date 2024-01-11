.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Attack
/* 7A42C 80089C2C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7A430 80089C30 1800B2AF */  sw         $s2, 0x18($sp)
/* 7A434 80089C34 21908000 */  addu       $s2, $a0, $zero
/* 7A438 80089C38 2400BFAF */  sw         $ra, 0x24($sp)
/* 7A43C 80089C3C 2000B4AF */  sw         $s4, 0x20($sp)
/* 7A440 80089C40 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7A444 80089C44 1400B1AF */  sw         $s1, 0x14($sp)
/* 7A448 80089C48 1000B0AF */  sw         $s0, 0x10($sp)
/* 7A44C 80089C4C 6C01538E */  lw         $s3, 0x16C($s2)
/* 7A450 80089C50 00000000 */  nop
/* 7A454 80089C54 B800708E */  lw         $s0, 0xB8($s3)
/* 7A458 80089C58 5F016682 */  lb         $a2, 0x15F($s3)
/* 7A45C 80089C5C C400748E */  lw         $s4, 0xC4($s3)
/* 7A460 80089C60 F4FE010C */  jal        MON_GetAnim
/* 7A464 80089C64 1B000526 */   addiu     $a1, $s0, 0x1B
/* 7A468 80089C68 21884000 */  addu       $s1, $v0, $zero
/* 7A46C 80089C6C 00002296 */  lhu        $v0, 0x0($s1)
/* 7A470 80089C70 00000000 */  nop
/* 7A474 80089C74 09004010 */  beqz       $v0, .L80089C9C
/* 7A478 80089C78 21204002 */   addu      $a0, $s2, $zero
/* 7A47C 80089C7C EAFE010C */  jal        MON_TransNodeAnimation
/* 7A480 80089C80 21204002 */   addu      $a0, $s2, $zero
/* 7A484 80089C84 05004014 */  bnez       $v0, .L80089C9C
/* 7A488 80089C88 21204002 */   addu      $a0, $s2, $zero
/* 7A48C 80089C8C 00002296 */  lhu        $v0, 0x0($s1)
/* 7A490 80089C90 5204020C */  jal        MON_MoveForward
/* 7A494 80089C94 2A0162A6 */   sh        $v0, 0x12A($s3)
/* 7A498 80089C98 21204002 */  addu       $a0, $s2, $zero
.L80089C9C:
/* 7A49C 80089C9C 0A000682 */  lb         $a2, 0xA($s0)
/* 7A4A0 80089CA0 96FF010C */  jal        MON_AnimPlayingFromList
/* 7A4A4 80089CA4 1B000526 */   addiu     $a1, $s0, 0x1B
/* 7A4A8 80089CA8 0B004010 */  beqz       $v0, .L80089CD8
/* 7A4AC 80089CAC 21204002 */   addu      $a0, $s2, $zero
/* 7A4B0 80089CB0 09000682 */  lb         $a2, 0x9($s0)
/* 7A4B4 80089CB4 CCC9010C */  jal        G2EmulationInstanceQueryPassedFrame
/* 7A4B8 80089CB8 21280000 */   addu      $a1, $zero, $zero
/* 7A4BC 80089CBC 06004010 */  beqz       $v0, .L80089CD8
/* 7A4C0 80089CC0 21204002 */   addu      $a0, $s2, $zero
/* 7A4C4 80089CC4 08000582 */  lb         $a1, 0x8($s0)
/* 7A4C8 80089CC8 E2FD010C */  jal        MON_TurnOnWeaponSphere
/* 7A4CC 80089CCC 21204002 */   addu      $a0, $s2, $zero
/* 7A4D0 80089CD0 4C270208 */  j          .L80089D30
/* 7A4D4 80089CD4 00000000 */   nop
.L80089CD8:
/* 7A4D8 80089CD8 0C000682 */  lb         $a2, 0xC($s0)
/* 7A4DC 80089CDC 96FF010C */  jal        MON_AnimPlayingFromList
/* 7A4E0 80089CE0 1B000526 */   addiu     $a1, $s0, 0x1B
/* 7A4E4 80089CE4 12004010 */  beqz       $v0, .L80089D30
/* 7A4E8 80089CE8 00000000 */   nop
/* 7A4EC 80089CEC 21204002 */  addu       $a0, $s2, $zero
/* 7A4F0 80089CF0 0B000682 */  lb         $a2, 0xB($s0)
/* 7A4F4 80089CF4 CCC9010C */  jal        G2EmulationInstanceQueryPassedFrame
/* 7A4F8 80089CF8 21280000 */   addu      $a1, $zero, $zero
/* 7A4FC 80089CFC 0C004010 */  beqz       $v0, .L80089D30
/* 7A500 80089D00 00000000 */   nop
/* 7A504 80089D04 0000628E */  lw         $v0, 0x0($s3)
/* 7A508 80089D08 00000000 */  nop
/* 7A50C 80089D0C 00404230 */  andi       $v0, $v0, 0x4000
/* 7A510 80089D10 07004010 */  beqz       $v0, .L80089D30
/* 7A514 80089D14 00000000 */   nop
/* 7A518 80089D18 76FD010C */  jal        MON_TurnOffWeaponSpheres
/* 7A51C 80089D1C 21204002 */   addu      $a0, $s2, $zero
/* 7A520 80089D20 18008296 */  lhu        $v0, 0x18($s4)
/* 7A524 80089D24 00000000 */  nop
/* 7A528 80089D28 00024234 */  ori        $v0, $v0, 0x200
/* 7A52C 80089D2C 180082A6 */  sh         $v0, 0x18($s4)
.L80089D30:
/* 7A530 80089D30 1800438E */  lw         $v1, 0x18($s2)
/* 7A534 80089D34 00000000 */  nop
/* 7A538 80089D38 10006230 */  andi       $v0, $v1, 0x10
/* 7A53C 80089D3C 14004010 */  beqz       $v0, .L80089D90
/* 7A540 80089D40 EFFF0224 */   addiu     $v0, $zero, -0x11
/* 7A544 80089D44 24106200 */  and        $v0, $v1, $v0
/* 7A548 80089D48 180042AE */  sw         $v0, 0x18($s2)
/* 7A54C 80089D4C 5F016292 */  lbu        $v0, 0x15F($s3)
/* 7A550 80089D50 00000000 */  nop
/* 7A554 80089D54 01004224 */  addiu      $v0, $v0, 0x1
/* 7A558 80089D58 5F0162A2 */  sb         $v0, 0x15F($s3)
/* 7A55C 80089D5C 00160200 */  sll        $v0, $v0, 24
/* 7A560 80089D60 0E000382 */  lb         $v1, 0xE($s0)
/* 7A564 80089D64 03360200 */  sra        $a2, $v0, 24
/* 7A568 80089D68 2A18C300 */  slt        $v1, $a2, $v1
/* 7A56C 80089D6C 06006010 */  beqz       $v1, .L80089D88
/* 7A570 80089D70 21204002 */   addu      $a0, $s2, $zero
/* 7A574 80089D74 1B000526 */  addiu      $a1, $s0, 0x1B
/* 7A578 80089D78 6FFF010C */  jal        MON_PlayAnimFromList
/* 7A57C 80089D7C 01000724 */   addiu     $a3, $zero, 0x1
/* 7A580 80089D80 64270208 */  j          .L80089D90
/* 7A584 80089D84 00000000 */   nop
.L80089D88:
/* 7A588 80089D88 91FE010C */  jal        MON_SwitchState
/* 7A58C 80089D8C 0D000524 */   addiu     $a1, $zero, 0xD
.L80089D90:
/* 7A590 80089D90 14008012 */  beqz       $s4, .L80089DE4
/* 7A594 80089D94 00000000 */   nop
/* 7A598 80089D98 9006020C */  jal        MON_GetTime
/* 7A59C 80089D9C 21204002 */   addu      $a0, $s2, $zero
/* 7A5A0 80089DA0 1401638E */  lw         $v1, 0x114($s3)
/* 7A5A4 80089DA4 00000000 */  nop
/* 7A5A8 80089DA8 2B104300 */  sltu       $v0, $v0, $v1
/* 7A5AC 80089DAC 08004014 */  bnez       $v0, .L80089DD0
/* 7A5B0 80089DB0 21204002 */   addu      $a0, $s2, $zero
/* 7A5B4 80089DB4 0400848E */  lw         $a0, 0x4($s4)
/* 7A5B8 80089DB8 92D1000C */  jal        INSTANCE_Query
/* 7A5BC 80089DBC 0A000524 */   addiu     $a1, $zero, 0xA
/* 7A5C0 80089DC0 0002033C */  lui        $v1, (0x2000000 >> 16)
/* 7A5C4 80089DC4 24104300 */  and        $v0, $v0, $v1
/* 7A5C8 80089DC8 06004014 */  bnez       $v0, .L80089DE4
/* 7A5CC 80089DCC 21204002 */   addu      $a0, $s2, $zero
.L80089DD0:
/* 7A5D0 80089DD0 6801628E */  lw         $v0, 0x168($s3)
/* 7A5D4 80089DD4 0400858E */  lw         $a1, 0x4($s4)
/* 7A5D8 80089DD8 1C004684 */  lh         $a2, 0x1C($v0)
/* 7A5DC 80089DDC 6604020C */  jal        MON_TurnToPosition
/* 7A5E0 80089DE0 5C00A524 */   addiu     $a1, $a1, 0x5C
.L80089DE4:
/* 7A5E4 80089DE4 0917020C */  jal        MON_DefaultQueueHandler
/* 7A5E8 80089DE8 21204002 */   addu      $a0, $s2, $zero
/* 7A5EC 80089DEC 2400BF8F */  lw         $ra, 0x24($sp)
/* 7A5F0 80089DF0 2000B48F */  lw         $s4, 0x20($sp)
/* 7A5F4 80089DF4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7A5F8 80089DF8 1800B28F */  lw         $s2, 0x18($sp)
/* 7A5FC 80089DFC 1400B18F */  lw         $s1, 0x14($sp)
/* 7A600 80089E00 1000B08F */  lw         $s0, 0x10($sp)
/* 7A604 80089E04 0800E003 */  jr         $ra
/* 7A608 80089E08 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_Attack, . - MON_Attack
