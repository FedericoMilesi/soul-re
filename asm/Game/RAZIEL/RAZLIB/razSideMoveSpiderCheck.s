.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSideMoveSpiderCheck
/* 98338 800A7B38 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9833C 800A7B3C 2800B2AF */  sw         $s2, 0x28($sp)
/* 98340 800A7B40 21908000 */  addu       $s2, $a0, $zero
/* 98344 800A7B44 002C0500 */  sll        $a1, $a1, 16
/* 98348 800A7B48 2400B1AF */  sw         $s1, 0x24($sp)
/* 9834C 800A7B4C 038C0500 */  sra        $s1, $a1, 16
/* 98350 800A7B50 21202002 */  addu       $a0, $s1, $zero
/* 98354 800A7B54 21280000 */  addu       $a1, $zero, $zero
/* 98358 800A7B58 C0000624 */  addiu      $a2, $zero, 0xC0
/* 9835C 800A7B5C 1000A727 */  addiu      $a3, $sp, 0x10
/* 98360 800A7B60 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 98364 800A7B64 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 98368 800A7B68 2000B0AF */   sw        $s0, 0x20($sp)
/* 9836C 800A7B6C 21202002 */  addu       $a0, $s1, $zero
/* 98370 800A7B70 C0FE0524 */  addiu      $a1, $zero, -0x140
/* 98374 800A7B74 C0000624 */  addiu      $a2, $zero, 0xC0
/* 98378 800A7B78 1800B027 */  addiu      $s0, $sp, 0x18
/* 9837C 800A7B7C 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 98380 800A7B80 21380002 */   addu      $a3, $s0, $zero
/* 98384 800A7B84 21204002 */  addu       $a0, $s2, $zero
/* 98388 800A7B88 1000A527 */  addiu      $a1, $sp, 0x10
/* 9838C 800A7B8C 21300002 */  addu       $a2, $s0, $zero
/* 98390 800A7B90 A2DF010C */  jal        PHYSICS_CheckForValidMove
/* 98394 800A7B94 21380000 */   addu      $a3, $zero, $zero
/* 98398 800A7B98 01004230 */  andi       $v0, $v0, 0x1
/* 9839C 800A7B9C 12004010 */  beqz       $v0, .L800A7BE8
/* 983A0 800A7BA0 21202002 */   addu      $a0, $s1, $zero
/* 983A4 800A7BA4 21280000 */  addu       $a1, $zero, $zero
/* 983A8 800A7BA8 2130A000 */  addu       $a2, $a1, $zero
/* 983AC 800A7BAC 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 983B0 800A7BB0 1000A727 */   addiu     $a3, $sp, 0x10
/* 983B4 800A7BB4 21202002 */  addu       $a0, $s1, $zero
/* 983B8 800A7BB8 C0FE0524 */  addiu      $a1, $zero, -0x140
/* 983BC 800A7BBC 21300000 */  addu       $a2, $zero, $zero
/* 983C0 800A7BC0 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 983C4 800A7BC4 21380002 */   addu      $a3, $s0, $zero
/* 983C8 800A7BC8 21204002 */  addu       $a0, $s2, $zero
/* 983CC 800A7BCC 1000A527 */  addiu      $a1, $sp, 0x10
/* 983D0 800A7BD0 21300002 */  addu       $a2, $s0, $zero
/* 983D4 800A7BD4 A2DF010C */  jal        PHYSICS_CheckForValidMove
/* 983D8 800A7BD8 21380000 */   addu      $a3, $zero, $zero
/* 983DC 800A7BDC 01004230 */  andi       $v0, $v0, 0x1
/* 983E0 800A7BE0 FB9E0208 */  j          .L800A7BEC
/* 983E4 800A7BE4 01004238 */   xori      $v0, $v0, 0x1
.L800A7BE8:
/* 983E8 800A7BE8 01000224 */  addiu      $v0, $zero, 0x1
.L800A7BEC:
/* 983EC 800A7BEC 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 983F0 800A7BF0 2800B28F */  lw         $s2, 0x28($sp)
/* 983F4 800A7BF4 2400B18F */  lw         $s1, 0x24($sp)
/* 983F8 800A7BF8 2000B08F */  lw         $s0, 0x20($sp)
/* 983FC 800A7BFC 0800E003 */  jr         $ra
/* 98400 800A7C00 3000BD27 */   addiu     $sp, $sp, 0x30
.size razSideMoveSpiderCheck, . - razSideMoveSpiderCheck
