.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UpdateAutoFaceAngle
/* 94C60 800A4460 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 94C64 800A4464 1000BFAF */  sw         $ra, 0x10($sp)
/* 94C68 800A4468 5E008684 */  lh         $a2, 0x5E($a0)
/* 94C6C 800A446C 5E00A284 */  lh         $v0, 0x5E($a1)
/* 94C70 800A4470 5C008384 */  lh         $v1, 0x5C($a0)
/* 94C74 800A4474 5C00A584 */  lh         $a1, 0x5C($a1)
/* 94C78 800A4478 2320C200 */  subu       $a0, $a2, $v0
/* 94C7C 800A447C 27E7000C */  jal        MATH3D_FastAtan2
/* 94C80 800A4480 23286500 */   subu      $a1, $v1, $a1
/* 94C84 800A4484 00140200 */  sll        $v0, $v0, 16
/* 94C88 800A4488 03140200 */  sra        $v0, $v0, 16
/* 94C8C 800A448C 000C4224 */  addiu      $v0, $v0, 0xC00
/* 94C90 800A4490 1000BF8F */  lw         $ra, 0x10($sp)
/* 94C94 800A4494 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 94C98 800A4498 0800E003 */  jr         $ra
/* 94C9C 800A449C 1800BD27 */   addiu     $sp, $sp, 0x18
.size UpdateAutoFaceAngle, . - UpdateAutoFaceAngle
