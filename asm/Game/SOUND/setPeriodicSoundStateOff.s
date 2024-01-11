.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setPeriodicSoundStateOff
/* 2F8F8 8003F0F8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2F8FC 8003F0FC 1000B0AF */  sw         $s0, 0x10($sp)
/* 2F900 8003F100 21808000 */  addu       $s0, $a0, $zero
/* 2F904 8003F104 1800BFAF */  sw         $ra, 0x18($sp)
/* 2F908 8003F108 1400B1AF */  sw         $s1, 0x14($sp)
/* 2F90C 8003F10C 00000492 */  lbu        $a0, 0x0($s0)
/* 2F910 8003F110 28FB000C */  jal        SndCloseSfxChannel
/* 2F914 8003F114 2188A000 */   addu      $s1, $a1, $zero
/* 2F918 8003F118 FF000224 */  addiu      $v0, $zero, 0xFF
/* 2F91C 8003F11C 000002A2 */  sb         $v0, 0x0($s0)
/* 2F920 8003F120 03000224 */  addiu      $v0, $zero, 0x3
/* 2F924 8003F124 010002A2 */  sb         $v0, 0x1($s0)
/* 2F928 8003F128 10002292 */  lbu        $v0, 0x10($s1)
/* 2F92C 8003F12C 00000000 */  nop
/* 2F930 8003F130 020002A2 */  sb         $v0, 0x2($s0)
/* 2F934 8003F134 11002292 */  lbu        $v0, 0x11($s1)
/* 2F938 8003F138 00000000 */  nop
/* 2F93C 8003F13C 0C004010 */  beqz       $v0, .L8003F170
/* 2F940 8003F140 00000000 */   nop
/* 2F944 8003F144 3AF2020C */  jal        func_800BC8E8
/* 2F948 8003F148 00000000 */   nop
/* 2F94C 8003F14C 11002492 */  lbu        $a0, 0x11($s1)
/* 2F950 8003F150 00000000 */  nop
/* 2F954 8003F154 40180400 */  sll        $v1, $a0, 1
/* 2F958 8003F158 1A004300 */  div        $zero, $v0, $v1
/* 2F95C 8003F15C 10180000 */  mfhi       $v1
/* 2F960 8003F160 02000292 */  lbu        $v0, 0x2($s0)
/* 2F964 8003F164 23208300 */  subu       $a0, $a0, $v1
/* 2F968 8003F168 21104400 */  addu       $v0, $v0, $a0
/* 2F96C 8003F16C 020002A2 */  sb         $v0, 0x2($s0)
.L8003F170:
/* 2F970 8003F170 1800BF8F */  lw         $ra, 0x18($sp)
/* 2F974 8003F174 1400B18F */  lw         $s1, 0x14($sp)
/* 2F978 8003F178 1000B08F */  lw         $s0, 0x10($sp)
/* 2F97C 8003F17C 0800E003 */  jr         $ra
/* 2F980 8003F180 2000BD27 */   addiu     $sp, $sp, 0x20
.size setPeriodicSoundStateOff, . - setPeriodicSoundStateOff
