.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razAdjustSpeed
/* 96358 800A5B58 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 9635C 800A5B5C CAF98587 */  lh         $a1, %gp_rel(Raziel + 0x39A)($gp)
/* 96360 800A5B60 A4F9838F */  lw         $v1, %gp_rel(Raziel + 0x374)($gp)
/* 96364 800A5B64 21388000 */  addu       $a3, $a0, $zero
/* 96368 800A5B68 1400BFAF */  sw         $ra, 0x14($sp)
/* 9636C 800A5B6C 2A10A300 */  slt        $v0, $a1, $v1
/* 96370 800A5B70 04004010 */  beqz       $v0, .L800A5B84
/* 96374 800A5B74 1000B0AF */   sw        $s0, 0x10($sp)
/* 96378 800A5B78 C6F99087 */  lh         $s0, %gp_rel(Raziel + 0x396)($gp)
/* 9637C 800A5B7C F6960208 */  j          .L800A5BD8
/* 96380 800A5B80 C801E424 */   addiu     $a0, $a3, 0x1C8
.L800A5B84:
/* 96384 800A5B84 C8F98687 */  lh         $a2, %gp_rel(Raziel + 0x398)($gp)
/* 96388 800A5B88 00000000 */  nop
/* 9638C 800A5B8C 2A106600 */  slt        $v0, $v1, $a2
/* 96390 800A5B90 04004010 */  beqz       $v0, .L800A5BA4
/* 96394 800A5B94 C801E424 */   addiu     $a0, $a3, 0x1C8
/* 96398 800A5B98 C4F99087 */  lh         $s0, %gp_rel(Raziel + 0x394)($gp)
/* 9639C 800A5B9C F6960208 */  j          .L800A5BD8
/* 963A0 800A5BA0 00000000 */   nop
.L800A5BA4:
/* 963A4 800A5BA4 C6F98487 */  lh         $a0, %gp_rel(Raziel + 0x396)($gp)
/* 963A8 800A5BA8 C4F98287 */  lh         $v0, %gp_rel(Raziel + 0x394)($gp)
/* 963AC 800A5BAC 2318A300 */  subu       $v1, $a1, $v1
/* 963B0 800A5BB0 23108200 */  subu       $v0, $a0, $v0
/* 963B4 800A5BB4 18004300 */  mult       $v0, $v1
/* 963B8 800A5BB8 12180000 */  mflo       $v1
/* 963BC 800A5BBC 2310A600 */  subu       $v0, $a1, $a2
/* 963C0 800A5BC0 00000000 */  nop
/* 963C4 800A5BC4 1A006200 */  div        $zero, $v1, $v0
/* 963C8 800A5BC8 12100000 */  mflo       $v0
/* 963CC 800A5BCC 00000000 */  nop
/* 963D0 800A5BD0 23808200 */  subu       $s0, $a0, $v0
/* 963D4 800A5BD4 C801E424 */  addiu      $a0, $a3, 0x1C8
.L800A5BD8:
/* 963D8 800A5BD8 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 963DC 800A5BDC 21280002 */   addu      $a1, $s0, $zero
/* 963E0 800A5BE0 21100002 */  addu       $v0, $s0, $zero
/* 963E4 800A5BE4 1400BF8F */  lw         $ra, 0x14($sp)
/* 963E8 800A5BE8 1000B08F */  lw         $s0, 0x10($sp)
/* 963EC 800A5BEC 0800E003 */  jr         $ra
/* 963F0 800A5BF0 1800BD27 */   addiu     $sp, $sp, 0x18
.size razAdjustSpeed, . - razAdjustSpeed
