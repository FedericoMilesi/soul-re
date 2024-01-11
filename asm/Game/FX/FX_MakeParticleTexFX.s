.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_MakeParticleTexFX
/* 3AE34 8004A634 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 3AE38 8004A638 3400B3AF */  sw         $s3, 0x34($sp)
/* 3AE3C 8004A63C 5C00B38F */  lw         $s3, 0x5C($sp)
/* 3AE40 8004A640 3000B2AF */  sw         $s2, 0x30($sp)
/* 3AE44 8004A644 6400B28F */  lw         $s2, 0x64($sp)
/* 3AE48 8004A648 2800B0AF */  sw         $s0, 0x28($sp)
/* 3AE4C 8004A64C 21808000 */  addu       $s0, $a0, $zero
/* 3AE50 8004A650 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 3AE54 8004A654 2188C000 */  addu       $s1, $a2, $zero
/* 3AE58 8004A658 3800B4AF */  sw         $s4, 0x38($sp)
/* 3AE5C 8004A65C 21A0E000 */  addu       $s4, $a3, $zero
/* 3AE60 8004A660 06002016 */  bnez       $s1, .L8004A67C
/* 3AE64 8004A664 3C00BFAF */   sw        $ra, 0x3C($sp)
/* 3AE68 8004A668 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 3AE6C 8004A66C 90A2518C */  lw         $s1, %lo(objectAccess + 0x54)($v0)
/* 3AE70 8004A670 00000000 */  nop
/* 3AE74 8004A674 29002012 */  beqz       $s1, .L8004A71C
/* 3AE78 8004A678 00000000 */   nop
.L8004A67C:
/* 3AE7C 8004A67C 27000012 */  beqz       $s0, .L8004A71C
/* 3AE80 8004A680 21200002 */   addu      $a0, $s0, $zero
/* 3AE84 8004A684 6000A68F */  lw         $a2, 0x60($sp)
/* 3AE88 8004A688 5400A28F */  lw         $v0, 0x54($sp)
/* 3AE8C 8004A68C 44BA838F */  lw         $v1, %gp_rel(gFXT)($gp)
/* 3AE90 8004A690 1000B3AF */  sw         $s3, 0x10($sp)
/* 3AE94 8004A694 00340600 */  sll        $a2, $a2, 16
/* 3AE98 8004A698 03340600 */  sra        $a2, $a2, 16
/* 3AE9C 8004A69C 1400A2AF */  sw         $v0, 0x14($sp)
/* 3AEA0 8004A6A0 5800A28F */  lw         $v0, 0x58($sp)
/* 3AEA4 8004A6A4 2138C000 */  addu       $a3, $a2, $zero
/* 3AEA8 8004A6A8 1C00A3AF */  sw         $v1, 0x1C($sp)
/* 3AEAC 8004A6AC 1800A2AF */  sw         $v0, 0x18($sp)
/* 3AEB0 8004A6B0 00141200 */  sll        $v0, $s2, 16
/* 3AEB4 8004A6B4 03140200 */  sra        $v0, $v0, 16
/* 3AEB8 8004A6B8 5C22010C */  jal        FX_DFacadeParticleSetup
/* 3AEBC 8004A6BC 2000A2AF */   sw        $v0, 0x20($sp)
/* 3AEC0 8004A6C0 21202002 */  addu       $a0, $s1, $zero
/* 3AEC4 8004A6C4 5000A68F */  lw         $a2, 0x50($sp)
/* 3AEC8 8004A6C8 9D19010C */  jal        FX_GetTextureObject
/* 3AECC 8004A6CC 21288002 */   addu      $a1, $s4, $zero
/* 3AED0 8004A6D0 00100424 */  addiu      $a0, $zero, 0x1000
/* 3AED4 8004A6D4 1A009200 */  div        $zero, $a0, $s2
/* 3AED8 8004A6D8 12200000 */  mflo       $a0
/* 3AEDC 8004A6DC 0C00053C */  lui        $a1, (0xC0001 >> 16)
/* 3AEE0 8004A6E0 0100A534 */  ori        $a1, $a1, (0xC0001 & 0xFFFF)
/* 3AEE4 8004A6E4 080002AE */  sw         $v0, 0x8($s0)
/* 3AEE8 8004A6E8 002E023C */  lui        $v0, (0x2E000000 >> 16)
/* 3AEEC 8004A6EC 0C00038E */  lw         $v1, 0xC($s0)
/* 3AEF0 8004A6F0 25106202 */  or         $v0, $s3, $v0
/* 3AEF4 8004A6F4 3A0000A6 */  sh         $zero, 0x3A($s0)
/* 3AEF8 8004A6F8 380000A6 */  sh         $zero, 0x38($s0)
/* 3AEFC 8004A6FC 360000A6 */  sh         $zero, 0x36($s0)
/* 3AF00 8004A700 340000A6 */  sh         $zero, 0x34($s0)
/* 3AF04 8004A704 1C0002AE */  sw         $v0, 0x1C($s0)
/* 3AF08 8004A708 200013AE */  sw         $s3, 0x20($s0)
/* 3AF0C 8004A70C 240000AE */  sw         $zero, 0x24($s0)
/* 3AF10 8004A710 25186500 */  or         $v1, $v1, $a1
/* 3AF14 8004A714 0C0003AE */  sw         $v1, 0xC($s0)
/* 3AF18 8004A718 320004A6 */  sh         $a0, 0x32($s0)
.L8004A71C:
/* 3AF1C 8004A71C 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 3AF20 8004A720 3800B48F */  lw         $s4, 0x38($sp)
/* 3AF24 8004A724 3400B38F */  lw         $s3, 0x34($sp)
/* 3AF28 8004A728 3000B28F */  lw         $s2, 0x30($sp)
/* 3AF2C 8004A72C 2C00B18F */  lw         $s1, 0x2C($sp)
/* 3AF30 8004A730 2800B08F */  lw         $s0, 0x28($sp)
/* 3AF34 8004A734 0800E003 */  jr         $ra
/* 3AF38 8004A738 4000BD27 */   addiu     $sp, $sp, 0x40
.size FX_MakeParticleTexFX, . - FX_MakeParticleTexFX
