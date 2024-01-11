.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel load
/* A9DB0 800B95B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A9DB4 800B95B4 1400B1AF */  sw         $s1, 0x14($sp)
/* A9DB8 800B95B8 21888000 */  addu       $s1, $a0, $zero
/* A9DBC 800B95BC 0D80023C */  lui        $v0, %hi(gameTrackerX)
/* A9DC0 800B95C0 60334424 */  addiu      $a0, $v0, %lo(gameTrackerX)
/* A9DC4 800B95C4 1800BFAF */  sw         $ra, 0x18($sp)
/* A9DC8 800B95C8 1000B0AF */  sw         $s0, 0x10($sp)
/* A9DCC 800B95CC 4001828C */  lw         $v0, 0x140($a0)
/* A9DD0 800B95D0 0008033C */  lui        $v1, (0x8000000 >> 16)
/* A9DD4 800B95D4 24104300 */  and        $v0, $v0, $v1
/* A9DD8 800B95D8 04004010 */  beqz       $v0, .L800B95EC
/* A9DDC 800B95DC 00000000 */   nop
/* A9DE0 800B95E0 4000828C */  lw         $v0, 0x40($a0)
/* A9DE4 800B95E4 7FE50208 */  j          .L800B95FC
/* A9DE8 800B95E8 0C005024 */   addiu     $s0, $v0, 0xC
.L800B95EC:
/* A9DEC 800B95EC 409C0434 */  ori        $a0, $zero, 0x9C40
/* A9DF0 800B95F0 8140010C */  jal        MEMPACK_Malloc
/* A9DF4 800B95F4 2B000524 */   addiu     $a1, $zero, 0x2B
/* A9DF8 800B95F8 21804000 */  addu       $s0, $v0, $zero
.L800B95FC:
/* A9DFC 800B95FC 0180043C */  lui        $a0, %hi(D_8001248C)
/* A9E00 800B9600 8C248424 */  addiu      $a0, $a0, %lo(D_8001248C)
/* A9E04 800B9604 21280002 */  addu       $a1, $s0, $zero
/* A9E08 800B9608 D081010C */  jal        LOAD_LoadToAddress
/* A9E0C 800B960C 01000624 */   addiu     $a2, $zero, 0x1
/* A9E10 800B9610 4000028E */  lw         $v0, 0x40($s0)
/* A9E14 800B9614 00000000 */  nop
/* A9E18 800B9618 040022AE */  sw         $v0, 0x4($s1)
/* A9E1C 800B961C 4000048E */  lw         $a0, 0x40($s0)
/* A9E20 800B9620 3C00058E */  lw         $a1, 0x3C($s0)
/* A9E24 800B9624 E9F2010C */  jal        RELMOD_InitModulePointers
/* A9E28 800B9628 00000000 */   nop
/* A9E2C 800B962C 0400238E */  lw         $v1, 0x4($s1)
/* A9E30 800B9630 0D80023C */  lui        $v0, %hi(monVersion)
/* A9E34 800B9634 000030AE */  sw         $s0, 0x0($s1)
/* A9E38 800B9638 2000638C */  lw         $v1, 0x20($v1)
/* A9E3C 800B963C A41E4224 */  addiu      $v0, $v0, %lo(monVersion)
/* A9E40 800B9640 09006210 */  beq        $v1, $v0, .L800B9668
/* A9E44 800B9644 0D80023C */   lui       $v0, %hi(gameTrackerX + 0x140)
/* A9E48 800B9648 A034428C */  lw         $v0, %lo(gameTrackerX + 0x140)($v0)
/* A9E4C 800B964C 0008033C */  lui        $v1, (0x8000000 >> 16)
/* A9E50 800B9650 24104300 */  and        $v0, $v0, $v1
/* A9E54 800B9654 03004014 */  bnez       $v0, .L800B9664
/* A9E58 800B9658 00000000 */   nop
/* A9E5C 800B965C 2641010C */  jal        MEMPACK_Free
/* A9E60 800B9660 21200002 */   addu      $a0, $s0, $zero
.L800B9664:
/* A9E64 800B9664 040020AE */  sw         $zero, 0x4($s1)
.L800B9668:
/* A9E68 800B9668 1800BF8F */  lw         $ra, 0x18($sp)
/* A9E6C 800B966C 1400B18F */  lw         $s1, 0x14($sp)
/* A9E70 800B9670 1000B08F */  lw         $s0, 0x10($sp)
/* A9E74 800B9674 0800E003 */  jr         $ra
/* A9E78 800B9678 2000BD27 */   addiu     $sp, $sp, 0x20
.size load, . - load
