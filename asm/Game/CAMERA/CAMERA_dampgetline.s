.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_dampgetline
/* 9B5C 8001935C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 9B60 80019360 5C8E8227 */  addiu      $v0, $gp, %gp_rel(D_800D03F4)
/* 9B64 80019364 1000A2AF */  sw         $v0, 0x10($sp)
/* 9B68 80019368 00040224 */  addiu      $v0, $zero, 0x400
/* 9B6C 8001936C 00240400 */  sll        $a0, $a0, 16
/* 9B70 80019370 1800B0AF */  sw         $s0, 0x18($sp)
/* 9B74 80019374 03840400 */  sra        $s0, $a0, 16
/* 9B78 80019378 01000424 */  addiu      $a0, $zero, 0x1
/* 9B7C 8001937C 588E8527 */  addiu      $a1, $gp, %gp_rel(D_800D03F0)
/* 9B80 80019380 21300002 */  addu       $a2, $s0, $zero
/* 9B84 80019384 5A8E8727 */  addiu      $a3, $gp, %gp_rel(D_800D03F0 + 0x2)
/* 9B88 80019388 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 9B8C 8001938C 7E5E000C */  jal        CriticalDampAngle
/* 9B90 80019390 1400A2AF */   sw        $v0, 0x14($sp)
/* 9B94 80019394 588E8287 */  lh         $v0, %gp_rel(D_800D03F0)($gp)
/* 9B98 80019398 588E8397 */  lhu        $v1, %gp_rel(D_800D03F0)($gp)
/* 9B9C 8001939C 01084228 */  slti       $v0, $v0, 0x801
/* 9BA0 800193A0 02004014 */  bnez       $v0, .L800193AC
/* 9BA4 800193A4 00F06224 */   addiu     $v0, $v1, -0x1000
/* 9BA8 800193A8 588E82A7 */  sh         $v0, %gp_rel(D_800D03F0)($gp)
.L800193AC:
/* 9BAC 800193AC 588E8287 */  lh         $v0, %gp_rel(D_800D03F0)($gp)
/* 9BB0 800193B0 00000000 */  nop
/* 9BB4 800193B4 02004104 */  bgez       $v0, .L800193C0
/* 9BB8 800193B8 00000000 */   nop
/* 9BBC 800193BC 23100200 */  negu       $v0, $v0
.L800193C0:
/* 9BC0 800193C0 20004228 */  slti       $v0, $v0, 0x20
/* 9BC4 800193C4 0B004010 */  beqz       $v0, .L800193F4
/* 9BC8 800193C8 00000000 */   nop
/* 9BCC 800193CC 02000106 */  bgez       $s0, .L800193D8
/* 9BD0 800193D0 21100002 */   addu      $v0, $s0, $zero
/* 9BD4 800193D4 23100200 */  negu       $v0, $v0
.L800193D8:
/* 9BD8 800193D8 20004228 */  slti       $v0, $v0, 0x20
/* 9BDC 800193DC 05004014 */  bnez       $v0, .L800193F4
/* 9BE0 800193E0 00000000 */   nop
/* 9BE4 800193E4 02000106 */  bgez       $s0, .L800193F0
/* 9BE8 800193E8 20000224 */   addiu     $v0, $zero, 0x20
/* 9BEC 800193EC E0FF0224 */  addiu      $v0, $zero, -0x20
.L800193F0:
/* 9BF0 800193F0 588E82A7 */  sh         $v0, %gp_rel(D_800D03F0)($gp)
.L800193F4:
/* 9BF4 800193F4 588E8287 */  lh         $v0, %gp_rel(D_800D03F0)($gp)
/* 9BF8 800193F8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 9BFC 800193FC 1800B08F */  lw         $s0, 0x18($sp)
/* 9C00 80019400 0800E003 */  jr         $ra
/* 9C04 80019404 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_dampgetline, . - CAMERA_dampgetline
