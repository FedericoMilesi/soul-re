.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_GetClosestNode
/* 89CB4 800994B4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 89CB8 800994B8 1400B1AF */  sw         $s1, 0x14($sp)
/* 89CBC 800994BC 21888000 */  addu       $s1, $a0, $zero
/* 89CC0 800994C0 2000B4AF */  sw         $s4, 0x20($sp)
/* 89CC4 800994C4 FF7F143C */  lui        $s4, (0x7FFFFFFF >> 16)
/* 89CC8 800994C8 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 89CCC 800994CC FFFF9436 */  ori        $s4, $s4, (0x7FFFFFFF & 0xFFFF)
/* 89CD0 800994D0 1800B2AF */  sw         $s2, 0x18($sp)
/* 89CD4 800994D4 21900000 */  addu       $s2, $zero, $zero
/* 89CD8 800994D8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 89CDC 800994DC 21984002 */  addu       $s3, $s2, $zero
/* 89CE0 800994E0 2800BFAF */  sw         $ra, 0x28($sp)
/* 89CE4 800994E4 2400B5AF */  sw         $s5, 0x24($sp)
/* 89CE8 800994E8 1000B0AF */  sw         $s0, 0x10($sp)
/* 89CEC 800994EC 01004290 */  lbu        $v0, 0x1($v0)
/* 89CF0 800994F0 00000000 */  nop
/* 89CF4 800994F4 25004010 */  beqz       $v0, .L8009958C
/* 89CF8 800994F8 21A8C000 */   addu      $s5, $a2, $zero
/* 89CFC 800994FC 2180A000 */  addu       $s0, $a1, $zero
.L80099500:
/* 89D00 80099500 FF00A232 */  andi       $v0, $s5, 0xFF
/* 89D04 80099504 0A004014 */  bnez       $v0, .L80099530
/* 89D08 80099508 00000000 */   nop
/* 89D0C 8009950C 00002386 */  lh         $v1, 0x0($s1)
/* 89D10 80099510 00000486 */  lh         $a0, 0x0($s0)
/* 89D14 80099514 02002286 */  lh         $v0, 0x2($s1)
/* 89D18 80099518 02000586 */  lh         $a1, 0x2($s0)
/* 89D1C 8009951C 23206400 */  subu       $a0, $v1, $a0
/* 89D20 80099520 EBE6000C */  jal        MATH3D_LengthXY
/* 89D24 80099524 23284500 */   subu      $a1, $v0, $a1
/* 89D28 80099528 57650208 */  j          .L8009955C
/* 89D2C 8009952C 21184000 */   addu      $v1, $v0, $zero
.L80099530:
/* 89D30 80099530 00002286 */  lh         $v0, 0x0($s1)
/* 89D34 80099534 00000486 */  lh         $a0, 0x0($s0)
/* 89D38 80099538 02002386 */  lh         $v1, 0x2($s1)
/* 89D3C 8009953C 02000586 */  lh         $a1, 0x2($s0)
/* 89D40 80099540 04000686 */  lh         $a2, 0x4($s0)
/* 89D44 80099544 23204400 */  subu       $a0, $v0, $a0
/* 89D48 80099548 04002286 */  lh         $v0, 0x4($s1)
/* 89D4C 8009954C 23286500 */  subu       $a1, $v1, $a1
/* 89D50 80099550 B7E6000C */  jal        MATH3D_LengthXYZ
/* 89D54 80099554 23304600 */   subu      $a2, $v0, $a2
/* 89D58 80099558 21184000 */  addu       $v1, $v0, $zero
.L8009955C:
/* 89D5C 8009955C 2A107400 */  slt        $v0, $v1, $s4
/* 89D60 80099560 03004010 */  beqz       $v0, .L80099570
/* 89D64 80099564 00000000 */   nop
/* 89D68 80099568 21A06000 */  addu       $s4, $v1, $zero
/* 89D6C 8009956C 21980002 */  addu       $s3, $s0, $zero
.L80099570:
/* 89D70 80099570 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 89D74 80099574 00000000 */  nop
/* 89D78 80099578 01004290 */  lbu        $v0, 0x1($v0)
/* 89D7C 8009957C 01005226 */  addiu      $s2, $s2, 0x1
/* 89D80 80099580 2A104202 */  slt        $v0, $s2, $v0
/* 89D84 80099584 DEFF4014 */  bnez       $v0, .L80099500
/* 89D88 80099588 1C001026 */   addiu     $s0, $s0, 0x1C
.L8009958C:
/* 89D8C 8009958C 21106002 */  addu       $v0, $s3, $zero
/* 89D90 80099590 2800BF8F */  lw         $ra, 0x28($sp)
/* 89D94 80099594 2400B58F */  lw         $s5, 0x24($sp)
/* 89D98 80099598 2000B48F */  lw         $s4, 0x20($sp)
/* 89D9C 8009959C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 89DA0 800995A0 1800B28F */  lw         $s2, 0x18($sp)
/* 89DA4 800995A4 1400B18F */  lw         $s1, 0x14($sp)
/* 89DA8 800995A8 1000B08F */  lw         $s0, 0x10($sp)
/* 89DAC 800995AC 0800E003 */  jr         $ra
/* 89DB0 800995B0 3000BD27 */   addiu     $sp, $sp, 0x30
.size PLANPOOL_GetClosestNode, . - PLANPOOL_GetClosestNode
