.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Spiral_Init
/* 3E920 8004E120 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3E924 8004E124 0100023C */  lui        $v0, (0x186A0 >> 16)
/* 3E928 8004E128 A0864234 */  ori        $v0, $v0, (0x186A0 & 0xFFFF)
/* 3E92C 8004E12C CC9A82AF */  sw         $v0, %gp_rel(Spiral_Max)($gp)
/* 3E930 8004E130 C89A82AF */  sw         $v0, %gp_rel(Spiral_Current)($gp)
/* 3E934 8004E134 01000224 */  addiu      $v0, $zero, 0x1
/* 3E938 8004E138 C49A82A7 */  sh         $v0, %gp_rel(Spiral_Number)($gp)
/* 3E93C 8004E13C 80000224 */  addiu      $v0, $zero, 0x80
/* 3E940 8004E140 1000BFAF */  sw         $ra, 0x10($sp)
/* 3E944 8004E144 C69A82A7 */  sh         $v0, %gp_rel(Spiral_Degrees)($gp)
/* 3E948 8004E148 2F36010C */  jal        FX_CalcSpiral
/* 3E94C 8004E14C 80000424 */   addiu     $a0, $zero, 0x80
/* 3E950 8004E150 1000BF8F */  lw         $ra, 0x10($sp)
/* 3E954 8004E154 00000000 */  nop
/* 3E958 8004E158 0800E003 */  jr         $ra
/* 3E95C 8004E15C 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_Spiral_Init, . - FX_Spiral_Init
