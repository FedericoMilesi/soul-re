.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TrailWaterFX
/* A4CB8 800B44B8 90FFBD27 */  addiu      $sp, $sp, -0x70
/* A4CBC 800B44BC 5000B2AF */  sw         $s2, 0x50($sp)
/* A4CC0 800B44C0 21908000 */  addu       $s2, $a0, $zero
/* A4CC4 800B44C4 4800B0AF */  sw         $s0, 0x48($sp)
/* A4CC8 800B44C8 2180A000 */  addu       $s0, $a1, $zero
/* A4CCC 800B44CC 6400B7AF */  sw         $s7, 0x64($sp)
/* A4CD0 800B44D0 21B8C000 */  addu       $s7, $a2, $zero
/* A4CD4 800B44D4 6000B6AF */  sw         $s6, 0x60($sp)
/* A4CD8 800B44D8 21B0E000 */  addu       $s6, $a3, $zero
/* A4CDC 800B44DC 2800A427 */  addiu      $a0, $sp, 0x28
/* A4CE0 800B44E0 21280000 */  addu       $a1, $zero, $zero
/* A4CE4 800B44E4 08000624 */  addiu      $a2, $zero, 0x8
/* A4CE8 800B44E8 6800BFAF */  sw         $ra, 0x68($sp)
/* A4CEC 800B44EC 5C00B5AF */  sw         $s5, 0x5C($sp)
/* A4CF0 800B44F0 5800B4AF */  sw         $s4, 0x58($sp)
/* A4CF4 800B44F4 5400B3AF */  sw         $s3, 0x54($sp)
/* A4CF8 800B44F8 2EF2020C */  jal        memset
/* A4CFC 800B44FC 4C00B1AF */   sw        $s1, 0x4C($sp)
/* A4D00 800B4500 3800448E */  lw         $a0, 0x38($s2)
/* A4D04 800B4504 1C66010C */  jal        STREAM_GetLevelWithID
/* A4D08 800B4508 00000000 */   nop
/* A4D0C 800B450C 05000324 */  addiu      $v1, $zero, 0x5
/* A4D10 800B4510 3000A3A7 */  sh         $v1, 0x30($sp)
/* A4D14 800B4514 80000324 */  addiu      $v1, $zero, 0x80
/* A4D18 800B4518 3200A3A7 */  sh         $v1, 0x32($sp)
/* A4D1C 800B451C 00080324 */  addiu      $v1, $zero, 0x800
/* A4D20 800B4520 3400A3A7 */  sh         $v1, 0x34($sp)
/* A4D24 800B4524 18000324 */  addiu      $v1, $zero, 0x18
/* A4D28 800B4528 3600A3A7 */  sh         $v1, 0x36($sp)
/* A4D2C 800B452C 3800A3A7 */  sh         $v1, 0x38($sp)
/* A4D30 800B4530 20000324 */  addiu      $v1, $zero, 0x20
/* A4D34 800B4534 3A00A3A7 */  sh         $v1, 0x3A($sp)
/* A4D38 800B4538 10000324 */  addiu      $v1, $zero, 0x10
/* A4D3C 800B453C 3C00A3A7 */  sh         $v1, 0x3C($sp)
/* A4D40 800B4540 04000324 */  addiu      $v1, $zero, 0x4
/* A4D44 800B4544 4200A3A7 */  sh         $v1, 0x42($sp)
/* A4D48 800B4548 4000438E */  lw         $v1, 0x40($s2)
/* A4D4C 800B454C 00000000 */  nop
/* A4D50 800B4550 AE006010 */  beqz       $v1, .L800B480C
/* A4D54 800B4554 21A84000 */   addu      $s5, $v0, $zero
/* A4D58 800B4558 4400428E */  lw         $v0, 0x44($s2)
/* A4D5C 800B455C 00000000 */  nop
/* A4D60 800B4560 AA004010 */  beqz       $v0, .L800B480C
/* A4D64 800B4564 21A00000 */   addu      $s4, $zero, $zero
/* A4D68 800B4568 40811000 */  sll        $s0, $s0, 5
/* A4D6C 800B456C 6666133C */  lui        $s3, (0x66666667 >> 16)
/* A4D70 800B4570 67667336 */  ori        $s3, $s3, (0x66666667 & 0xFFFF)
.L800B4574:
/* A4D74 800B4574 4400448E */  lw         $a0, 0x44($s2)
/* A4D78 800B4578 4000428E */  lw         $v0, 0x40($s2)
/* A4D7C 800B457C 21200402 */  addu       $a0, $s0, $a0
/* A4D80 800B4580 21100202 */  addu       $v0, $s0, $v0
/* A4D84 800B4584 1400428C */  lw         $v0, 0x14($v0)
/* A4D88 800B4588 1400838C */  lw         $v1, 0x14($a0)
/* A4D8C 800B458C 00000000 */  nop
/* A4D90 800B4590 23104300 */  subu       $v0, $v0, $v1
/* A4D94 800B4594 18005400 */  mult       $v0, $s4
/* A4D98 800B4598 12100000 */  mflo       $v0
/* A4D9C 800B459C C21F0200 */  srl        $v1, $v0, 31
/* A4DA0 800B45A0 21104300 */  addu       $v0, $v0, $v1
/* A4DA4 800B45A4 14008394 */  lhu        $v1, 0x14($a0)
/* A4DA8 800B45A8 43100200 */  sra        $v0, $v0, 1
/* A4DAC 800B45AC 21186200 */  addu       $v1, $v1, $v0
/* A4DB0 800B45B0 1800A3A7 */  sh         $v1, 0x18($sp)
/* A4DB4 800B45B4 4400448E */  lw         $a0, 0x44($s2)
/* A4DB8 800B45B8 4000428E */  lw         $v0, 0x40($s2)
/* A4DBC 800B45BC 21200402 */  addu       $a0, $s0, $a0
/* A4DC0 800B45C0 21100202 */  addu       $v0, $s0, $v0
/* A4DC4 800B45C4 1800428C */  lw         $v0, 0x18($v0)
/* A4DC8 800B45C8 1800838C */  lw         $v1, 0x18($a0)
/* A4DCC 800B45CC 00000000 */  nop
/* A4DD0 800B45D0 23104300 */  subu       $v0, $v0, $v1
/* A4DD4 800B45D4 18005400 */  mult       $v0, $s4
/* A4DD8 800B45D8 12100000 */  mflo       $v0
/* A4DDC 800B45DC C21F0200 */  srl        $v1, $v0, 31
/* A4DE0 800B45E0 21104300 */  addu       $v0, $v0, $v1
/* A4DE4 800B45E4 18008394 */  lhu        $v1, 0x18($a0)
/* A4DE8 800B45E8 43100200 */  sra        $v0, $v0, 1
/* A4DEC 800B45EC 21186200 */  addu       $v1, $v1, $v0
/* A4DF0 800B45F0 1A00A3A7 */  sh         $v1, 0x1A($sp)
/* A4DF4 800B45F4 4400448E */  lw         $a0, 0x44($s2)
/* A4DF8 800B45F8 4000428E */  lw         $v0, 0x40($s2)
/* A4DFC 800B45FC 21200402 */  addu       $a0, $s0, $a0
/* A4E00 800B4600 21100202 */  addu       $v0, $s0, $v0
/* A4E04 800B4604 1C00428C */  lw         $v0, 0x1C($v0)
/* A4E08 800B4608 1C00838C */  lw         $v1, 0x1C($a0)
/* A4E0C 800B460C 00000000 */  nop
/* A4E10 800B4610 23104300 */  subu       $v0, $v0, $v1
/* A4E14 800B4614 18005400 */  mult       $v0, $s4
/* A4E18 800B4618 21880000 */  addu       $s1, $zero, $zero
/* A4E1C 800B461C 12100000 */  mflo       $v0
/* A4E20 800B4620 C21F0200 */  srl        $v1, $v0, 31
/* A4E24 800B4624 21104300 */  addu       $v0, $v0, $v1
/* A4E28 800B4628 1C008394 */  lhu        $v1, 0x1C($a0)
/* A4E2C 800B462C 43100200 */  sra        $v0, $v0, 1
/* A4E30 800B4630 21186200 */  addu       $v1, $v1, $v0
/* A4E34 800B4634 7100E01A */  blez       $s7, .L800B47FC
/* A4E38 800B4638 1C00A3A7 */   sh        $v1, 0x1C($sp)
.L800B463C:
/* A4E3C 800B463C 3AF2020C */  jal        rand
/* A4E40 800B4640 00000000 */   nop
/* A4E44 800B4644 18005300 */  mult       $v0, $s3
/* A4E48 800B4648 4400438E */  lw         $v1, 0x44($s2)
/* A4E4C 800B464C 1800A597 */  lhu        $a1, 0x18($sp)
/* A4E50 800B4650 21180302 */  addu       $v1, $s0, $v1
/* A4E54 800B4654 14006394 */  lhu        $v1, 0x14($v1)
/* A4E58 800B4658 00000000 */  nop
/* A4E5C 800B465C 2328A300 */  subu       $a1, $a1, $v1
/* A4E60 800B4660 C31F0200 */  sra        $v1, $v0, 31
/* A4E64 800B4664 10400000 */  mfhi       $t0
/* A4E68 800B4668 C3200800 */  sra        $a0, $t0, 3
/* A4E6C 800B466C 23208300 */  subu       $a0, $a0, $v1
/* A4E70 800B4670 80180400 */  sll        $v1, $a0, 2
/* A4E74 800B4674 21186400 */  addu       $v1, $v1, $a0
/* A4E78 800B4678 80180300 */  sll        $v1, $v1, 2
/* A4E7C 800B467C 23104300 */  subu       $v0, $v0, $v1
/* A4E80 800B4680 2128A200 */  addu       $a1, $a1, $v0
/* A4E84 800B4684 F6FFA524 */  addiu      $a1, $a1, -0xA
/* A4E88 800B4688 3AF2020C */  jal        rand
/* A4E8C 800B468C 2000A5A7 */   sh        $a1, 0x20($sp)
/* A4E90 800B4690 18005300 */  mult       $v0, $s3
/* A4E94 800B4694 4400438E */  lw         $v1, 0x44($s2)
/* A4E98 800B4698 1A00A597 */  lhu        $a1, 0x1A($sp)
/* A4E9C 800B469C 21180302 */  addu       $v1, $s0, $v1
/* A4EA0 800B46A0 18006394 */  lhu        $v1, 0x18($v1)
/* A4EA4 800B46A4 00000000 */  nop
/* A4EA8 800B46A8 2328A300 */  subu       $a1, $a1, $v1
/* A4EAC 800B46AC C31F0200 */  sra        $v1, $v0, 31
/* A4EB0 800B46B0 10400000 */  mfhi       $t0
/* A4EB4 800B46B4 C3200800 */  sra        $a0, $t0, 3
/* A4EB8 800B46B8 23208300 */  subu       $a0, $a0, $v1
/* A4EBC 800B46BC 80180400 */  sll        $v1, $a0, 2
/* A4EC0 800B46C0 21186400 */  addu       $v1, $v1, $a0
/* A4EC4 800B46C4 80180300 */  sll        $v1, $v1, 2
/* A4EC8 800B46C8 23104300 */  subu       $v0, $v0, $v1
/* A4ECC 800B46CC 2128A200 */  addu       $a1, $a1, $v0
/* A4ED0 800B46D0 F6FFA524 */  addiu      $a1, $a1, -0xA
/* A4ED4 800B46D4 2100C016 */  bnez       $s6, .L800B475C
/* A4ED8 800B46D8 2200A5A7 */   sh        $a1, 0x22($sp)
/* A4EDC 800B46DC 3AF2020C */  jal        rand
/* A4EE0 800B46E0 00000000 */   nop
/* A4EE4 800B46E4 18005300 */  mult       $v0, $s3
/* A4EE8 800B46E8 4400438E */  lw         $v1, 0x44($s2)
/* A4EEC 800B46EC 1C00A597 */  lhu        $a1, 0x1C($sp)
/* A4EF0 800B46F0 21180302 */  addu       $v1, $s0, $v1
/* A4EF4 800B46F4 1C006394 */  lhu        $v1, 0x1C($v1)
/* A4EF8 800B46F8 00000000 */  nop
/* A4EFC 800B46FC 2328A300 */  subu       $a1, $a1, $v1
/* A4F00 800B4700 C31F0200 */  sra        $v1, $v0, 31
/* A4F04 800B4704 10400000 */  mfhi       $t0
/* A4F08 800B4708 83200800 */  sra        $a0, $t0, 2
/* A4F0C 800B470C 23208300 */  subu       $a0, $a0, $v1
/* A4F10 800B4710 80180400 */  sll        $v1, $a0, 2
/* A4F14 800B4714 21186400 */  addu       $v1, $v1, $a0
/* A4F18 800B4718 40180300 */  sll        $v1, $v1, 1
/* A4F1C 800B471C 23104300 */  subu       $v0, $v0, $v1
/* A4F20 800B4720 2128A200 */  addu       $a1, $a1, $v0
/* A4F24 800B4724 2400A5A7 */  sh         $a1, 0x24($sp)
/* A4F28 800B4728 002C0500 */  sll        $a1, $a1, 16
/* A4F2C 800B472C 0300A01C */  bgtz       $a1, .L800B473C
/* A4F30 800B4730 1800A427 */   addiu     $a0, $sp, 0x18
/* A4F34 800B4734 01000224 */  addiu      $v0, $zero, 0x1
/* A4F38 800B4738 2400A2A7 */  sh         $v0, 0x24($sp)
.L800B473C:
/* A4F3C 800B473C 2000A527 */  addiu      $a1, $sp, 0x20
/* A4F40 800B4740 000C0224 */  addiu      $v0, $zero, 0xC00
/* A4F44 800B4744 3E00A2A7 */  sh         $v0, 0x3E($sp)
/* A4F48 800B4748 00010224 */  addiu      $v0, $zero, 0x100
/* A4F4C 800B474C 4000A2A7 */  sh         $v0, 0x40($sp)
/* A4F50 800B4750 3000A227 */  addiu      $v0, $sp, 0x30
/* A4F54 800B4754 F7D10208 */  j          .L800B47DC
/* A4F58 800B4758 2C00A0A7 */   sh        $zero, 0x2C($sp)
.L800B475C:
/* A4F5C 800B475C 01000224 */  addiu      $v0, $zero, 0x1
/* A4F60 800B4760 2200C216 */  bne        $s6, $v0, .L800B47EC
/* A4F64 800B4764 00000000 */   nop
/* A4F68 800B4768 3AF2020C */  jal        rand
/* A4F6C 800B476C 00000000 */   nop
/* A4F70 800B4770 18005300 */  mult       $v0, $s3
/* A4F74 800B4774 C31F0200 */  sra        $v1, $v0, 31
/* A4F78 800B4778 10400000 */  mfhi       $t0
/* A4F7C 800B477C C3200800 */  sra        $a0, $t0, 3
/* A4F80 800B4780 23208300 */  subu       $a0, $a0, $v1
/* A4F84 800B4784 80180400 */  sll        $v1, $a0, 2
/* A4F88 800B4788 21186400 */  addu       $v1, $v1, $a0
/* A4F8C 800B478C 80180300 */  sll        $v1, $v1, 2
/* A4F90 800B4790 23104300 */  subu       $v0, $v0, $v1
/* A4F94 800B4794 06004224 */  addiu      $v0, $v0, 0x6
/* A4F98 800B4798 3AF2020C */  jal        rand
/* A4F9C 800B479C 2400A2A7 */   sh        $v0, 0x24($sp)
/* A4FA0 800B47A0 21184000 */  addu       $v1, $v0, $zero
/* A4FA4 800B47A4 02006104 */  bgez       $v1, .L800B47B0
/* A4FA8 800B47A8 1800A427 */   addiu     $a0, $sp, 0x18
/* A4FAC 800B47AC 03006224 */  addiu      $v0, $v1, 0x3
.L800B47B0:
/* A4FB0 800B47B0 2000A527 */  addiu      $a1, $sp, 0x20
/* A4FB4 800B47B4 83100200 */  sra        $v0, $v0, 2
/* A4FB8 800B47B8 80100200 */  sll        $v0, $v0, 2
/* A4FBC 800B47BC 23106200 */  subu       $v0, $v1, $v0
/* A4FC0 800B47C0 01004224 */  addiu      $v0, $v0, 0x1
/* A4FC4 800B47C4 2C00A2A7 */  sh         $v0, 0x2C($sp)
/* A4FC8 800B47C8 00100224 */  addiu      $v0, $zero, 0x1000
/* A4FCC 800B47CC 3E00A2A7 */  sh         $v0, 0x3E($sp)
/* A4FD0 800B47D0 00080224 */  addiu      $v0, $zero, 0x800
/* A4FD4 800B47D4 4000A2A7 */  sh         $v0, 0x40($sp)
/* A4FD8 800B47D8 3000A227 */  addiu      $v0, $sp, 0x30
.L800B47DC:
/* A4FDC 800B47DC 1000A2AF */  sw         $v0, 0x10($sp)
/* A4FE0 800B47E0 3800A78E */  lw         $a3, 0x38($s5)
/* A4FE4 800B47E4 AC19010C */  jal        FX_MakeWaterBubble
/* A4FE8 800B47E8 2800A627 */   addiu     $a2, $sp, 0x28
.L800B47EC:
/* A4FEC 800B47EC 01003126 */  addiu      $s1, $s1, 0x1
/* A4FF0 800B47F0 2A103702 */  slt        $v0, $s1, $s7
/* A4FF4 800B47F4 91FF4014 */  bnez       $v0, .L800B463C
/* A4FF8 800B47F8 00000000 */   nop
.L800B47FC:
/* A4FFC 800B47FC 01009426 */  addiu      $s4, $s4, 0x1
/* A5000 800B4800 0200822A */  slti       $v0, $s4, 0x2
/* A5004 800B4804 5BFF4014 */  bnez       $v0, .L800B4574
/* A5008 800B4808 00000000 */   nop
.L800B480C:
/* A500C 800B480C 6800BF8F */  lw         $ra, 0x68($sp)
/* A5010 800B4810 6400B78F */  lw         $s7, 0x64($sp)
/* A5014 800B4814 6000B68F */  lw         $s6, 0x60($sp)
/* A5018 800B4818 5C00B58F */  lw         $s5, 0x5C($sp)
/* A501C 800B481C 5800B48F */  lw         $s4, 0x58($sp)
/* A5020 800B4820 5400B38F */  lw         $s3, 0x54($sp)
/* A5024 800B4824 5000B28F */  lw         $s2, 0x50($sp)
/* A5028 800B4828 4C00B18F */  lw         $s1, 0x4C($sp)
/* A502C 800B482C 4800B08F */  lw         $s0, 0x48($sp)
/* A5030 800B4830 0800E003 */  jr         $ra
/* A5034 800B4834 7000BD27 */   addiu     $sp, $sp, 0x70
.size TrailWaterFX, . - TrailWaterFX
