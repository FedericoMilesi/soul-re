.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPhysicsLinkedMoveData
/* 61C24 80071424 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 61C28 80071428 1400B1AF */  sw         $s1, 0x14($sp)
/* 61C2C 8007142C 21888000 */  addu       $s1, $a0, $zero
/* 61C30 80071430 1000B0AF */  sw         $s0, 0x10($sp)
/* 61C34 80071434 2180A000 */  addu       $s0, $a1, $zero
/* 61C38 80071438 1800B2AF */  sw         $s2, 0x18($sp)
/* 61C3C 8007143C 2190C000 */  addu       $s2, $a2, $zero
/* 61C40 80071440 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 61C44 80071444 2198E000 */  addu       $s3, $a3, $zero
/* 61C48 80071448 2000BFAF */  sw         $ra, 0x20($sp)
/* 61C4C 8007144C 6DC3010C */  jal        CIRC_Alloc
/* 61C50 80071450 18000424 */   addiu     $a0, $zero, 0x18
/* 61C54 80071454 040050AC */  sw         $s0, 0x4($v0)
/* 61C58 80071458 09004012 */  beqz       $s2, .L80071480
/* 61C5C 8007145C 000051AC */   sw        $s1, 0x0($v0)
/* 61C60 80071460 0300438A */  lwl        $v1, 0x3($s2)
/* 61C64 80071464 0000439A */  lwr        $v1, 0x0($s2)
/* 61C68 80071468 0700488A */  lwl        $t0, 0x7($s2)
/* 61C6C 8007146C 0400489A */  lwr        $t0, 0x4($s2)
/* 61C70 80071470 0B0043A8 */  swl        $v1, 0xB($v0)
/* 61C74 80071474 080043B8 */  swr        $v1, 0x8($v0)
/* 61C78 80071478 0F0048A8 */  swl        $t0, 0xF($v0)
/* 61C7C 8007147C 0C0048B8 */  swr        $t0, 0xC($v0)
.L80071480:
/* 61C80 80071480 09006012 */  beqz       $s3, .L800714A8
/* 61C84 80071484 00000000 */   nop
/* 61C88 80071488 0300638A */  lwl        $v1, 0x3($s3)
/* 61C8C 8007148C 0000639A */  lwr        $v1, 0x0($s3)
/* 61C90 80071490 0700688A */  lwl        $t0, 0x7($s3)
/* 61C94 80071494 0400689A */  lwr        $t0, 0x4($s3)
/* 61C98 80071498 130043A8 */  swl        $v1, 0x13($v0)
/* 61C9C 8007149C 100043B8 */  swr        $v1, 0x10($v0)
/* 61CA0 800714A0 170048A8 */  swl        $t0, 0x17($v0)
/* 61CA4 800714A4 140048B8 */  swr        $t0, 0x14($v0)
.L800714A8:
/* 61CA8 800714A8 2000BF8F */  lw         $ra, 0x20($sp)
/* 61CAC 800714AC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 61CB0 800714B0 1800B28F */  lw         $s2, 0x18($sp)
/* 61CB4 800714B4 1400B18F */  lw         $s1, 0x14($sp)
/* 61CB8 800714B8 1000B08F */  lw         $s0, 0x10($sp)
/* 61CBC 800714BC 0800E003 */  jr         $ra
/* 61CC0 800714C0 2800BD27 */   addiu     $sp, $sp, 0x28
.size SetPhysicsLinkedMoveData, . - SetPhysicsLinkedMoveData
