.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StartGenericFlash
/* 3D7F0 8004CFF0 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 3D7F4 8004CFF4 90A2438C */  lw         $v1, %lo(objectAccess + 0x54)($v0)
/* 3D7F8 8004CFF8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3D7FC 8004CFFC 1800B2AF */  sw         $s2, 0x18($sp)
/* 3D800 8004D000 21908000 */  addu       $s2, $a0, $zero
/* 3D804 8004D004 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 3D808 8004D008 1400B1AF */  sw         $s1, 0x14($sp)
/* 3D80C 8004D00C 03006014 */  bnez       $v1, .L8004D01C
/* 3D810 8004D010 1000B0AF */   sw        $s0, 0x10($sp)
/* 3D814 8004D014 2E340108 */  j          .L8004D0B8
/* 3D818 8004D018 21100000 */   addu      $v0, $zero, $zero
.L8004D01C:
/* 3D81C 8004D01C 24000424 */  addiu      $a0, $zero, 0x24
/* 3D820 8004D020 40100500 */  sll        $v0, $a1, 1
/* 3D824 8004D024 21104500 */  addu       $v0, $v0, $a1
/* 3D828 8004D028 1C00638C */  lw         $v1, 0x1C($v1)
/* 3D82C 8004D02C 80100200 */  sll        $v0, $v0, 2
/* 3D830 8004D030 1400638C */  lw         $v1, 0x14($v1)
/* 3D834 8004D034 0D000524 */  addiu      $a1, $zero, 0xD
/* 3D838 8004D038 8140010C */  jal        MEMPACK_Malloc
/* 3D83C 8004D03C 21886200 */   addu      $s1, $v1, $v0
/* 3D840 8004D040 21804000 */  addu       $s0, $v0, $zero
/* 3D844 8004D044 1B000012 */  beqz       $s0, .L8004D0B4
/* 3D848 8004D048 0580023C */   lui       $v0, %hi(FX_ContinueFlash)
/* 3D84C 8004D04C D8C24224 */  addiu      $v0, $v0, %lo(FX_ContinueFlash)
/* 3D850 8004D050 040002AE */  sw         $v0, 0x4($s0)
/* 3D854 8004D054 88000224 */  addiu      $v0, $zero, 0x88
/* 3D858 8004D058 0C0002A2 */  sb         $v0, 0xC($s0)
/* 3D85C 8004D05C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3D860 8004D060 080012AE */  sw         $s2, 0x8($s0)
/* 3D864 8004D064 0D0000A2 */  sb         $zero, 0xD($s0)
/* 3D868 8004D068 0E0002A6 */  sh         $v0, 0xE($s0)
/* 3D86C 8004D06C 0400228E */  lw         $v0, 0x4($s1)
/* 3D870 8004D070 1C0000AE */  sw         $zero, 0x1C($s0)
/* 3D874 8004D074 200002AE */  sw         $v0, 0x20($s0)
/* 3D878 8004D078 02002386 */  lh         $v1, 0x2($s1)
/* 3D87C 8004D07C 00000000 */  nop
/* 3D880 8004D080 001A0300 */  sll        $v1, $v1, 8
/* 3D884 8004D084 100003AE */  sw         $v1, 0x10($s0)
/* 3D888 8004D088 08002286 */  lh         $v0, 0x8($s1)
/* 3D88C 8004D08C 00000000 */  nop
/* 3D890 8004D090 00120200 */  sll        $v0, $v0, 8
/* 3D894 8004D094 21186200 */  addu       $v1, $v1, $v0
/* 3D898 8004D098 140003AE */  sw         $v1, 0x14($s0)
/* 3D89C 8004D09C 0A002286 */  lh         $v0, 0xA($s1)
/* 3D8A0 8004D0A0 21200002 */  addu       $a0, $s0, $zero
/* 3D8A4 8004D0A4 00120200 */  sll        $v0, $v0, 8
/* 3D8A8 8004D0A8 21186200 */  addu       $v1, $v1, $v0
/* 3D8AC 8004D0AC 1B2D010C */  jal        FX_InsertGeneralEffect
/* 3D8B0 8004D0B0 180003AE */   sw        $v1, 0x18($s0)
.L8004D0B4:
/* 3D8B4 8004D0B4 21100002 */  addu       $v0, $s0, $zero
.L8004D0B8:
/* 3D8B8 8004D0B8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 3D8BC 8004D0BC 1800B28F */  lw         $s2, 0x18($sp)
/* 3D8C0 8004D0C0 1400B18F */  lw         $s1, 0x14($sp)
/* 3D8C4 8004D0C4 1000B08F */  lw         $s0, 0x10($sp)
/* 3D8C8 8004D0C8 0800E003 */  jr         $ra
/* 3D8CC 8004D0CC 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_StartGenericFlash, . - FX_StartGenericFlash
