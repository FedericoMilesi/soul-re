.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BB664
/* ABE64 800BB664 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* ABE68 800BB668 21408000 */  addu       $t0, $a0, $zero
/* ABE6C 800BB66C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* ABE70 800BB670 1800B2AF */  sw         $s2, 0x18($sp)
/* ABE74 800BB674 1400B1AF */  sw         $s1, 0x14($sp)
/* ABE78 800BB678 1000B0AF */  sw         $s0, 0x10($sp)
/* ABE7C 800BB67C 04000385 */  lh         $v1, 0x4($t0)
/* ABE80 800BB680 04000495 */  lhu        $a0, 0x4($t0)
/* ABE84 800BB684 0C006004 */  bltz       $v1, .L800BB6B8
/* ABE88 800BB688 2148A000 */   addu      $t1, $a1, $zero
/* ABE8C 800BB68C 0D80023C */  lui        $v0, %hi(GEnv + 0x4)
/* ABE90 800BB690 10DA4284 */  lh         $v0, %lo(GEnv + 0x4)($v0)
/* ABE94 800BB694 00000000 */  nop
/* ABE98 800BB698 FFFF4224 */  addiu      $v0, $v0, -0x1
/* ABE9C 800BB69C 2A104300 */  slt        $v0, $v0, $v1
/* ABEA0 800BB6A0 0D80033C */  lui        $v1, %hi(GEnv + 0x4)
/* ABEA4 800BB6A4 10DA6394 */  lhu        $v1, %lo(GEnv + 0x4)($v1)
/* ABEA8 800BB6A8 04004014 */  bnez       $v0, .L800BB6BC
/* ABEAC 800BB6AC FFFF6224 */   addiu     $v0, $v1, -0x1
/* ABEB0 800BB6B0 AFED0208 */  j          .L800BB6BC
/* ABEB4 800BB6B4 21108000 */   addu      $v0, $a0, $zero
.L800BB6B8:
/* ABEB8 800BB6B8 21100000 */  addu       $v0, $zero, $zero
.L800BB6BC:
/* ABEBC 800BB6BC 06000385 */  lh         $v1, 0x6($t0)
/* ABEC0 800BB6C0 06000495 */  lhu        $a0, 0x6($t0)
/* ABEC4 800BB6C4 0C006004 */  bltz       $v1, .L800BB6F8
/* ABEC8 800BB6C8 040002A5 */   sh        $v0, 0x4($t0)
/* ABECC 800BB6CC 0D80023C */  lui        $v0, %hi(GEnv + 0x6)
/* ABED0 800BB6D0 12DA4284 */  lh         $v0, %lo(GEnv + 0x6)($v0)
/* ABED4 800BB6D4 00000000 */  nop
/* ABED8 800BB6D8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* ABEDC 800BB6DC 2A104300 */  slt        $v0, $v0, $v1
/* ABEE0 800BB6E0 0D80033C */  lui        $v1, %hi(GEnv + 0x6)
/* ABEE4 800BB6E4 12DA6394 */  lhu        $v1, %lo(GEnv + 0x6)($v1)
/* ABEE8 800BB6E8 04004014 */  bnez       $v0, .L800BB6FC
/* ABEEC 800BB6EC FFFF6324 */   addiu     $v1, $v1, -0x1
/* ABEF0 800BB6F0 BFED0208 */  j          .L800BB6FC
/* ABEF4 800BB6F4 21188000 */   addu      $v1, $a0, $zero
.L800BB6F8:
/* ABEF8 800BB6F8 21180000 */  addu       $v1, $zero, $zero
.L800BB6FC:
/* ABEFC 800BB6FC 00000295 */  lhu        $v0, 0x0($t0)
/* ABF00 800BB700 00000000 */  nop
/* ABF04 800BB704 3F004230 */  andi       $v0, $v0, 0x3F
/* ABF08 800BB708 06004014 */  bnez       $v0, .L800BB724
/* ABF0C 800BB70C 060003A5 */   sh        $v1, 0x6($t0)
/* ABF10 800BB710 04000295 */  lhu        $v0, 0x4($t0)
/* ABF14 800BB714 00000000 */  nop
/* ABF18 800BB718 3F004230 */  andi       $v0, $v0, 0x3F
/* ABF1C 800BB71C 37004010 */  beqz       $v0, .L800BB7FC
/* ABF20 800BB720 FF05023C */   lui       $v0, (0x5FFFFFF >> 16)
.L800BB724:
/* ABF24 800BB724 FF00063C */  lui        $a2, (0xFFFFFF >> 16)
/* ABF28 800BB728 FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
/* ABF2C 800BB72C FFE4043C */  lui        $a0, (0xE4FFFFFF >> 16)
/* ABF30 800BB730 FFFF8434 */  ori        $a0, $a0, (0xE4FFFFFF & 0xFFFF)
/* ABF34 800BB734 FF03073C */  lui        $a3, (0x3FFFFFF >> 16)
/* ABF38 800BB738 0E80053C */  lui        $a1, %hi(gMemcard + 0x10)
/* ABF3C 800BB73C 18BDA524 */  addiu      $a1, $a1, %lo(gMemcard + 0x10)
/* ABF40 800BB740 0E80103C */  lui        $s0, %hi(gMemcard + 0x38)
/* ABF44 800BB744 40BD1026 */  addiu      $s0, $s0, %lo(gMemcard + 0x38)
/* ABF48 800BB748 24100602 */  and        $v0, $s0, $a2
/* ABF4C 800BB74C 0008033C */  lui        $v1, (0x8000000 >> 16)
/* ABF50 800BB750 25104300 */  or         $v0, $v0, $v1
/* ABF54 800BB754 00E3113C */  lui        $s1, (0xE3000000 >> 16)
/* ABF58 800BB758 00E5123C */  lui        $s2, (0xE500FFFF >> 16)
/* ABF5C 800BB75C 0000A2AC */  sw         $v0, 0x0($a1)
/* ABF60 800BB760 00E6023C */  lui        $v0, (0xE6000000 >> 16)
/* ABF64 800BB764 24302601 */  and        $a2, $t1, $a2
/* ABF68 800BB768 0060033C */  lui        $v1, (0x60000000 >> 16)
/* ABF6C 800BB76C 2530C300 */  or         $a2, $a2, $v1
/* ABF70 800BB770 1000A2AC */  sw         $v0, 0x10($a1)
/* ABF74 800BB774 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* ABF78 800BB778 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* ABF7C 800BB77C 00E1033C */  lui        $v1, (0xE1000000 >> 16)
/* ABF80 800BB780 0400B1AC */  sw         $s1, 0x4($a1)
/* ABF84 800BB784 0800A4AC */  sw         $a0, 0x8($a1)
/* ABF88 800BB788 0C00B2AC */  sw         $s2, 0xC($a1)
/* ABF8C 800BB78C 0000448C */  lw         $a0, 0x0($v0)
/* ABF90 800BB790 C2170900 */  srl        $v0, $t1, 31
/* ABF94 800BB794 80120200 */  sll        $v0, $v0, 10
/* ABF98 800BB798 25104300 */  or         $v0, $v0, $v1
/* ABF9C 800BB79C 1800A6AC */  sw         $a2, 0x18($a1)
/* ABFA0 800BB7A0 FF078430 */  andi       $a0, $a0, 0x7FF
/* ABFA4 800BB7A4 25208200 */  or         $a0, $a0, $v0
/* ABFA8 800BB7A8 1400A4AC */  sw         $a0, 0x14($a1)
/* ABFAC 800BB7AC 0000028D */  lw         $v0, 0x0($t0)
/* ABFB0 800BB7B0 FFFFE734 */  ori        $a3, $a3, (0x3FFFFFF & 0xFFFF)
/* ABFB4 800BB7B4 1C00A2AC */  sw         $v0, 0x1C($a1)
/* ABFB8 800BB7B8 0400028D */  lw         $v0, 0x4($t0)
/* ABFBC 800BB7BC 03000424 */  addiu      $a0, $zero, 0x3
/* ABFC0 800BB7C0 000007AE */  sw         $a3, 0x0($s0)
/* ABFC4 800BB7C4 84EF020C */  jal        func_800BBE10
/* ABFC8 800BB7C8 2000A2AC */   sw        $v0, 0x20($a1)
/* ABFCC 800BB7CC 04000424 */  addiu      $a0, $zero, 0x4
/* ABFD0 800BB7D0 25105100 */  or         $v0, $v0, $s1
/* ABFD4 800BB7D4 84EF020C */  jal        func_800BBE10
/* ABFD8 800BB7D8 040002AE */   sw        $v0, 0x4($s0)
/* ABFDC 800BB7DC 05000424 */  addiu      $a0, $zero, 0x5
/* ABFE0 800BB7E0 00E4033C */  lui        $v1, (0xE4000000 >> 16)
/* ABFE4 800BB7E4 25104300 */  or         $v0, $v0, $v1
/* ABFE8 800BB7E8 84EF020C */  jal        func_800BBE10
/* ABFEC 800BB7EC 080002AE */   sw        $v0, 0x8($s0)
/* ABFF0 800BB7F0 25105200 */  or         $v0, $v0, $s2
/* ABFF4 800BB7F4 1BEE0208 */  j          .L800BB86C
/* ABFF8 800BB7F8 0C0002AE */   sw        $v0, 0xC($s0)
.L800BB7FC:
/* ABFFC 800BB7FC FFFF4234 */  ori        $v0, $v0, (0xE500FFFF & 0xFFFF)
/* AC000 800BB800 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* AC004 800BB804 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* AC008 800BB808 0E80063C */  lui        $a2, %hi(gMemcard + 0x10)
/* AC00C 800BB80C 18BDC624 */  addiu      $a2, $a2, %lo(gMemcard + 0x10)
/* AC010 800BB810 0000C2AC */  sw         $v0, 0x0($a2)
/* AC014 800BB814 00E6023C */  lui        $v0, (0xE6000000 >> 16)
/* AC018 800BB818 24182301 */  and        $v1, $t1, $v1
/* AC01C 800BB81C 0002053C */  lui        $a1, (0x2000000 >> 16)
/* AC020 800BB820 0400C2AC */  sw         $v0, 0x4($a2)
/* AC024 800BB824 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* AC028 800BB828 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* AC02C 800BB82C 25186500 */  or         $v1, $v1, $a1
/* AC030 800BB830 0000448C */  lw         $a0, 0x0($v0)
/* AC034 800BB834 C2170900 */  srl        $v0, $t1, 31
/* AC038 800BB838 80120200 */  sll        $v0, $v0, 10
/* AC03C 800BB83C 0C00C3AC */  sw         $v1, 0xC($a2)
/* AC040 800BB840 00E1033C */  lui        $v1, (0xE1000000 >> 16)
/* AC044 800BB844 25104300 */  or         $v0, $v0, $v1
/* AC048 800BB848 FF078430 */  andi       $a0, $a0, 0x7FF
/* AC04C 800BB84C 25208200 */  or         $a0, $a0, $v0
/* AC050 800BB850 0800C4AC */  sw         $a0, 0x8($a2)
/* AC054 800BB854 0000028D */  lw         $v0, 0x0($t0)
/* AC058 800BB858 00000000 */  nop
/* AC05C 800BB85C 1000C2AC */  sw         $v0, 0x10($a2)
/* AC060 800BB860 0400028D */  lw         $v0, 0x4($t0)
/* AC064 800BB864 00000000 */  nop
/* AC068 800BB868 1400C2AC */  sw         $v0, 0x14($a2)
.L800BB86C:
/* AC06C 800BB86C 0E80043C */  lui        $a0, %hi(gMemcard + 0x10)
/* AC070 800BB870 72EF020C */  jal        func_800BBDC8
/* AC074 800BB874 18BD8424 */   addiu     $a0, $a0, %lo(gMemcard + 0x10)
/* AC078 800BB878 21100000 */  addu       $v0, $zero, $zero
/* AC07C 800BB87C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* AC080 800BB880 1800B28F */  lw         $s2, 0x18($sp)
/* AC084 800BB884 1400B18F */  lw         $s1, 0x14($sp)
/* AC088 800BB888 1000B08F */  lw         $s0, 0x10($sp)
/* AC08C 800BB88C 0800E003 */  jr         $ra
/* AC090 800BB890 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800BB664, . - func_800BB664
