.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel adjust_format
/* 43F8 80013BF8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 43FC 80013BFC 1400B1AF */  sw         $s1, 0x14($sp)
/* 4400 80013C00 21888000 */  addu       $s1, $a0, $zero
/* 4404 80013C04 2800BFAF */  sw         $ra, 0x28($sp)
/* 4408 80013C08 2400B5AF */  sw         $s5, 0x24($sp)
/* 440C 80013C0C 2000B4AF */  sw         $s4, 0x20($sp)
/* 4410 80013C10 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4414 80013C14 1800B2AF */  sw         $s2, 0x18($sp)
/* 4418 80013C18 1000B0AF */  sw         $s0, 0x10($sp)
/* 441C 80013C1C 00002292 */  lbu        $v0, 0x0($s1)
/* 4420 80013C20 00000000 */  nop
/* 4424 80013C24 55004010 */  beqz       $v0, .L80013D7C
/* 4428 80013C28 21A0A000 */   addu      $s4, $a1, $zero
/* 442C 80013C2C 0D80153C */  lui        $s5, %hi(cem_item_leading + 0x4)
/* 4430 80013C30 21202002 */  addu       $a0, $s1, $zero
.L80013C34:
/* 4434 80013C34 6401A526 */  addiu      $a1, $s5, %lo(cem_item_leading + 0x4)
/* 4438 80013C38 3DE8020C */  jal        strncmp
/* 443C 80013C3C 05000624 */   addiu     $a2, $zero, 0x5
/* 4440 80013C40 07004010 */  beqz       $v0, .L80013C60
/* 4444 80013C44 21202002 */   addu      $a0, $s1, $zero
/* 4448 80013C48 0D80053C */  lui        $a1, %hi(cem_item_leading + 0xC)
/* 444C 80013C4C 6C01A524 */  addiu      $a1, $a1, %lo(cem_item_leading + 0xC)
/* 4450 80013C50 3DE8020C */  jal        strncmp
/* 4454 80013C54 05000624 */   addiu     $a2, $zero, 0x5
/* 4458 80013C58 36004014 */  bnez       $v0, .L80013D34
/* 445C 80013C5C 21202002 */   addu      $a0, $s1, $zero
.L80013C60:
/* 4460 80013C60 05003026 */  addiu      $s0, $s1, 0x5
/* 4464 80013C64 21900000 */  addu       $s2, $zero, $zero
/* 4468 80013C68 21984002 */  addu       $s3, $s2, $zero
.L80013C6C:
/* 446C 80013C6C 00000492 */  lbu        $a0, 0x0($s0)
/* 4470 80013C70 FA4E000C */  jal        isdigit
/* 4474 80013C74 00000000 */   nop
/* 4478 80013C78 08004010 */  beqz       $v0, .L80013C9C
/* 447C 80013C7C 80101200 */   sll       $v0, $s2, 2
/* 4480 80013C80 00000392 */  lbu        $v1, 0x0($s0)
/* 4484 80013C84 01001026 */  addiu      $s0, $s0, 0x1
/* 4488 80013C88 21105200 */  addu       $v0, $v0, $s2
/* 448C 80013C8C 40100200 */  sll        $v0, $v0, 1
/* 4490 80013C90 21104300 */  addu       $v0, $v0, $v1
/* 4494 80013C94 1B4F0008 */  j          .L80013C6C
/* 4498 80013C98 D0FF5224 */   addiu     $s2, $v0, -0x30
.L80013C9C:
/* 449C 80013C9C 00000292 */  lbu        $v0, 0x0($s0)
/* 44A0 80013CA0 00000000 */  nop
/* 44A4 80013CA4 02004010 */  beqz       $v0, .L80013CB0
/* 44A8 80013CA8 00000000 */   nop
/* 44AC 80013CAC 01001026 */  addiu      $s0, $s0, 0x1
.L80013CB0:
/* 44B0 80013CB0 00000492 */  lbu        $a0, 0x0($s0)
/* 44B4 80013CB4 FA4E000C */  jal        isdigit
/* 44B8 80013CB8 00000000 */   nop
/* 44BC 80013CBC 08004010 */  beqz       $v0, .L80013CE0
/* 44C0 80013CC0 80101300 */   sll       $v0, $s3, 2
/* 44C4 80013CC4 00000392 */  lbu        $v1, 0x0($s0)
/* 44C8 80013CC8 01001026 */  addiu      $s0, $s0, 0x1
/* 44CC 80013CCC 21105300 */  addu       $v0, $v0, $s3
/* 44D0 80013CD0 40100200 */  sll        $v0, $v0, 1
/* 44D4 80013CD4 21104300 */  addu       $v0, $v0, $v1
/* 44D8 80013CD8 2C4F0008 */  j          .L80013CB0
/* 44DC 80013CDC D0FF5324 */   addiu     $s3, $v0, -0x30
.L80013CE0:
/* 44E0 80013CE0 00000292 */  lbu        $v0, 0x0($s0)
/* 44E4 80013CE4 00000000 */  nop
/* 44E8 80013CE8 02004010 */  beqz       $v0, .L80013CF4
/* 44EC 80013CEC 21202002 */   addu      $a0, $s1, $zero
/* 44F0 80013CF0 01001026 */  addiu      $s0, $s0, 0x1
.L80013CF4:
/* 44F4 80013CF4 6401A526 */  addiu      $a1, $s5, %lo(cem_item_leading + 0x4)
/* 44F8 80013CF8 3DE8020C */  jal        strncmp
/* 44FC 80013CFC 05000624 */   addiu     $a2, $zero, 0x5
/* 4500 80013D00 04004014 */  bnez       $v0, .L80013D14
/* 4504 80013D04 00000000 */   nop
/* 4508 80013D08 000092AE */  sw         $s2, 0x0($s4)
/* 450C 80013D0C 4B4F0008 */  j          .L80013D2C
/* 4510 80013D10 040093AE */   sw        $s3, 0x4($s4)
.L80013D14:
/* 4514 80013D14 0000828E */  lw         $v0, 0x0($s4)
/* 4518 80013D18 0400838E */  lw         $v1, 0x4($s4)
/* 451C 80013D1C 21105200 */  addu       $v0, $v0, $s2
/* 4520 80013D20 21187300 */  addu       $v1, $v1, $s3
/* 4524 80013D24 000082AE */  sw         $v0, 0x0($s4)
/* 4528 80013D28 040083AE */  sw         $v1, 0x4($s4)
.L80013D2C:
/* 452C 80013D2C 5B4F0008 */  j          .L80013D6C
/* 4530 80013D30 21880002 */   addu      $s1, $s0, $zero
.L80013D34:
/* 4534 80013D34 0D80053C */  lui        $a1, %hi(cem_item_leading + 0x14)
/* 4538 80013D38 7401A524 */  addiu      $a1, $a1, %lo(cem_item_leading + 0x14)
/* 453C 80013D3C 3DE8020C */  jal        strncmp
/* 4540 80013D40 07000624 */   addiu     $a2, $zero, 0x7
/* 4544 80013D44 06004010 */  beqz       $v0, .L80013D60
/* 4548 80013D48 0D80043C */   lui       $a0, %hi(cem_item_leading + 0x1C)
/* 454C 80013D4C 7C018424 */  addiu      $a0, $a0, %lo(cem_item_leading + 0x1C)
/* 4550 80013D50 06D1010C */  jal        printf
/* 4554 80013D54 21282002 */   addu      $a1, $s1, $zero
/* 4558 80013D58 5F4F0008 */  j          .L80013D7C
/* 455C 80013D5C 00000000 */   nop
.L80013D60:
/* 4560 80013D60 01000224 */  addiu      $v0, $zero, 0x1
/* 4564 80013D64 080082AE */  sw         $v0, 0x8($s4)
/* 4568 80013D68 07003126 */  addiu      $s1, $s1, 0x7
.L80013D6C:
/* 456C 80013D6C 00002292 */  lbu        $v0, 0x0($s1)
/* 4570 80013D70 00000000 */  nop
/* 4574 80013D74 AFFF4014 */  bnez       $v0, .L80013C34
/* 4578 80013D78 21202002 */   addu      $a0, $s1, $zero
.L80013D7C:
/* 457C 80013D7C 2800BF8F */  lw         $ra, 0x28($sp)
/* 4580 80013D80 2400B58F */  lw         $s5, 0x24($sp)
/* 4584 80013D84 2000B48F */  lw         $s4, 0x20($sp)
/* 4588 80013D88 1C00B38F */  lw         $s3, 0x1C($sp)
/* 458C 80013D8C 1800B28F */  lw         $s2, 0x18($sp)
/* 4590 80013D90 1400B18F */  lw         $s1, 0x14($sp)
/* 4594 80013D94 1000B08F */  lw         $s0, 0x10($sp)
/* 4598 80013D98 0800E003 */  jr         $ra
/* 459C 80013D9C 3000BD27 */   addiu     $sp, $sp, 0x30
.size adjust_format, . - adjust_format
