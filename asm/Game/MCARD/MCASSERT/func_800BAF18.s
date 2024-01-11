.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BAF18
/* AB718 800BAF18 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* AB71C 800BAF1C 1800B0AF */  sw         $s0, 0x18($sp)
/* AB720 800BAF20 2180A000 */  addu       $s0, $a1, $zero
/* AB724 800BAF24 1C00B1AF */  sw         $s1, 0x1C($sp)
/* AB728 800BAF28 21888000 */  addu       $s1, $a0, $zero
/* AB72C 800BAF2C 2000BFAF */  sw         $ra, 0x20($sp)
/* AB730 800BAF30 00000486 */  lh         $a0, 0x0($s0)
/* AB734 800BAF34 02000586 */  lh         $a1, 0x2($s0)
/* AB738 800BAF38 E8EC020C */  jal        func_800BB3A0
/* AB73C 800BAF3C 00000000 */   nop
/* AB740 800BAF40 040022AE */  sw         $v0, 0x4($s1)
/* AB744 800BAF44 04000496 */  lhu        $a0, 0x4($s0)
/* AB748 800BAF48 00000296 */  lhu        $v0, 0x0($s0)
/* AB74C 800BAF4C 02000596 */  lhu        $a1, 0x2($s0)
/* AB750 800BAF50 21208200 */  addu       $a0, $a0, $v0
/* AB754 800BAF54 FFFF8424 */  addiu      $a0, $a0, -0x1
/* AB758 800BAF58 00240400 */  sll        $a0, $a0, 16
/* AB75C 800BAF5C 06000296 */  lhu        $v0, 0x6($s0)
/* AB760 800BAF60 03240400 */  sra        $a0, $a0, 16
/* AB764 800BAF64 2128A200 */  addu       $a1, $a1, $v0
/* AB768 800BAF68 FFFFA524 */  addiu      $a1, $a1, -0x1
/* AB76C 800BAF6C 002C0500 */  sll        $a1, $a1, 16
/* AB770 800BAF70 0EED020C */  jal        func_800BB438
/* AB774 800BAF74 032C0500 */   sra       $a1, $a1, 16
/* AB778 800BAF78 080022AE */  sw         $v0, 0x8($s1)
/* AB77C 800BAF7C 08000486 */  lh         $a0, 0x8($s0)
/* AB780 800BAF80 0A000586 */  lh         $a1, 0xA($s0)
/* AB784 800BAF84 34ED020C */  jal        func_800BB4D0
/* AB788 800BAF88 00000000 */   nop
/* AB78C 800BAF8C 0C0022AE */  sw         $v0, 0xC($s1)
/* AB790 800BAF90 17000492 */  lbu        $a0, 0x17($s0)
/* AB794 800BAF94 16000592 */  lbu        $a1, 0x16($s0)
/* AB798 800BAF98 14000696 */  lhu        $a2, 0x14($s0)
/* AB79C 800BAF9C E0EC020C */  jal        func_800BB380
/* AB7A0 800BAFA0 00000000 */   nop
/* AB7A4 800BAFA4 0C000426 */  addiu      $a0, $s0, 0xC
/* AB7A8 800BAFA8 3BED020C */  jal        func_800BB4EC
/* AB7AC 800BAFAC 100022AE */   sw        $v0, 0x10($s1)
/* AB7B0 800BAFB0 140022AE */  sw         $v0, 0x14($s1)
/* AB7B4 800BAFB4 00E6023C */  lui        $v0, (0xE6000000 >> 16)
/* AB7B8 800BAFB8 180022AE */  sw         $v0, 0x18($s1)
/* AB7BC 800BAFBC 18000292 */  lbu        $v0, 0x18($s0)
/* AB7C0 800BAFC0 00000000 */  nop
/* AB7C4 800BAFC4 4B004010 */  beqz       $v0, .L800BB0F4
/* AB7C8 800BAFC8 07000824 */   addiu     $t0, $zero, 0x7
/* AB7CC 800BAFCC 00000296 */  lhu        $v0, 0x0($s0)
/* AB7D0 800BAFD0 00000000 */  nop
/* AB7D4 800BAFD4 1000A2A7 */  sh         $v0, 0x10($sp)
/* AB7D8 800BAFD8 02000296 */  lhu        $v0, 0x2($s0)
/* AB7DC 800BAFDC 00000000 */  nop
/* AB7E0 800BAFE0 1200A2A7 */  sh         $v0, 0x12($sp)
/* AB7E4 800BAFE4 04000496 */  lhu        $a0, 0x4($s0)
/* AB7E8 800BAFE8 00000000 */  nop
/* AB7EC 800BAFEC 1400A4A7 */  sh         $a0, 0x14($sp)
/* AB7F0 800BAFF0 06000296 */  lhu        $v0, 0x6($s0)
/* AB7F4 800BAFF4 00000000 */  nop
/* AB7F8 800BAFF8 1600A2A7 */  sh         $v0, 0x16($sp)
/* AB7FC 800BAFFC 00140400 */  sll        $v0, $a0, 16
/* AB800 800BB000 031C0200 */  sra        $v1, $v0, 16
/* AB804 800BB004 0B006004 */  bltz       $v1, .L800BB034
/* AB808 800BB008 21100000 */   addu      $v0, $zero, $zero
/* AB80C 800BB00C 0D80023C */  lui        $v0, %hi(GEnv + 0x4)
/* AB810 800BB010 10DA4284 */  lh         $v0, %lo(GEnv + 0x4)($v0)
/* AB814 800BB014 00000000 */  nop
/* AB818 800BB018 FFFF4224 */  addiu      $v0, $v0, -0x1
/* AB81C 800BB01C 2A104300 */  slt        $v0, $v0, $v1
/* AB820 800BB020 0D80033C */  lui        $v1, %hi(GEnv + 0x4)
/* AB824 800BB024 10DA6394 */  lhu        $v1, %lo(GEnv + 0x4)($v1)
/* AB828 800BB028 02004014 */  bnez       $v0, .L800BB034
/* AB82C 800BB02C FFFF6224 */   addiu     $v0, $v1, -0x1
/* AB830 800BB030 21108000 */  addu       $v0, $a0, $zero
.L800BB034:
/* AB834 800BB034 1600A387 */  lh         $v1, 0x16($sp)
/* AB838 800BB038 1600A497 */  lhu        $a0, 0x16($sp)
/* AB83C 800BB03C 0C006004 */  bltz       $v1, .L800BB070
/* AB840 800BB040 1400A2A7 */   sh        $v0, 0x14($sp)
/* AB844 800BB044 0D80023C */  lui        $v0, %hi(GEnv + 0x6)
/* AB848 800BB048 12DA4284 */  lh         $v0, %lo(GEnv + 0x6)($v0)
/* AB84C 800BB04C 00000000 */  nop
/* AB850 800BB050 FFFF4224 */  addiu      $v0, $v0, -0x1
/* AB854 800BB054 2A104300 */  slt        $v0, $v0, $v1
/* AB858 800BB058 0D80033C */  lui        $v1, %hi(GEnv + 0x6)
/* AB85C 800BB05C 12DA6394 */  lhu        $v1, %lo(GEnv + 0x6)($v1)
/* AB860 800BB060 04004014 */  bnez       $v0, .L800BB074
/* AB864 800BB064 FFFF6224 */   addiu     $v0, $v1, -0x1
/* AB868 800BB068 1DEC0208 */  j          .L800BB074
/* AB86C 800BB06C 21108000 */   addu      $v0, $a0, $zero
.L800BB070:
/* AB870 800BB070 21100000 */  addu       $v0, $zero, $zero
.L800BB074:
/* AB874 800BB074 80300800 */  sll        $a2, $t0, 2
/* AB878 800BB078 01000825 */  addiu      $t0, $t0, 0x1
/* AB87C 800BB07C 80380800 */  sll        $a3, $t0, 2
/* AB880 800BB080 01000825 */  addiu      $t0, $t0, 0x1
/* AB884 800BB084 80280800 */  sll        $a1, $t0, 2
/* AB888 800BB088 01000825 */  addiu      $t0, $t0, 0x1
/* AB88C 800BB08C 1600A2A7 */  sh         $v0, 0x16($sp)
/* AB890 800BB090 1000A297 */  lhu        $v0, 0x10($sp)
/* AB894 800BB094 08000396 */  lhu        $v1, 0x8($s0)
/* AB898 800BB098 2130D100 */  addu       $a2, $a2, $s1
/* AB89C 800BB09C 23104300 */  subu       $v0, $v0, $v1
/* AB8A0 800BB0A0 1000A2A7 */  sh         $v0, 0x10($sp)
/* AB8A4 800BB0A4 1200A297 */  lhu        $v0, 0x12($sp)
/* AB8A8 800BB0A8 0A000396 */  lhu        $v1, 0xA($s0)
/* AB8AC 800BB0AC 0060043C */  lui        $a0, (0x60000000 >> 16)
/* AB8B0 800BB0B0 23104300 */  subu       $v0, $v0, $v1
/* AB8B4 800BB0B4 1200A2A7 */  sh         $v0, 0x12($sp)
/* AB8B8 800BB0B8 1B000292 */  lbu        $v0, 0x1B($s0)
/* AB8BC 800BB0BC 1A000392 */  lbu        $v1, 0x1A($s0)
/* AB8C0 800BB0C0 00140200 */  sll        $v0, $v0, 16
/* AB8C4 800BB0C4 001A0300 */  sll        $v1, $v1, 8
/* AB8C8 800BB0C8 25186400 */  or         $v1, $v1, $a0
/* AB8CC 800BB0CC 19000492 */  lbu        $a0, 0x19($s0)
/* AB8D0 800BB0D0 25104300 */  or         $v0, $v0, $v1
/* AB8D4 800BB0D4 25104400 */  or         $v0, $v0, $a0
/* AB8D8 800BB0D8 0000C2AC */  sw         $v0, 0x0($a2)
/* AB8DC 800BB0DC 1000A28F */  lw         $v0, 0x10($sp)
/* AB8E0 800BB0E0 2138F100 */  addu       $a3, $a3, $s1
/* AB8E4 800BB0E4 0000E2AC */  sw         $v0, 0x0($a3)
/* AB8E8 800BB0E8 1400A28F */  lw         $v0, 0x14($sp)
/* AB8EC 800BB0EC 2128B100 */  addu       $a1, $a1, $s1
/* AB8F0 800BB0F0 0000A2AC */  sw         $v0, 0x0($a1)
.L800BB0F4:
/* AB8F4 800BB0F4 FFFF0225 */  addiu      $v0, $t0, -0x1
/* AB8F8 800BB0F8 030022A2 */  sb         $v0, 0x3($s1)
/* AB8FC 800BB0FC 2000BF8F */  lw         $ra, 0x20($sp)
/* AB900 800BB100 1C00B18F */  lw         $s1, 0x1C($sp)
/* AB904 800BB104 1800B08F */  lw         $s0, 0x18($sp)
/* AB908 800BB108 0800E003 */  jr         $ra
/* AB90C 800BB10C 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800BAF18, . - func_800BAF18
