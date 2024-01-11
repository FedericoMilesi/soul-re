.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_GetInstanceRotation
/* A59F8 800B51F8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A59FC 800B51FC 1000B0AF */  sw         $s0, 0x10($sp)
/* A5A00 800B5200 21808000 */  addu       $s0, $a0, $zero
/* A5A04 800B5204 1400B1AF */  sw         $s1, 0x14($sp)
/* A5A08 800B5208 2188A000 */  addu       $s1, $a1, $zero
/* A5A0C 800B520C 1800BFAF */  sw         $ra, 0x18($sp)
/* A5A10 800B5210 92D1000C */  jal        INSTANCE_Query
/* A5A14 800B5214 07000524 */   addiu     $a1, $zero, 0x7
/* A5A18 800B5218 21184000 */  addu       $v1, $v0, $zero
/* A5A1C 800B521C 0A006014 */  bnez       $v1, .L800B5248
/* A5A20 800B5220 00000000 */   nop
/* A5A24 800B5224 74000296 */  lhu        $v0, 0x74($s0)
/* A5A28 800B5228 00000000 */  nop
/* A5A2C 800B522C 000022A6 */  sh         $v0, 0x0($s1)
/* A5A30 800B5230 76000296 */  lhu        $v0, 0x76($s0)
/* A5A34 800B5234 00000000 */  nop
/* A5A38 800B5238 020022A6 */  sh         $v0, 0x2($s1)
/* A5A3C 800B523C 78000296 */  lhu        $v0, 0x78($s0)
/* A5A40 800B5240 9BD40208 */  j          .L800B526C
/* A5A44 800B5244 040022A6 */   sh        $v0, 0x4($s1)
.L800B5248:
/* A5A48 800B5248 00006294 */  lhu        $v0, 0x0($v1)
/* A5A4C 800B524C 00000000 */  nop
/* A5A50 800B5250 000022A6 */  sh         $v0, 0x0($s1)
/* A5A54 800B5254 02006294 */  lhu        $v0, 0x2($v1)
/* A5A58 800B5258 00000000 */  nop
/* A5A5C 800B525C 020022A6 */  sh         $v0, 0x2($s1)
/* A5A60 800B5260 04006294 */  lhu        $v0, 0x4($v1)
/* A5A64 800B5264 00000000 */  nop
/* A5A68 800B5268 040022A6 */  sh         $v0, 0x4($s1)
.L800B526C:
/* A5A6C 800B526C 1800BF8F */  lw         $ra, 0x18($sp)
/* A5A70 800B5270 1400B18F */  lw         $s1, 0x14($sp)
/* A5A74 800B5274 1000B08F */  lw         $s0, 0x10($sp)
/* A5A78 800B5278 0800E003 */  jr         $ra
/* A5A7C 800B527C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SAVE_GetInstanceRotation, . - SAVE_GetInstanceRotation
