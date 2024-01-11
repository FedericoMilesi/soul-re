.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuGetAllKeysStatus
/* B04E4 800BFCE4 18000A24 */  addiu      $t2, $zero, 0x18
/* B04E8 800BFCE8 21300000 */  addu       $a2, $zero, $zero
/* B04EC 800BFCEC 01000724 */  addiu      $a3, $zero, 0x1
/* B04F0 800BFCF0 03000924 */  addiu      $t1, $zero, 0x3
/* B04F4 800BFCF4 02000824 */  addiu      $t0, $zero, 0x2
/* B04F8 800BFCF8 21288000 */  addu       $a1, $a0, $zero
.L800BFCFC:
/* B04FC 800BFCFC 00210600 */  sll        $a0, $a2, 4
/* B0500 800BFD00 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B0504 800BFD04 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B0508 800BFD08 0D80033C */  lui        $v1, %hi(_spu_keystat)
/* B050C 800BFD0C E8EC638C */  lw         $v1, %lo(_spu_keystat)($v1)
/* B0510 800BFD10 21208200 */  addu       $a0, $a0, $v0
/* B0514 800BFD14 0410C700 */  sllv       $v0, $a3, $a2
/* B0518 800BFD18 24186200 */  and        $v1, $v1, $v0
/* B051C 800BFD1C 0C008294 */  lhu        $v0, 0xC($a0)
/* B0520 800BFD20 07006010 */  beqz       $v1, .L800BFD40
/* B0524 800BFD24 00000000 */   nop
/* B0528 800BFD28 03004010 */  beqz       $v0, .L800BFD38
/* B052C 800BFD2C 00000000 */   nop
/* B0530 800BFD30 55FF0208 */  j          .L800BFD54
/* B0534 800BFD34 0000A7A0 */   sb        $a3, 0x0($a1)
.L800BFD38:
/* B0538 800BFD38 55FF0208 */  j          .L800BFD54
/* B053C 800BFD3C 0000A9A0 */   sb        $t1, 0x0($a1)
.L800BFD40:
/* B0540 800BFD40 03004010 */  beqz       $v0, .L800BFD50
/* B0544 800BFD44 00000000 */   nop
/* B0548 800BFD48 55FF0208 */  j          .L800BFD54
/* B054C 800BFD4C 0000A8A0 */   sb        $t0, 0x0($a1)
.L800BFD50:
/* B0550 800BFD50 0000A0A0 */  sb         $zero, 0x0($a1)
.L800BFD54:
/* B0554 800BFD54 0100C624 */  addiu      $a2, $a2, 0x1
/* B0558 800BFD58 2A10CA00 */  slt        $v0, $a2, $t2
/* B055C 800BFD5C E7FF4014 */  bnez       $v0, .L800BFCFC
/* B0560 800BFD60 0100A524 */   addiu     $a1, $a1, 0x1
/* B0564 800BFD64 0800E003 */  jr         $ra
/* B0568 800BFD68 00000000 */   nop
/* B056C 800BFD6C 00000000 */  nop
.size SpuGetAllKeysStatus, . - SpuGetAllKeysStatus
