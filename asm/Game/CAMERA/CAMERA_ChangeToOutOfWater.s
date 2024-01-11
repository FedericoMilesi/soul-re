.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_ChangeToOutOfWater
/* CBC4 8001C3C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* CBC8 8001C3C8 1000B0AF */  sw         $s0, 0x10($sp)
/* CBCC 8001C3CC 21808000 */  addu       $s0, $a0, $zero
/* CBD0 8001C3D0 1400BFAF */  sw         $ra, 0x14($sp)
/* CBD4 8001C3D4 0801028E */  lw         $v0, 0x108($s0)
/* CBD8 8001C3D8 00000000 */  nop
/* CBDC 8001C3DC 1200A214 */  bne        $a1, $v0, .L8001C428
/* CBE0 8001C3E0 05000224 */   addiu     $v0, $zero, 0x5
/* CBE4 8001C3E4 F0000386 */  lh         $v1, 0xF0($s0)
/* CBE8 8001C3E8 00000000 */  nop
/* CBEC 8001C3EC 06006210 */  beq        $v1, $v0, .L8001C408
/* CBF0 8001C3F0 00000000 */   nop
/* CBF4 8001C3F4 8F56000C */  jal        CAMERA_SetMode
/* CBF8 8001C3F8 0D000524 */   addiu     $a1, $zero, 0xD
/* CBFC 8001C3FC 880100A6 */  sh         $zero, 0x188($s0)
/* CC00 8001C400 05710008 */  j          .L8001C414
/* CC04 8001C404 9E0100A6 */   sh        $zero, 0x19E($s0)
.L8001C408:
/* CC08 8001C408 21200002 */  addu       $a0, $s0, $zero
/* CC0C 8001C40C 1D54000C */  jal        CAMERA_SaveMode
/* CC10 8001C410 0D000524 */   addiu     $a1, $zero, 0xD
.L8001C414:
/* CC14 8001C414 FEFF033C */  lui        $v1, (0xFFFEFFFF >> 16)
/* CC18 8001C418 E800028E */  lw         $v0, 0xE8($s0)
/* CC1C 8001C41C FFFF6334 */  ori        $v1, $v1, (0xFFFEFFFF & 0xFFFF)
/* CC20 8001C420 24104300 */  and        $v0, $v0, $v1
/* CC24 8001C424 E80002AE */  sw         $v0, 0xE8($s0)
.L8001C428:
/* CC28 8001C428 1400BF8F */  lw         $ra, 0x14($sp)
/* CC2C 8001C42C 1000B08F */  lw         $s0, 0x10($sp)
/* CC30 8001C430 0800E003 */  jr         $ra
/* CC34 8001C434 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_ChangeToOutOfWater, . - CAMERA_ChangeToOutOfWater
