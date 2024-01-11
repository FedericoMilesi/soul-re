.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformCameraObjectAttribute
/* 53CB4 800634B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 53CB8 800634B8 1000B0AF */  sw         $s0, 0x10($sp)
/* 53CBC 800634BC 21808000 */  addu       $s0, $a0, $zero
/* 53CC0 800634C0 2120A000 */  addu       $a0, $a1, $zero
/* 53CC4 800634C4 4A00C228 */  slti       $v0, $a2, 0x4A
/* 53CC8 800634C8 1400BFAF */  sw         $ra, 0x14($sp)
/* 53CCC 800634CC 0400888C */  lw         $t0, 0x4($a0)
/* 53CD0 800634D0 0A004010 */  beqz       $v0, .L800634FC
/* 53CD4 800634D4 21180000 */   addu      $v1, $zero, $zero
/* 53CD8 800634D8 4300C228 */  slti       $v0, $a2, 0x43
/* 53CDC 800634DC 39004010 */  beqz       $v0, .L800635C4
/* 53CE0 800634E0 09000224 */   addiu     $v0, $zero, 0x9
/* 53CE4 800634E4 3700C210 */  beq        $a2, $v0, .L800635C4
/* 53CE8 800634E8 10000224 */   addiu     $v0, $zero, 0x10
/* 53CEC 800634EC 3500C210 */  beq        $a2, $v0, .L800635C4
/* 53CF0 800634F0 00000000 */   nop
/* 53CF4 800634F4 738D0108 */  j          .L800635CC
/* 53CF8 800634F8 00000000 */   nop
.L800634FC:
/* 53CFC 800634FC 68000224 */  addiu      $v0, $zero, 0x68
/* 53D00 80063500 3000C210 */  beq        $a2, $v0, .L800635C4
/* 53D04 80063504 6900C228 */   slti      $v0, $a2, 0x69
/* 53D08 80063508 05004010 */  beqz       $v0, .L80063520
/* 53D0C 8006350C 5D000224 */   addiu     $v0, $zero, 0x5D
/* 53D10 80063510 0A00C210 */  beq        $a2, $v0, .L8006353C
/* 53D14 80063514 00000000 */   nop
/* 53D18 80063518 738D0108 */  j          .L800635CC
/* 53D1C 8006351C 00000000 */   nop
.L80063520:
/* 53D20 80063520 69000224 */  addiu      $v0, $zero, 0x69
/* 53D24 80063524 1C00C210 */  beq        $a2, $v0, .L80063598
/* 53D28 80063528 75000224 */   addiu     $v0, $zero, 0x75
/* 53D2C 8006352C 2000C210 */  beq        $a2, $v0, .L800635B0
/* 53D30 80063530 21300000 */   addu      $a2, $zero, $zero
/* 53D34 80063534 738D0108 */  j          .L800635CC
/* 53D38 80063538 00000000 */   nop
.L8006353C:
/* 53D3C 8006353C 2200E010 */  beqz       $a3, .L800635C8
/* 53D40 80063540 0200E724 */   addiu     $a3, $a3, 0x2
/* 53D44 80063544 EB51033C */  lui        $v1, (0x51EB851F >> 16)
/* 53D48 80063548 02000224 */  addiu      $v0, $zero, 0x2
/* 53D4C 8006354C 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 53D50 80063550 0200E684 */  lh         $a2, 0x2($a3)
/* 53D54 80063554 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
/* 53D58 80063558 00330600 */  sll        $a2, $a2, 12
/* 53D5C 8006355C 1800C300 */  mult       $a2, $v1
/* 53D60 80063560 0000E594 */  lhu        $a1, 0x0($a3)
/* 53D64 80063564 21200001 */  addu       $a0, $t0, $zero
/* 53D68 80063568 002C0500 */  sll        $a1, $a1, 16
/* 53D6C 8006356C 032C0500 */  sra        $a1, $a1, 16
/* 53D70 80063570 C3370600 */  sra        $a2, $a2, 31
/* 53D74 80063574 10480000 */  mfhi       $t1
/* 53D78 80063578 43110900 */  sra        $v0, $t1, 5
/* 53D7C 8006357C 205C000C */  jal        CAMERA_SetShake
/* 53D80 80063580 23304600 */   subu      $a2, $v0, $a2
/* 53D84 80063584 0000028E */  lw         $v0, 0x0($s0)
/* 53D88 80063588 00000000 */  nop
/* 53D8C 8006358C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 53D90 80063590 728D0108 */  j          .L800635C8
/* 53D94 80063594 000002AE */   sw        $v0, 0x0($s0)
.L80063598:
/* 53D98 80063598 0A00E010 */  beqz       $a3, .L800635C4
/* 53D9C 8006359C 01000224 */   addiu     $v0, $zero, 0x1
/* 53DA0 800635A0 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 53DA4 800635A4 0200E284 */  lh         $v0, 0x2($a3)
/* 53DA8 800635A8 718D0108 */  j          .L800635C4
/* 53DAC 800635AC 080082AC */   sw        $v0, 0x8($a0)
.L800635B0:
/* 53DB0 800635B0 36040585 */  lh         $a1, 0x436($t0)
/* 53DB4 800635B4 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53DB8 800635B8 2B280500 */   sltu      $a1, $zero, $a1
/* 53DBC 800635BC 738D0108 */  j          .L800635CC
/* 53DC0 800635C0 01000324 */   addiu     $v1, $zero, 0x1
.L800635C4:
/* 53DC4 800635C4 0C0086AC */  sw         $a2, 0xC($a0)
.L800635C8:
/* 53DC8 800635C8 01000324 */  addiu      $v1, $zero, 0x1
.L800635CC:
/* 53DCC 800635CC 1400BF8F */  lw         $ra, 0x14($sp)
/* 53DD0 800635D0 1000B08F */  lw         $s0, 0x10($sp)
/* 53DD4 800635D4 21106000 */  addu       $v0, $v1, $zero
/* 53DD8 800635D8 0800E003 */  jr         $ra
/* 53DDC 800635DC 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_TransformCameraObjectAttribute, . - EVENT_TransformCameraObjectAttribute
