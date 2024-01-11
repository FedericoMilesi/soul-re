.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_StartLookaroundMode
/* C3AC 8001BBAC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* C3B0 8001BBB0 1000B0AF */  sw         $s0, 0x10($sp)
/* C3B4 8001BBB4 21808000 */  addu       $s0, $a0, $zero
/* C3B8 8001BBB8 00020224 */  addiu      $v0, $zero, 0x200
/* C3BC 8001BBBC 1800BFAF */  sw         $ra, 0x18($sp)
/* C3C0 8001BBC0 1400B1AF */  sw         $s1, 0x14($sp)
/* C3C4 8001BBC4 F0000586 */  lh         $a1, 0xF0($s0)
/* C3C8 8001BBC8 8A021124 */  addiu      $s1, $zero, 0x28A
/* C3CC 8001BBCC 8CAC82A7 */  sh         $v0, %gp_rel(Camera_lookHeight)($gp)
/* C3D0 8001BBD0 8EAC91A7 */  sh         $s1, %gp_rel(Camera_lookDist)($gp)
/* C3D4 8001BBD4 1D54000C */  jal        CAMERA_SaveMode
/* C3D8 8001BBD8 00000000 */   nop
/* C3DC 8001BBDC A8010396 */  lhu        $v1, 0x1A8($s0)
/* C3E0 8001BBE0 06000224 */  addiu      $v0, $zero, 0x6
/* C3E4 8001BBE4 F00002A6 */  sh         $v0, 0xF0($s0)
/* C3E8 8001BBE8 9C0203A6 */  sh         $v1, 0x29C($s0)
/* C3EC 8001BBEC B501068A */  lwl        $a2, 0x1B5($s0)
/* C3F0 8001BBF0 B201069A */  lwr        $a2, 0x1B2($s0)
/* C3F4 8001BBF4 B901078A */  lwl        $a3, 0x1B9($s0)
/* C3F8 8001BBF8 B601079A */  lwr        $a3, 0x1B6($s0)
/* C3FC 8001BBFC 970206AA */  swl        $a2, 0x297($s0)
/* C400 8001BC00 940206BA */  swr        $a2, 0x294($s0)
/* C404 8001BC04 9B0207AA */  swl        $a3, 0x29B($s0)
/* C408 8001BC08 980207BA */  swr        $a3, 0x298($s0)
/* C40C 8001BC0C 0801048E */  lw         $a0, 0x108($s0)
/* C410 8001BC10 AA010526 */  addiu      $a1, $s0, 0x1AA
/* C414 8001BC14 A80111A6 */  sh         $s1, 0x1A8($s0)
/* C418 8001BC18 140400A6 */  sh         $zero, 0x414($s0)
/* C41C 8001BC1C 160400A6 */  sh         $zero, 0x416($s0)
/* C420 8001BC20 5562000C */  jal        CAMERA_SetLookFocusAndBase
/* C424 8001BC24 180400A6 */   sh        $zero, 0x418($s0)
/* C428 8001BC28 1800BF8F */  lw         $ra, 0x18($sp)
/* C42C 8001BC2C 1400B18F */  lw         $s1, 0x14($sp)
/* C430 8001BC30 1000B08F */  lw         $s0, 0x10($sp)
/* C434 8001BC34 0800E003 */  jr         $ra
/* C438 8001BC38 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_StartLookaroundMode, . - CAMERA_StartLookaroundMode
