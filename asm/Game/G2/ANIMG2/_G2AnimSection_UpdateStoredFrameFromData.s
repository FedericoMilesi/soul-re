.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2AnimSection_UpdateStoredFrameFromData
/* 85410 80094C10 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 85414 80094C14 1800B0AF */  sw         $s0, 0x18($sp)
/* 85418 80094C18 21808000 */  addu       $s0, $a0, $zero
/* 8541C 80094C1C 2800BFAF */  sw         $ra, 0x28($sp)
/* 85420 80094C20 2400B3AF */  sw         $s3, 0x24($sp)
/* 85424 80094C24 2000B2AF */  sw         $s2, 0x20($sp)
/* 85428 80094C28 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8542C 80094C2C 2400048E */  lw         $a0, 0x24($s0)
/* 85430 80094C30 06000386 */  lh         $v1, 0x6($s0)
/* 85434 80094C34 06008284 */  lh         $v0, 0x6($a0)
/* 85438 80094C38 00000000 */  nop
/* 8543C 80094C3C 1A006200 */  div        $zero, $v1, $v0
/* 85440 80094C40 12300000 */  mflo       $a2
/* 85444 80094C44 04000386 */  lh         $v1, 0x4($s0)
/* 85448 80094C48 06009294 */  lhu        $s2, 0x6($a0)
/* 8544C 80094C4C 1A006200 */  div        $zero, $v1, $v0
/* 85450 80094C50 12880000 */  mflo       $s1
/* 85454 80094C54 0400C004 */  bltz       $a2, .L80094C68
/* 85458 80094C58 2198A000 */   addu      $s3, $a1, $zero
/* 8545C 80094C5C 2A102602 */  slt        $v0, $s1, $a2
/* 85460 80094C60 06004010 */  beqz       $v0, .L80094C7C
/* 85464 80094C64 001C1200 */   sll       $v1, $s2, 16
.L80094C68:
/* 85468 80094C68 21200002 */  addu       $a0, $s0, $zero
/* 8546C 80094C6C 3751020C */  jal        _G2AnimSection_InitStatus
/* 85470 80094C70 21286002 */   addu      $a1, $s3, $zero
/* 85474 80094C74 FFFF0624 */  addiu      $a2, $zero, -0x1
/* 85478 80094C78 001C1200 */  sll        $v1, $s2, 16
.L80094C7C:
/* 8547C 80094C7C 031C0300 */  sra        $v1, $v1, 16
/* 85480 80094C80 18002302 */  mult       $s1, $v1
/* 85484 80094C84 04000286 */  lh         $v0, 0x4($s0)
/* 85488 80094C88 12480000 */  mflo       $t1
/* 8548C 80094C8C 23104900 */  subu       $v0, $v0, $t1
/* 85490 80094C90 00130200 */  sll        $v0, $v0, 12
/* 85494 80094C94 1A004300 */  div        $zero, $v0, $v1
/* 85498 80094C98 12100000 */  mflo       $v0
/* 8549C 80094C9C 21200002 */  addu       $a0, $s0, $zero
/* 854A0 80094CA0 21286002 */  addu       $a1, $s3, $zero
/* 854A4 80094CA4 21382002 */  addu       $a3, $s1, $zero
/* 854A8 80094CA8 E251020C */  jal        FooBar
/* 854AC 80094CAC 1000A2AF */   sw        $v0, 0x10($sp)
/* 854B0 80094CB0 00000292 */  lbu        $v0, 0x0($s0)
/* 854B4 80094CB4 04000396 */  lhu        $v1, 0x4($s0)
/* 854B8 80094CB8 80004234 */  ori        $v0, $v0, 0x80
/* 854BC 80094CBC 060003A6 */  sh         $v1, 0x6($s0)
/* 854C0 80094CC0 000002A2 */  sb         $v0, 0x0($s0)
/* 854C4 80094CC4 2800BF8F */  lw         $ra, 0x28($sp)
/* 854C8 80094CC8 2400B38F */  lw         $s3, 0x24($sp)
/* 854CC 80094CCC 2000B28F */  lw         $s2, 0x20($sp)
/* 854D0 80094CD0 1C00B18F */  lw         $s1, 0x1C($sp)
/* 854D4 80094CD4 1800B08F */  lw         $s0, 0x18($sp)
/* 854D8 80094CD8 0800E003 */  jr         $ra
/* 854DC 80094CDC 3000BD27 */   addiu     $sp, $sp, 0x30
.size _G2AnimSection_UpdateStoredFrameFromData, . - _G2AnimSection_UpdateStoredFrameFromData
