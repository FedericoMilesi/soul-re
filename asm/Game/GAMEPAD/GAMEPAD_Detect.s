.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_Detect
/* 22020 80031820 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 22024 80031824 1400B1AF */  sw         $s1, 0x14($sp)
/* 22028 80031828 21880000 */  addu       $s1, $zero, $zero
/* 2202C 8003182C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 22030 80031830 04001324 */  addiu      $s3, $zero, 0x4
/* 22034 80031834 1800B2AF */  sw         $s2, 0x18($sp)
/* 22038 80031838 01001224 */  addiu      $s2, $zero, 0x1
/* 2203C 8003183C 2000BFAF */  sw         $ra, 0x20($sp)
/* 22040 80031840 1000B0AF */  sw         $s0, 0x10($sp)
/* 22044 80031844 68BA80AF */  sw         $zero, %gp_rel(dualshock0_time)($gp)
/* 22048 80031848 6CBA80AF */  sw         $zero, %gp_rel(dualshock1_time)($gp)
/* 2204C 8003184C 289280A7 */  sh         $zero, %gp_rel(align_flag)($gp)
/* 22050 80031850 2A9280A7 */  sh         $zero, %gp_rel(dualshock_onflag)($gp)
/* 22054 80031854 64BA80AF */  sw         $zero, %gp_rel(ignoreFind)($gp)
/* 22058 80031858 2C9280AF */  sw         $zero, %gp_rel(dualShock)($gp)
.L8003185C:
/* 2205C 8003185C 21800000 */  addu       $s0, $zero, $zero
.L80031860:
/* 22060 80031860 5EF2020C */  jal        VSync
/* 22064 80031864 21200000 */   addu      $a0, $zero, $zero
/* 22068 80031868 BAF6020C */  jal        PadGetState
/* 2206C 8003186C 21200000 */   addu      $a0, $zero, $zero
/* 22070 80031870 21184000 */  addu       $v1, $v0, $zero
/* 22074 80031874 05006014 */  bnez       $v1, .L8003188C
/* 22078 80031878 00000000 */   nop
/* 2207C 8003187C 01001026 */  addiu      $s0, $s0, 0x1
/* 22080 80031880 0500022A */  slti       $v0, $s0, 0x5
/* 22084 80031884 F6FF4014 */  bnez       $v0, .L80031860
/* 22088 80031888 00000000 */   nop
.L8003188C:
/* 2208C 8003188C 02007314 */  bne        $v1, $s3, .L80031898
/* 22090 80031890 00000000 */   nop
/* 22094 80031894 2C9292AF */  sw         $s2, %gp_rel(dualShock)($gp)
.L80031898:
/* 22098 80031898 01003126 */  addiu      $s1, $s1, 0x1
/* 2209C 8003189C 1F00222A */  slti       $v0, $s1, 0x1F
/* 220A0 800318A0 04004014 */  bnez       $v0, .L800318B4
/* 220A4 800318A4 00000000 */   nop
/* 220A8 800318A8 64BA92AF */  sw         $s2, %gp_rel(ignoreFind)($gp)
/* 220AC 800318AC 33C60008 */  j          .L800318CC
/* 220B0 800318B0 00000000 */   nop
.L800318B4:
/* 220B4 800318B4 EAFF7210 */  beq        $v1, $s2, .L80031860
/* 220B8 800318B8 21800000 */   addu      $s0, $zero, $zero
/* 220BC 800318BC E8FF7310 */  beq        $v1, $s3, .L80031860
/* 220C0 800318C0 05000224 */   addiu     $v0, $zero, 0x5
/* 220C4 800318C4 E5FF6210 */  beq        $v1, $v0, .L8003185C
/* 220C8 800318C8 00000000 */   nop
.L800318CC:
/* 220CC 800318CC 2C92828F */  lw         $v0, %gp_rel(dualShock)($gp)
/* 220D0 800318D0 00000000 */  nop
/* 220D4 800318D4 0B004010 */  beqz       $v0, .L80031904
/* 220D8 800318D8 21800000 */   addu      $s0, $zero, $zero
/* 220DC 800318DC 06001124 */  addiu      $s1, $zero, 0x6
.L800318E0:
/* 220E0 800318E0 5EF2020C */  jal        VSync
/* 220E4 800318E4 21200000 */   addu      $a0, $zero, $zero
/* 220E8 800318E8 BAF6020C */  jal        PadGetState
/* 220EC 800318EC 21200000 */   addu      $a0, $zero, $zero
/* 220F0 800318F0 04005110 */  beq        $v0, $s1, .L80031904
/* 220F4 800318F4 01001026 */   addiu     $s0, $s0, 0x1
/* 220F8 800318F8 1E00022A */  slti       $v0, $s0, 0x1E
/* 220FC 800318FC F8FF4014 */  bnez       $v0, .L800318E0
/* 22100 80031900 00000000 */   nop
.L80031904:
/* 22104 80031904 5EF2020C */  jal        VSync
/* 22108 80031908 03000424 */   addiu     $a0, $zero, 0x3
/* 2210C 8003190C 2000BF8F */  lw         $ra, 0x20($sp)
/* 22110 80031910 1C00B38F */  lw         $s3, 0x1C($sp)
/* 22114 80031914 1800B28F */  lw         $s2, 0x18($sp)
/* 22118 80031918 1400B18F */  lw         $s1, 0x14($sp)
/* 2211C 8003191C 1000B08F */  lw         $s0, 0x10($sp)
/* 22120 80031920 0800E003 */  jr         $ra
/* 22124 80031924 2800BD27 */   addiu     $sp, $sp, 0x28
.size GAMEPAD_Detect, . - GAMEPAD_Detect
