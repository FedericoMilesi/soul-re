.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BED34
/* AF534 800BED34 0D80023C */  lui        $v0, %hi(CD_read_dma_mode + 0xC)
/* AF538 800BED38 4CE4428C */  lw         $v0, %lo(CD_read_dma_mode + 0xC)($v0)
/* AF53C 800BED3C C0FFBD27 */  addiu      $sp, $sp, -0x40
/* AF540 800BED40 3800B6AF */  sw         $s6, 0x38($sp)
/* AF544 800BED44 21B08000 */  addu       $s6, $a0, $zero
/* AF548 800BED48 3C00BFAF */  sw         $ra, 0x3C($sp)
/* AF54C 800BED4C 3400B5AF */  sw         $s5, 0x34($sp)
/* AF550 800BED50 3000B4AF */  sw         $s4, 0x30($sp)
/* AF554 800BED54 2C00B3AF */  sw         $s3, 0x2C($sp)
/* AF558 800BED58 2800B2AF */  sw         $s2, 0x28($sp)
/* AF55C 800BED5C 2400B1AF */  sw         $s1, 0x24($sp)
/* AF560 800BED60 9000C212 */  beq        $s6, $v0, .L800BEFA4
/* AF564 800BED64 2000B0AF */   sw        $s0, 0x20($sp)
/* AF568 800BED68 01000424 */  addiu      $a0, $zero, 0x1
/* AF56C 800BED6C 40101600 */  sll        $v0, $s6, 1
/* AF570 800BED70 21105600 */  addu       $v0, $v0, $s6
/* AF574 800BED74 80100200 */  sll        $v0, $v0, 2
/* AF578 800BED78 23105600 */  subu       $v0, $v0, $s6
/* AF57C 800BED7C 80100200 */  sll        $v0, $v0, 2
/* AF580 800BED80 0E80053C */  lui        $a1, %hi(GsOUT_PACKET_P_dup1 + 0x85C)
/* AF584 800BED84 2128A200 */  addu       $a1, $a1, $v0
/* AF588 800BED88 C4DEA58C */  lw         $a1, %lo(GsOUT_PACKET_P_dup1 + 0x85C)($a1)
/* AF58C 800BED8C 0E80103C */  lui        $s0, %hi(GsOUT_PACKET_P_dup1 + 0x1E80)
/* AF590 800BED90 E8F41026 */  addiu      $s0, $s0, %lo(GsOUT_PACKET_P_dup1 + 0x1E80)
/* AF594 800BED94 F4FB020C */  jal        func_800BEFD0
/* AF598 800BED98 21300002 */   addu      $a2, $s0, $zero
/* AF59C 800BED9C 01000324 */  addiu      $v1, $zero, 0x1
/* AF5A0 800BEDA0 0B004310 */  beq        $v0, $v1, .L800BEDD0
/* AF5A4 800BEDA4 00000000 */   nop
/* AF5A8 800BEDA8 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF5AC 800BEDAC 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF5B0 800BEDB0 00000000 */  nop
/* AF5B4 800BEDB4 7C004018 */  blez       $v0, .L800BEFA8
/* AF5B8 800BEDB8 FFFF0224 */   addiu     $v0, $zero, -0x1
/* AF5BC 800BEDBC 0180043C */  lui        $a0, %hi(D_80012930)
/* AF5C0 800BEDC0 06D1010C */  jal        printf
/* AF5C4 800BEDC4 30298424 */   addiu     $a0, $a0, %lo(D_80012930)
/* AF5C8 800BEDC8 EAFB0208 */  j          .L800BEFA8
/* AF5CC 800BEDCC FFFF0224 */   addiu     $v0, $zero, -0x1
.L800BEDD0:
/* AF5D0 800BEDD0 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF5D4 800BEDD4 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF5D8 800BEDD8 00000000 */  nop
/* AF5DC 800BEDDC 02004228 */  slti       $v0, $v0, 0x2
/* AF5E0 800BEDE0 05004014 */  bnez       $v0, .L800BEDF8
/* AF5E4 800BEDE4 00080226 */   addiu     $v0, $s0, 0x800
/* AF5E8 800BEDE8 0180043C */  lui        $a0, %hi(D_80012950)
/* AF5EC 800BEDEC 06D1010C */  jal        printf
/* AF5F0 800BEDF0 50298424 */   addiu     $a0, $a0, %lo(D_80012950)
/* AF5F4 800BEDF4 00080226 */  addiu      $v0, $s0, 0x800
.L800BEDF8:
/* AF5F8 800BEDF8 2B100202 */  sltu       $v0, $s0, $v0
/* AF5FC 800BEDFC 55004010 */  beqz       $v0, .L800BEF54
/* AF600 800BEE00 21900000 */   addu      $s2, $zero, $zero
/* AF604 800BEE04 0E80153C */  lui        $s5, %hi(GsOUT_PACKET_P_dup1 + 0x280)
/* AF608 800BEE08 E8D8B526 */  addiu      $s5, $s5, %lo(GsOUT_PACKET_P_dup1 + 0x280)
/* AF60C 800BEE0C 0800B326 */  addiu      $s3, $s5, 0x8
/* AF610 800BEE10 21880000 */  addu       $s1, $zero, $zero
/* AF614 800BEE14 21A0A002 */  addu       $s4, $s5, $zero
.L800BEE18:
/* AF618 800BEE18 00000292 */  lbu        $v0, 0x0($s0)
/* AF61C 800BEE1C 00000000 */  nop
/* AF620 800BEE20 4C004010 */  beqz       $v0, .L800BEF54
/* AF624 800BEE24 00000000 */   nop
/* AF628 800BEE28 0500028A */  lwl        $v0, 0x5($s0)
/* AF62C 800BEE2C 0200029A */  lwr        $v0, 0x2($s0)
/* AF630 800BEE30 00000000 */  nop
/* AF634 800BEE34 1B00A2AB */  swl        $v0, 0x1B($sp)
/* AF638 800BEE38 1800A2BB */  swr        $v0, 0x18($sp)
/* AF63C 800BEE3C 1800A48F */  lw         $a0, 0x18($sp)
/* AF640 800BEE40 15FC020C */  jal        func_800BF054
/* AF644 800BEE44 21288002 */   addu      $a1, $s4, $zero
/* AF648 800BEE48 0400A226 */  addiu      $v0, $s5, 0x4
/* AF64C 800BEE4C 21102202 */  addu       $v0, $s1, $v0
/* AF650 800BEE50 0D00038A */  lwl        $v1, 0xD($s0)
/* AF654 800BEE54 0A00039A */  lwr        $v1, 0xA($s0)
/* AF658 800BEE58 00000000 */  nop
/* AF65C 800BEE5C 030043A8 */  swl        $v1, 0x3($v0)
/* AF660 800BEE60 000043B8 */  swr        $v1, 0x0($v0)
/* AF664 800BEE64 05004012 */  beqz       $s2, .L800BEE7C
/* AF668 800BEE68 01000224 */   addiu     $v0, $zero, 0x1
/* AF66C 800BEE6C 07004212 */  beq        $s2, $v0, .L800BEE8C
/* AF670 800BEE70 21206002 */   addu      $a0, $s3, $zero
/* AF674 800BEE74 AAFB0208 */  j          .L800BEEA8
/* AF678 800BEE78 00000000 */   nop
.L800BEE7C:
/* AF67C 800BEE7C 0180023C */  lui        $v0, %hi(D_8001296C)
/* AF680 800BEE80 6C294294 */  lhu        $v0, %lo(D_8001296C)($v0)
/* AF684 800BEE84 B1FB0208 */  j          .L800BEEC4
/* AF688 800BEE88 0800A2A6 */   sh        $v0, 0x8($s5)
.L800BEE8C:
/* AF68C 800BEE8C 0180023C */  lui        $v0, %hi(D_80012970)
/* AF690 800BEE90 70294284 */  lh         $v0, %lo(D_80012970)($v0)
/* AF694 800BEE94 0180033C */  lui        $v1, %hi(D_80012972)
/* AF698 800BEE98 72296380 */  lb         $v1, %lo(D_80012972)($v1)
/* AF69C 800BEE9C 2000A2A6 */  sh         $v0, 0x20($s5)
/* AF6A0 800BEEA0 B1FB0208 */  j          .L800BEEC4
/* AF6A4 800BEEA4 2200A3A2 */   sb        $v1, 0x22($s5)
.L800BEEA8:
/* AF6A8 800BEEA8 20000692 */  lbu        $a2, 0x20($s0)
/* AF6AC 800BEEAC 02E5010C */  jal        func_80079408
/* AF6B0 800BEEB0 21000526 */   addiu     $a1, $s0, 0x21
/* AF6B4 800BEEB4 20000292 */  lbu        $v0, 0x20($s0)
/* AF6B8 800BEEB8 00000000 */  nop
/* AF6BC 800BEEBC 21106202 */  addu       $v0, $s3, $v0
/* AF6C0 800BEEC0 000040A0 */  sb         $zero, 0x0($v0)
.L800BEEC4:
/* AF6C4 800BEEC4 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF6C8 800BEEC8 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF6CC 800BEECC 00000000 */  nop
/* AF6D0 800BEED0 02004228 */  slti       $v0, $v0, 0x2
/* AF6D4 800BEED4 12004014 */  bnez       $v0, .L800BEF20
/* AF6D8 800BEED8 00000000 */   nop
/* AF6DC 800BEEDC 0E80053C */  lui        $a1, %hi(GsOUT_PACKET_P_dup1 + 0x280)
/* AF6E0 800BEEE0 2128B100 */  addu       $a1, $a1, $s1
/* AF6E4 800BEEE4 E8D8A590 */  lbu        $a1, %lo(GsOUT_PACKET_P_dup1 + 0x280)($a1)
/* AF6E8 800BEEE8 0E80063C */  lui        $a2, %hi(GsOUT_PACKET_P_dup1 + 0x281)
/* AF6EC 800BEEEC 2130D100 */  addu       $a2, $a2, $s1
/* AF6F0 800BEEF0 E9D8C690 */  lbu        $a2, %lo(GsOUT_PACKET_P_dup1 + 0x281)($a2)
/* AF6F4 800BEEF4 0E80073C */  lui        $a3, %hi(GsOUT_PACKET_P_dup1 + 0x282)
/* AF6F8 800BEEF8 2138F100 */  addu       $a3, $a3, $s1
/* AF6FC 800BEEFC EAD8E790 */  lbu        $a3, %lo(GsOUT_PACKET_P_dup1 + 0x282)($a3)
/* AF700 800BEF00 0E80023C */  lui        $v0, %hi(GsOUT_PACKET_P_dup1 + 0x284)
/* AF704 800BEF04 21105100 */  addu       $v0, $v0, $s1
/* AF708 800BEF08 ECD8428C */  lw         $v0, %lo(GsOUT_PACKET_P_dup1 + 0x284)($v0)
/* AF70C 800BEF0C 0180043C */  lui        $a0, %hi(D_80012974)
/* AF710 800BEF10 74298424 */  addiu      $a0, $a0, %lo(D_80012974)
/* AF714 800BEF14 1400B3AF */  sw         $s3, 0x14($sp)
/* AF718 800BEF18 06D1010C */  jal        printf
/* AF71C 800BEF1C 1000A2AF */   sw        $v0, 0x10($sp)
.L800BEF20:
/* AF720 800BEF20 18007326 */  addiu      $s3, $s3, 0x18
/* AF724 800BEF24 18003126 */  addiu      $s1, $s1, 0x18
/* AF728 800BEF28 00000292 */  lbu        $v0, 0x0($s0)
/* AF72C 800BEF2C 01005226 */  addiu      $s2, $s2, 0x1
/* AF730 800BEF30 21800202 */  addu       $s0, $s0, $v0
/* AF734 800BEF34 4000422A */  slti       $v0, $s2, 0x40
/* AF738 800BEF38 06004010 */  beqz       $v0, .L800BEF54
/* AF73C 800BEF3C 18009426 */   addiu     $s4, $s4, 0x18
/* AF740 800BEF40 0E80023C */  lui        $v0, %hi(SpuCommonError)
/* AF744 800BEF44 E8FC4224 */  addiu      $v0, $v0, %lo(SpuCommonError)
/* AF748 800BEF48 2B100202 */  sltu       $v0, $s0, $v0
/* AF74C 800BEF4C B2FF4014 */  bnez       $v0, .L800BEE18
/* AF750 800BEF50 00000000 */   nop
.L800BEF54:
/* AF754 800BEF54 0D80013C */  lui        $at, %hi(CD_read_dma_mode + 0xC)
/* AF758 800BEF58 4CE436AC */  sw         $s6, %lo(CD_read_dma_mode + 0xC)($at)
/* AF75C 800BEF5C 4000422A */  slti       $v0, $s2, 0x40
/* AF760 800BEF60 06004010 */  beqz       $v0, .L800BEF7C
/* AF764 800BEF64 40101200 */   sll       $v0, $s2, 1
/* AF768 800BEF68 21105200 */  addu       $v0, $v0, $s2
/* AF76C 800BEF6C C0100200 */  sll        $v0, $v0, 3
/* AF770 800BEF70 0E80013C */  lui        $at, %hi(GsOUT_PACKET_P_dup1 + 0x288)
/* AF774 800BEF74 21082200 */  addu       $at, $at, $v0
/* AF778 800BEF78 F0D820A0 */  sb         $zero, %lo(GsOUT_PACKET_P_dup1 + 0x288)($at)
.L800BEF7C:
/* AF77C 800BEF7C 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF780 800BEF80 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF784 800BEF84 00000000 */  nop
/* AF788 800BEF88 02004228 */  slti       $v0, $v0, 0x2
/* AF78C 800BEF8C 06004014 */  bnez       $v0, .L800BEFA8
/* AF790 800BEF90 01000224 */   addiu     $v0, $zero, 0x1
/* AF794 800BEF94 0180043C */  lui        $a0, %hi(D_80012990)
/* AF798 800BEF98 90298424 */  addiu      $a0, $a0, %lo(D_80012990)
/* AF79C 800BEF9C 06D1010C */  jal        printf
/* AF7A0 800BEFA0 21284002 */   addu      $a1, $s2, $zero
.L800BEFA4:
/* AF7A4 800BEFA4 01000224 */  addiu      $v0, $zero, 0x1
.L800BEFA8:
/* AF7A8 800BEFA8 3C00BF8F */  lw         $ra, 0x3C($sp)
/* AF7AC 800BEFAC 3800B68F */  lw         $s6, 0x38($sp)
/* AF7B0 800BEFB0 3400B58F */  lw         $s5, 0x34($sp)
/* AF7B4 800BEFB4 3000B48F */  lw         $s4, 0x30($sp)
/* AF7B8 800BEFB8 2C00B38F */  lw         $s3, 0x2C($sp)
/* AF7BC 800BEFBC 2800B28F */  lw         $s2, 0x28($sp)
/* AF7C0 800BEFC0 2400B18F */  lw         $s1, 0x24($sp)
/* AF7C4 800BEFC4 2000B08F */  lw         $s0, 0x20($sp)
/* AF7C8 800BEFC8 0800E003 */  jr         $ra
/* AF7CC 800BEFCC 4000BD27 */   addiu     $sp, $sp, 0x40
.size func_800BED34, . - func_800BED34
