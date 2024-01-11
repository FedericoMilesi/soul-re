.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerAttack2
/* 8C5E4 8009BDE4 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 8C5E8 8009BDE8 5000B4AF */  sw         $s4, 0x50($sp)
/* 8C5EC 8009BDEC 21A08000 */  addu       $s4, $a0, $zero
/* 8C5F0 8009BDF0 5400B5AF */  sw         $s5, 0x54($sp)
/* 8C5F4 8009BDF4 21A8A000 */  addu       $s5, $a1, $zero
/* 8C5F8 8009BDF8 6400BFAF */  sw         $ra, 0x64($sp)
/* 8C5FC 8009BDFC 6000BEAF */  sw         $fp, 0x60($sp)
/* 8C600 8009BE00 5C00B7AF */  sw         $s7, 0x5C($sp)
/* 8C604 8009BE04 5800B6AF */  sw         $s6, 0x58($sp)
/* 8C608 8009BE08 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 8C60C 8009BE0C 4800B2AF */  sw         $s2, 0x48($sp)
/* 8C610 8009BE10 4400B1AF */  sw         $s1, 0x44($sp)
/* 8C614 8009BE14 4000B0AF */  sw         $s0, 0x40($sp)
/* 8C618 8009BE18 F6C9010C */  jal        G2EmulationQueryFrame
/* 8C61C 8009BE1C 7000A6AF */   sw        $a2, 0x70($sp)
/* 8C620 8009BE20 21208002 */  addu       $a0, $s4, $zero
/* 8C624 8009BE24 2128A002 */  addu       $a1, $s5, $zero
/* 8C628 8009BE28 A9C9010C */  jal        G2EmulationQueryAnimation
/* 8C62C 8009BE2C 3000A2AF */   sw        $v0, 0x30($sp)
/* 8C630 8009BE30 3800A0AF */  sw         $zero, 0x38($sp)
/* 8C634 8009BE34 3C00A0AF */  sw         $zero, 0x3C($sp)
/* 8C638 8009BE38 1C00A016 */  bnez       $s5, .L8009BEAC
/* 8C63C 8009BE3C 3400A2AF */   sw        $v0, 0x34($sp)
/* 8C640 8009BE40 C8FD838F */  lw         $v1, %gp_rel(ControlFlag)($gp)
/* 8C644 8009BE44 00000000 */  nop
/* 8C648 8009BE48 20006230 */  andi       $v0, $v1, 0x20
/* 8C64C 8009BE4C 13004014 */  bnez       $v0, .L8009BE9C
/* 8C650 8009BE50 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 8C654 8009BE54 24106200 */  and        $v0, $v1, $v0
/* 8C658 8009BE58 15004010 */  beqz       $v0, .L8009BEB0
/* 8C65C 8009BE5C C0101500 */   sll       $v0, $s5, 3
/* 8C660 8009BE60 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8C664 8009BE64 00000000 */  nop
/* 8C668 8009BE68 02004230 */  andi       $v0, $v0, 0x2
/* 8C66C 8009BE6C 10004014 */  bnez       $v0, .L8009BEB0
/* 8C670 8009BE70 C0101500 */   sll       $v0, $s5, 3
/* 8C674 8009BE74 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 8C678 8009BE78 0080033C */  lui        $v1, (0x8000000F >> 16)
/* 8C67C 8009BE7C 0000428C */  lw         $v0, 0x0($v0)
/* 8C680 8009BE80 0F006334 */  ori        $v1, $v1, (0x8000000F & 0xFFFF)
/* 8C684 8009BE84 24104300 */  and        $v0, $v0, $v1
/* 8C688 8009BE88 04004010 */  beqz       $v0, .L8009BE9C
/* 8C68C 8009BE8C 02000524 */   addiu     $a1, $zero, 0x2
/* 8C690 8009BE90 0000848E */  lw         $a0, 0x0($s4)
/* 8C694 8009BE94 A96F0208 */  j          .L8009BEA4
/* 8C698 8009BE98 00000000 */   nop
.L8009BE9C:
/* 8C69C 8009BE9C 0000848E */  lw         $a0, 0x0($s4)
/* 8C6A0 8009BEA0 21280000 */  addu       $a1, $zero, $zero
.L8009BEA4:
/* 8C6A4 8009BEA4 938B020C */  jal        SteerSwitchMode
/* 8C6A8 8009BEA8 00000000 */   nop
.L8009BEAC:
/* 8C6AC 8009BEAC C0101500 */  sll        $v0, $s5, 3
.L8009BEB0:
/* 8C6B0 8009BEB0 21105500 */  addu       $v0, $v0, $s5
/* 8C6B4 8009BEB4 C0100200 */  sll        $v0, $v0, 3
/* 8C6B8 8009BEB8 23105500 */  subu       $v0, $v0, $s5
/* 8C6BC 8009BEBC 80F00200 */  sll        $fp, $v0, 2
/* 8C6C0 8009BEC0 21B89E02 */  addu       $s7, $s4, $fp
/* 8C6C4 8009BEC4 01001624 */  addiu      $s6, $zero, 0x1
/* 8C6C8 8009BEC8 2110D403 */  addu       $v0, $fp, $s4
.L8009BECC:
/* 8C6CC 8009BECC 0C005024 */  addiu      $s0, $v0, 0xC
/* 8C6D0 8009BED0 39C3010C */  jal        PeekMessageQueue
/* 8C6D4 8009BED4 21200002 */   addu      $a0, $s0, $zero
/* 8C6D8 8009BED8 21884000 */  addu       $s1, $v0, $zero
/* 8C6DC 8009BEDC BF032012 */  beqz       $s1, .L8009CDDC
/* 8C6E0 8009BEE0 0001023C */   lui       $v0, (0x1000002 >> 16)
/* 8C6E4 8009BEE4 0000238E */  lw         $v1, 0x0($s1)
/* 8C6E8 8009BEE8 02004234 */  ori        $v0, $v0, (0x1000002 & 0xFFFF)
/* 8C6EC 8009BEEC 3E026210 */  beq        $v1, $v0, .L8009C7E8
/* 8C6F0 8009BEF0 2A104300 */   slt       $v0, $v0, $v1
/* 8C6F4 8009BEF4 30004014 */  bnez       $v0, .L8009BFB8
/* 8C6F8 8009BEF8 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 8C6FC 8009BEFC 1000023C */  lui        $v0, (0x100001 >> 16)
/* 8C700 8009BF00 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 8C704 8009BF04 59006210 */  beq        $v1, $v0, .L8009C06C
/* 8C708 8009BF08 2A104300 */   slt       $v0, $v0, $v1
/* 8C70C 8009BF0C 14004014 */  bnez       $v0, .L8009BF60
/* 8C710 8009BF10 1000023C */   lui       $v0, (0x100015 >> 16)
/* 8C714 8009BF14 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 8C718 8009BF18 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 8C71C 8009BF1C B4016210 */  beq        $v1, $v0, .L8009C5F0
/* 8C720 8009BF20 2A104300 */   slt       $v0, $v0, $v1
/* 8C724 8009BF24 08004014 */  bnez       $v0, .L8009BF48
/* 8C728 8009BF28 0800023C */   lui       $v0, (0x80000 >> 16)
/* 8C72C 8009BF2C 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 8C730 8009BF30 19016210 */  beq        $v1, $v0, .L8009C398
/* 8C734 8009BF34 01004234 */   ori       $v0, $v0, (0x80000001 & 0xFFFF)
/* 8C738 8009BF38 61036210 */  beq        $v1, $v0, .L8009CCC0
/* 8C73C 8009BF3C 21208002 */   addu      $a0, $s4, $zero
/* 8C740 8009BF40 6F730208 */  j          .L8009CDBC
/* 8C744 8009BF44 00000000 */   nop
.L8009BF48:
/* 8C748 8009BF48 0C036210 */  beq        $v1, $v0, .L8009CB7C
/* 8C74C 8009BF4C 1000023C */   lui       $v0, (0x100015 >> 16)
/* 8C750 8009BF50 B6016210 */  beq        $v1, $v0, .L8009C62C
/* 8C754 8009BF54 21208002 */   addu      $a0, $s4, $zero
/* 8C758 8009BF58 6F730208 */  j          .L8009CDBC
/* 8C75C 8009BF5C 00000000 */   nop
.L8009BF60:
/* 8C760 8009BF60 15004234 */  ori        $v0, $v0, (0x100015 & 0xFFFF)
/* 8C764 8009BF64 F7006210 */  beq        $v1, $v0, .L8009C344
/* 8C768 8009BF68 2A104300 */   slt       $v0, $v0, $v1
/* 8C76C 8009BF6C 0A004014 */  bnez       $v0, .L8009BF98
/* 8C770 8009BF70 8000023C */   lui       $v0, (0x800010 >> 16)
/* 8C774 8009BF74 1000023C */  lui        $v0, (0x100002 >> 16)
/* 8C778 8009BF78 02004234 */  ori        $v0, $v0, (0x100002 & 0xFFFF)
/* 8C77C 8009BF7C 17026210 */  beq        $v1, $v0, .L8009C7DC
/* 8C780 8009BF80 1000023C */   lui       $v0, (0x100004 >> 16)
/* 8C784 8009BF84 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 8C788 8009BF88 29016210 */  beq        $v1, $v0, .L8009C430
/* 8C78C 8009BF8C 21208002 */   addu      $a0, $s4, $zero
/* 8C790 8009BF90 6F730208 */  j          .L8009CDBC
/* 8C794 8009BF94 00000000 */   nop
.L8009BF98:
/* 8C798 8009BF98 10004234 */  ori        $v0, $v0, (0x800010 & 0xFFFF)
/* 8C79C 8009BF9C EF026210 */  beq        $v1, $v0, .L8009CB5C
/* 8C7A0 8009BFA0 0001023C */   lui       $v0, (0x1000001 >> 16)
/* 8C7A4 8009BFA4 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 8C7A8 8009BFA8 87036210 */  beq        $v1, $v0, .L8009CDC8
/* 8C7AC 8009BFAC 21208002 */   addu      $a0, $s4, $zero
/* 8C7B0 8009BFB0 6F730208 */  j          .L8009CDBC
/* 8C7B4 8009BFB4 00000000 */   nop
.L8009BFB8:
/* 8C7B8 8009BFB8 F7006210 */  beq        $v1, $v0, .L8009C398
/* 8C7BC 8009BFBC 2A104300 */   slt       $v0, $v0, $v1
/* 8C7C0 8009BFC0 17004014 */  bnez       $v0, .L8009C020
/* 8C7C4 8009BFC4 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 8C7C8 8009BFC8 0001023C */  lui        $v0, (0x100001F >> 16)
/* 8C7CC 8009BFCC 1F004234 */  ori        $v0, $v0, (0x100001F & 0xFFFF)
/* 8C7D0 8009BFD0 61036210 */  beq        $v1, $v0, .L8009CD58
/* 8C7D4 8009BFD4 2A104300 */   slt       $v0, $v0, $v1
/* 8C7D8 8009BFD8 09004014 */  bnez       $v0, .L8009C000
/* 8C7DC 8009BFDC 0001023C */   lui       $v0, (0x100000A >> 16)
/* 8C7E0 8009BFE0 0A004234 */  ori        $v0, $v0, (0x100000A & 0xFFFF)
/* 8C7E4 8009BFE4 0B026210 */  beq        $v1, $v0, .L8009C814
/* 8C7E8 8009BFE8 0001023C */   lui       $v0, (0x1000018 >> 16)
/* 8C7EC 8009BFEC 18004234 */  ori        $v0, $v0, (0x1000018 & 0xFFFF)
/* 8C7F0 8009BFF0 67026210 */  beq        $v1, $v0, .L8009C990
/* 8C7F4 8009BFF4 21208002 */   addu      $a0, $s4, $zero
/* 8C7F8 8009BFF8 6F730208 */  j          .L8009CDBC
/* 8C7FC 8009BFFC 00000000 */   nop
.L8009C000:
/* 8C800 8009C000 23004234 */  ori        $v0, $v0, (0x1000023 & 0xFFFF)
/* 8C804 8009C004 AA026210 */  beq        $v1, $v0, .L8009CAB0
/* 8C808 8009C008 0001023C */   lui       $v0, (0x1000024 >> 16)
/* 8C80C 8009C00C 24004234 */  ori        $v0, $v0, (0x1000024 & 0xFFFF)
/* 8C810 8009C010 ED026210 */  beq        $v1, $v0, .L8009CBC8
/* 8C814 8009C014 21208002 */   addu      $a0, $s4, $zero
/* 8C818 8009C018 6F730208 */  j          .L8009CDBC
/* 8C81C 8009C01C 00000000 */   nop
.L8009C020:
/* 8C820 8009C020 69036210 */  beq        $v1, $v0, .L8009CDC8
/* 8C824 8009C024 2A104300 */   slt       $v0, $v0, $v1
/* 8C828 8009C028 0A004014 */  bnez       $v0, .L8009C054
/* 8C82C 8009C02C 0008023C */   lui       $v0, (0x8000004 >> 16)
/* 8C830 8009C030 0002023C */  lui        $v0, (0x2000002 >> 16)
/* 8C834 8009C034 02004234 */  ori        $v0, $v0, (0x2000002 & 0xFFFF)
/* 8C838 8009C038 E6026210 */  beq        $v1, $v0, .L8009CBD4
/* 8C83C 8009C03C 0104023C */   lui       $v0, (0x4010080 >> 16)
/* 8C840 8009C040 80004234 */  ori        $v0, $v0, (0x4010080 & 0xFFFF)
/* 8C844 8009C044 AF006210 */  beq        $v1, $v0, .L8009C304
/* 8C848 8009C048 21208002 */   addu      $a0, $s4, $zero
/* 8C84C 8009C04C 6F730208 */  j          .L8009CDBC
/* 8C850 8009C050 00000000 */   nop
.L8009C054:
/* 8C854 8009C054 14016210 */  beq        $v1, $v0, .L8009C4A8
/* 8C858 8009C058 04004234 */   ori       $v0, $v0, (0x8000004 & 0xFFFF)
/* 8C85C 8009C05C 29026210 */  beq        $v1, $v0, .L8009C904
/* 8C860 8009C060 21208002 */   addu      $a0, $s4, $zero
/* 8C864 8009C064 6F730208 */  j          .L8009CDBC
/* 8C868 8009C068 00000000 */   nop
.L8009C06C:
/* 8C86C 8009C06C 0400228E */  lw         $v0, 0x4($s1)
/* 8C870 8009C070 00000000 */  nop
/* 8C874 8009C074 80FA82AF */  sw         $v0, %gp_rel(Raziel + 0x450)($gp)
/* 8C878 8009C078 2F97020C */  jal        razGetHeldWeapon
/* 8C87C 8009C07C 2001E0AE */   sw        $zero, 0x120($s7)
/* 8C880 8009C080 20004010 */  beqz       $v0, .L8009C104
/* 8C884 8009C084 02000224 */   addiu     $v0, $zero, 0x2
/* 8C888 8009C088 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8C88C 8009C08C 00000000 */  nop
/* 8C890 8009C090 12006210 */  beq        $v1, $v0, .L8009C0DC
/* 8C894 8009C094 00000000 */   nop
/* 8C898 8009C098 0300622C */  sltiu      $v0, $v1, 0x3
/* 8C89C 8009C09C 05004010 */  beqz       $v0, .L8009C0B4
/* 8C8A0 8009C0A0 00000000 */   nop
/* 8C8A4 8009C0A4 0A007610 */  beq        $v1, $s6, .L8009C0D0
/* 8C8A8 8009C0A8 00000000 */   nop
/* 8C8AC 8009C0AC 41700208 */  j          .L8009C104
/* 8C8B0 8009C0B0 00000000 */   nop
.L8009C0B4:
/* 8C8B4 8009C0B4 03000224 */  addiu      $v0, $zero, 0x3
/* 8C8B8 8009C0B8 0E006210 */  beq        $v1, $v0, .L8009C0F4
/* 8C8BC 8009C0BC 00100224 */   addiu     $v0, $zero, 0x1000
/* 8C8C0 8009C0C0 09006210 */  beq        $v1, $v0, .L8009C0E8
/* 8C8C4 8009C0C4 00000000 */   nop
/* 8C8C8 8009C0C8 41700208 */  j          .L8009C104
/* 8C8CC 8009C0CC 00000000 */   nop
.L8009C0D0:
/* 8C8D0 8009C0D0 0400228E */  lw         $v0, 0x4($s1)
/* 8C8D4 8009C0D4 40700208 */  j          .L8009C100
/* 8C8D8 8009C0D8 01004224 */   addiu     $v0, $v0, 0x1
.L8009C0DC:
/* 8C8DC 8009C0DC 0400228E */  lw         $v0, 0x4($s1)
/* 8C8E0 8009C0E0 40700208 */  j          .L8009C100
/* 8C8E4 8009C0E4 02004224 */   addiu     $v0, $v0, 0x2
.L8009C0E8:
/* 8C8E8 8009C0E8 0400228E */  lw         $v0, 0x4($s1)
/* 8C8EC 8009C0EC 40700208 */  j          .L8009C100
/* 8C8F0 8009C0F0 03004224 */   addiu     $v0, $v0, 0x3
.L8009C0F4:
/* 8C8F4 8009C0F4 0400228E */  lw         $v0, 0x4($s1)
/* 8C8F8 8009C0F8 00000000 */  nop
/* 8C8FC 8009C0FC 04004224 */  addiu      $v0, $v0, 0x4
.L8009C100:
/* 8C900 8009C100 80FA82AF */  sw         $v0, %gp_rel(Raziel + 0x450)($gp)
.L8009C104:
/* 8C904 8009C104 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8C908 8009C108 80FA838F */  lw         $v1, %gp_rel(Raziel + 0x450)($gp)
/* 8C90C 8009C10C 1000428C */  lw         $v0, 0x10($v0)
/* 8C910 8009C110 80180300 */  sll        $v1, $v1, 2
/* 8C914 8009C114 21186200 */  addu       $v1, $v1, $v0
/* 8C918 8009C118 2001E28E */  lw         $v0, 0x120($s7)
/* 8C91C 8009C11C 0000638C */  lw         $v1, 0x0($v1)
/* 8C920 8009C120 80100200 */  sll        $v0, $v0, 2
/* 8C924 8009C124 21104300 */  addu       $v0, $v0, $v1
/* 8C928 8009C128 0000438C */  lw         $v1, 0x0($v0)
/* 8C92C 8009C12C 00000000 */  nop
/* 8C930 8009C130 78FA83AF */  sw         $v1, %gp_rel(Raziel + 0x448)($gp)
/* 8C934 8009C134 0400228E */  lw         $v0, 0x4($s1)
/* 8C938 8009C138 00000000 */  nop
/* 8C93C 8009C13C 0A004228 */  slti       $v0, $v0, 0xA
/* 8C940 8009C140 07004014 */  bnez       $v0, .L8009C160
/* 8C944 8009C144 21208002 */   addu      $a0, $s4, $zero
/* 8C948 8009C148 6500B616 */  bne        $s5, $s6, .L8009C2E0
/* 8C94C 8009C14C 01000524 */   addiu     $a1, $zero, 0x1
/* 8C950 8009C150 00006690 */  lbu        $a2, 0x0($v1)
/* 8C954 8009C154 01006290 */  lbu        $v0, 0x1($v1)
/* 8C958 8009C158 5D700208 */  j          .L8009C174
/* 8C95C 8009C15C 1400B5AF */   sw        $s5, 0x14($sp)
.L8009C160:
/* 8C960 8009C160 00006690 */  lbu        $a2, 0x0($v1)
/* 8C964 8009C164 01006290 */  lbu        $v0, 0x1($v1)
/* 8C968 8009C168 78FA838F */  lw         $v1, %gp_rel(Raziel + 0x448)($gp)
/* 8C96C 8009C16C 2128A002 */  addu       $a1, $s5, $zero
/* 8C970 8009C170 1400B6AF */  sw         $s6, 0x14($sp)
.L8009C174:
/* 8C974 8009C174 1000A2AF */  sw         $v0, 0x10($sp)
/* 8C978 8009C178 02006290 */  lbu        $v0, 0x2($v1)
/* 8C97C 8009C17C 21380000 */  addu       $a3, $zero, $zero
/* 8C980 8009C180 31C8010C */  jal        G2EmulationSwitchAnimationAlpha
/* 8C984 8009C184 1800A2AF */   sw        $v0, 0x18($sp)
/* 8C988 8009C188 5500B616 */  bne        $s5, $s6, .L8009C2E0
/* 8C98C 8009C18C 00000000 */   nop
/* 8C990 8009C190 78FA828F */  lw         $v0, %gp_rel(Raziel + 0x448)($gp)
/* 8C994 8009C194 00000000 */  nop
/* 8C998 8009C198 1400538C */  lw         $s3, 0x14($v0)
/* 8C99C 8009C19C 1800528C */  lw         $s2, 0x18($v0)
/* 8C9A0 8009C1A0 2F97020C */  jal        razGetHeldWeapon
/* 8C9A4 8009C1A4 00000000 */   nop
/* 8C9A8 8009C1A8 1F004010 */  beqz       $v0, .L8009C228
/* 8C9AC 8009C1AC 00000000 */   nop
/* 8C9B0 8009C1B0 2F97020C */  jal        razGetHeldWeapon
/* 8C9B4 8009C1B4 00000000 */   nop
/* 8C9B8 8009C1B8 21804000 */  addu       $s0, $v0, $zero
/* 8C9BC 8009C1BC 21204000 */  addu       $a0, $v0, $zero
/* 8C9C0 8009C1C0 92D1000C */  jal        INSTANCE_Query
/* 8C9C4 8009C1C4 02000524 */   addiu     $a1, $zero, 0x2
/* 8C9C8 8009C1C8 20004230 */  andi       $v0, $v0, 0x20
/* 8C9CC 8009C1CC 0D004010 */  beqz       $v0, .L8009C204
/* 8C9D0 8009C1D0 21200002 */   addu      $a0, $s0, $zero
/* 8C9D4 8009C1D4 92D1000C */  jal        INSTANCE_Query
/* 8C9D8 8009C1D8 03000524 */   addiu     $a1, $zero, 0x3
/* 8C9DC 8009C1DC 0100033C */  lui        $v1, (0x10000 >> 16)
/* 8C9E0 8009C1E0 24104300 */  and        $v0, $v0, $v1
/* 8C9E4 8009C1E4 11004010 */  beqz       $v0, .L8009C22C
/* 8C9E8 8009C1E8 00000000 */   nop
/* 8C9EC 8009C1EC E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8C9F0 8009C1F0 00000000 */  nop
/* 8C9F4 8009C1F4 0400538C */  lw         $s3, 0x4($v0)
/* 8C9F8 8009C1F8 0800528C */  lw         $s2, 0x8($v0)
/* 8C9FC 8009C1FC 8B700208 */  j          .L8009C22C
/* 8CA00 8009C200 00000000 */   nop
.L8009C204:
/* 8CA04 8009C204 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8CA08 8009C208 00100224 */  addiu      $v0, $zero, 0x1000
/* 8CA0C 8009C20C 07006214 */  bne        $v1, $v0, .L8009C22C
/* 8CA10 8009C210 00000000 */   nop
/* 8CA14 8009C214 5EEA010C */  jal        REAVER_GetGlowColor
/* 8CA18 8009C218 21200002 */   addu      $a0, $s0, $zero
/* 8CA1C 8009C21C 21984000 */  addu       $s3, $v0, $zero
/* 8CA20 8009C220 8B700208 */  j          .L8009C22C
/* 8CA24 8009C224 21900000 */   addu      $s2, $zero, $zero
.L8009C228:
/* 8CA28 8009C228 0000908E */  lw         $s0, 0x0($s4)
.L8009C22C:
/* 8CA2C 8009C22C 78FA828F */  lw         $v0, %gp_rel(Raziel + 0x448)($gp)
/* 8CA30 8009C230 78FA838F */  lw         $v1, %gp_rel(Raziel + 0x448)($gp)
/* 8CA34 8009C234 0B004590 */  lbu        $a1, 0xB($v0)
/* 8CA38 8009C238 0C004690 */  lbu        $a2, 0xC($v0)
/* 8CA3C 8009C23C 0D004290 */  lbu        $v0, 0xD($v0)
/* 8CA40 8009C240 00000000 */  nop
/* 8CA44 8009C244 1000A2AF */  sw         $v0, 0x10($sp)
/* 8CA48 8009C248 0E006290 */  lbu        $v0, 0xE($v1)
/* 8CA4C 8009C24C 21200002 */  addu       $a0, $s0, $zero
/* 8CA50 8009C250 1400A2AF */  sw         $v0, 0x14($sp)
/* 8CA54 8009C254 12006284 */  lh         $v0, 0x12($v1)
/* 8CA58 8009C258 21380000 */  addu       $a3, $zero, $zero
/* 8CA5C 8009C25C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 8CA60 8009C260 2000B2AF */  sw         $s2, 0x20($sp)
/* 8CA64 8009C264 681D010C */  jal        FX_StartRibbon
/* 8CA68 8009C268 1800A2AF */   sw        $v0, 0x18($sp)
/* 8CA6C 8009C26C 0400228E */  lw         $v0, 0x4($s1)
/* 8CA70 8009C270 00000000 */  nop
/* 8CA74 8009C274 0A004228 */  slti       $v0, $v0, 0xA
/* 8CA78 8009C278 0D004014 */  bnez       $v0, .L8009C2B0
/* 8CA7C 8009C27C 00000000 */   nop
/* 8CA80 8009C280 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8CA84 8009C284 00000000 */  nop
/* 8CA88 8009C288 40004230 */  andi       $v0, $v0, 0x40
/* 8CA8C 8009C28C 0B004010 */  beqz       $v0, .L8009C2BC
/* 8CA90 8009C290 00000000 */   nop
/* 8CA94 8009C294 0000848E */  lw         $a0, 0x0($s4)
/* 8CA98 8009C298 938B020C */  jal        SteerSwitchMode
/* 8CA9C 8009C29C 0F000524 */   addiu     $a1, $zero, 0xF
/* 8CAA0 8009C2A0 31CC020C */  jal        SetTimer
/* 8CAA4 8009C2A4 04000424 */   addiu     $a0, $zero, 0x4
/* 8CAA8 8009C2A8 AF700208 */  j          .L8009C2BC
/* 8CAAC 8009C2AC 00000000 */   nop
.L8009C2B0:
/* 8CAB0 8009C2B0 0000848E */  lw         $a0, 0x0($s4)
/* 8CAB4 8009C2B4 938B020C */  jal        SteerSwitchMode
/* 8CAB8 8009C2B8 09000524 */   addiu     $a1, $zero, 0x9
.L8009C2BC:
/* 8CABC 8009C2BC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8CAC0 8009C2C0 0400238E */  lw         $v1, 0x4($s1)
/* 8CAC4 8009C2C4 00204234 */  ori        $v0, $v0, 0x2000
/* 8CAC8 8009C2C8 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8CACC 8009C2CC 05000224 */  addiu      $v0, $zero, 0x5
/* 8CAD0 8009C2D0 03006214 */  bne        $v1, $v0, .L8009C2E0
/* 8CAD4 8009C2D4 00000000 */   nop
/* 8CAD8 8009C2D8 31CC020C */  jal        SetTimer
/* 8CADC 8009C2DC 01000424 */   addiu     $a0, $zero, 0x1
.L8009C2E0:
/* 8CAE0 8009C2E0 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8CAE4 8009C2E4 2000033C */  lui        $v1, (0x200000 >> 16)
/* 8CAE8 8009C2E8 88FA80AF */  sw         $zero, %gp_rel(Raziel + 0x458)($gp)
/* 8CAEC 8009C2EC 84FA80AF */  sw         $zero, %gp_rel(Raziel + 0x454)($gp)
/* 8CAF0 8009C2F0 8CFA80AF */  sw         $zero, %gp_rel(Raziel + 0x45C)($gp)
/* 8CAF4 8009C2F4 25104300 */  or         $v0, $v0, $v1
/* 8CAF8 8009C2F8 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8CAFC 8009C2FC 73730208 */  j          .L8009CDCC
/* 8CB00 8009C300 2120D403 */   addu      $a0, $fp, $s4
.L8009C304:
/* 8CB04 8009C304 B102A016 */  bnez       $s5, .L8009CDCC
/* 8CB08 8009C308 2120D403 */   addu      $a0, $fp, $s4
/* 8CB0C 8009C30C 0400228E */  lw         $v0, 0x4($s1)
/* 8CB10 8009C310 00000000 */  nop
/* 8CB14 8009C314 06004010 */  beqz       $v0, .L8009C330
/* 8CB18 8009C318 00000000 */   nop
/* 8CB1C 8009C31C 0000848E */  lw         $a0, 0x0($s4)
/* 8CB20 8009C320 FD98020C */  jal        razResetPauseTranslation
/* 8CB24 8009C324 00000000 */   nop
/* 8CB28 8009C328 73730208 */  j          .L8009CDCC
/* 8CB2C 8009C32C 2120D403 */   addu      $a0, $fp, $s4
.L8009C330:
/* 8CB30 8009C330 0000848E */  lw         $a0, 0x0($s4)
/* 8CB34 8009C334 E098020C */  jal        razSetPauseTranslation
/* 8CB38 8009C338 00000000 */   nop
/* 8CB3C 8009C33C 73730208 */  j          .L8009CDCC
/* 8CB40 8009C340 2120D403 */   addu      $a0, $fp, $s4
.L8009C344:
/* 8CB44 8009C344 B8F9838F */  lw         $v1, %gp_rel(Raziel + 0x388)($gp)
/* 8CB48 8009C348 0F000224 */  addiu      $v0, $zero, 0xF
/* 8CB4C 8009C34C 0D006214 */  bne        $v1, $v0, .L8009C384
/* 8CB50 8009C350 0080033C */   lui       $v1, (0x8000000F >> 16)
/* 8CB54 8009C354 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 8CB58 8009C358 00000000 */  nop
/* 8CB5C 8009C35C 0000428C */  lw         $v0, 0x0($v0)
/* 8CB60 8009C360 0F006334 */  ori        $v1, $v1, (0x8000000F & 0xFFFF)
/* 8CB64 8009C364 24104300 */  and        $v0, $v0, $v1
/* 8CB68 8009C368 06004010 */  beqz       $v0, .L8009C384
/* 8CB6C 8009C36C 00000000 */   nop
/* 8CB70 8009C370 0000848E */  lw         $a0, 0x0($s4)
/* 8CB74 8009C374 938B020C */  jal        SteerSwitchMode
/* 8CB78 8009C378 02000524 */   addiu     $a1, $zero, 0x2
/* 8CB7C 8009C37C 73730208 */  j          .L8009CDCC
/* 8CB80 8009C380 2120D403 */   addu      $a0, $fp, $s4
.L8009C384:
/* 8CB84 8009C384 0000848E */  lw         $a0, 0x0($s4)
/* 8CB88 8009C388 938B020C */  jal        SteerSwitchMode
/* 8CB8C 8009C38C 21280000 */   addu      $a1, $zero, $zero
/* 8CB90 8009C390 73730208 */  j          .L8009CDCC
/* 8CB94 8009C394 2120D403 */   addu      $a0, $fp, $s4
.L8009C398:
/* 8CB98 8009C398 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8CB9C 8009C39C 80FA838F */  lw         $v1, %gp_rel(Raziel + 0x450)($gp)
/* 8CBA0 8009C3A0 3400A88F */  lw         $t0, 0x34($sp)
/* 8CBA4 8009C3A4 1000428C */  lw         $v0, 0x10($v0)
/* 8CBA8 8009C3A8 80180300 */  sll        $v1, $v1, 2
/* 8CBAC 8009C3AC 21186200 */  addu       $v1, $v1, $v0
/* 8CBB0 8009C3B0 2001E28E */  lw         $v0, 0x120($s7)
/* 8CBB4 8009C3B4 0000638C */  lw         $v1, 0x0($v1)
/* 8CBB8 8009C3B8 80100200 */  sll        $v0, $v0, 2
/* 8CBBC 8009C3BC 21104300 */  addu       $v0, $v0, $v1
/* 8CBC0 8009C3C0 0000438C */  lw         $v1, 0x0($v0)
/* 8CBC4 8009C3C4 00000000 */  nop
/* 8CBC8 8009C3C8 78FA83AF */  sw         $v1, %gp_rel(Raziel + 0x448)($gp)
/* 8CBCC 8009C3CC 00006290 */  lbu        $v0, 0x0($v1)
/* 8CBD0 8009C3D0 00000000 */  nop
/* 8CBD4 8009C3D4 0B000215 */  bne        $t0, $v0, .L8009C404
/* 8CBD8 8009C3D8 00000000 */   nop
/* 8CBDC 8009C3DC 05006290 */  lbu        $v0, 0x5($v1)
/* 8CBE0 8009C3E0 3000A88F */  lw         $t0, 0x30($sp)
/* 8CBE4 8009C3E4 00000000 */  nop
/* 8CBE8 8009C3E8 2A100201 */  slt        $v0, $t0, $v0
/* 8CBEC 8009C3EC 05004014 */  bnez       $v0, .L8009C404
/* 8CBF0 8009C3F0 00000000 */   nop
/* 8CBF4 8009C3F4 7CFA828F */  lw         $v0, %gp_rel(Raziel + 0x44C)($gp)
/* 8CBF8 8009C3F8 00000000 */  nop
/* 8CBFC 8009C3FC 04004234 */  ori        $v0, $v0, 0x4
/* 8CC00 8009C400 7CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x44C)($gp)
.L8009C404:
/* 8CC04 8009C404 7102B616 */  bne        $s5, $s6, .L8009CDCC
/* 8CC08 8009C408 2120D403 */   addu      $a0, $fp, $s4
/* 8CC0C 8009C40C 8CFA848F */  lw         $a0, %gp_rel(Raziel + 0x45C)($gp)
/* 8CC10 8009C410 00000000 */  nop
/* 8CC14 8009C414 6C028010 */  beqz       $a0, .L8009CDC8
/* 8CC18 8009C418 00000000 */   nop
/* 8CC1C 8009C41C 042E010C */  jal        FX_StopGlowEffect
/* 8CC20 8009C420 21280000 */   addu      $a1, $zero, $zero
/* 8CC24 8009C424 8CFA80AF */  sw         $zero, %gp_rel(Raziel + 0x45C)($gp)
/* 8CC28 8009C428 73730208 */  j          .L8009CDCC
/* 8CC2C 8009C42C 2120D403 */   addu      $a0, $fp, $s4
.L8009C430:
/* 8CC30 8009C430 1A00B616 */  bne        $s5, $s6, .L8009C49C
/* 8CC34 8009C434 7FFF033C */   lui       $v1, (0xFF7FFFFF >> 16)
/* 8CC38 8009C438 0000848E */  lw         $a0, 0x0($s4)
/* 8CC3C 8009C43C A6CE020C */  jal        DisableWristCollision
/* 8CC40 8009C440 02000524 */   addiu     $a1, $zero, 0x2
/* 8CC44 8009C444 0000848E */  lw         $a0, 0x0($s4)
/* 8CC48 8009C448 A6CE020C */  jal        DisableWristCollision
/* 8CC4C 8009C44C 01000524 */   addiu     $a1, $zero, 0x1
/* 8CC50 8009C450 00010224 */  addiu      $v0, $zero, 0x100
/* 8CC54 8009C454 24FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x3F4)($gp)
/* 8CC58 8009C458 A0FF0224 */  addiu      $v0, $zero, -0x60
/* 8CC5C 8009C45C 26FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x3F6)($gp)
/* 8CC60 8009C460 2F97020C */  jal        razGetHeldWeapon
/* 8CC64 8009C464 00000000 */   nop
/* 8CC68 8009C468 21804000 */  addu       $s0, $v0, $zero
/* 8CC6C 8009C46C 0A000012 */  beqz       $s0, .L8009C498
/* 8CC70 8009C470 2000053C */   lui       $a1, (0x200005 >> 16)
/* 8CC74 8009C474 21200002 */  addu       $a0, $s0, $zero
/* 8CC78 8009C478 0500A534 */  ori        $a1, $a1, (0x200005 & 0xFFFF)
/* 8CC7C 8009C47C A1D1000C */  jal        INSTANCE_Post
/* 8CC80 8009C480 21300000 */   addu      $a2, $zero, $zero
/* 8CC84 8009C484 21200002 */  addu       $a0, $s0, $zero
/* 8CC88 8009C488 2000053C */  lui        $a1, (0x200003 >> 16)
/* 8CC8C 8009C48C 0300A534 */  ori        $a1, $a1, (0x200003 & 0xFFFF)
/* 8CC90 8009C490 A1D1000C */  jal        INSTANCE_Post
/* 8CC94 8009C494 07000624 */   addiu     $a2, $zero, 0x7
.L8009C498:
/* 8CC98 8009C498 7FFF033C */  lui        $v1, (0xFF7FFFFF >> 16)
.L8009C49C:
/* 8CC9C 8009C49C C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8CCA0 8009C4A0 4B730208 */  j          .L8009CD2C
/* 8CCA4 8009C4A4 FFFF6334 */   ori       $v1, $v1, (0xFF7FFFFF & 0xFFFF)
.L8009C4A8:
/* 8CCA8 8009C4A8 7CFA828F */  lw         $v0, %gp_rel(Raziel + 0x44C)($gp)
/* 8CCAC 8009C4AC 00000000 */  nop
/* 8CCB0 8009C4B0 04004230 */  andi       $v0, $v0, 0x4
/* 8CCB4 8009C4B4 1C004010 */  beqz       $v0, .L8009C528
/* 8CCB8 8009C4B8 00000000 */   nop
/* 8CCBC 8009C4BC E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8CCC0 8009C4C0 80FA848F */  lw         $a0, %gp_rel(Raziel + 0x450)($gp)
/* 8CCC4 8009C4C4 1000428C */  lw         $v0, 0x10($v0)
/* 8CCC8 8009C4C8 80180400 */  sll        $v1, $a0, 2
/* 8CCCC 8009C4CC 21186200 */  addu       $v1, $v1, $v0
/* 8CCD0 8009C4D0 2001E28E */  lw         $v0, 0x120($s7)
/* 8CCD4 8009C4D4 0000638C */  lw         $v1, 0x0($v1)
/* 8CCD8 8009C4D8 80100200 */  sll        $v0, $v0, 2
/* 8CCDC 8009C4DC 21104300 */  addu       $v0, $v0, $v1
/* 8CCE0 8009C4E0 0400428C */  lw         $v0, 0x4($v0)
/* 8CCE4 8009C4E4 00000000 */  nop
/* 8CCE8 8009C4E8 0F004010 */  beqz       $v0, .L8009C528
/* 8CCEC 8009C4EC 0A008228 */   slti      $v0, $a0, 0xA
/* 8CCF0 8009C4F0 0A004014 */  bnez       $v0, .L8009C51C
/* 8CCF4 8009C4F4 0080033C */   lui       $v1, (0x8000000F >> 16)
/* 8CCF8 8009C4F8 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 8CCFC 8009C4FC 00000000 */  nop
/* 8CD00 8009C500 0000428C */  lw         $v0, 0x0($v0)
/* 8CD04 8009C504 0F006334 */  ori        $v1, $v1, (0x8000000F & 0xFFFF)
/* 8CD08 8009C508 24104300 */  and        $v0, $v0, $v1
/* 8CD0C 8009C50C 2E024010 */  beqz       $v0, .L8009CDC8
/* 8CD10 8009C510 21200002 */   addu      $a0, $s0, $zero
/* 8CD14 8009C514 52730208 */  j          .L8009CD48
/* 8CD18 8009C518 1000053C */   lui       $a1, (0x100000 >> 16)
.L8009C51C:
/* 8CD1C 8009C51C 21200002 */  addu       $a0, $s0, $zero
/* 8CD20 8009C520 52730208 */  j          .L8009CD48
/* 8CD24 8009C524 1000053C */   lui       $a1, (0x100000 >> 16)
.L8009C528:
/* 8CD28 8009C528 80FA828F */  lw         $v0, %gp_rel(Raziel + 0x450)($gp)
/* 8CD2C 8009C52C 00000000 */  nop
/* 8CD30 8009C530 0A004228 */  slti       $v0, $v0, 0xA
/* 8CD34 8009C534 13004014 */  bnez       $v0, .L8009C584
/* 8CD38 8009C538 0080033C */   lui       $v1, (0x8000000F >> 16)
/* 8CD3C 8009C53C C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 8CD40 8009C540 00000000 */  nop
/* 8CD44 8009C544 0000428C */  lw         $v0, 0x0($v0)
/* 8CD48 8009C548 0F006334 */  ori        $v1, $v1, (0x8000000F & 0xFFFF)
/* 8CD4C 8009C54C 24104300 */  and        $v0, $v0, $v1
/* 8CD50 8009C550 05004010 */  beqz       $v0, .L8009C568
/* 8CD54 8009C554 2128A002 */   addu      $a1, $s5, $zero
/* 8CD58 8009C558 21208002 */  addu       $a0, $s4, $zero
/* 8CD5C 8009C55C 0B80063C */  lui        $a2, %hi(StateHandlerMove)
/* 8CD60 8009C560 DB720208 */  j          .L8009CB6C
/* 8CD64 8009C564 A8ABC624 */   addiu     $a2, $a2, %lo(StateHandlerMove)
.L8009C568:
/* 8CD68 8009C568 21208002 */  addu       $a0, $s4, $zero
/* 8CD6C 8009C56C 0B80053C */  lui        $a1, %hi(StateHandlerStopMove)
/* 8CD70 8009C570 7CB2A524 */  addiu      $a1, $a1, %lo(StateHandlerStopMove)
/* 8CD74 8009C574 F4CA010C */  jal        StateSwitchStateCharacterData
/* 8CD78 8009C578 3C000624 */   addiu     $a2, $zero, 0x3C
/* 8CD7C 8009C57C 73730208 */  j          .L8009CDCC
/* 8CD80 8009C580 2120D403 */   addu      $a0, $fp, $s4
.L8009C584:
/* 8CD84 8009C584 74FB828F */  lw         $v0, %gp_rel(Raziel + 0x544)($gp)
/* 8CD88 8009C588 00000000 */  nop
/* 8CD8C 8009C58C 07004228 */  slti       $v0, $v0, 0x7
/* 8CD90 8009C590 0A004010 */  beqz       $v0, .L8009C5BC
/* 8CD94 8009C594 00000000 */   nop
/* 8CD98 8009C598 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8CD9C 8009C59C 00000000 */  nop
/* 8CDA0 8009C5A0 40004230 */  andi       $v0, $v0, 0x40
/* 8CDA4 8009C5A4 05004010 */  beqz       $v0, .L8009C5BC
/* 8CDA8 8009C5A8 2128A002 */   addu      $a1, $s5, $zero
/* 8CDAC 8009C5AC 21208002 */  addu       $a0, $s4, $zero
/* 8CDB0 8009C5B0 0B80063C */  lui        $a2, %hi(StateHandlerAutoFace)
/* 8CDB4 8009C5B4 DB720208 */  j          .L8009CB6C
/* 8CDB8 8009C5B8 10EFC624 */   addiu     $a2, $a2, %lo(StateHandlerAutoFace)
.L8009C5BC:
/* 8CDBC 8009C5BC 78FA828F */  lw         $v0, %gp_rel(Raziel + 0x448)($gp)
/* 8CDC0 8009C5C0 01000424 */  addiu      $a0, $zero, 0x1
/* 8CDC4 8009C5C4 03004690 */  lbu        $a2, 0x3($v0)
/* 8CDC8 8009C5C8 4FC6010C */  jal        SetControlInitIdleData
/* 8CDCC 8009C5CC 21280000 */   addu      $a1, $zero, $zero
/* 8CDD0 8009C5D0 21208002 */  addu       $a0, $s4, $zero
/* 8CDD4 8009C5D4 2128A002 */  addu       $a1, $s5, $zero
/* 8CDD8 8009C5D8 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 8CDDC 8009C5DC E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 8CDE0 8009C5E0 C1CA010C */  jal        StateSwitchStateData
/* 8CDE4 8009C5E4 21384000 */   addu      $a3, $v0, $zero
/* 8CDE8 8009C5E8 73730208 */  j          .L8009CDCC
/* 8CDEC 8009C5EC 2120D403 */   addu      $a0, $fp, $s4
.L8009C5F0:
/* 8CDF0 8009C5F0 2800A427 */  addiu      $a0, $sp, 0x28
/* 8CDF4 8009C5F4 9F6E020C */  jal        StateHandlerDecodeHold
/* 8CDF8 8009C5F8 2C00A527 */   addiu     $a1, $sp, 0x2C
/* 8CDFC 8009C5FC F2014010 */  beqz       $v0, .L8009CDC8
/* 8CE00 8009C600 00000000 */   nop
/* 8CE04 8009C604 2800A58F */  lw         $a1, 0x28($sp)
/* 8CE08 8009C608 2C00A68F */  lw         $a2, 0x2C($sp)
/* 8CE0C 8009C60C 4EC3010C */  jal        EnMessageQueueData
/* 8CE10 8009C610 21200002 */   addu      $a0, $s0, $zero
/* 8CE14 8009C614 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8CE18 8009C618 8000033C */  lui        $v1, (0x800000 >> 16)
/* 8CE1C 8009C61C 25104300 */  or         $v0, $v0, $v1
/* 8CE20 8009C620 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8CE24 8009C624 73730208 */  j          .L8009CDCC
/* 8CE28 8009C628 2120D403 */   addu      $a0, $fp, $s4
.L8009C62C:
/* 8CE2C 8009C62C 2001E38E */  lw         $v1, 0x120($s7)
/* 8CE30 8009C630 E8FB848F */  lw         $a0, %gp_rel(PlayerData)($gp)
/* 8CE34 8009C634 01006324 */  addiu      $v1, $v1, 0x1
/* 8CE38 8009C638 2001E3AE */  sw         $v1, 0x120($s7)
/* 8CE3C 8009C63C 80FA828F */  lw         $v0, %gp_rel(Raziel + 0x450)($gp)
/* 8CE40 8009C640 1000848C */  lw         $a0, 0x10($a0)
/* 8CE44 8009C644 80100200 */  sll        $v0, $v0, 2
/* 8CE48 8009C648 21104400 */  addu       $v0, $v0, $a0
/* 8CE4C 8009C64C 0000428C */  lw         $v0, 0x0($v0)
/* 8CE50 8009C650 80180300 */  sll        $v1, $v1, 2
/* 8CE54 8009C654 21186200 */  addu       $v1, $v1, $v0
/* 8CE58 8009C658 0000628C */  lw         $v0, 0x0($v1)
/* 8CE5C 8009C65C 00000000 */  nop
/* 8CE60 8009C660 02004014 */  bnez       $v0, .L8009C66C
/* 8CE64 8009C664 00000000 */   nop
/* 8CE68 8009C668 2001F6AE */  sw         $s6, 0x120($s7)
.L8009C66C:
/* 8CE6C 8009C66C E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8CE70 8009C670 80FA838F */  lw         $v1, %gp_rel(Raziel + 0x450)($gp)
/* 8CE74 8009C674 1000428C */  lw         $v0, 0x10($v0)
/* 8CE78 8009C678 80180300 */  sll        $v1, $v1, 2
/* 8CE7C 8009C67C 21186200 */  addu       $v1, $v1, $v0
/* 8CE80 8009C680 2001E28E */  lw         $v0, 0x120($s7)
/* 8CE84 8009C684 0000638C */  lw         $v1, 0x0($v1)
/* 8CE88 8009C688 80100200 */  sll        $v0, $v0, 2
/* 8CE8C 8009C68C 21104300 */  addu       $v0, $v0, $v1
/* 8CE90 8009C690 0000428C */  lw         $v0, 0x0($v0)
/* 8CE94 8009C694 21208002 */  addu       $a0, $s4, $zero
/* 8CE98 8009C698 78FA82AF */  sw         $v0, %gp_rel(Raziel + 0x448)($gp)
/* 8CE9C 8009C69C 00004690 */  lbu        $a2, 0x0($v0)
/* 8CEA0 8009C6A0 01004290 */  lbu        $v0, 0x1($v0)
/* 8CEA4 8009C6A4 78FA838F */  lw         $v1, %gp_rel(Raziel + 0x448)($gp)
/* 8CEA8 8009C6A8 2128A002 */  addu       $a1, $s5, $zero
/* 8CEAC 8009C6AC 1400B6AF */  sw         $s6, 0x14($sp)
/* 8CEB0 8009C6B0 1000A2AF */  sw         $v0, 0x10($sp)
/* 8CEB4 8009C6B4 02006290 */  lbu        $v0, 0x2($v1)
/* 8CEB8 8009C6B8 21380000 */  addu       $a3, $zero, $zero
/* 8CEBC 8009C6BC 31C8010C */  jal        G2EmulationSwitchAnimationAlpha
/* 8CEC0 8009C6C0 1800A2AF */   sw        $v0, 0x18($sp)
/* 8CEC4 8009C6C4 3B00B616 */  bne        $s5, $s6, .L8009C7B4
/* 8CEC8 8009C6C8 0800D027 */   addiu     $s0, $fp, 0x8
/* 8CECC 8009C6CC 78FA828F */  lw         $v0, %gp_rel(Raziel + 0x448)($gp)
/* 8CED0 8009C6D0 00000000 */  nop
/* 8CED4 8009C6D4 1400528C */  lw         $s2, 0x14($v0)
/* 8CED8 8009C6D8 1800518C */  lw         $s1, 0x18($v0)
/* 8CEDC 8009C6DC 2F97020C */  jal        razGetHeldWeapon
/* 8CEE0 8009C6E0 00000000 */   nop
/* 8CEE4 8009C6E4 1F004010 */  beqz       $v0, .L8009C764
/* 8CEE8 8009C6E8 00000000 */   nop
/* 8CEEC 8009C6EC 2F97020C */  jal        razGetHeldWeapon
/* 8CEF0 8009C6F0 00000000 */   nop
/* 8CEF4 8009C6F4 21804000 */  addu       $s0, $v0, $zero
/* 8CEF8 8009C6F8 21204000 */  addu       $a0, $v0, $zero
/* 8CEFC 8009C6FC 92D1000C */  jal        INSTANCE_Query
/* 8CF00 8009C700 02000524 */   addiu     $a1, $zero, 0x2
/* 8CF04 8009C704 20004230 */  andi       $v0, $v0, 0x20
/* 8CF08 8009C708 0D004010 */  beqz       $v0, .L8009C740
/* 8CF0C 8009C70C 21200002 */   addu      $a0, $s0, $zero
/* 8CF10 8009C710 92D1000C */  jal        INSTANCE_Query
/* 8CF14 8009C714 03000524 */   addiu     $a1, $zero, 0x3
/* 8CF18 8009C718 0100033C */  lui        $v1, (0x10000 >> 16)
/* 8CF1C 8009C71C 24104300 */  and        $v0, $v0, $v1
/* 8CF20 8009C720 11004010 */  beqz       $v0, .L8009C768
/* 8CF24 8009C724 00000000 */   nop
/* 8CF28 8009C728 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8CF2C 8009C72C 00000000 */  nop
/* 8CF30 8009C730 0400528C */  lw         $s2, 0x4($v0)
/* 8CF34 8009C734 0800518C */  lw         $s1, 0x8($v0)
/* 8CF38 8009C738 DA710208 */  j          .L8009C768
/* 8CF3C 8009C73C 00000000 */   nop
.L8009C740:
/* 8CF40 8009C740 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8CF44 8009C744 00100224 */  addiu      $v0, $zero, 0x1000
/* 8CF48 8009C748 07006214 */  bne        $v1, $v0, .L8009C768
/* 8CF4C 8009C74C 00000000 */   nop
/* 8CF50 8009C750 5EEA010C */  jal        REAVER_GetGlowColor
/* 8CF54 8009C754 21200002 */   addu      $a0, $s0, $zero
/* 8CF58 8009C758 21904000 */  addu       $s2, $v0, $zero
/* 8CF5C 8009C75C DA710208 */  j          .L8009C768
/* 8CF60 8009C760 21880000 */   addu      $s1, $zero, $zero
.L8009C764:
/* 8CF64 8009C764 0000908E */  lw         $s0, 0x0($s4)
.L8009C768:
/* 8CF68 8009C768 84FA838F */  lw         $v1, %gp_rel(Raziel + 0x454)($gp)
/* 8CF6C 8009C76C 78FA828F */  lw         $v0, %gp_rel(Raziel + 0x448)($gp)
/* 8CF70 8009C770 84FA80AF */  sw         $zero, %gp_rel(Raziel + 0x454)($gp)
/* 8CF74 8009C774 88FA83AF */  sw         $v1, %gp_rel(Raziel + 0x458)($gp)
/* 8CF78 8009C778 0B004590 */  lbu        $a1, 0xB($v0)
/* 8CF7C 8009C77C 0C004690 */  lbu        $a2, 0xC($v0)
/* 8CF80 8009C780 0D004290 */  lbu        $v0, 0xD($v0)
/* 8CF84 8009C784 78FA838F */  lw         $v1, %gp_rel(Raziel + 0x448)($gp)
/* 8CF88 8009C788 1000A2AF */  sw         $v0, 0x10($sp)
/* 8CF8C 8009C78C 0E006290 */  lbu        $v0, 0xE($v1)
/* 8CF90 8009C790 21200002 */  addu       $a0, $s0, $zero
/* 8CF94 8009C794 1400A2AF */  sw         $v0, 0x14($sp)
/* 8CF98 8009C798 12006284 */  lh         $v0, 0x12($v1)
/* 8CF9C 8009C79C 21380000 */  addu       $a3, $zero, $zero
/* 8CFA0 8009C7A0 1C00B2AF */  sw         $s2, 0x1C($sp)
/* 8CFA4 8009C7A4 2000B1AF */  sw         $s1, 0x20($sp)
/* 8CFA8 8009C7A8 681D010C */  jal        FX_StartRibbon
/* 8CFAC 8009C7AC 1800A2AF */   sw        $v0, 0x18($sp)
/* 8CFB0 8009C7B0 0800D027 */  addiu      $s0, $fp, 0x8
.L8009C7B4:
/* 8CFB4 8009C7B4 21809002 */  addu       $s0, $s4, $s0
/* 8CFB8 8009C7B8 8C000426 */  addiu      $a0, $s0, 0x8C
/* 8CFBC 8009C7BC 1000053C */  lui        $a1, (0x100002 >> 16)
/* 8CFC0 8009C7C0 0200A534 */  ori        $a1, $a1, (0x100002 & 0xFFFF)
/* 8CFC4 8009C7C4 4EC3010C */  jal        EnMessageQueueData
/* 8CFC8 8009C7C8 21300000 */   addu      $a2, $zero, $zero
/* 8CFCC 8009C7CC 36C3010C */  jal        PurgeMessageQueue
/* 8CFD0 8009C7D0 04000426 */   addiu     $a0, $s0, 0x4
/* 8CFD4 8009C7D4 73730208 */  j          .L8009CDCC
/* 8CFD8 8009C7D8 2120D403 */   addu      $a0, $fp, $s4
.L8009C7DC:
/* 8CFDC 8009C7DC 7CFA80AF */  sw         $zero, %gp_rel(Raziel + 0x44C)($gp)
/* 8CFE0 8009C7E0 73730208 */  j          .L8009CDCC
/* 8CFE4 8009C7E4 2120D403 */   addu      $a0, $fp, $s4
.L8009C7E8:
/* 8CFE8 8009C7E8 68FA828F */  lw         $v0, %gp_rel(Raziel + 0x438)($gp)
/* 8CFEC 8009C7EC 00000000 */  nop
/* 8CFF0 8009C7F0 75015614 */  bne        $v0, $s6, .L8009CDC8
/* 8CFF4 8009C7F4 21208002 */   addu      $a0, $s4, $zero
/* 8CFF8 8009C7F8 2128A002 */  addu       $a1, $s5, $zero
/* 8CFFC 8009C7FC 2C00A78F */  lw         $a3, 0x2C($sp)
/* 8D000 8009C800 0A80063C */  lui        $a2, %hi(StateHandlerGrab)
/* 8D004 8009C804 C1CA010C */  jal        StateSwitchStateData
/* 8D008 8009C808 C4E6C624 */   addiu     $a2, $a2, %lo(StateHandlerGrab)
/* 8D00C 8009C80C 73730208 */  j          .L8009CDCC
/* 8D010 8009C810 2120D403 */   addu      $a0, $fp, $s4
.L8009C814:
/* 8D014 8009C814 0400228E */  lw         $v0, 0x4($s1)
/* 8D018 8009C818 00000000 */  nop
/* 8D01C 8009C81C 30004010 */  beqz       $v0, .L8009C8E0
/* 8D020 8009C820 00000000 */   nop
/* 8D024 8009C824 C89E020C */  jal        razSetPlayerEventHistory
/* 8D028 8009C828 80000424 */   addiu     $a0, $zero, 0x80
/* 8D02C 8009C82C C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D030 8009C830 0400033C */  lui        $v1, (0x40000 >> 16)
/* 8D034 8009C834 25104300 */  or         $v0, $v0, $v1
/* 8D038 8009C838 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D03C 8009C83C 02000224 */  addiu      $v0, $zero, 0x2
/* 8D040 8009C840 0800A216 */  bne        $s5, $v0, .L8009C864
/* 8D044 8009C844 21208002 */   addu      $a0, $s4, $zero
/* 8D048 8009C848 21284000 */  addu       $a1, $v0, $zero
/* 8D04C 8009C84C 21300000 */  addu       $a2, $zero, $zero
/* 8D050 8009C850 2138C000 */  addu       $a3, $a2, $zero
/* 8D054 8009C854 03000224 */  addiu      $v0, $zero, 0x3
/* 8D058 8009C858 1000A2AF */  sw         $v0, 0x10($sp)
/* 8D05C 8009C85C 1F720208 */  j          .L8009C87C
/* 8D060 8009C860 1400B5AF */   sw        $s5, 0x14($sp)
.L8009C864:
/* 8D064 8009C864 2128A002 */  addu       $a1, $s5, $zero
/* 8D068 8009C868 3B000624 */  addiu      $a2, $zero, 0x3B
/* 8D06C 8009C86C 21380000 */  addu       $a3, $zero, $zero
/* 8D070 8009C870 03000224 */  addiu      $v0, $zero, 0x3
/* 8D074 8009C874 1000A2AF */  sw         $v0, 0x10($sp)
/* 8D078 8009C878 1400B6AF */  sw         $s6, 0x14($sp)
.L8009C87C:
/* 8D07C 8009C87C 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8D080 8009C880 00000000 */   nop
/* 8D084 8009C884 21208002 */  addu       $a0, $s4, $zero
/* 8D088 8009C888 2128A002 */  addu       $a1, $s5, $zero
/* 8D08C 8009C88C 0A80063C */  lui        $a2, %hi(StateHandlerCannedReaction)
/* 8D090 8009C890 B4CEC624 */  addiu      $a2, $a2, %lo(StateHandlerCannedReaction)
/* 8D094 8009C894 C1CA010C */  jal        StateSwitchStateData
/* 8D098 8009C898 21380000 */   addu      $a3, $zero, $zero
/* 8D09C 8009C89C 4B01A016 */  bnez       $s5, .L8009CDCC
/* 8D0A0 8009C8A0 2120D403 */   addu      $a0, $fp, $s4
/* 8D0A4 8009C8A4 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8D0A8 8009C8A8 00000000 */  nop
/* 8D0AC 8009C8AC 00024230 */  andi       $v0, $v0, 0x200
/* 8D0B0 8009C8B0 46014010 */  beqz       $v0, .L8009CDCC
/* 8D0B4 8009C8B4 03000224 */   addiu     $v0, $zero, 0x3
/* 8D0B8 8009C8B8 1000A2AF */  sw         $v0, 0x10($sp)
/* 8D0BC 8009C8BC 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8D0C0 8009C8C0 08020624 */  addiu      $a2, $zero, 0x208
/* 8D0C4 8009C8C4 1400A0AF */  sw         $zero, 0x14($sp)
/* 8D0C8 8009C8C8 0000848E */  lw         $a0, 0x0($s4)
/* 8D0CC 8009C8CC 4800458C */  lw         $a1, 0x48($v0)
/* 8D0D0 8009C8D0 7E94020C */  jal        razAlignYRotMoveInterp
/* 8D0D4 8009C8D4 21380000 */   addu      $a3, $zero, $zero
/* 8D0D8 8009C8D8 73730208 */  j          .L8009CDCC
/* 8D0DC 8009C8DC 2120D403 */   addu      $a0, $fp, $s4
.L8009C8E0:
/* 8D0E0 8009C8E0 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D0E4 8009C8E4 00000000 */  nop
/* 8D0E8 8009C8E8 20004234 */  ori        $v0, $v0, 0x20
/* 8D0EC 8009C8EC C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D0F0 8009C8F0 3601B616 */  bne        $s5, $s6, .L8009CDCC
/* 8D0F4 8009C8F4 2120D403 */   addu      $a0, $fp, $s4
/* 8D0F8 8009C8F8 21208002 */  addu       $a0, $s4, $zero
/* 8D0FC 8009C8FC 9C720208 */  j          .L8009CA70
/* 8D100 8009C900 48000524 */   addiu     $a1, $zero, 0x48
.L8009C904:
/* 8D104 8009C904 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8D108 8009C908 00000000 */  nop
/* 8D10C 8009C90C 00024230 */  andi       $v0, $v0, 0x200
/* 8D110 8009C910 2E014010 */  beqz       $v0, .L8009CDCC
/* 8D114 8009C914 2120D403 */   addu      $a0, $fp, $s4
/* 8D118 8009C918 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8D11C 8009C91C 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8D120 8009C920 4800448C */  lw         $a0, 0x48($v0)
/* 8D124 8009C924 00100224 */  addiu      $v0, $zero, 0x1000
/* 8D128 8009C928 0F006214 */  bne        $v1, $v0, .L8009C968
/* 8D12C 8009C92C 0001053C */   lui       $a1, (0x1000023 >> 16)
/* 8D130 8009C930 64FA838F */  lw         $v1, %gp_rel(Raziel + 0x434)($gp)
/* 8D134 8009C934 06000224 */  addiu      $v0, $zero, 0x6
/* 8D138 8009C938 07006214 */  bne        $v1, $v0, .L8009C958
/* 8D13C 8009C93C 2300A534 */   ori       $a1, $a1, (0x1000023 & 0xFFFF)
/* 8D140 8009C940 0001053C */  lui        $a1, (0x100000C >> 16)
/* 8D144 8009C944 0C00A534 */  ori        $a1, $a1, (0x100000C & 0xFFFF)
/* 8D148 8009C948 A1D1000C */  jal        INSTANCE_Post
/* 8D14C 8009C94C 20000624 */   addiu     $a2, $zero, 0x20
/* 8D150 8009C950 73730208 */  j          .L8009CDCC
/* 8D154 8009C954 2120D403 */   addu      $a0, $fp, $s4
.L8009C958:
/* 8D158 8009C958 A1D1000C */  jal        INSTANCE_Post
/* 8D15C 8009C95C 00100624 */   addiu     $a2, $zero, 0x1000
/* 8D160 8009C960 73730208 */  j          .L8009CDCC
/* 8D164 8009C964 2120D403 */   addu      $a0, $fp, $s4
.L8009C968:
/* 8D168 8009C968 0C00A534 */  ori        $a1, $a1, (0x100000C & 0xFFFF)
/* 8D16C 8009C96C A1D1000C */  jal        INSTANCE_Post
/* 8D170 8009C970 20000624 */   addiu     $a2, $zero, 0x20
/* 8D174 8009C974 2F97020C */  jal        razGetHeldWeapon
/* 8D178 8009C978 00000000 */   nop
/* 8D17C 8009C97C 21204000 */  addu       $a0, $v0, $zero
/* 8D180 8009C980 11018010 */  beqz       $a0, .L8009CDC8
/* 8D184 8009C984 8000053C */   lui       $a1, (0x800029 >> 16)
/* 8D188 8009C988 A8720208 */  j          .L8009CAA0
/* 8D18C 8009C98C 2900A534 */   ori       $a1, $a1, (0x800029 & 0xFFFF)
.L8009C990:
/* 8D190 8009C990 0400228E */  lw         $v0, 0x4($s1)
/* 8D194 8009C994 00000000 */  nop
/* 8D198 8009C998 2D004010 */  beqz       $v0, .L8009CA50
/* 8D19C 8009C99C 00000000 */   nop
/* 8D1A0 8009C9A0 C89E020C */  jal        razSetPlayerEventHistory
/* 8D1A4 8009C9A4 00010424 */   addiu     $a0, $zero, 0x100
/* 8D1A8 8009C9A8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D1AC 8009C9AC 0400033C */  lui        $v1, (0x40000 >> 16)
/* 8D1B0 8009C9B0 25104300 */  or         $v0, $v0, $v1
/* 8D1B4 8009C9B4 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D1B8 8009C9B8 02000224 */  addiu      $v0, $zero, 0x2
/* 8D1BC 8009C9BC 0800A216 */  bne        $s5, $v0, .L8009C9E0
/* 8D1C0 8009C9C0 21208002 */   addu      $a0, $s4, $zero
/* 8D1C4 8009C9C4 21284000 */  addu       $a1, $v0, $zero
/* 8D1C8 8009C9C8 21300000 */  addu       $a2, $zero, $zero
/* 8D1CC 8009C9CC 2138C000 */  addu       $a3, $a2, $zero
/* 8D1D0 8009C9D0 03000224 */  addiu      $v0, $zero, 0x3
/* 8D1D4 8009C9D4 1000A2AF */  sw         $v0, 0x10($sp)
/* 8D1D8 8009C9D8 7D720208 */  j          .L8009C9F4
/* 8D1DC 8009C9DC 1400B5AF */   sw        $s5, 0x14($sp)
.L8009C9E0:
/* 8D1E0 8009C9E0 2128A002 */  addu       $a1, $s5, $zero
/* 8D1E4 8009C9E4 8A000624 */  addiu      $a2, $zero, 0x8A
/* 8D1E8 8009C9E8 21380000 */  addu       $a3, $zero, $zero
/* 8D1EC 8009C9EC 1000A0AF */  sw         $zero, 0x10($sp)
/* 8D1F0 8009C9F0 1400B6AF */  sw         $s6, 0x14($sp)
.L8009C9F4:
/* 8D1F4 8009C9F4 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8D1F8 8009C9F8 00000000 */   nop
/* 8D1FC 8009C9FC F300B616 */  bne        $s5, $s6, .L8009CDCC
/* 8D200 8009CA00 2120D403 */   addu      $a0, $fp, $s4
/* 8D204 8009CA04 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8D208 8009CA08 00000000 */  nop
/* 8D20C 8009CA0C 00024230 */  andi       $v0, $v0, 0x200
/* 8D210 8009CA10 EE004010 */  beqz       $v0, .L8009CDCC
/* 8D214 8009CA14 84030224 */   addiu     $v0, $zero, 0x384
/* 8D218 8009CA18 8CFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x55C)($gp)
/* 8D21C 8009CA1C 14000224 */  addiu      $v0, $zero, 0x14
/* 8D220 8009CA20 1000A2AF */  sw         $v0, 0x10($sp)
/* 8D224 8009CA24 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8D228 8009CA28 E6010624 */  addiu      $a2, $zero, 0x1E6
/* 8D22C 8009CA2C 1400A0AF */  sw         $zero, 0x14($sp)
/* 8D230 8009CA30 0000848E */  lw         $a0, 0x0($s4)
/* 8D234 8009CA34 4800458C */  lw         $a1, 0x48($v0)
/* 8D238 8009CA38 7E94020C */  jal        razAlignYRotMoveInterp
/* 8D23C 8009CA3C 21380000 */   addu      $a3, $zero, $zero
/* 8D240 8009CA40 0000838E */  lw         $v1, 0x0($s4)
/* 8D244 8009CA44 8CFB8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x55C)
/* 8D248 8009CA48 72730208 */  j          .L8009CDC8
/* 8D24C 8009CA4C 280262AC */   sw        $v0, 0x228($v1)
.L8009CA50:
/* 8D250 8009CA50 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D254 8009CA54 00000000 */  nop
/* 8D258 8009CA58 20004234 */  ori        $v0, $v0, 0x20
/* 8D25C 8009CA5C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D260 8009CA60 DA00B616 */  bne        $s5, $s6, .L8009CDCC
/* 8D264 8009CA64 2120D403 */   addu      $a0, $fp, $s4
/* 8D268 8009CA68 21208002 */  addu       $a0, $s4, $zero
/* 8D26C 8009CA6C 8A000524 */  addiu      $a1, $zero, 0x8A
.L8009CA70:
/* 8D270 8009CA70 21300000 */  addu       $a2, $zero, $zero
/* 8D274 8009CA74 03000724 */  addiu      $a3, $zero, 0x3
/* 8D278 8009CA78 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 8D27C 8009CA7C 1000B5AF */   sw        $s5, 0x10($sp)
/* 8D280 8009CA80 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8D284 8009CA84 00000000 */  nop
/* 8D288 8009CA88 00024230 */  andi       $v0, $v0, 0x200
/* 8D28C 8009CA8C CE004010 */  beqz       $v0, .L8009CDC8
/* 8D290 8009CA90 0001053C */   lui       $a1, (0x100000A >> 16)
/* 8D294 8009CA94 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8D298 8009CA98 0A00A534 */  ori        $a1, $a1, (0x100000A & 0xFFFF)
/* 8D29C 8009CA9C 4800448C */  lw         $a0, 0x48($v0)
.L8009CAA0:
/* 8D2A0 8009CAA0 A1D1000C */  jal        INSTANCE_Post
/* 8D2A4 8009CAA4 21300000 */   addu      $a2, $zero, $zero
/* 8D2A8 8009CAA8 73730208 */  j          .L8009CDCC
/* 8D2AC 8009CAAC 2120D403 */   addu      $a0, $fp, $s4
.L8009CAB0:
/* 8D2B0 8009CAB0 0400228E */  lw         $v0, 0x4($s1)
/* 8D2B4 8009CAB4 00000000 */  nop
/* 8D2B8 8009CAB8 05004014 */  bnez       $v0, .L8009CAD0
/* 8D2BC 8009CABC 00000000 */   nop
/* 8D2C0 8009CAC0 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D2C4 8009CAC4 00000000 */  nop
/* 8D2C8 8009CAC8 20004234 */  ori        $v0, $v0, 0x20
/* 8D2CC 8009CACC C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L8009CAD0:
/* 8D2D0 8009CAD0 BE00A016 */  bnez       $s5, .L8009CDCC
/* 8D2D4 8009CAD4 2120D403 */   addu      $a0, $fp, $s4
/* 8D2D8 8009CAD8 18000524 */  addiu      $a1, $zero, 0x18
/* 8D2DC 8009CADC 21300000 */  addu       $a2, $zero, $zero
/* 8D2E0 8009CAE0 0000848E */  lw         $a0, 0x0($s4)
/* 8D2E4 8009CAE4 759C020C */  jal        razSwitchVAnimCharacterSingle
/* 8D2E8 8009CAE8 2138C000 */   addu      $a3, $a2, $zero
/* 8D2EC 8009CAEC 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8D2F0 8009CAF0 00000000 */  nop
/* 8D2F4 8009CAF4 00024230 */  andi       $v0, $v0, 0x200
/* 8D2F8 8009CAF8 B3004010 */  beqz       $v0, .L8009CDC8
/* 8D2FC 8009CAFC 0001053C */   lui       $a1, (0x1000023 >> 16)
/* 8D300 8009CB00 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8D304 8009CB04 0400268E */  lw         $a2, 0x4($s1)
/* 8D308 8009CB08 4800448C */  lw         $a0, 0x48($v0)
/* 8D30C 8009CB0C A1D1000C */  jal        INSTANCE_Post
/* 8D310 8009CB10 2300A534 */   ori       $a1, $a1, (0x1000023 & 0xFFFF)
/* 8D314 8009CB14 14000224 */  addiu      $v0, $zero, 0x14
/* 8D318 8009CB18 1000A2AF */  sw         $v0, 0x10($sp)
/* 8D31C 8009CB1C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8D320 8009CB20 E6010624 */  addiu      $a2, $zero, 0x1E6
/* 8D324 8009CB24 1400A0AF */  sw         $zero, 0x14($sp)
/* 8D328 8009CB28 0000848E */  lw         $a0, 0x0($s4)
/* 8D32C 8009CB2C 4800458C */  lw         $a1, 0x48($v0)
/* 8D330 8009CB30 7E94020C */  jal        razAlignYRotMoveInterp
/* 8D334 8009CB34 21380000 */   addu      $a3, $zero, $zero
/* 8D338 8009CB38 0400228E */  lw         $v0, 0x4($s1)
/* 8D33C 8009CB3C 00000000 */  nop
/* 8D340 8009CB40 A1004010 */  beqz       $v0, .L8009CDC8
/* 8D344 8009CB44 AC0D0224 */   addiu     $v0, $zero, 0xDAC
/* 8D348 8009CB48 8CFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x55C)($gp)
/* 8D34C 8009CB4C 0000838E */  lw         $v1, 0x0($s4)
/* 8D350 8009CB50 8CFB8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x55C)
/* 8D354 8009CB54 72730208 */  j          .L8009CDC8
/* 8D358 8009CB58 F80162AC */   sw        $v0, 0x1F8($v1)
.L8009CB5C:
/* 8D35C 8009CB5C 21208002 */  addu       $a0, $s4, $zero
/* 8D360 8009CB60 2128A002 */  addu       $a1, $s5, $zero
/* 8D364 8009CB64 0A80063C */  lui        $a2, %hi(StateHandlerThrow2)
/* 8D368 8009CB68 E4D7C624 */  addiu      $a2, $a2, %lo(StateHandlerThrow2)
.L8009CB6C:
/* 8D36C 8009CB6C C1CA010C */  jal        StateSwitchStateData
/* 8D370 8009CB70 21380000 */   addu      $a3, $zero, $zero
/* 8D374 8009CB74 73730208 */  j          .L8009CDCC
/* 8D378 8009CB78 2120D403 */   addu      $a0, $fp, $s4
.L8009CB7C:
/* 8D37C 8009CB7C DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 8D380 8009CB80 00040424 */  addiu      $a0, $zero, 0x400
/* 8D384 8009CB84 25104400 */  or         $v0, $v0, $a0
/* 8D388 8009CB88 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 8D38C 8009CB8C C89E020C */  jal        razSetPlayerEventHistory
/* 8D390 8009CB90 00000000 */   nop
/* 8D394 8009CB94 21208002 */  addu       $a0, $s4, $zero
/* 8D398 8009CB98 2128A002 */  addu       $a1, $s5, $zero
/* 8D39C 8009CB9C 0A80063C */  lui        $a2, %hi(StateHandlerThrow2)
/* 8D3A0 8009CBA0 E4D7C624 */  addiu      $a2, $a2, %lo(StateHandlerThrow2)
/* 8D3A4 8009CBA4 C1CA010C */  jal        StateSwitchStateData
/* 8D3A8 8009CBA8 21380000 */   addu      $a3, $zero, $zero
/* 8D3AC 8009CBAC 8600B616 */  bne        $s5, $s6, .L8009CDC8
/* 8D3B0 8009CBB0 00000000 */   nop
/* 8D3B4 8009CBB4 0000848E */  lw         $a0, 0x0($s4)
/* 8D3B8 8009CBB8 FD96020C */  jal        razLaunchForce
/* 8D3BC 8009CBBC 00000000 */   nop
/* 8D3C0 8009CBC0 73730208 */  j          .L8009CDCC
/* 8D3C4 8009CBC4 2120D403 */   addu      $a0, $fp, $s4
.L8009CBC8:
/* 8D3C8 8009CBC8 01000824 */  addiu      $t0, $zero, 0x1
/* 8D3CC 8009CBCC 72730208 */  j          .L8009CDC8
/* 8D3D0 8009CBD0 3800A8AF */   sw        $t0, 0x38($sp)
.L8009CBD4:
/* 8D3D4 8009CBD4 7D00B616 */  bne        $s5, $s6, .L8009CDCC
/* 8D3D8 8009CBD8 2120D403 */   addu      $a0, $fp, $s4
/* 8D3DC 8009CBDC 78FA848F */  lw         $a0, %gp_rel(Raziel + 0x448)($gp)
/* 8D3E0 8009CBE0 0400308E */  lw         $s0, 0x4($s1)
/* 8D3E4 8009CBE4 22008394 */  lhu        $v1, 0x22($a0)
/* 8D3E8 8009CBE8 0C00028E */  lw         $v0, 0xC($s0)
/* 8D3EC 8009CBEC 00000000 */  nop
/* 8D3F0 8009CBF0 18004300 */  mult       $v0, $v1
/* 8D3F4 8009CBF4 0000088E */  lw         $t0, 0x0($s0)
/* 8D3F8 8009CBF8 12300000 */  mflo       $a2
/* 8D3FC 8009CBFC 0200C104 */  bgez       $a2, .L8009CC08
/* 8D400 8009CC00 3C00A8AF */   sw        $t0, 0x3C($sp)
/* 8D404 8009CC04 FF0FC624 */  addiu      $a2, $a2, 0xFFF
.L8009CC08:
/* 8D408 8009CC08 0F008290 */  lbu        $v0, 0xF($a0)
/* 8D40C 8009CC0C 88FA858F */  lw         $a1, %gp_rel(Raziel + 0x458)($gp)
/* 8D410 8009CC10 20008794 */  lhu        $a3, 0x20($a0)
/* 8D414 8009CC14 1000A2AF */  sw         $v0, 0x10($sp)
/* 8D418 8009CC18 0000848E */  lw         $a0, 0x0($s4)
/* 8D41C 8009CC1C 95C3010C */  jal        SetMonsterHitData
/* 8D420 8009CC20 03330600 */   sra       $a2, $a2, 12
/* 8D424 8009CC24 0001053C */  lui        $a1, (0x1000000 >> 16)
/* 8D428 8009CC28 0000048E */  lw         $a0, 0x0($s0)
/* 8D42C 8009CC2C A1D1000C */  jal        INSTANCE_Post
/* 8D430 8009CC30 21304000 */   addu      $a2, $v0, $zero
/* 8D434 8009CC34 78FA828F */  lw         $v0, %gp_rel(Raziel + 0x448)($gp)
/* 8D438 8009CC38 00000000 */  nop
/* 8D43C 8009CC3C 08004290 */  lbu        $v0, 0x8($v0)
/* 8D440 8009CC40 00000000 */  nop
/* 8D444 8009CC44 02004230 */  andi       $v0, $v0, 0x2
/* 8D448 8009CC48 09004010 */  beqz       $v0, .L8009CC70
/* 8D44C 8009CC4C 29000524 */   addiu     $a1, $zero, 0x29
/* 8D450 8009CC50 20000624 */  addiu      $a2, $zero, 0x20
/* 8D454 8009CC54 0000848E */  lw         $a0, 0x0($s4)
/* 8D458 8009CC58 7FC5010C */  jal        SetFXHitData
/* 8D45C 8009CC5C 00010724 */   addiu     $a3, $zero, 0x100
/* 8D460 8009CC60 4000053C */  lui        $a1, (0x400000 >> 16)
/* 8D464 8009CC64 0000048E */  lw         $a0, 0x0($s0)
/* 8D468 8009CC68 A1D1000C */  jal        INSTANCE_Post
/* 8D46C 8009CC6C 21304000 */   addu      $a2, $v0, $zero
.L8009CC70:
/* 8D470 8009CC70 78FA828F */  lw         $v0, %gp_rel(Raziel + 0x448)($gp)
/* 8D474 8009CC74 00000000 */  nop
/* 8D478 8009CC78 08004290 */  lbu        $v0, 0x8($v0)
/* 8D47C 8009CC7C 00000000 */  nop
/* 8D480 8009CC80 01004230 */  andi       $v0, $v0, 0x1
/* 8D484 8009CC84 09004010 */  beqz       $v0, .L8009CCAC
/* 8D488 8009CC88 1F000524 */   addiu     $a1, $zero, 0x1F
/* 8D48C 8009CC8C 20000624 */  addiu      $a2, $zero, 0x20
/* 8D490 8009CC90 0000848E */  lw         $a0, 0x0($s4)
/* 8D494 8009CC94 7FC5010C */  jal        SetFXHitData
/* 8D498 8009CC98 00010724 */   addiu     $a3, $zero, 0x100
/* 8D49C 8009CC9C 4000053C */  lui        $a1, (0x400000 >> 16)
/* 8D4A0 8009CCA0 0000048E */  lw         $a0, 0x0($s0)
/* 8D4A4 8009CCA4 A1D1000C */  jal        INSTANCE_Post
/* 8D4A8 8009CCA8 21304000 */   addu      $a2, $v0, $zero
.L8009CCAC:
/* 8D4AC 8009CCAC 0000028E */  lw         $v0, 0x0($s0)
/* 8D4B0 8009CCB0 00000000 */  nop
/* 8D4B4 8009CCB4 84FA82AF */  sw         $v0, %gp_rel(Raziel + 0x454)($gp)
/* 8D4B8 8009CCB8 73730208 */  j          .L8009CDCC
/* 8D4BC 8009CCBC 2120D403 */   addu      $a0, $fp, $s4
.L8009CCC0:
/* 8D4C0 8009CCC0 4200A016 */  bnez       $s5, .L8009CDCC
/* 8D4C4 8009CCC4 2120D403 */   addu      $a0, $fp, $s4
/* 8D4C8 8009CCC8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D4CC 8009CCCC 0010033C */  lui        $v1, (0x10000000 >> 16)
/* 8D4D0 8009CCD0 24104300 */  and        $v0, $v0, $v1
/* 8D4D4 8009CCD4 19004010 */  beqz       $v0, .L8009CD3C
/* 8D4D8 8009CCD8 21280000 */   addu      $a1, $zero, $zero
/* 8D4DC 8009CCDC 2130A000 */  addu       $a2, $a1, $zero
/* 8D4E0 8009CCE0 08000224 */  addiu      $v0, $zero, 0x8
/* 8D4E4 8009CCE4 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8D4E8 8009CCE8 0000848E */  lw         $a0, 0x0($s4)
/* 8D4EC 8009CCEC 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 8D4F0 8009CCF0 2138A000 */   addu      $a3, $a1, $zero
/* 8D4F4 8009CCF4 06004010 */  beqz       $v0, .L8009CD10
/* 8D4F8 8009CCF8 1A000524 */   addiu     $a1, $zero, 0x1A
/* 8D4FC 8009CCFC 1000B6AF */  sw         $s6, 0x10($sp)
/* 8D500 8009CD00 21208002 */  addu       $a0, $s4, $zero
/* 8D504 8009CD04 21300000 */  addu       $a2, $zero, $zero
/* 8D508 8009CD08 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 8D50C 8009CD0C 2138C000 */   addu      $a3, $a2, $zero
.L8009CD10:
/* 8D510 8009CD10 21208002 */  addu       $a0, $s4, $zero
/* 8D514 8009CD14 0B80053C */  lui        $a1, %hi(StateHandlerCompression)
/* 8D518 8009CD18 ACB5A524 */  addiu      $a1, $a1, %lo(StateHandlerCompression)
/* 8D51C 8009CD1C F4CA010C */  jal        StateSwitchStateCharacterData
/* 8D520 8009CD20 21300000 */   addu      $a2, $zero, $zero
/* 8D524 8009CD24 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D528 8009CD28 FFDF0324 */  addiu      $v1, $zero, -0x2001
.L8009CD2C:
/* 8D52C 8009CD2C 24104300 */  and        $v0, $v0, $v1
/* 8D530 8009CD30 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8D534 8009CD34 73730208 */  j          .L8009CDCC
/* 8D538 8009CD38 2120D403 */   addu      $a0, $fp, $s4
.L8009CD3C:
/* 8D53C 8009CD3C 94008426 */  addiu      $a0, $s4, 0x94
/* 8D540 8009CD40 0080053C */  lui        $a1, (0x80000001 >> 16)
/* 8D544 8009CD44 0100A534 */  ori        $a1, $a1, (0x80000001 & 0xFFFF)
.L8009CD48:
/* 8D548 8009CD48 4EC3010C */  jal        EnMessageQueueData
/* 8D54C 8009CD4C 21300000 */   addu      $a2, $zero, $zero
/* 8D550 8009CD50 73730208 */  j          .L8009CDCC
/* 8D554 8009CD54 2120D403 */   addu      $a0, $fp, $s4
.L8009CD58:
/* 8D558 8009CD58 1C00B616 */  bne        $s5, $s6, .L8009CDCC
/* 8D55C 8009CD5C 2120D403 */   addu      $a0, $fp, $s4
/* 8D560 8009CD60 0400308E */  lw         $s0, 0x4($s1)
/* 8D564 8009CD64 00000000 */  nop
/* 8D568 8009CD68 0400028E */  lw         $v0, 0x4($s0)
/* 8D56C 8009CD6C 00000000 */  nop
/* 8D570 8009CD70 16004010 */  beqz       $v0, .L8009CDCC
/* 8D574 8009CD74 00000000 */   nop
/* 8D578 8009CD78 78FA828F */  lw         $v0, %gp_rel(Raziel + 0x448)($gp)
/* 8D57C 8009CD7C 00000000 */  nop
/* 8D580 8009CD80 20004794 */  lhu        $a3, 0x20($v0)
/* 8D584 8009CD84 0F004290 */  lbu        $v0, 0xF($v0)
/* 8D588 8009CD88 00000000 */  nop
/* 8D58C 8009CD8C 1000A2AF */  sw         $v0, 0x10($sp)
/* 8D590 8009CD90 0000048E */  lw         $a0, 0x0($s0)
/* 8D594 8009CD94 0C00068E */  lw         $a2, 0xC($s0)
/* 8D598 8009CD98 95C3010C */  jal        SetMonsterHitData
/* 8D59C 8009CD9C 21280000 */   addu      $a1, $zero, $zero
/* 8D5A0 8009CDA0 0001053C */  lui        $a1, (0x100001F >> 16)
/* 8D5A4 8009CDA4 1F00A534 */  ori        $a1, $a1, (0x100001F & 0xFFFF)
/* 8D5A8 8009CDA8 0400048E */  lw         $a0, 0x4($s0)
/* 8D5AC 8009CDAC A1D1000C */  jal        INSTANCE_Post
/* 8D5B0 8009CDB0 21304000 */   addu      $a2, $v0, $zero
/* 8D5B4 8009CDB4 73730208 */  j          .L8009CDCC
/* 8D5B8 8009CDB8 2120D403 */   addu      $a0, $fp, $s4
.L8009CDBC:
/* 8D5BC 8009CDBC 7000A68F */  lw         $a2, 0x70($sp)
/* 8D5C0 8009CDC0 B9BF020C */  jal        DefaultStateHandler
/* 8D5C4 8009CDC4 2128A002 */   addu      $a1, $s5, $zero
.L8009CDC8:
/* 8D5C8 8009CDC8 2120D403 */  addu       $a0, $fp, $s4
.L8009CDCC:
/* 8D5CC 8009CDCC 27C3010C */  jal        DeMessageQueue
/* 8D5D0 8009CDD0 0C008424 */   addiu     $a0, $a0, 0xC
/* 8D5D4 8009CDD4 B36F0208 */  j          .L8009BECC
/* 8D5D8 8009CDD8 2110D403 */   addu      $v0, $fp, $s4
.L8009CDDC:
/* 8D5DC 8009CDDC 7CFA828F */  lw         $v0, %gp_rel(Raziel + 0x44C)($gp)
/* 8D5E0 8009CDE0 00000000 */  nop
/* 8D5E4 8009CDE4 04004230 */  andi       $v0, $v0, 0x4
/* 8D5E8 8009CDE8 1A004010 */  beqz       $v0, .L8009CE54
/* 8D5EC 8009CDEC FF00A232 */   andi      $v0, $s5, 0xFF
/* 8D5F0 8009CDF0 40180200 */  sll        $v1, $v0, 1
/* 8D5F4 8009CDF4 21186200 */  addu       $v1, $v1, $v0
/* 8D5F8 8009CDF8 00190300 */  sll        $v1, $v1, 4
/* 8D5FC 8009CDFC 0000858E */  lw         $a1, 0x0($s4)
/* 8D600 8009CE00 78FA828F */  lw         $v0, %gp_rel(Raziel + 0x448)($gp)
/* 8D604 8009CE04 21186500 */  addu       $v1, $v1, $a1
/* 8D608 8009CE08 04004490 */  lbu        $a0, 0x4($v0)
/* 8D60C 8009CE0C F0016384 */  lh         $v1, 0x1F0($v1)
/* 8D610 8009CE10 40100400 */  sll        $v0, $a0, 1
/* 8D614 8009CE14 21104400 */  addu       $v0, $v0, $a0
/* 8D618 8009CE18 C0100200 */  sll        $v0, $v0, 3
/* 8D61C 8009CE1C 21104400 */  addu       $v0, $v0, $a0
/* 8D620 8009CE20 80100200 */  sll        $v0, $v0, 2
/* 8D624 8009CE24 2A186200 */  slt        $v1, $v1, $v0
/* 8D628 8009CE28 0A006014 */  bnez       $v1, .L8009CE54
/* 8D62C 8009CE2C C0201500 */   sll       $a0, $s5, 3
/* 8D630 8009CE30 21209500 */  addu       $a0, $a0, $s5
/* 8D634 8009CE34 C0200400 */  sll        $a0, $a0, 3
/* 8D638 8009CE38 23209500 */  subu       $a0, $a0, $s5
/* 8D63C 8009CE3C 80200400 */  sll        $a0, $a0, 2
/* 8D640 8009CE40 21209400 */  addu       $a0, $a0, $s4
/* 8D644 8009CE44 0C008424 */  addiu      $a0, $a0, 0xC
/* 8D648 8009CE48 1000053C */  lui        $a1, (0x100000 >> 16)
/* 8D64C 8009CE4C 4EC3010C */  jal        EnMessageQueueData
/* 8D650 8009CE50 21300000 */   addu      $a2, $zero, $zero
.L8009CE54:
/* 8D654 8009CE54 3800A88F */  lw         $t0, 0x38($sp)
/* 8D658 8009CE58 00000000 */  nop
/* 8D65C 8009CE5C 09000011 */  beqz       $t0, .L8009CE84
/* 8D660 8009CE60 00000000 */   nop
/* 8D664 8009CE64 3C00A88F */  lw         $t0, 0x3C($sp)
/* 8D668 8009CE68 00000000 */  nop
/* 8D66C 8009CE6C 05000011 */  beqz       $t0, .L8009CE84
/* 8D670 8009CE70 21200001 */   addu      $a0, $t0, $zero
/* 8D674 8009CE74 0001053C */  lui        $a1, (0x1000024 >> 16)
/* 8D678 8009CE78 2400A534 */  ori        $a1, $a1, (0x1000024 & 0xFFFF)
/* 8D67C 8009CE7C A1D1000C */  jal        INSTANCE_Post
/* 8D680 8009CE80 21300000 */   addu      $a2, $zero, $zero
.L8009CE84:
/* 8D684 8009CE84 6400BF8F */  lw         $ra, 0x64($sp)
/* 8D688 8009CE88 6000BE8F */  lw         $fp, 0x60($sp)
/* 8D68C 8009CE8C 5C00B78F */  lw         $s7, 0x5C($sp)
/* 8D690 8009CE90 5800B68F */  lw         $s6, 0x58($sp)
/* 8D694 8009CE94 5400B58F */  lw         $s5, 0x54($sp)
/* 8D698 8009CE98 5000B48F */  lw         $s4, 0x50($sp)
/* 8D69C 8009CE9C 4C00B38F */  lw         $s3, 0x4C($sp)
/* 8D6A0 8009CEA0 4800B28F */  lw         $s2, 0x48($sp)
/* 8D6A4 8009CEA4 4400B18F */  lw         $s1, 0x44($sp)
/* 8D6A8 8009CEA8 4000B08F */  lw         $s0, 0x40($sp)
/* 8D6AC 8009CEAC 0800E003 */  jr         $ra
/* 8D6B0 8009CEB0 6800BD27 */   addiu     $sp, $sp, 0x68
.size StateHandlerAttack2, . - StateHandlerAttack2
