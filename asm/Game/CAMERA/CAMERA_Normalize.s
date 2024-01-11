.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_Normalize
/* 9418 80018C18 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 941C 80018C1C 1000B0AF */  sw         $s0, 0x10($sp)
/* 9420 80018C20 1400BFAF */  sw         $ra, 0x14($sp)
/* 9424 80018C24 9C58000C */  jal        CAMERA_LengthSVector
/* 9428 80018C28 21808000 */   addu      $s0, $a0, $zero
/* 942C 80018C2C 21284000 */  addu       $a1, $v0, $zero
/* 9430 80018C30 1300A010 */  beqz       $a1, .L80018C80
/* 9434 80018C34 00000000 */   nop
/* 9438 80018C38 00000486 */  lh         $a0, 0x0($s0)
/* 943C 80018C3C 00000000 */  nop
/* 9440 80018C40 00230400 */  sll        $a0, $a0, 12
/* 9444 80018C44 1A008500 */  div        $zero, $a0, $a1
/* 9448 80018C48 12200000 */  mflo       $a0
/* 944C 80018C4C 02000386 */  lh         $v1, 0x2($s0)
/* 9450 80018C50 00000000 */  nop
/* 9454 80018C54 001B0300 */  sll        $v1, $v1, 12
/* 9458 80018C58 1A006500 */  div        $zero, $v1, $a1
/* 945C 80018C5C 12180000 */  mflo       $v1
/* 9460 80018C60 04000286 */  lh         $v0, 0x4($s0)
/* 9464 80018C64 00000000 */  nop
/* 9468 80018C68 00130200 */  sll        $v0, $v0, 12
/* 946C 80018C6C 1A004500 */  div        $zero, $v0, $a1
/* 9470 80018C70 12100000 */  mflo       $v0
/* 9474 80018C74 000004A6 */  sh         $a0, 0x0($s0)
/* 9478 80018C78 020003A6 */  sh         $v1, 0x2($s0)
/* 947C 80018C7C 040002A6 */  sh         $v0, 0x4($s0)
.L80018C80:
/* 9480 80018C80 1400BF8F */  lw         $ra, 0x14($sp)
/* 9484 80018C84 1000B08F */  lw         $s0, 0x10($sp)
/* 9488 80018C88 0800E003 */  jr         $ra
/* 948C 80018C8C 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_Normalize, . - CAMERA_Normalize
