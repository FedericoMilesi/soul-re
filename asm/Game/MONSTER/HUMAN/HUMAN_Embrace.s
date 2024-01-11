.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_Embrace
/* 6DB98 8007D398 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6DB9C 8007D39C 2000B2AF */  sw         $s2, 0x20($sp)
/* 6DBA0 8007D3A0 21908000 */  addu       $s2, $a0, $zero
/* 6DBA4 8007D3A4 2400B3AF */  sw         $s3, 0x24($sp)
/* 6DBA8 8007D3A8 21980000 */  addu       $s3, $zero, $zero
/* 6DBAC 8007D3AC 00100624 */  addiu      $a2, $zero, 0x1000
/* 6DBB0 8007D3B0 1800B0AF */  sw         $s0, 0x18($sp)
/* 6DBB4 8007D3B4 0001103C */  lui        $s0, (0x1000014 >> 16)
/* 6DBB8 8007D3B8 F4BD858F */  lw         $a1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6DBBC 8007D3BC 14001036 */  ori        $s0, $s0, (0x1000014 & 0xFFFF)
/* 6DBC0 8007D3C0 2800BFAF */  sw         $ra, 0x28($sp)
/* 6DBC4 8007D3C4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 6DBC8 8007D3C8 6C01518E */  lw         $s1, 0x16C($s2)
/* 6DBCC 8007D3CC 6604020C */  jal        MON_TurnToPosition
/* 6DBD0 8007D3D0 5C00A524 */   addiu     $a1, $a1, 0x5C
.L8007D3D4:
/* 6DBD4 8007D3D4 27C3010C */  jal        DeMessageQueue
/* 6DBD8 8007D3D8 08002426 */   addiu     $a0, $s1, 0x8
/* 6DBDC 8007D3DC 21284000 */  addu       $a1, $v0, $zero
/* 6DBE0 8007D3E0 0B00A010 */  beqz       $a1, .L8007D410
/* 6DBE4 8007D3E4 00000000 */   nop
/* 6DBE8 8007D3E8 0000A28C */  lw         $v0, 0x0($a1)
/* 6DBEC 8007D3EC 00000000 */  nop
/* 6DBF0 8007D3F0 03005014 */  bne        $v0, $s0, .L8007D400
/* 6DBF4 8007D3F4 00000000 */   nop
/* 6DBF8 8007D3F8 F5F40108 */  j          .L8007D3D4
/* 6DBFC 8007D3FC 01001324 */   addiu     $s3, $zero, 0x1
.L8007D400:
/* 6DC00 8007D400 6513020C */  jal        MON_DefaultMessageHandler
/* 6DC04 8007D404 21204002 */   addu      $a0, $s2, $zero
/* 6DC08 8007D408 F5F40108 */  j          .L8007D3D4
/* 6DC0C 8007D40C 00000000 */   nop
.L8007D410:
/* 6DC10 8007D410 1401238E */  lw         $v1, 0x114($s1)
/* 6DC14 8007D414 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 6DC18 8007D418 00000000 */  nop
/* 6DC1C 8007D41C 18006200 */  mult       $v1, $v0
/* 6DC20 8007D420 12180000 */  mflo       $v1
/* 6DC24 8007D424 40110300 */  sll        $v0, $v1, 5
/* 6DC28 8007D428 21104300 */  addu       $v0, $v0, $v1
/* 6DC2C 8007D42C B7D1033C */  lui        $v1, (0xD1B71759 >> 16)
/* 6DC30 8007D430 59176334 */  ori        $v1, $v1, (0xD1B71759 & 0xFFFF)
/* 6DC34 8007D434 19004300 */  multu      $v0, $v1
/* 6DC38 8007D438 0001053C */  lui        $a1, (0x1000016 >> 16)
/* 6DC3C 8007D43C 1600A534 */  ori        $a1, $a1, (0x1000016 & 0xFFFF)
/* 6DC40 8007D440 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6DC44 8007D444 10180000 */  mfhi       $v1
/* 6DC48 8007D448 02830300 */  srl        $s0, $v1, 12
/* 6DC4C 8007D44C A1D1000C */  jal        INSTANCE_Post
/* 6DC50 8007D450 21300002 */   addu      $a2, $s0, $zero
/* 6DC54 8007D454 48012396 */  lhu        $v1, 0x148($s1)
/* 6DC58 8007D458 48012286 */  lh         $v0, 0x148($s1)
/* 6DC5C 8007D45C 00000000 */  nop
/* 6DC60 8007D460 2A105000 */  slt        $v0, $v0, $s0
/* 6DC64 8007D464 03004010 */  beqz       $v0, .L8007D474
/* 6DC68 8007D468 23107000 */   subu      $v0, $v1, $s0
/* 6DC6C 8007D46C 1EF50108 */  j          .L8007D478
/* 6DC70 8007D470 480120A6 */   sh        $zero, 0x148($s1)
.L8007D474:
/* 6DC74 8007D474 480122A6 */  sh         $v0, 0x148($s1)
.L8007D478:
/* 6DC78 8007D478 48012486 */  lh         $a0, 0x148($s1)
/* 6DC7C 8007D47C 1401228E */  lw         $v0, 0x114($s1)
/* 6DC80 8007D480 C0210400 */  sll        $a0, $a0, 7
/* 6DC84 8007D484 00130200 */  sll        $v0, $v0, 12
/* 6DC88 8007D488 1B008200 */  divu       $zero, $a0, $v0
/* 6DC8C 8007D48C 12200000 */  mflo       $a0
/* 6DC90 8007D490 00F00534 */  ori        $a1, $zero, 0xF000
/* 6DC94 8007D494 80000224 */  addiu      $v0, $zero, 0x80
/* 6DC98 8007D498 F9C5000C */  jal        GAMEPAD_Shock1
/* 6DC9C 8007D49C 23204400 */   subu      $a0, $v0, $a0
/* 6DCA0 8007D4A0 48012286 */  lh         $v0, 0x148($s1)
/* 6DCA4 8007D4A4 00000000 */  nop
/* 6DCA8 8007D4A8 13004014 */  bnez       $v0, .L8007D4F8
/* 6DCAC 8007D4AC 21204002 */   addu      $a0, $s2, $zero
/* 6DCB0 8007D4B0 10000524 */  addiu      $a1, $zero, 0x10
/* 6DCB4 8007D4B4 91FE010C */  jal        MON_SwitchState
/* 6DCB8 8007D4B8 540120A6 */   sh        $zero, 0x154($s1)
/* 6DCBC 8007D4BC 0001053C */  lui        $a1, (0x1000006 >> 16)
/* 6DCC0 8007D4C0 0600A534 */  ori        $a1, $a1, (0x1000006 & 0xFFFF)
/* 6DCC4 8007D4C4 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6DCC8 8007D4C8 A1D1000C */  jal        INSTANCE_Post
/* 6DCCC 8007D4CC 21304002 */   addu      $a2, $s2, $zero
/* 6DCD0 8007D4D0 5C004426 */  addiu      $a0, $s2, 0x5C
/* 6DCD4 8007D4D4 08000524 */  addiu      $a1, $zero, 0x8
/* 6DCD8 8007D4D8 3EFE0624 */  addiu      $a2, $zero, -0x1C2
/* 6DCDC 8007D4DC AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* 6DCE0 8007D4E0 50000724 */  addiu      $a3, $zero, 0x50
/* 6DCE4 8007D4E4 480120A6 */  sh         $zero, 0x148($s1)
/* 6DCE8 8007D4E8 1300010C */  jal        SOUND_Play3dSound
/* 6DCEC 8007D4EC 1000A2AF */   sw        $v0, 0x10($sp)
/* 6DCF0 8007D4F0 51F50108 */  j          .L8007D544
/* 6DCF4 8007D4F4 00000000 */   nop
.L8007D4F8:
/* 6DCF8 8007D4F8 08006012 */  beqz       $s3, .L8007D51C
/* 6DCFC 8007D4FC 09000524 */   addiu     $a1, $zero, 0x9
/* 6DD00 8007D500 0400228E */  lw         $v0, 0x4($s1)
/* 6DD04 8007D504 00000000 */  nop
/* 6DD08 8007D508 10004234 */  ori        $v0, $v0, 0x10
/* 6DD0C 8007D50C 91FE010C */  jal        MON_SwitchState
/* 6DD10 8007D510 040022AE */   sw        $v0, 0x4($s1)
/* 6DD14 8007D514 4FF50108 */  j          .L8007D53C
/* 6DD18 8007D518 00000000 */   nop
.L8007D51C:
/* 6DD1C 8007D51C 9801438E */  lw         $v1, 0x198($s2)
/* 6DD20 8007D520 1B000224 */  addiu      $v0, $zero, 0x1B
/* 6DD24 8007D524 07006210 */  beq        $v1, $v0, .L8007D544
/* 6DD28 8007D528 0001053C */   lui       $a1, (0x1000006 >> 16)
/* 6DD2C 8007D52C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6DD30 8007D530 0600A534 */  ori        $a1, $a1, (0x1000006 & 0xFFFF)
/* 6DD34 8007D534 A1D1000C */  jal        INSTANCE_Post
/* 6DD38 8007D538 21304002 */   addu      $a2, $s2, $zero
.L8007D53C:
/* 6DD3C 8007D53C 4EFE010C */  jal        MON_TurnOnBodySpheres
/* 6DD40 8007D540 21204002 */   addu      $a0, $s2, $zero
.L8007D544:
/* 6DD44 8007D544 2800BF8F */  lw         $ra, 0x28($sp)
/* 6DD48 8007D548 2400B38F */  lw         $s3, 0x24($sp)
/* 6DD4C 8007D54C 2000B28F */  lw         $s2, 0x20($sp)
/* 6DD50 8007D550 1C00B18F */  lw         $s1, 0x1C($sp)
/* 6DD54 8007D554 1800B08F */  lw         $s0, 0x18($sp)
/* 6DD58 8007D558 0800E003 */  jr         $ra
/* 6DD5C 8007D55C 3000BD27 */   addiu     $sp, $sp, 0x30
.size HUMAN_Embrace, . - HUMAN_Embrace
