.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel LIGHT_DrawShadow
/* 273C8 80036BC8 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 273CC 80036BCC 7000B2AF */  sw         $s2, 0x70($sp)
/* 273D0 80036BD0 21908000 */  addu       $s2, $a0, $zero
/* 273D4 80036BD4 6C00B1AF */  sw         $s1, 0x6C($sp)
/* 273D8 80036BD8 2188A000 */  addu       $s1, $a1, $zero
/* 273DC 80036BDC 7400B3AF */  sw         $s3, 0x74($sp)
/* 273E0 80036BE0 2198C000 */  addu       $s3, $a2, $zero
/* 273E4 80036BE4 7800B4AF */  sw         $s4, 0x78($sp)
/* 273E8 80036BE8 7C00BFAF */  sw         $ra, 0x7C($sp)
/* 273EC 80036BEC 6800B0AF */  sw         $s0, 0x68($sp)
/* 273F0 80036BF0 60002286 */  lh         $v0, 0x60($s1)
/* 273F4 80036BF4 24012386 */  lh         $v1, 0x124($s1)
/* 273F8 80036BF8 F4BD908F */  lw         $s0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 273FC 80036BFC 00FB4224 */  addiu      $v0, $v0, -0x500
/* 27400 80036C00 2A104300 */  slt        $v0, $v0, $v1
/* 27404 80036C04 A1004010 */  beqz       $v0, .L80036E8C
/* 27408 80036C08 21A0E000 */   addu      $s4, $a3, $zero
/* 2740C 80036C0C DA002486 */  lh         $a0, 0xDA($s1)
/* 27410 80036C10 DC002586 */  lh         $a1, 0xDC($s1)
/* 27414 80036C14 27E7000C */  jal        MATH3D_FastAtan2
/* 27418 80036C18 00000000 */   nop
/* 2741C 80036C1C 23100200 */  negu       $v0, $v0
/* 27420 80036C20 1000A2A7 */  sh         $v0, 0x10($sp)
/* 27424 80036C24 D8002286 */  lh         $v0, 0xD8($s1)
/* 27428 80036C28 00000000 */  nop
/* 2742C 80036C2C 18004200 */  mult       $v0, $v0
/* 27430 80036C30 0001043C */  lui        $a0, (0x1000000 >> 16)
/* 27434 80036C34 12400000 */  mflo       $t0
/* 27438 80036C38 A6E7000C */  jal        MATH3D_FastSqrt0
/* 2743C 80036C3C 23208800 */   subu      $a0, $a0, $t0
/* 27440 80036C40 D8002486 */  lh         $a0, 0xD8($s1)
/* 27444 80036C44 27E7000C */  jal        MATH3D_FastAtan2
/* 27448 80036C48 21284000 */   addu      $a1, $v0, $zero
/* 2744C 80036C4C 1000A427 */  addiu      $a0, $sp, 0x10
/* 27450 80036C50 1200A2A7 */  sh         $v0, 0x12($sp)
/* 27454 80036C54 78002296 */  lhu        $v0, 0x78($s1)
/* 27458 80036C58 1800A527 */  addiu      $a1, $sp, 0x18
/* 2745C 80036C5C 3DE3010C */  jal        func_80078CF4
/* 27460 80036C60 1400A2A7 */   sh        $v0, 0x14($sp)
/* 27464 80036C64 20012286 */  lh         $v0, 0x120($s1)
/* 27468 80036C68 00000000 */  nop
/* 2746C 80036C6C 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 27470 80036C70 22012286 */  lh         $v0, 0x122($s1)
/* 27474 80036C74 00000000 */  nop
/* 27478 80036C78 3000A2AF */  sw         $v0, 0x30($sp)
/* 2747C 80036C7C 24012286 */  lh         $v0, 0x124($s1)
/* 27480 80036C80 00000000 */  nop
/* 27484 80036C84 3400A2AF */  sw         $v0, 0x34($sp)
/* 27488 80036C88 00004C8E */  lw         $t4, 0x0($s2)
/* 2748C 80036C8C 04004D8E */  lw         $t5, 0x4($s2)
/* 27490 80036C90 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 27494 80036C94 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 27498 80036C98 08004C8E */  lw         $t4, 0x8($s2)
/* 2749C 80036C9C 0C004D8E */  lw         $t5, 0xC($s2)
/* 274A0 80036CA0 10004E8E */  lw         $t6, 0x10($s2)
/* 274A4 80036CA4 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 274A8 80036CA8 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 274AC 80036CAC 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 274B0 80036CB0 1800A227 */  addiu      $v0, $sp, 0x18
/* 274B4 80036CB4 00004C94 */  lhu        $t4, 0x0($v0)
/* 274B8 80036CB8 06004D94 */  lhu        $t5, 0x6($v0)
/* 274BC 80036CBC 0C004E94 */  lhu        $t6, 0xC($v0)
/* 274C0 80036CC0 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 274C4 80036CC4 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 274C8 80036CC8 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 274CC 80036CCC 00000000 */  nop
/* 274D0 80036CD0 00000000 */  nop
/* 274D4 80036CD4 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 274D8 80036CD8 3800B027 */  addiu      $s0, $sp, 0x38
/* 274DC 80036CDC 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 274E0 80036CE0 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 274E4 80036CE4 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 274E8 80036CE8 00000CA6 */  sh         $t4, 0x0($s0)
/* 274EC 80036CEC 06000DA6 */  sh         $t5, 0x6($s0)
/* 274F0 80036CF0 0C000EA6 */  sh         $t6, 0xC($s0)
/* 274F4 80036CF4 1A00A227 */  addiu      $v0, $sp, 0x1A
/* 274F8 80036CF8 00004C94 */  lhu        $t4, 0x0($v0)
/* 274FC 80036CFC 06004D94 */  lhu        $t5, 0x6($v0)
/* 27500 80036D00 0C004E94 */  lhu        $t6, 0xC($v0)
/* 27504 80036D04 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 27508 80036D08 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 2750C 80036D0C 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 27510 80036D10 00000000 */  nop
/* 27514 80036D14 00000000 */  nop
/* 27518 80036D18 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 2751C 80036D1C 3A00A227 */  addiu      $v0, $sp, 0x3A
/* 27520 80036D20 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 27524 80036D24 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 27528 80036D28 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 2752C 80036D2C 00004CA4 */  sh         $t4, 0x0($v0)
/* 27530 80036D30 06004DA4 */  sh         $t5, 0x6($v0)
/* 27534 80036D34 0C004EA4 */  sh         $t6, 0xC($v0)
/* 27538 80036D38 1C00A227 */  addiu      $v0, $sp, 0x1C
/* 2753C 80036D3C 00004C94 */  lhu        $t4, 0x0($v0)
/* 27540 80036D40 06004D94 */  lhu        $t5, 0x6($v0)
/* 27544 80036D44 0C004E94 */  lhu        $t6, 0xC($v0)
/* 27548 80036D48 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 2754C 80036D4C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 27550 80036D50 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 27554 80036D54 00000000 */  nop
/* 27558 80036D58 00000000 */  nop
/* 2755C 80036D5C 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 27560 80036D60 3C00A227 */  addiu      $v0, $sp, 0x3C
/* 27564 80036D64 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 27568 80036D68 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 2756C 80036D6C 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 27570 80036D70 00004CA4 */  sh         $t4, 0x0($v0)
/* 27574 80036D74 06004DA4 */  sh         $t5, 0x6($v0)
/* 27578 80036D78 0C004EA4 */  sh         $t6, 0xC($v0)
/* 2757C 80036D7C 14004C8E */  lw         $t4, 0x14($s2)
/* 27580 80036D80 18004D8E */  lw         $t5, 0x18($s2)
/* 27584 80036D84 0028CC48 */  ctc2       $t4, $5 # handwritten instruction
/* 27588 80036D88 1C004E8E */  lw         $t6, 0x1C($s2)
/* 2758C 80036D8C 0030CD48 */  ctc2       $t5, $6 # handwritten instruction
/* 27590 80036D90 0038CE48 */  ctc2       $t6, $7 # handwritten instruction
/* 27594 80036D94 2C00A227 */  addiu      $v0, $sp, 0x2C
/* 27598 80036D98 04004D94 */  lhu        $t5, 0x4($v0)
/* 2759C 80036D9C 00004C94 */  lhu        $t4, 0x0($v0)
/* 275A0 80036DA0 006C0D00 */  sll        $t5, $t5, 16
/* 275A4 80036DA4 25608D01 */  or         $t4, $t4, $t5
/* 275A8 80036DA8 00008C48 */  mtc2       $t4, $0 # handwritten instruction
/* 275AC 80036DAC 080041C8 */  lwc2       $1, 0x8($v0)
/* 275B0 80036DB0 00000000 */  nop
/* 275B4 80036DB4 00000000 */  nop
/* 275B8 80036DB8 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 275BC 80036DBC 4C00A227 */  addiu      $v0, $sp, 0x4C
/* 275C0 80036DC0 000059E8 */  swc2       $25, 0x0($v0)
/* 275C4 80036DC4 04005AE8 */  swc2       $26, 0x4($v0) # handwritten instruction
/* 275C8 80036DC8 08005BE8 */  swc2       $27, 0x8($v0) # handwritten instruction
/* 275CC 80036DCC 1C00238E */  lw         $v1, 0x1C($s1)
/* 275D0 80036DD0 26012286 */  lh         $v0, 0x126($s1)
/* 275D4 80036DD4 0C00638C */  lw         $v1, 0xC($v1)
/* 275D8 80036DD8 80100200 */  sll        $v0, $v0, 2
/* 275DC 80036DDC 21104300 */  addu       $v0, $v0, $v1
/* 275E0 80036DE0 0000428C */  lw         $v0, 0x0($v0)
/* 275E4 80036DE4 8888043C */  lui        $a0, (0x88888889 >> 16)
/* 275E8 80036DE8 24004384 */  lh         $v1, 0x24($v0)
/* 275EC 80036DEC 89888434 */  ori        $a0, $a0, (0x88888889 & 0xFFFF)
/* 275F0 80036DF0 001B0300 */  sll        $v1, $v1, 12
/* 275F4 80036DF4 18006400 */  mult       $v1, $a0
/* 275F8 80036DF8 6666053C */  lui        $a1, (0x66666667 >> 16)
/* 275FC 80036DFC 6766A534 */  ori        $a1, $a1, (0x66666667 & 0xFFFF)
/* 27600 80036E00 60002286 */  lh         $v0, 0x60($s1)
/* 27604 80036E04 24012486 */  lh         $a0, 0x124($s1)
/* 27608 80036E08 10300000 */  mfhi       $a2
/* 2760C 80036E0C 23104400 */  subu       $v0, $v0, $a0
/* 27610 80036E10 00130200 */  sll        $v0, $v0, 12
/* 27614 80036E14 18004500 */  mult       $v0, $a1
/* 27618 80036E18 2120C300 */  addu       $a0, $a2, $v1
/* 2761C 80036E1C 03220400 */  sra        $a0, $a0, 8
/* 27620 80036E20 C31F0300 */  sra        $v1, $v1, 31
/* 27624 80036E24 23208300 */  subu       $a0, $a0, $v1
/* 27628 80036E28 C3170200 */  sra        $v0, $v0, 31
/* 2762C 80036E2C 10480000 */  mfhi       $t1
/* 27630 80036E30 431A0900 */  sra        $v1, $t1, 9
/* 27634 80036E34 23186200 */  subu       $v1, $v1, $v0
/* 27638 80036E38 00100224 */  addiu      $v0, $zero, 0x1000
/* 2763C 80036E3C 23104300 */  subu       $v0, $v0, $v1
/* 27640 80036E40 18008200 */  mult       $a0, $v0
/* 27644 80036E44 5800A527 */  addiu      $a1, $sp, 0x58
/* 27648 80036E48 21200002 */  addu       $a0, $s0, $zero
/* 2764C 80036E4C 12180000 */  mflo       $v1
/* 27650 80036E50 03130300 */  sra        $v0, $v1, 12
/* 27654 80036E54 6000A2AF */  sw         $v0, 0x60($sp)
/* 27658 80036E58 5C00A2AF */  sw         $v0, 0x5C($sp)
/* 2765C 80036E5C 96E4010C */  jal        func_80079258
/* 27660 80036E60 5800A2AF */   sw        $v0, 0x58($sp)
/* 27664 80036E64 52F2020C */  jal        func_800BC948
/* 27668 80036E68 21200002 */   addu      $a0, $s0, $zero
/* 2766C 80036E6C 4AF2020C */  jal        func_800BC928
/* 27670 80036E70 21200002 */   addu      $a0, $s0, $zero
/* 27674 80036E74 21206002 */  addu       $a0, $s3, $zero
/* 27678 80036E78 21280000 */  addu       $a1, $zero, $zero
/* 2767C 80036E7C 04012786 */  lh         $a3, 0x104($s1)
/* 27680 80036E80 95AA000C */  jal        DRAW_DrawShadow
/* 27684 80036E84 21308002 */   addu      $a2, $s4, $zero
/* 27688 80036E88 040062AE */  sw         $v0, 0x4($s3)
.L80036E8C:
/* 2768C 80036E8C 7C00BF8F */  lw         $ra, 0x7C($sp)
/* 27690 80036E90 7800B48F */  lw         $s4, 0x78($sp)
/* 27694 80036E94 7400B38F */  lw         $s3, 0x74($sp)
/* 27698 80036E98 7000B28F */  lw         $s2, 0x70($sp)
/* 2769C 80036E9C 6C00B18F */  lw         $s1, 0x6C($sp)
/* 276A0 80036EA0 6800B08F */  lw         $s0, 0x68($sp)
/* 276A4 80036EA4 0800E003 */  jr         $ra
/* 276A8 80036EA8 8000BD27 */   addiu     $sp, $sp, 0x80
.size LIGHT_DrawShadow, . - LIGHT_DrawShadow
