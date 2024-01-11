.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _spu_t
/* B6D20 800C6520 0000A4AF */  sw         $a0, 0x0($sp)
/* B6D24 800C6524 0400A5AF */  sw         $a1, 0x4($sp)
/* B6D28 800C6528 0800A6AF */  sw         $a2, 0x8($sp)
/* B6D2C 800C652C 0C00A7AF */  sw         $a3, 0xC($sp)
/* B6D30 800C6530 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B6D34 800C6534 1000B0AF */  sw         $s0, 0x10($sp)
/* B6D38 800C6538 1C00B027 */  addiu      $s0, $sp, 0x1C
/* B6D3C 800C653C 01000624 */  addiu      $a2, $zero, 0x1
/* B6D40 800C6540 1400BFAF */  sw         $ra, 0x14($sp)
/* B6D44 800C6544 19008610 */  beq        $a0, $a2, .L800C65AC
/* B6D48 800C6548 1800A4AF */   sw        $a0, 0x18($sp)
/* B6D4C 800C654C 02008228 */  slti       $v0, $a0, 0x2
/* B6D50 800C6550 05004010 */  beqz       $v0, .L800C6568
/* B6D54 800C6554 02000224 */   addiu     $v0, $zero, 0x2
/* B6D58 800C6558 2F008010 */  beqz       $a0, .L800C6618
/* B6D5C 800C655C 21100000 */   addu      $v0, $zero, $zero
/* B6D60 800C6560 E4190308 */  j          .L800C6790
/* B6D64 800C6564 00000000 */   nop
.L800C6568:
/* B6D68 800C6568 05008210 */  beq        $a0, $v0, .L800C6580
/* B6D6C 800C656C 03000224 */   addiu     $v0, $zero, 0x3
/* B6D70 800C6570 43008210 */  beq        $a0, $v0, .L800C6680
/* B6D74 800C6574 21100000 */   addu      $v0, $zero, $zero
/* B6D78 800C6578 E4190308 */  j          .L800C6790
/* B6D7C 800C657C 00000000 */   nop
.L800C6580:
/* B6D80 800C6580 1C00A48F */  lw         $a0, 0x1C($sp)
/* B6D84 800C6584 0D80023C */  lui        $v0, %hi(_spu_mem_mode_plus)
/* B6D88 800C6588 84ED428C */  lw         $v0, %lo(_spu_mem_mode_plus)($v0)
/* B6D8C 800C658C 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B6D90 800C6590 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B6D94 800C6594 06104400 */  srlv       $v0, $a0, $v0
/* B6D98 800C6598 0D80013C */  lui        $at, %hi(_spu_tsa)
/* B6D9C 800C659C 74ED22A4 */  sh         $v0, %lo(_spu_tsa)($at)
/* B6DA0 800C65A0 A60162A4 */  sh         $v0, 0x1A6($v1)
/* B6DA4 800C65A4 E4190308 */  j          .L800C6790
/* B6DA8 800C65A8 21100000 */   addu      $v0, $zero, $zero
.L800C65AC:
/* B6DAC 800C65AC 0D80053C */  lui        $a1, %hi(_spu_RXX)
/* B6DB0 800C65B0 5CEDA58C */  lw         $a1, %lo(_spu_RXX)($a1)
/* B6DB4 800C65B4 0D80043C */  lui        $a0, %hi(_spu_tsa)
/* B6DB8 800C65B8 74ED8494 */  lhu        $a0, %lo(_spu_tsa)($a0)
/* B6DBC 800C65BC A601A294 */  lhu        $v0, 0x1A6($a1)
/* B6DC0 800C65C0 0D80013C */  lui        $at, %hi(_spu_IRQCallback + 0x14)
/* B6DC4 800C65C4 ACED20AC */  sw         $zero, %lo(_spu_IRQCallback + 0x14)($at)
/* B6DC8 800C65C8 09004410 */  beq        $v0, $a0, .L800C65F0
/* B6DCC 800C65CC 21180000 */   addu      $v1, $zero, $zero
/* B6DD0 800C65D0 01006324 */  addiu      $v1, $v1, 0x1
.L800C65D4:
/* B6DD4 800C65D4 010F622C */  sltiu      $v0, $v1, 0xF01
/* B6DD8 800C65D8 6D004010 */  beqz       $v0, .L800C6790
/* B6DDC 800C65DC FEFF0224 */   addiu     $v0, $zero, -0x2
/* B6DE0 800C65E0 A601A294 */  lhu        $v0, 0x1A6($a1)
/* B6DE4 800C65E4 00000000 */  nop
/* B6DE8 800C65E8 FAFF4414 */  bne        $v0, $a0, .L800C65D4
/* B6DEC 800C65EC 01006324 */   addiu     $v1, $v1, 0x1
.L800C65F0:
/* B6DF0 800C65F0 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B6DF4 800C65F4 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B6DF8 800C65F8 00000000 */  nop
/* B6DFC 800C65FC AA016294 */  lhu        $v0, 0x1AA($v1)
/* B6E00 800C6600 00000000 */  nop
/* B6E04 800C6604 CFFF4230 */  andi       $v0, $v0, 0xFFCF
/* B6E08 800C6608 20004234 */  ori        $v0, $v0, 0x20
/* B6E0C 800C660C AA0162A4 */  sh         $v0, 0x1AA($v1)
/* B6E10 800C6610 E4190308 */  j          .L800C6790
/* B6E14 800C6614 21100000 */   addu      $v0, $zero, $zero
.L800C6618:
/* B6E18 800C6618 0D80053C */  lui        $a1, %hi(_spu_RXX)
/* B6E1C 800C661C 5CEDA58C */  lw         $a1, %lo(_spu_RXX)($a1)
/* B6E20 800C6620 0D80043C */  lui        $a0, %hi(_spu_tsa)
/* B6E24 800C6624 74ED8494 */  lhu        $a0, %lo(_spu_tsa)($a0)
/* B6E28 800C6628 A601A294 */  lhu        $v0, 0x1A6($a1)
/* B6E2C 800C662C 0D80013C */  lui        $at, %hi(_spu_IRQCallback + 0x14)
/* B6E30 800C6630 ACED26AC */  sw         $a2, %lo(_spu_IRQCallback + 0x14)($at)
/* B6E34 800C6634 09004410 */  beq        $v0, $a0, .L800C665C
/* B6E38 800C6638 21180000 */   addu      $v1, $zero, $zero
/* B6E3C 800C663C 01006324 */  addiu      $v1, $v1, 0x1
.L800C6640:
/* B6E40 800C6640 010F622C */  sltiu      $v0, $v1, 0xF01
/* B6E44 800C6644 52004010 */  beqz       $v0, .L800C6790
/* B6E48 800C6648 FEFF0224 */   addiu     $v0, $zero, -0x2
/* B6E4C 800C664C A601A294 */  lhu        $v0, 0x1A6($a1)
/* B6E50 800C6650 00000000 */  nop
/* B6E54 800C6654 FAFF4414 */  bne        $v0, $a0, .L800C6640
/* B6E58 800C6658 01006324 */   addiu     $v1, $v1, 0x1
.L800C665C:
/* B6E5C 800C665C 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B6E60 800C6660 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B6E64 800C6664 00000000 */  nop
/* B6E68 800C6668 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B6E6C 800C666C 00000000 */  nop
/* B6E70 800C6670 30004234 */  ori        $v0, $v0, 0x30
/* B6E74 800C6674 AA0162A4 */  sh         $v0, 0x1AA($v1)
/* B6E78 800C6678 E4190308 */  j          .L800C6790
/* B6E7C 800C667C 21100000 */   addu      $v0, $zero, $zero
.L800C6680:
/* B6E80 800C6680 0D80023C */  lui        $v0, %hi(_spu_IRQCallback + 0x14)
/* B6E84 800C6684 ACED428C */  lw         $v0, %lo(_spu_IRQCallback + 0x14)($v0)
/* B6E88 800C6688 00000000 */  nop
/* B6E8C 800C668C 02004614 */  bne        $v0, $a2, .L800C6698
/* B6E90 800C6690 20000424 */   addiu     $a0, $zero, 0x20
/* B6E94 800C6694 30000424 */  addiu      $a0, $zero, 0x30
.L800C6698:
/* B6E98 800C6698 0D80053C */  lui        $a1, %hi(_spu_RXX)
/* B6E9C 800C669C 5CEDA58C */  lw         $a1, %lo(_spu_RXX)($a1)
/* B6EA0 800C66A0 21180000 */  addu       $v1, $zero, $zero
/* B6EA4 800C66A4 AA01A294 */  lhu        $v0, 0x1AA($a1)
/* B6EA8 800C66A8 FFFF8430 */  andi       $a0, $a0, 0xFFFF
/* B6EAC 800C66AC 30004230 */  andi       $v0, $v0, 0x30
/* B6EB0 800C66B0 09004410 */  beq        $v0, $a0, .L800C66D8
/* B6EB4 800C66B4 01006324 */   addiu     $v1, $v1, 0x1
.L800C66B8:
/* B6EB8 800C66B8 010F622C */  sltiu      $v0, $v1, 0xF01
/* B6EBC 800C66BC 34004010 */  beqz       $v0, .L800C6790
/* B6EC0 800C66C0 FEFF0224 */   addiu     $v0, $zero, -0x2
/* B6EC4 800C66C4 AA01A294 */  lhu        $v0, 0x1AA($a1)
/* B6EC8 800C66C8 00000000 */  nop
/* B6ECC 800C66CC 30004230 */  andi       $v0, $v0, 0x30
/* B6ED0 800C66D0 F9FF4414 */  bne        $v0, $a0, .L800C66B8
/* B6ED4 800C66D4 01006324 */   addiu     $v1, $v1, 0x1
.L800C66D8:
/* B6ED8 800C66D8 0D80033C */  lui        $v1, %hi(_spu_IRQCallback + 0x14)
/* B6EDC 800C66DC ACED638C */  lw         $v1, %lo(_spu_IRQCallback + 0x14)($v1)
/* B6EE0 800C66E0 01000224 */  addiu      $v0, $zero, 0x1
/* B6EE4 800C66E4 05006214 */  bne        $v1, $v0, .L800C66FC
/* B6EE8 800C66E8 00000000 */   nop
/* B6EEC 800C66EC 7C1A030C */  jal        func_800C69F0
/* B6EF0 800C66F0 04001026 */   addiu     $s0, $s0, 0x4
/* B6EF4 800C66F4 C2190308 */  j          .L800C6708
/* B6EF8 800C66F8 0001063C */   lui       $a2, (0x1000201 >> 16)
.L800C66FC:
/* B6EFC 800C66FC 721A030C */  jal        func_800C69C8
/* B6F00 800C6700 04001026 */   addiu     $s0, $s0, 0x4
/* B6F04 800C6704 0001063C */  lui        $a2, (0x1000201 >> 16)
.L800C6708:
/* B6F08 800C6708 FCFF048E */  lw         $a0, -0x4($s0)
/* B6F0C 800C670C 0D80013C */  lui        $at, %hi(_spu_IRQCallback + 0x18)
/* B6F10 800C6710 B0ED24AC */  sw         $a0, %lo(_spu_IRQCallback + 0x18)($at)
/* B6F14 800C6714 0000048E */  lw         $a0, 0x0($s0)
/* B6F18 800C6718 0D80053C */  lui        $a1, %hi(_spu_RXX + 0x4)
/* B6F1C 800C671C 60EDA58C */  lw         $a1, %lo(_spu_RXX + 0x4)($a1)
/* B6F20 800C6720 82190400 */  srl        $v1, $a0, 6
/* B6F24 800C6724 3F008230 */  andi       $v0, $a0, 0x3F
/* B6F28 800C6728 2B100200 */  sltu       $v0, $zero, $v0
/* B6F2C 800C672C 0D80043C */  lui        $a0, %hi(_spu_IRQCallback + 0x18)
/* B6F30 800C6730 B0ED848C */  lw         $a0, %lo(_spu_IRQCallback + 0x18)($a0)
/* B6F34 800C6734 21186200 */  addu       $v1, $v1, $v0
/* B6F38 800C6738 0D80013C */  lui        $at, %hi(_spu_IRQCallback + 0x1C)
/* B6F3C 800C673C B4ED23AC */  sw         $v1, %lo(_spu_IRQCallback + 0x1C)($at)
/* B6F40 800C6740 0000A4AC */  sw         $a0, 0x0($a1)
/* B6F44 800C6744 0D80023C */  lui        $v0, %hi(_spu_IRQCallback + 0x1C)
/* B6F48 800C6748 B4ED428C */  lw         $v0, %lo(_spu_IRQCallback + 0x1C)($v0)
/* B6F4C 800C674C 0D80033C */  lui        $v1, %hi(_spu_RXX + 0x8)
/* B6F50 800C6750 64ED638C */  lw         $v1, %lo(_spu_RXX + 0x8)($v1)
/* B6F54 800C6754 00140200 */  sll        $v0, $v0, 16
/* B6F58 800C6758 10004234 */  ori        $v0, $v0, 0x10
/* B6F5C 800C675C 000062AC */  sw         $v0, 0x0($v1)
/* B6F60 800C6760 0D80033C */  lui        $v1, %hi(_spu_IRQCallback + 0x14)
/* B6F64 800C6764 ACED638C */  lw         $v1, %lo(_spu_IRQCallback + 0x14)($v1)
/* B6F68 800C6768 01000224 */  addiu      $v0, $zero, 0x1
/* B6F6C 800C676C 03006214 */  bne        $v1, $v0, .L800C677C
/* B6F70 800C6770 0102C634 */   ori       $a2, $a2, (0x1000201 & 0xFFFF)
/* B6F74 800C6774 0001063C */  lui        $a2, (0x1000200 >> 16)
/* B6F78 800C6778 0002C634 */  ori        $a2, $a2, (0x1000200 & 0xFFFF)
.L800C677C:
/* B6F7C 800C677C 0D80023C */  lui        $v0, %hi(_spu_RXX + 0xC)
/* B6F80 800C6780 68ED428C */  lw         $v0, %lo(_spu_RXX + 0xC)($v0)
/* B6F84 800C6784 00000000 */  nop
/* B6F88 800C6788 000046AC */  sw         $a2, 0x0($v0)
/* B6F8C 800C678C 21100000 */  addu       $v0, $zero, $zero
.L800C6790:
/* B6F90 800C6790 1400BF8F */  lw         $ra, 0x14($sp)
/* B6F94 800C6794 1000B08F */  lw         $s0, 0x10($sp)
/* B6F98 800C6798 0800E003 */  jr         $ra
/* B6F9C 800C679C 1800BD27 */   addiu     $sp, $sp, 0x18
.size _spu_t, . - _spu_t
