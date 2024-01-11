.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_GetAngry
/* 6E0B8 8007D8B8 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 6E0BC 8007D8BC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6E0C0 8007D8C0 1800BFAF */  sw         $ra, 0x18($sp)
/* 6E0C4 8007D8C4 1400B1AF */  sw         $s1, 0x14($sp)
/* 6E0C8 8007D8C8 1000B0AF */  sw         $s0, 0x10($sp)
/* 6E0CC 8007D8CC 0400508C */  lw         $s0, 0x4($v0)
/* 6E0D0 8007D8D0 00000000 */  nop
/* 6E0D4 8007D8D4 25000012 */  beqz       $s0, .L8007D96C
/* 6E0D8 8007D8D8 FEFF1124 */   addiu     $s1, $zero, -0x2
.L8007D8DC:
/* 6E0DC 8007D8DC 21200002 */  addu       $a0, $s0, $zero
/* 6E0E0 8007D8E0 92D1000C */  jal        INSTANCE_Query
/* 6E0E4 8007D8E4 01000524 */   addiu     $a1, $zero, 0x1
/* 6E0E8 8007D8E8 00C04230 */  andi       $v0, $v0, 0xC000
/* 6E0EC 8007D8EC 1B004010 */  beqz       $v0, .L8007D95C
/* 6E0F0 8007D8F0 00000000 */   nop
/* 6E0F4 8007D8F4 6C01028E */  lw         $v0, 0x16C($s0)
/* 6E0F8 8007D8F8 00000000 */  nop
/* 6E0FC 8007D8FC 6801428C */  lw         $v0, 0x168($v0)
/* 6E100 8007D900 00000000 */  nop
/* 6E104 8007D904 0C00448C */  lw         $a0, 0xC($v0)
/* 6E108 8007D908 00000000 */  nop
/* 6E10C 8007D90C 0C00828C */  lw         $v0, 0xC($a0)
/* 6E110 8007D910 00000000 */  nop
/* 6E114 8007D914 24105100 */  and        $v0, $v0, $s1
/* 6E118 8007D918 0C0082AC */  sw         $v0, 0xC($a0)
/* 6E11C 8007D91C 0400828C */  lw         $v0, 0x4($a0)
/* 6E120 8007D920 0000838C */  lw         $v1, 0x0($a0)
/* 6E124 8007D924 24105100 */  and        $v0, $v0, $s1
/* 6E128 8007D928 01006334 */  ori        $v1, $v1, 0x1
/* 6E12C 8007D92C 040082AC */  sw         $v0, 0x4($a0)
/* 6E130 8007D930 000083AC */  sw         $v1, 0x0($a0)
/* 6E134 8007D934 F4BD858F */  lw         $a1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6E138 8007D938 071A020C */  jal        MONSENSE_SetEnemy
/* 6E13C 8007D93C 21200002 */   addu      $a0, $s0, $zero
/* 6E140 8007D940 21184000 */  addu       $v1, $v0, $zero
/* 6E144 8007D944 05006010 */  beqz       $v1, .L8007D95C
/* 6E148 8007D948 00000000 */   nop
/* 6E14C 8007D94C 16006294 */  lhu        $v0, 0x16($v1)
/* 6E150 8007D950 00000000 */  nop
/* 6E154 8007D954 F9FF4230 */  andi       $v0, $v0, 0xFFF9
/* 6E158 8007D958 160062A4 */  sh         $v0, 0x16($v1)
.L8007D95C:
/* 6E15C 8007D95C 0800108E */  lw         $s0, 0x8($s0)
/* 6E160 8007D960 00000000 */  nop
/* 6E164 8007D964 DDFF0016 */  bnez       $s0, .L8007D8DC
/* 6E168 8007D968 00000000 */   nop
.L8007D96C:
/* 6E16C 8007D96C 1800BF8F */  lw         $ra, 0x18($sp)
/* 6E170 8007D970 1400B18F */  lw         $s1, 0x14($sp)
/* 6E174 8007D974 1000B08F */  lw         $s0, 0x10($sp)
/* 6E178 8007D978 0800E003 */  jr         $ra
/* 6E17C 8007D97C 2000BD27 */   addiu     $sp, $sp, 0x20
.size HUMAN_GetAngry, . - HUMAN_GetAngry
