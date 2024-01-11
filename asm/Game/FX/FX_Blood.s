.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Blood
/* 393C4 80048BC4 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 393C8 80048BC8 3400B3AF */  sw         $s3, 0x34($sp)
/* 393CC 80048BCC 5800B38F */  lw         $s3, 0x58($sp)
/* 393D0 80048BD0 3000B2AF */  sw         $s2, 0x30($sp)
/* 393D4 80048BD4 5C00B28F */  lw         $s2, 0x5C($sp)
/* 393D8 80048BD8 3800B4AF */  sw         $s4, 0x38($sp)
/* 393DC 80048BDC 21A08000 */  addu       $s4, $a0, $zero
/* 393E0 80048BE0 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 393E4 80048BE4 2188A000 */  addu       $s1, $a1, $zero
/* 393E8 80048BE8 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 393EC 80048BEC 21A8C000 */  addu       $s5, $a2, $zero
/* 393F0 80048BF0 2800B0AF */  sw         $s0, 0x28($sp)
/* 393F4 80048BF4 2180E000 */  addu       $s0, $a3, $zero
/* 393F8 80048BF8 38000012 */  beqz       $s0, .L80048CDC
/* 393FC 80048BFC 4000BFAF */   sw        $ra, 0x40($sp)
.L80048C00:
/* 39400 80048C00 3AF2020C */  jal        rand
/* 39404 80048C04 00000000 */   nop
/* 39408 80048C08 00002386 */  lh         $v1, 0x0($s1)
/* 3940C 80048C0C 00000000 */  nop
/* 39410 80048C10 18007000 */  mult       $v1, $s0
/* 39414 80048C14 12180000 */  mflo       $v1
/* 39418 80048C18 02006104 */  bgez       $v1, .L80048C24
/* 3941C 80048C1C 21204000 */   addu      $a0, $v0, $zero
/* 39420 80048C20 7F006324 */  addiu      $v1, $v1, 0x7F
.L80048C24:
/* 39424 80048C24 C3110300 */  sra        $v0, $v1, 7
/* 39428 80048C28 07008330 */  andi       $v1, $a0, 0x7
/* 3942C 80048C2C 21104300 */  addu       $v0, $v0, $v1
/* 39430 80048C30 FCFF4224 */  addiu      $v0, $v0, -0x4
/* 39434 80048C34 3AF2020C */  jal        rand
/* 39438 80048C38 2000A2A7 */   sh        $v0, 0x20($sp)
/* 3943C 80048C3C 02002386 */  lh         $v1, 0x2($s1)
/* 39440 80048C40 00000000 */  nop
/* 39444 80048C44 18007000 */  mult       $v1, $s0
/* 39448 80048C48 12180000 */  mflo       $v1
/* 3944C 80048C4C 02006104 */  bgez       $v1, .L80048C58
/* 39450 80048C50 21204000 */   addu      $a0, $v0, $zero
/* 39454 80048C54 7F006324 */  addiu      $v1, $v1, 0x7F
.L80048C58:
/* 39458 80048C58 C3110300 */  sra        $v0, $v1, 7
/* 3945C 80048C5C 07008330 */  andi       $v1, $a0, 0x7
/* 39460 80048C60 21104300 */  addu       $v0, $v0, $v1
/* 39464 80048C64 FCFF4224 */  addiu      $v0, $v0, -0x4
/* 39468 80048C68 3AF2020C */  jal        rand
/* 3946C 80048C6C 2200A2A7 */   sh        $v0, 0x22($sp)
/* 39470 80048C70 04002386 */  lh         $v1, 0x4($s1)
/* 39474 80048C74 00000000 */  nop
/* 39478 80048C78 18007000 */  mult       $v1, $s0
/* 3947C 80048C7C 12180000 */  mflo       $v1
/* 39480 80048C80 02006104 */  bgez       $v1, .L80048C8C
/* 39484 80048C84 21204000 */   addu      $a0, $v0, $zero
/* 39488 80048C88 7F006324 */  addiu      $v1, $v1, 0x7F
.L80048C8C:
/* 3948C 80048C8C C3110300 */  sra        $v0, $v1, 7
/* 39490 80048C90 07008330 */  andi       $v1, $a0, 0x7
/* 39494 80048C94 21104300 */  addu       $v0, $v0, $v1
/* 39498 80048C98 FCFF4224 */  addiu      $v0, $v0, -0x4
/* 3949C 80048C9C 2400A2A7 */  sh         $v0, 0x24($sp)
/* 394A0 80048CA0 40101200 */  sll        $v0, $s2, 1
/* 394A4 80048CA4 1400A2AF */  sw         $v0, 0x14($sp)
/* 394A8 80048CA8 10000224 */  addiu      $v0, $zero, 0x10
/* 394AC 80048CAC 1800A2AF */  sw         $v0, 0x18($sp)
/* 394B0 80048CB0 01000224 */  addiu      $v0, $zero, 0x1
/* 394B4 80048CB4 21208002 */  addu       $a0, $s4, $zero
/* 394B8 80048CB8 2000A527 */  addiu      $a1, $sp, 0x20
/* 394BC 80048CBC 2130A002 */  addu       $a2, $s5, $zero
/* 394C0 80048CC0 21380000 */  addu       $a3, $zero, $zero
/* 394C4 80048CC4 1000B3AF */  sw         $s3, 0x10($sp)
/* 394C8 80048CC8 9622010C */  jal        FX_Dot
/* 394CC 80048CCC 1C00A2AF */   sw        $v0, 0x1C($sp)
/* 394D0 80048CD0 FFFF1026 */  addiu      $s0, $s0, -0x1
/* 394D4 80048CD4 CAFF0016 */  bnez       $s0, .L80048C00
/* 394D8 80048CD8 00000000 */   nop
.L80048CDC:
/* 394DC 80048CDC 4000BF8F */  lw         $ra, 0x40($sp)
/* 394E0 80048CE0 3C00B58F */  lw         $s5, 0x3C($sp)
/* 394E4 80048CE4 3800B48F */  lw         $s4, 0x38($sp)
/* 394E8 80048CE8 3400B38F */  lw         $s3, 0x34($sp)
/* 394EC 80048CEC 3000B28F */  lw         $s2, 0x30($sp)
/* 394F0 80048CF0 2C00B18F */  lw         $s1, 0x2C($sp)
/* 394F4 80048CF4 2800B08F */  lw         $s0, 0x28($sp)
/* 394F8 80048CF8 0800E003 */  jr         $ra
/* 394FC 80048CFC 4800BD27 */   addiu     $sp, $sp, 0x48
.size FX_Blood, . - FX_Blood
