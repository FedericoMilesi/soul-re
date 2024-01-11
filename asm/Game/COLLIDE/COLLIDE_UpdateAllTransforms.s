.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_UpdateAllTransforms
/* F578 8001ED78 4000878C */  lw         $a3, 0x40($a0)
/* F57C 8001ED7C 00000000 */  nop
/* F580 8001ED80 2F00E010 */  beqz       $a3, .L8001EE40
/* F584 8001ED84 00000000 */   nop
/* F588 8001ED88 0000A984 */  lh         $t1, 0x0($a1)
/* F58C 8001ED8C 1C00868C */  lw         $a2, 0x1C($a0)
/* F590 8001ED90 0200A884 */  lh         $t0, 0x2($a1)
/* F594 8001ED94 1000C28C */  lw         $v0, 0x10($a2)
/* F598 8001ED98 0400A584 */  lh         $a1, 0x4($a1)
/* F59C 8001ED9C 10004010 */  beqz       $v0, .L8001EDE0
/* F5A0 8001EDA0 0040033C */   lui       $v1, (0x40000000 >> 16)
/* F5A4 8001EDA4 2C00C28C */  lw         $v0, 0x2C($a2)
/* F5A8 8001EDA8 00000000 */  nop
/* F5AC 8001EDAC 24104300 */  and        $v0, $v0, $v1
/* F5B0 8001EDB0 0B004014 */  bnez       $v0, .L8001EDE0
/* F5B4 8001EDB4 00000000 */   nop
/* F5B8 8001EDB8 26018284 */  lh         $v0, 0x126($a0)
/* F5BC 8001EDBC 0C00C38C */  lw         $v1, 0xC($a2)
/* F5C0 8001EDC0 80100200 */  sll        $v0, $v0, 2
/* F5C4 8001EDC4 21104300 */  addu       $v0, $v0, $v1
/* F5C8 8001EDC8 0000428C */  lw         $v0, 0x0($v0)
/* F5CC 8001EDCC 00000000 */  nop
/* F5D0 8001EDD0 1800428C */  lw         $v0, 0x18($v0)
/* F5D4 8001EDD4 E0FFE324 */  addiu      $v1, $a3, -0x20
/* F5D8 8001EDD8 807B0008 */  j          .L8001EE00
/* F5DC 8001EDDC 01004224 */   addiu     $v0, $v0, 0x1
.L8001EDE0:
/* F5E0 8001EDE0 1C00838C */  lw         $v1, 0x1C($a0)
/* F5E4 8001EDE4 26018284 */  lh         $v0, 0x126($a0)
/* F5E8 8001EDE8 0C00638C */  lw         $v1, 0xC($v1)
/* F5EC 8001EDEC 80100200 */  sll        $v0, $v0, 2
/* F5F0 8001EDF0 21104300 */  addu       $v0, $v0, $v1
/* F5F4 8001EDF4 0000428C */  lw         $v0, 0x0($v0)
/* F5F8 8001EDF8 4000838C */  lw         $v1, 0x40($a0)
/* F5FC 8001EDFC 1800428C */  lw         $v0, 0x18($v0)
.L8001EE00:
/* F600 8001EE00 00000000 */  nop
/* F604 8001EE04 21304000 */  addu       $a2, $v0, $zero
/* F608 8001EE08 0D00C010 */  beqz       $a2, .L8001EE40
/* F60C 8001EE0C 1C006424 */   addiu     $a0, $v1, 0x1C
.L8001EE10:
/* F610 8001EE10 FFFFC624 */  addiu      $a2, $a2, -0x1
/* F614 8001EE14 F8FF828C */  lw         $v0, -0x8($a0)
/* F618 8001EE18 0000838C */  lw         $v1, 0x0($a0)
/* F61C 8001EE1C 21104900 */  addu       $v0, $v0, $t1
/* F620 8001EE20 F8FF82AC */  sw         $v0, -0x8($a0)
/* F624 8001EE24 FCFF828C */  lw         $v0, -0x4($a0)
/* F628 8001EE28 21186500 */  addu       $v1, $v1, $a1
/* F62C 8001EE2C 000083AC */  sw         $v1, 0x0($a0)
/* F630 8001EE30 21104800 */  addu       $v0, $v0, $t0
/* F634 8001EE34 FCFF82AC */  sw         $v0, -0x4($a0)
/* F638 8001EE38 F5FFC014 */  bnez       $a2, .L8001EE10
/* F63C 8001EE3C 20008424 */   addiu     $a0, $a0, 0x20
.L8001EE40:
/* F640 8001EE40 0800E003 */  jr         $ra
/* F644 8001EE44 00000000 */   nop
.size COLLIDE_UpdateAllTransforms, . - COLLIDE_UpdateAllTransforms
