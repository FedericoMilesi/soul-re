.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_Init
/* 7E424 8008DC24 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7E428 8008DC28 1000B0AF */  sw         $s0, 0x10($sp)
/* 7E42C 8008DC2C 21808000 */  addu       $s0, $a0, $zero
/* 7E430 8008DC30 1800BFAF */  sw         $ra, 0x18($sp)
/* 7E434 8008DC34 1400B1AF */  sw         $s1, 0x14($sp)
/* 7E438 8008DC38 6C01118E */  lw         $s1, 0x16C($s0)
/* 7E43C 8008DC3C 3933020C */  jal        MON_DefaultInit
/* 7E440 8008DC40 00000000 */   nop
/* 7E444 8008DC44 2000033C */  lui        $v1, (0x200880 >> 16)
/* 7E448 8008DC48 80086334 */  ori        $v1, $v1, (0x200880 & 0xFFFF)
/* 7E44C 8008DC4C 0000228E */  lw         $v0, 0x0($s1)
/* 7E450 8008DC50 21200002 */  addu       $a0, $s0, $zero
/* 7E454 8008DC54 25104300 */  or         $v0, $v0, $v1
/* 7E458 8008DC58 000022AE */  sw         $v0, 0x0($s1)
/* 7E45C 8008DC5C 58020224 */  addiu      $v0, $zero, 0x258
/* 7E460 8008DC60 8C0102AE */  sw         $v0, 0x18C($s0)
/* 7E464 8008DC64 900102AE */  sw         $v0, 0x190($s0)
/* 7E468 8008DC68 940102AE */  sw         $v0, 0x194($s0)
/* 7E46C 8008DC6C 1800028E */  lw         $v0, 0x18($s0)
/* 7E470 8008DC70 0200033C */  lui        $v1, (0x20000 >> 16)
/* 7E474 8008DC74 25104300 */  or         $v0, $v0, $v1
/* 7E478 8008DC78 180002AE */  sw         $v0, 0x18($s0)
/* 7E47C 8008DC7C 9006020C */  jal        MON_GetTime
/* 7E480 8008DC80 2A0120A6 */   sh        $zero, 0x12A($s1)
/* 7E484 8008DC84 64194224 */  addiu      $v0, $v0, 0x1964
/* 7E488 8008DC88 0C0122AE */  sw         $v0, 0x10C($s1)
/* 7E48C 8008DC8C 2C00028E */  lw         $v0, 0x2C($s0)
/* 7E490 8008DC90 00000000 */  nop
/* 7E494 8008DC94 04004010 */  beqz       $v0, .L8008DCA8
/* 7E498 8008DC98 00000000 */   nop
/* 7E49C 8008DC9C 3C00428C */  lw         $v0, 0x3C($v0)
/* 7E4A0 8008DCA0 00000000 */  nop
/* 7E4A4 8008DCA4 D80022AE */  sw         $v0, 0xD8($s1)
.L8008DCA8:
/* 7E4A8 8008DCA8 1400028E */  lw         $v0, 0x14($s0)
/* 7E4AC 8008DCAC 00000000 */  nop
/* 7E4B0 8008DCB0 02004230 */  andi       $v0, $v0, 0x2
/* 7E4B4 8008DCB4 07004014 */  bnez       $v0, .L8008DCD4
/* 7E4B8 8008DCB8 21200002 */   addu      $a0, $s0, $zero
/* 7E4BC 8008DCBC 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 7E4C0 8008DCC0 1800828C */  lw         $v0, 0x18($a0)
/* 7E4C4 8008DCC4 02000524 */  addiu      $a1, $zero, 0x2
/* 7E4C8 8008DCC8 25104300 */  or         $v0, $v0, $v1
/* 7E4CC 8008DCCC 91FE010C */  jal        MON_SwitchState
/* 7E4D0 8008DCD0 180082AC */   sw        $v0, 0x18($a0)
.L8008DCD4:
/* 7E4D4 8008DCD4 1800BF8F */  lw         $ra, 0x18($sp)
/* 7E4D8 8008DCD8 1400B18F */  lw         $s1, 0x14($sp)
/* 7E4DC 8008DCDC 1000B08F */  lw         $s0, 0x10($sp)
/* 7E4E0 8008DCE0 0800E003 */  jr         $ra
/* 7E4E4 8008DCE4 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUL_Init, . - SOUL_Init
