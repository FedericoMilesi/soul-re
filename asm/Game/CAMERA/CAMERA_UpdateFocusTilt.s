.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_UpdateFocusTilt
/* CD08 8001C508 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* CD0C 8001C50C 1800B0AF */  sw         $s0, 0x18($sp)
/* CD10 8001C510 21808000 */  addu       $s0, $a0, $zero
/* CD14 8001C514 1C00BFAF */  sw         $ra, 0x1C($sp)
/* CD18 8001C518 E800028E */  lw         $v0, 0xE8($s0)
/* CD1C 8001C51C 00000000 */  nop
/* CD20 8001C520 00184230 */  andi       $v0, $v0, 0x1800
/* CD24 8001C524 05004010 */  beqz       $v0, .L8001C53C
/* CD28 8001C528 00000000 */   nop
/* CD2C 8001C52C BA010296 */  lhu        $v0, 0x1BA($s0)
/* CD30 8001C530 B80400A6 */  sh         $zero, 0x4B8($s0)
/* CD34 8001C534 71710008 */  j          .L8001C5C4
/* CD38 8001C538 3C0102A6 */   sh        $v0, 0x13C($s0)
.L8001C53C:
/* CD3C 8001C53C 3C010296 */  lhu        $v0, 0x13C($s0)
/* CD40 8001C540 08040386 */  lh         $v1, 0x408($s0)
/* CD44 8001C544 B80402A6 */  sh         $v0, 0x4B8($s0)
/* CD48 8001C548 03000224 */  addiu      $v0, $zero, 0x3
/* CD4C 8001C54C 06006210 */  beq        $v1, $v0, .L8001C568
/* CD50 8001C550 00000000 */   nop
/* CD54 8001C554 EC00028E */  lw         $v0, 0xEC($s0)
/* CD58 8001C558 00000000 */  nop
/* CD5C 8001C55C 02004230 */  andi       $v0, $v0, 0x2
/* CD60 8001C560 06004010 */  beqz       $v0, .L8001C57C
/* CD64 8001C564 01000424 */   addiu     $a0, $zero, 0x1
.L8001C568:
/* CD68 8001C568 E800028E */  lw         $v0, 0xE8($s0)
/* CD6C 8001C56C 0100033C */  lui        $v1, (0x10000 >> 16)
/* CD70 8001C570 24104300 */  and        $v0, $v0, $v1
/* CD74 8001C574 0B004010 */  beqz       $v0, .L8001C5A4
/* CD78 8001C578 01000424 */   addiu     $a0, $zero, 0x1
.L8001C57C:
/* CD7C 8001C57C 3C010526 */  addiu      $a1, $s0, 0x13C
/* CD80 8001C580 BA010686 */  lh         $a2, 0x1BA($s0)
/* CD84 8001C584 74010226 */  addiu      $v0, $s0, 0x174
/* CD88 8001C588 1000A2AF */  sw         $v0, 0x10($sp)
/* CD8C 8001C58C 20000224 */  addiu      $v0, $zero, 0x20
/* CD90 8001C590 6C010726 */  addiu      $a3, $s0, 0x16C
/* CD94 8001C594 7E5E000C */  jal        CriticalDampAngle
/* CD98 8001C598 1400A2AF */   sw        $v0, 0x14($sp)
/* CD9C 8001C59C 6C710008 */  j          .L8001C5B0
/* CDA0 8001C5A0 00000000 */   nop
.L8001C5A4:
/* CDA4 8001C5A4 B2010296 */  lhu        $v0, 0x1B2($s0)
/* CDA8 8001C5A8 00000000 */  nop
/* CDAC 8001C5AC 3C0102A6 */  sh         $v0, 0x13C($s0)
.L8001C5B0:
/* CDB0 8001C5B0 B8040486 */  lh         $a0, 0x4B8($s0)
/* CDB4 8001C5B4 3C010586 */  lh         $a1, 0x13C($s0)
/* CDB8 8001C5B8 DA59000C */  jal        CAMERA_SignedAngleDifference
/* CDBC 8001C5BC 00000000 */   nop
/* CDC0 8001C5C0 B80402A6 */  sh         $v0, 0x4B8($s0)
.L8001C5C4:
/* CDC4 8001C5C4 1C00BF8F */  lw         $ra, 0x1C($sp)
/* CDC8 8001C5C8 1800B08F */  lw         $s0, 0x18($sp)
/* CDCC 8001C5CC 0800E003 */  jr         $ra
/* CDD0 8001C5D0 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_UpdateFocusTilt, . - CAMERA_UpdateFocusTilt
