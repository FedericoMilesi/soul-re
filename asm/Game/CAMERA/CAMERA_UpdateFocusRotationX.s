.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_UpdateFocusRotationX
/* CFDC 8001C7DC D0FFBD27 */  addiu      $sp, $sp, -0x30
/* CFE0 8001C7E0 2000B0AF */  sw         $s0, 0x20($sp)
/* CFE4 8001C7E4 21808000 */  addu       $s0, $a0, $zero
/* CFE8 8001C7E8 2800B2AF */  sw         $s2, 0x28($sp)
/* CFEC 8001C7EC 2C00BFAF */  sw         $ra, 0x2C($sp)
/* CFF0 8001C7F0 2400B1AF */  sw         $s1, 0x24($sp)
/* CFF4 8001C7F4 B400A48C */  lw         $a0, 0xB4($a1)
/* CFF8 8001C7F8 A8011196 */  lhu        $s1, 0x1A8($s0)
/* CFFC 8001C7FC 4E008010 */  beqz       $a0, .L8001C938
/* D000 8001C800 21900000 */   addu      $s2, $zero, $zero
/* D004 8001C804 BC00A28C */  lw         $v0, 0xBC($a1)
/* D008 8001C808 00000000 */  nop
/* D00C 8001C80C 0000458C */  lw         $a1, 0x0($v0)
/* D010 8001C810 00000000 */  nop
/* D014 8001C814 4800A010 */  beqz       $a1, .L8001C938
/* D018 8001C818 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* D01C 8001C81C 0A008394 */  lhu        $v1, 0xA($a0)
/* D020 8001C820 00000000 */  nop
/* D024 8001C824 44006210 */  beq        $v1, $v0, .L8001C938
/* D028 8001C828 21106000 */   addu      $v0, $v1, $zero
/* D02C 8001C82C 3400A38C */  lw         $v1, 0x34($a1)
/* D030 8001C830 00000000 */  nop
/* D034 8001C834 21186200 */  addu       $v1, $v1, $v0
/* D038 8001C838 0A006294 */  lhu        $v0, 0xA($v1)
/* D03C 8001C83C 00000000 */  nop
/* D040 8001C840 00804230 */  andi       $v0, $v0, 0x8000
/* D044 8001C844 3C004010 */  beqz       $v0, .L8001C938
/* D048 8001C848 00141100 */   sll       $v0, $s1, 16
/* D04C 8001C84C 03140200 */  sra        $v0, $v0, 16
/* D050 8001C850 600B4228 */  slti       $v0, $v0, 0xB60
/* D054 8001C854 39004010 */  beqz       $v0, .L8001C93C
/* D058 8001C858 21104002 */   addu      $v0, $s2, $zero
/* D05C 8001C85C 08008484 */  lh         $a0, 0x8($a0)
/* D060 8001C860 2400A58C */  lw         $a1, 0x24($a1)
/* D064 8001C864 C27A000C */  jal        COLLIDE_GetNormal
/* D068 8001C868 1800A627 */   addiu     $a2, $sp, 0x18
/* D06C 8001C86C 1C00A287 */  lh         $v0, 0x1C($sp)
/* D070 8001C870 00000000 */  nop
/* D074 8001C874 6E0F4228 */  slti       $v0, $v0, 0xF6E
/* D078 8001C878 30004010 */  beqz       $v0, .L8001C93C
/* D07C 8001C87C 21104002 */   addu      $v0, $s2, $zero
/* D080 8001C880 01001224 */  addiu      $s2, $zero, 0x1
/* D084 8001C884 40010586 */  lh         $a1, 0x140($s0)
/* D088 8001C888 3862000C */  jal        CAMERA_CalcTilt
/* D08C 8001C88C 1800A427 */   addiu     $a0, $sp, 0x18
/* D090 8001C890 C0180200 */  sll        $v1, $v0, 3
/* D094 8001C894 21106200 */  addu       $v0, $v1, $v0
/* D098 8001C898 02004104 */  bgez       $v0, .L8001C8A4
/* D09C 8001C89C 00000000 */   nop
/* D0A0 8001C8A0 0F004224 */  addiu      $v0, $v0, 0xF
.L8001C8A4:
/* D0A4 8001C8A4 03110200 */  sra        $v0, $v0, 4
/* D0A8 8001C8A8 9E0102A6 */  sh         $v0, 0x19E($s0)
/* D0AC 8001C8AC 00140200 */  sll        $v0, $v0, 16
/* D0B0 8001C8B0 031C0200 */  sra        $v1, $v0, 16
/* D0B4 8001C8B4 00FF6228 */  slti       $v0, $v1, -0x100
/* D0B8 8001C8B8 05004014 */  bnez       $v0, .L8001C8D0
/* D0BC 8001C8BC 00FF0224 */   addiu     $v0, $zero, -0x100
/* D0C0 8001C8C0 01016228 */  slti       $v0, $v1, 0x101
/* D0C4 8001C8C4 04004014 */  bnez       $v0, .L8001C8D8
/* D0C8 8001C8C8 00141100 */   sll       $v0, $s1, 16
/* D0CC 8001C8CC 00010224 */  addiu      $v0, $zero, 0x100
.L8001C8D0:
/* D0D0 8001C8D0 9E0102A6 */  sh         $v0, 0x19E($s0)
/* D0D4 8001C8D4 00141100 */  sll        $v0, $s1, 16
.L8001C8D8:
/* D0D8 8001C8D8 03140200 */  sra        $v0, $v0, 16
/* D0DC 8001C8DC 600B0324 */  addiu      $v1, $zero, 0xB60
/* D0E0 8001C8E0 23186200 */  subu       $v1, $v1, $v0
/* D0E4 8001C8E4 00026228 */  slti       $v0, $v1, 0x200
/* D0E8 8001C8E8 0B004010 */  beqz       $v0, .L8001C918
/* D0EC 8001C8EC 01000424 */   addiu     $a0, $zero, 0x1
/* D0F0 8001C8F0 9E010286 */  lh         $v0, 0x19E($s0)
/* D0F4 8001C8F4 00000000 */  nop
/* D0F8 8001C8F8 18004300 */  mult       $v0, $v1
/* D0FC 8001C8FC 12100000 */  mflo       $v0
/* D100 8001C900 02004104 */  bgez       $v0, .L8001C90C
/* D104 8001C904 00000000 */   nop
/* D108 8001C908 FF014224 */  addiu      $v0, $v0, 0x1FF
.L8001C90C:
/* D10C 8001C90C 43120200 */  sra        $v0, $v0, 9
/* D110 8001C910 9E0102A6 */  sh         $v0, 0x19E($s0)
/* D114 8001C914 01000424 */  addiu      $a0, $zero, 0x1
.L8001C918:
/* D118 8001C918 FE000526 */  addiu      $a1, $s0, 0xFE
/* D11C 8001C91C 44010726 */  addiu      $a3, $s0, 0x144
/* D120 8001C920 9E010686 */  lh         $a2, 0x19E($s0)
/* D124 8001C924 46010226 */  addiu      $v0, $s0, 0x146
/* D128 8001C928 1000A2AF */  sw         $v0, 0x10($sp)
/* D12C 8001C92C 08000224 */  addiu      $v0, $zero, 0x8
/* D130 8001C930 7E5E000C */  jal        CriticalDampAngle
/* D134 8001C934 1400A2AF */   sw        $v0, 0x14($sp)
.L8001C938:
/* D138 8001C938 21104002 */  addu       $v0, $s2, $zero
.L8001C93C:
/* D13C 8001C93C 1C004014 */  bnez       $v0, .L8001C9B0
/* D140 8001C940 00000000 */   nop
/* D144 8001C944 9C04028E */  lw         $v0, 0x49C($s0)
/* D148 8001C948 00000000 */  nop
/* D14C 8001C94C 38004230 */  andi       $v0, $v0, 0x38
/* D150 8001C950 02004014 */  bnez       $v0, .L8001C95C
/* D154 8001C954 18000824 */   addiu     $t0, $zero, 0x18
/* D158 8001C958 9E0100A6 */  sh         $zero, 0x19E($s0)
.L8001C95C:
/* D15C 8001C95C 9C04028E */  lw         $v0, 0x49C($s0)
/* D160 8001C960 00000000 */  nop
/* D164 8001C964 00204230 */  andi       $v0, $v0, 0x2000
/* D168 8001C968 0A004010 */  beqz       $v0, .L8001C994
/* D16C 8001C96C 01000424 */   addiu     $a0, $zero, 0x1
/* D170 8001C970 AC040286 */  lh         $v0, 0x4AC($s0)
/* D174 8001C974 BA040386 */  lh         $v1, 0x4BA($s0)
/* D178 8001C978 00000000 */  nop
/* D17C 8001C97C 2A104300 */  slt        $v0, $v0, $v1
/* D180 8001C980 04004010 */  beqz       $v0, .L8001C994
/* D184 8001C984 80FE0224 */   addiu     $v0, $zero, -0x180
/* D188 8001C988 9E0102A6 */  sh         $v0, 0x19E($s0)
/* D18C 8001C98C 0C000824 */  addiu      $t0, $zero, 0xC
/* D190 8001C990 01000424 */  addiu      $a0, $zero, 0x1
.L8001C994:
/* D194 8001C994 FE000526 */  addiu      $a1, $s0, 0xFE
/* D198 8001C998 44010726 */  addiu      $a3, $s0, 0x144
/* D19C 8001C99C 9E010686 */  lh         $a2, 0x19E($s0)
/* D1A0 8001C9A0 46010226 */  addiu      $v0, $s0, 0x146
/* D1A4 8001C9A4 1000A2AF */  sw         $v0, 0x10($sp)
/* D1A8 8001C9A8 7E5E000C */  jal        CriticalDampAngle
/* D1AC 8001C9AC 1400A8AF */   sw        $t0, 0x14($sp)
.L8001C9B0:
/* D1B0 8001C9B0 B2010396 */  lhu        $v1, 0x1B2($s0)
/* D1B4 8001C9B4 FE000496 */  lhu        $a0, 0xFE($s0)
/* D1B8 8001C9B8 8C040296 */  lhu        $v0, 0x48C($s0)
/* D1BC 8001C9BC 21186400 */  addu       $v1, $v1, $a0
/* D1C0 8001C9C0 21104300 */  addu       $v0, $v0, $v1
/* D1C4 8001C9C4 FF0F4330 */  andi       $v1, $v0, 0xFFF
/* D1C8 8001C9C8 FFFC6224 */  addiu      $v0, $v1, -0x301
/* D1CC 8001C9CC FF04422C */  sltiu      $v0, $v0, 0x4FF
/* D1D0 8001C9D0 03004010 */  beqz       $v0, .L8001C9E0
/* D1D4 8001C9D4 21286000 */   addu      $a1, $v1, $zero
/* D1D8 8001C9D8 7D720008 */  j          .L8001C9F4
/* D1DC 8001C9DC 00030524 */   addiu     $a1, $zero, 0x300
.L8001C9E0:
/* D1E0 8001C9E0 00F86224 */  addiu      $v0, $v1, -0x800
/* D1E4 8001C9E4 0005422C */  sltiu      $v0, $v0, 0x500
/* D1E8 8001C9E8 03004010 */  beqz       $v0, .L8001C9F8
/* D1EC 8001C9EC FF0FA430 */   andi      $a0, $a1, 0xFFF
/* D1F0 8001C9F0 00FD0524 */  addiu      $a1, $zero, -0x300
.L8001C9F4:
/* D1F4 8001C9F4 FF0FA430 */  andi       $a0, $a1, 0xFFF
.L8001C9F8:
/* D1F8 8001C9F8 21288000 */  addu       $a1, $a0, $zero
/* D1FC 8001C9FC 9C04028E */  lw         $v0, 0x49C($s0)
/* D200 8001CA00 0002033C */  lui        $v1, (0x2000000 >> 16)
/* D204 8001CA04 24104300 */  and        $v0, $v0, $v1
/* D208 8001CA08 0D004010 */  beqz       $v0, .L8001CA40
/* D20C 8001CA0C BA0104A6 */   sh        $a0, 0x1BA($s0)
/* D210 8001CA10 01088228 */  slti       $v0, $a0, 0x801
/* D214 8001CA14 03004014 */  bnez       $v0, .L8001CA24
/* D218 8001CA18 00140500 */   sll       $v0, $a1, 16
/* D21C 8001CA1C 00F08534 */  ori        $a1, $a0, 0xF000
/* D220 8001CA20 00140500 */  sll        $v0, $a1, 16
.L8001CA24:
/* D224 8001CA24 D6AB8387 */  lh         $v1, %gp_rel(combat_cam_angle)($gp)
/* D228 8001CA28 03140200 */  sra        $v0, $v0, 16
/* D22C 8001CA2C 2A186200 */  slt        $v1, $v1, $v0
/* D230 8001CA30 D6AB8297 */  lhu        $v0, %gp_rel(combat_cam_angle)($gp)
/* D234 8001CA34 02006010 */  beqz       $v1, .L8001CA40
/* D238 8001CA38 00104224 */   addiu     $v0, $v0, 0x1000
/* D23C 8001CA3C BA0102A6 */  sh         $v0, 0x1BA($s0)
.L8001CA40:
/* D240 8001CA40 2C00BF8F */  lw         $ra, 0x2C($sp)
/* D244 8001CA44 2800B28F */  lw         $s2, 0x28($sp)
/* D248 8001CA48 2400B18F */  lw         $s1, 0x24($sp)
/* D24C 8001CA4C 2000B08F */  lw         $s0, 0x20($sp)
/* D250 8001CA50 0800E003 */  jr         $ra
/* D254 8001CA54 3000BD27 */   addiu     $sp, $sp, 0x30
.size CAMERA_UpdateFocusRotationX, . - CAMERA_UpdateFocusRotationX
