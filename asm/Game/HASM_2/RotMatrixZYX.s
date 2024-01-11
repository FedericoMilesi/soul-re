.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel RotMatrixZYX
/* 69360 80078B60 04009984 */  lh         $t9, 0x4($a0)
/* 69364 80078B64 02009884 */  lh         $t8, 0x2($a0)
/* 69368 80078B68 00008F84 */  lh         $t7, 0x0($a0)
/* 6936C 80078B6C 0C80033C */  lui        $v1, (0x800CABF4 >> 16)
/* 69370 80078B70 F4AB6334 */  ori        $v1, $v1, (0x800CABF4 & 0xFFFF)
/* 69374 80078B74 FF072833 */  andi       $t0, $t9, 0x7FF
/* 69378 80078B78 40400800 */  sll        $t0, $t0, 1
/* 6937C 80078B7C 21400301 */  addu       $t0, $t0, $v1
/* 69380 80078B80 00000D85 */  lh         $t5, 0x0($t0)
/* 69384 80078B84 00080A85 */  lh         $t2, 0x800($t0)
/* 69388 80078B88 00082B33 */  andi       $t3, $t9, 0x800
/* 6938C 80078B8C 03006011 */  beqz       $t3, .L80078B9C
/* 69390 80078B90 00000000 */   nop
/* 69394 80078B94 22680D00 */  sub        $t5, $zero, $t5 # handwritten instruction
/* 69398 80078B98 22500A00 */  sub        $t2, $zero, $t2 # handwritten instruction
.L80078B9C:
/* 6939C 80078B9C 25600F03 */  or         $t4, $t8, $t7
/* 693A0 80078BA0 49008011 */  beqz       $t4, .L80078CC8
/* 693A4 80078BA4 00000000 */   nop
/* 693A8 80078BA8 FF070833 */  andi       $t0, $t8, 0x7FF
/* 693AC 80078BAC 40400800 */  sll        $t0, $t0, 1
/* 693B0 80078BB0 21400301 */  addu       $t0, $t0, $v1
/* 693B4 80078BB4 00000C85 */  lh         $t4, 0x0($t0)
/* 693B8 80078BB8 00080985 */  lh         $t1, 0x800($t0)
/* 693BC 80078BBC 00080B33 */  andi       $t3, $t8, 0x800
/* 693C0 80078BC0 03006011 */  beqz       $t3, .L80078BD0
/* 693C4 80078BC4 00000000 */   nop
/* 693C8 80078BC8 22480900 */  sub        $t1, $zero, $t1 # handwritten instruction
/* 693CC 80078BCC 22600C00 */  sub        $t4, $zero, $t4 # handwritten instruction
.L80078BD0:
/* 693D0 80078BD0 FF07E831 */  andi       $t0, $t7, 0x7FF
/* 693D4 80078BD4 40400800 */  sll        $t0, $t0, 1
/* 693D8 80078BD8 21400301 */  addu       $t0, $t0, $v1
/* 693DC 80078BDC 00000B85 */  lh         $t3, 0x0($t0)
/* 693E0 80078BE0 00080885 */  lh         $t0, 0x800($t0)
/* 693E4 80078BE4 0008EE31 */  andi       $t6, $t7, 0x800
/* 693E8 80078BE8 0300C011 */  beqz       $t6, .L80078BF8
/* 693EC 80078BEC 00000000 */   nop
/* 693F0 80078BF0 22580B00 */  sub        $t3, $zero, $t3 # handwritten instruction
/* 693F4 80078BF4 22400800 */  sub        $t0, $zero, $t0 # handwritten instruction
.L80078BF8:
/* 693F8 80078BF8 00488948 */  mtc2       $t1, $9 # handwritten instruction
/* 693FC 80078BFC 00508A48 */  mtc2       $t2, $10 # handwritten instruction
/* 69400 80078C00 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 69404 80078C04 00408848 */  mtc2       $t0, $8 # handwritten instruction
/* 69408 80078C08 18002A01 */  mult       $t1, $t2
/* 6940C 80078C0C 00000000 */  nop
/* 69410 80078C10 3D00984B */  GPF        1
/* 69414 80078C14 23200C00 */  negu       $a0, $t4
/* 69418 80078C18 0C00A4A4 */  sh         $a0, 0xC($a1)
/* 6941C 80078C1C 00500E48 */  mfc2       $t6, $10 # handwritten instruction
/* 69420 80078C20 00480448 */  mfc2       $a0, $9 # handwritten instruction
/* 69424 80078C24 00580F48 */  mfc2       $t7, $11 # handwritten instruction
/* 69428 80078C28 1000A4A4 */  sh         $a0, 0x10($a1)
/* 6942C 80078C2C 12100000 */  mflo       $v0
/* 69430 80078C30 00488948 */  mtc2       $t1, $9 # handwritten instruction
/* 69434 80078C34 00508A48 */  mtc2       $t2, $10 # handwritten instruction
/* 69438 80078C38 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 6943C 80078C3C 00408B48 */  mtc2       $t3, $8 # handwritten instruction
/* 69440 80078C40 18002D01 */  mult       $t1, $t5
/* 69444 80078C44 00000000 */  nop
/* 69448 80078C48 3D00984B */  GPF        1
/* 6944C 80078C4C 03130200 */  sra        $v0, $v0, 12
/* 69450 80078C50 0000A2A4 */  sh         $v0, 0x0($a1)
/* 69454 80078C54 00480448 */  mfc2       $a0, $9 # handwritten instruction
/* 69458 80078C58 00501848 */  mfc2       $t8, $10 # handwritten instruction
/* 6945C 80078C5C 00581948 */  mfc2       $t9, $11 # handwritten instruction
/* 69460 80078C60 0E00A4A4 */  sh         $a0, 0xE($a1)
/* 69464 80078C64 12100000 */  mflo       $v0
/* 69468 80078C68 00488E48 */  mtc2       $t6, $9 # handwritten instruction
/* 6946C 80078C6C 00508F48 */  mtc2       $t7, $10 # handwritten instruction
/* 69470 80078C70 00589848 */  mtc2       $t8, $11 # handwritten instruction
/* 69474 80078C74 00408C48 */  mtc2       $t4, $8 # handwritten instruction
/* 69478 80078C78 18002C03 */  mult       $t9, $t4
/* 6947C 80078C7C 00000000 */  nop
/* 69480 80078C80 3D00984B */  GPF        1
/* 69484 80078C84 03130200 */  sra        $v0, $v0, 12
/* 69488 80078C88 0600A2A4 */  sh         $v0, 0x6($a1)
/* 6948C 80078C8C 00480448 */  mfc2       $a0, $9 # handwritten instruction
/* 69490 80078C90 00500848 */  mfc2       $t0, $10 # handwritten instruction
/* 69494 80078C94 00580948 */  mfc2       $t1, $11 # handwritten instruction
/* 69498 80078C98 12100000 */  mflo       $v0
/* 6949C 80078C9C 03130200 */  sra        $v0, $v0, 12
/* 694A0 80078CA0 22502F01 */  sub        $t2, $t1, $t7 # handwritten instruction
/* 694A4 80078CA4 20589900 */  add        $t3, $a0, $t9 # handwritten instruction
/* 694A8 80078CA8 20604E00 */  add        $t4, $v0, $t6 # handwritten instruction
/* 694AC 80078CAC 22681801 */  sub        $t5, $t0, $t8 # handwritten instruction
/* 694B0 80078CB0 0200AAA4 */  sh         $t2, 0x2($a1)
/* 694B4 80078CB4 0400ABA4 */  sh         $t3, 0x4($a1)
/* 694B8 80078CB8 0800ACA4 */  sh         $t4, 0x8($a1)
/* 694BC 80078CBC 0A00ADA4 */  sh         $t5, 0xA($a1)
/* 694C0 80078CC0 0800E003 */  jr         $ra
/* 694C4 80078CC4 00000000 */   nop
.L80078CC8:
/* 694C8 80078CC8 006C0D00 */  sll        $t5, $t5, 16
/* 694CC 80078CCC 22400D00 */  sub        $t0, $zero, $t5 # handwritten instruction
/* 694D0 80078CD0 FFFF4931 */  andi       $t1, $t2, 0xFFFF
/* 694D4 80078CD4 25400901 */  or         $t0, $t0, $t1
/* 694D8 80078CD8 00100B24 */  addiu      $t3, $zero, 0x1000
/* 694DC 80078CDC 0000A8AC */  sw         $t0, 0x0($a1)
/* 694E0 80078CE0 0400ADAC */  sw         $t5, 0x4($a1)
/* 694E4 80078CE4 0800A9AC */  sw         $t1, 0x8($a1)
/* 694E8 80078CE8 0C00A0AC */  sw         $zero, 0xC($a1)
/* 694EC 80078CEC 0800E003 */  jr         $ra
/* 694F0 80078CF0 1000ABA4 */   sh        $t3, 0x10($a1)
.size RotMatrixZYX, . - RotMatrixZYX
