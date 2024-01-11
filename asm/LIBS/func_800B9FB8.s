.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800B9FB8
/* AA7B8 800B9FB8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA7BC 800B9FBC 1000B0AF */  sw         $s0, 0x10($sp)
/* AA7C0 800B9FC0 0D80103C */  lui        $s0, %hi(the_attract_movies + 0x68)
/* AA7C4 800B9FC4 14C91026 */  addiu      $s0, $s0, %lo(the_attract_movies + 0x68)
/* AA7C8 800B9FC8 1400BFAF */  sw         $ra, 0x14($sp)
/* AA7CC 800B9FCC 00000296 */  lhu        $v0, 0x0($s0)
/* AA7D0 800B9FD0 00000000 */  nop
/* AA7D4 800B9FD4 1C004010 */  beqz       $v0, .L800BA048
/* AA7D8 800B9FD8 21100000 */   addu      $v0, $zero, $zero
/* AA7DC 800B9FDC A5FC020C */  jal        EnterCriticalSection
/* AA7E0 800B9FE0 00000000 */   nop
/* AA7E4 800B9FE4 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F8)
/* AA7E8 800B9FE8 A4D9428C */  lw         $v0, %lo(the_attract_movies + 0x10F8)($v0)
/* AA7EC 800B9FEC 0D80043C */  lui        $a0, %hi(the_attract_movies + 0x10FC)
/* AA7F0 800B9FF0 A8D9848C */  lw         $a0, %lo(the_attract_movies + 0x10FC)($a0)
/* AA7F4 800B9FF4 00004394 */  lhu        $v1, 0x0($v0)
/* AA7F8 800B9FF8 00000000 */  nop
/* AA7FC 800B9FFC 320003A6 */  sh         $v1, 0x32($s0)
/* AA800 800BA000 0000838C */  lw         $v1, 0x0($a0)
/* AA804 800BA004 0D80043C */  lui        $a0, %hi(the_attract_movies + 0x10F4)
/* AA808 800BA008 A0D9848C */  lw         $a0, %lo(the_attract_movies + 0x10F4)($a0)
/* AA80C 800BA00C 340003AE */  sw         $v1, 0x34($s0)
/* AA810 800BA010 000040A4 */  sh         $zero, 0x0($v0)
/* AA814 800BA014 00004294 */  lhu        $v0, 0x0($v0)
/* AA818 800BA018 00000000 */  nop
/* AA81C 800BA01C 000082A4 */  sh         $v0, 0x0($a0)
/* AA820 800BA020 0D80043C */  lui        $a0, %hi(the_attract_movies + 0x10FC)
/* AA824 800BA024 A8D9848C */  lw         $a0, %lo(the_attract_movies + 0x10FC)($a0)
/* AA828 800BA028 7777033C */  lui        $v1, (0x77777777 >> 16)
/* AA82C 800BA02C 0000828C */  lw         $v0, 0x0($a0)
/* AA830 800BA030 77776334 */  ori        $v1, $v1, (0x77777777 & 0xFFFF)
/* AA834 800BA034 24104300 */  and        $v0, $v0, $v1
/* AA838 800BA038 D008030C */  jal        ResetEntryInt
/* AA83C 800BA03C 000082AC */   sw        $v0, 0x0($a0)
/* AA840 800BA040 21100002 */  addu       $v0, $s0, $zero
/* AA844 800BA044 000040A4 */  sh         $zero, 0x0($v0)
.L800BA048:
/* AA848 800BA048 1400BF8F */  lw         $ra, 0x14($sp)
/* AA84C 800BA04C 1000B08F */  lw         $s0, 0x10($sp)
/* AA850 800BA050 0800E003 */  jr         $ra
/* AA854 800BA054 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800B9FB8, . - func_800B9FB8
