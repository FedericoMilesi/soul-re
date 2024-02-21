.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MAIN_ShowLoadingScreen
/* 29634 80038E34 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 29638 80038E38 0D80023C */  lui        $v0, %hi(D_800D0BFC)
/* 2963C 80038E3C 6000BFAF */  sw         $ra, 0x60($sp)
/* 29640 80038E40 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 29644 80038E44 5800B0AF */  sw         $s0, 0x58($sp)
/* 29648 80038E48 FC0B4924 */  addiu      $t1, $v0, %lo(D_800D0BFC)
/* 2964C 80038E4C 03002389 */  lwl        $v1, 0x3($t1)
/* 29650 80038E50 00002399 */  lwr        $v1, 0x0($t1)
/* 29654 80038E54 04002781 */  lb         $a3, 0x4($t1)
/* 29658 80038E58 1300A3AB */  swl        $v1, 0x13($sp)
/* 2965C 80038E5C 1000A3BB */  swr        $v1, 0x10($sp)
/* 29660 80038E60 1400A7A3 */  sb         $a3, 0x14($sp)
/* 29664 80038E64 5EF2020C */  jal        VSync
/* 29668 80038E68 21200000 */   addu      $a0, $zero, $zero
/* 2966C 80038E6C 8CDD020C */  jal        localstr_get_language
/* 29670 80038E70 00000000 */   nop
/* 29674 80038E74 0A004010 */  beqz       $v0, .L80038EA0
/* 29678 80038E78 1000B127 */   addiu     $s1, $sp, 0x10
/* 2967C 80038E7C 1800B027 */  addiu      $s0, $sp, 0x18
/* 29680 80038E80 21200002 */  addu       $a0, $s0, $zero
/* 29684 80038E84 0D80053C */  lui        $a1, %hi(D_800D0C04)
/* 29688 80038E88 21105100 */  addu       $v0, $v0, $s1
/* 2968C 80038E8C FFFF4690 */  lbu        $a2, -0x1($v0)
/* 29690 80038E90 1AD1010C */  jal        sprintf
/* 29694 80038E94 040CA524 */   addiu     $a1, $a1, %lo(D_800D0C04)
/* 29698 80038E98 AAE30008 */  j          .L80038EA8
/* 2969C 80038E9C 21200002 */   addu      $a0, $s0, $zero
.L80038EA0:
/* 296A0 80038EA0 0D80043C */  lui        $a0, %hi(D_800D0C24)
/* 296A4 80038EA4 240C8424 */  addiu      $a0, $a0, %lo(D_800D0C24)
.L80038EA8:
/* 296A8 80038EA8 3E82010C */  jal        LOAD_ReadFile
/* 296AC 80038EAC 0B000524 */   addiu     $a1, $zero, 0xB
/* 296B0 80038EB0 21804000 */  addu       $s0, $v0, $zero
/* 296B4 80038EB4 06000012 */  beqz       $s0, .L80038ED0
/* 296B8 80038EB8 00000000 */   nop
/* 296BC 80038EBC CCBD858F */  lw         $a1, %gp_rel(gameTrackerX + 0x4)($gp)
/* 296C0 80038EC0 6DE1000C */  jal        screen_to_vram
/* 296C4 80038EC4 21200002 */   addu      $a0, $s0, $zero
/* 296C8 80038EC8 2641010C */  jal        MEMPACK_Free
/* 296CC 80038ECC 21200002 */   addu      $a0, $s0, $zero
.L80038ED0:
/* 296D0 80038ED0 6000BF8F */  lw         $ra, 0x60($sp)
/* 296D4 80038ED4 5C00B18F */  lw         $s1, 0x5C($sp)
/* 296D8 80038ED8 5800B08F */  lw         $s0, 0x58($sp)
/* 296DC 80038EDC 0800E003 */  jr         $ra
/* 296E0 80038EE0 6800BD27 */   addiu     $sp, $sp, 0x68
.size MAIN_ShowLoadingScreen, . - MAIN_ShowLoadingScreen
