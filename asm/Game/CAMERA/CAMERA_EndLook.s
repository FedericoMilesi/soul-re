.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_EndLook
/* CA24 8001C224 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* CA28 8001C228 1000B0AF */  sw         $s0, 0x10($sp)
/* CA2C 8001C22C 21808000 */  addu       $s0, $a0, $zero
/* CA30 8001C230 1800BFAF */  sw         $ra, 0x18($sp)
/* CA34 8001C234 1400B1AF */  sw         $s1, 0x14($sp)
/* CA38 8001C238 F0010286 */  lh         $v0, 0x1F0($s0)
/* CA3C 8001C23C 0801118E */  lw         $s1, 0x108($s0)
/* CA40 8001C240 02004228 */  slti       $v0, $v0, 0x2
/* CA44 8001C244 2E004014 */  bnez       $v0, .L8001C300
/* CA48 8001C248 06000224 */   addiu     $v0, $zero, 0x6
/* CA4C 8001C24C F0000386 */  lh         $v1, 0xF0($s0)
/* CA50 8001C250 00000000 */  nop
/* CA54 8001C254 2A006214 */  bne        $v1, $v0, .L8001C300
/* CA58 8001C258 00000000 */   nop
/* CA5C 8001C25C EB54000C */  jal        CAMERA_RestoreMode
/* CA60 8001C260 00000000 */   nop
/* CA64 8001C264 9C020396 */  lhu        $v1, 0x29C($s0)
/* CA68 8001C268 08000224 */  addiu      $v0, $zero, 0x8
/* CA6C 8001C26C 080400A6 */  sh         $zero, 0x408($s0)
/* CA70 8001C270 C40102A6 */  sh         $v0, 0x1C4($s0)
/* CA74 8001C274 A80103A6 */  sh         $v1, 0x1A8($s0)
/* CA78 8001C278 9702058A */  lwl        $a1, 0x297($s0)
/* CA7C 8001C27C 9402059A */  lwr        $a1, 0x294($s0)
/* CA80 8001C280 9B02068A */  lwl        $a2, 0x29B($s0)
/* CA84 8001C284 9802069A */  lwr        $a2, 0x298($s0)
/* CA88 8001C288 B50105AA */  swl        $a1, 0x1B5($s0)
/* CA8C 8001C28C B20105BA */  swr        $a1, 0x1B2($s0)
/* CA90 8001C290 B90106AA */  swl        $a2, 0x1B9($s0)
/* CA94 8001C294 B60106BA */  swr        $a2, 0x1B6($s0)
/* CA98 8001C298 F0000386 */  lh         $v1, 0xF0($s0)
/* CA9C 8001C29C 04000224 */  addiu      $v0, $zero, 0x4
/* CAA0 8001C2A0 09006210 */  beq        $v1, $v0, .L8001C2C8
/* CAA4 8001C2A4 02000224 */   addiu     $v0, $zero, 0x2
/* CAA8 8001C2A8 07006210 */  beq        $v1, $v0, .L8001C2C8
/* CAAC 8001C2AC 21200002 */   addu      $a0, $s0, $zero
/* CAB0 8001C2B0 78002296 */  lhu        $v0, 0x78($s1)
/* CAB4 8001C2B4 00000000 */  nop
/* CAB8 8001C2B8 00084224 */  addiu      $v0, $v0, 0x800
/* CABC 8001C2BC FF0F4230 */  andi       $v0, $v0, 0xFFF
/* CAC0 8001C2C0 AE6E000C */  jal        CAMERA_CenterCamera
/* CAC4 8001C2C4 B60102A6 */   sh        $v0, 0x1B6($s0)
.L8001C2C8:
/* CAC8 8001C2C8 B6010396 */  lhu        $v1, 0x1B6($s0)
/* CACC 8001C2CC 01000224 */  addiu      $v0, $zero, 0x1
/* CAD0 8001C2D0 AE0402A6 */  sh         $v0, 0x4AE($s0)
/* CAD4 8001C2D4 E800028E */  lw         $v0, 0xE8($s0)
/* CAD8 8001C2D8 C00103A6 */  sh         $v1, 0x1C0($s0)
/* CADC 8001C2DC 0100033C */  lui        $v1, (0x10000 >> 16)
/* CAE0 8001C2E0 24104300 */  and        $v0, $v0, $v1
/* CAE4 8001C2E4 04004014 */  bnez       $v0, .L8001C2F8
/* CAE8 8001C2E8 00000000 */   nop
/* CAEC 8001C2EC B0000296 */  lhu        $v0, 0xB0($s0)
/* CAF0 8001C2F0 00000000 */  nop
/* CAF4 8001C2F4 B20402A6 */  sh         $v0, 0x4B2($s0)
.L8001C2F8:
/* CAF8 8001C2F8 9B4B000C */  jal        PLAYER_ReSetLookAround
/* CAFC 8001C2FC 21202002 */   addu      $a0, $s1, $zero
.L8001C300:
/* CB00 8001C300 F00100A6 */  sh         $zero, 0x1F0($s0)
/* CB04 8001C304 1800BF8F */  lw         $ra, 0x18($sp)
/* CB08 8001C308 1400B18F */  lw         $s1, 0x14($sp)
/* CB0C 8001C30C 1000B08F */  lw         $s0, 0x10($sp)
/* CB10 8001C310 0800E003 */  jr         $ra
/* CB14 8001C314 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_EndLook, . - CAMERA_EndLook
