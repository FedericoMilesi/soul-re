.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetEngagedInstance
/* 93AC4 800A32C4 21408000 */  addu       $t0, $a0, $zero
/* 93AC8 800A32C8 01000224 */  addiu      $v0, $zero, 0x1
/* 93ACC 800A32CC DC03078D */  lw         $a3, 0x3DC($t0)
/* 93AD0 800A32D0 0420C200 */  sllv       $a0, $v0, $a2
/* 93AD4 800A32D4 2410E400 */  and        $v0, $a3, $a0
/* 93AD8 800A32D8 12004010 */  beqz       $v0, .L800A3324
/* 93ADC 800A32DC 21480000 */   addu      $t1, $zero, $zero
/* 93AE0 800A32E0 D803028D */  lw         $v0, 0x3D8($t0)
/* 93AE4 800A32E4 C0300600 */  sll        $a2, $a2, 3
/* 93AE8 800A32E8 2120C200 */  addu       $a0, $a2, $v0
/* 93AEC 800A32EC 0400838C */  lw         $v1, 0x4($a0)
/* 93AF0 800A32F0 0400A28C */  lw         $v0, 0x4($a1)
/* 93AF4 800A32F4 00000000 */  nop
/* 93AF8 800A32F8 2B104300 */  sltu       $v0, $v0, $v1
/* 93AFC 800A32FC 15004010 */  beqz       $v0, .L800A3354
/* 93B00 800A3300 00000000 */   nop
/* 93B04 800A3304 0000A28C */  lw         $v0, 0x0($a1)
/* 93B08 800A3308 01000924 */  addiu      $t1, $zero, 0x1
/* 93B0C 800A330C 000082AC */  sw         $v0, 0x0($a0)
/* 93B10 800A3310 D803028D */  lw         $v0, 0x3D8($t0)
/* 93B14 800A3314 0400A38C */  lw         $v1, 0x4($a1)
/* 93B18 800A3318 2110C200 */  addu       $v0, $a2, $v0
/* 93B1C 800A331C D58C0208 */  j          .L800A3354
/* 93B20 800A3320 040043AC */   sw        $v1, 0x4($v0)
.L800A3324:
/* 93B24 800A3324 01000924 */  addiu      $t1, $zero, 0x1
/* 93B28 800A3328 2510E400 */  or         $v0, $a3, $a0
/* 93B2C 800A332C C0180600 */  sll        $v1, $a2, 3
/* 93B30 800A3330 DC0302AD */  sw         $v0, 0x3DC($t0)
/* 93B34 800A3334 D803028D */  lw         $v0, 0x3D8($t0)
/* 93B38 800A3338 0000A48C */  lw         $a0, 0x0($a1)
/* 93B3C 800A333C 21106200 */  addu       $v0, $v1, $v0
/* 93B40 800A3340 000044AC */  sw         $a0, 0x0($v0)
/* 93B44 800A3344 D803028D */  lw         $v0, 0x3D8($t0)
/* 93B48 800A3348 0400A48C */  lw         $a0, 0x4($a1)
/* 93B4C 800A334C 21186200 */  addu       $v1, $v1, $v0
/* 93B50 800A3350 040064AC */  sw         $a0, 0x4($v1)
.L800A3354:
/* 93B54 800A3354 0800E003 */  jr         $ra
/* 93B58 800A3358 21102001 */   addu      $v0, $t1, $zero
.size SetEngagedInstance, . - SetEngagedInstance
