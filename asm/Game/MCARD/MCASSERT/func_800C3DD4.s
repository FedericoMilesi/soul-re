.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3DD4
/* B45D4 800C3DD4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B45D8 800C3DD8 1000B0AF */  sw         $s0, 0x10($sp)
/* B45DC 800C3DDC 21808000 */  addu       $s0, $a0, $zero
/* B45E0 800C3DE0 1400B1AF */  sw         $s1, 0x14($sp)
/* B45E4 800C3DE4 0D80023C */  lui        $v0, %hi(_padFuncChkEng)
/* B45E8 800C3DE8 20E9428C */  lw         $v0, %lo(_padFuncChkEng)($v0)
/* B45EC 800C3DEC 1800BFAF */  sw         $ra, 0x18($sp)
/* B45F0 800C3DF0 09F84000 */  jalr       $v0
/* B45F4 800C3DF4 2188A000 */   addu      $s1, $a1, $zero
/* B45F8 800C3DF8 0B004014 */  bnez       $v0, .L800C3E28
/* B45FC 800C3DFC 21100000 */   addu      $v0, $zero, $zero
/* B4600 800C3E00 01000224 */  addiu      $v0, $zero, 0x1
/* B4604 800C3E04 01000324 */  addiu      $v1, $zero, 0x1
/* B4608 800C3E08 460003A2 */  sb         $v1, 0x46($s0)
/* B460C 800C3E0C 0C80033C */  lui        $v1, %hi(func_800C3E3C)
/* B4610 800C3E10 3C3E6324 */  addiu      $v1, $v1, %lo(func_800C3E3C)
/* B4614 800C3E14 140003AE */  sw         $v1, 0x14($s0)
/* B4618 800C3E18 0C80033C */  lui        $v1, %hi(func_800C3E58)
/* B461C 800C3E1C 583E6324 */  addiu      $v1, $v1, %lo(func_800C3E58)
/* B4620 800C3E20 200011AE */  sw         $s1, 0x20($s0)
/* B4624 800C3E24 180003AE */  sw         $v1, 0x18($s0)
.L800C3E28:
/* B4628 800C3E28 1800BF8F */  lw         $ra, 0x18($sp)
/* B462C 800C3E2C 1400B18F */  lw         $s1, 0x14($sp)
/* B4630 800C3E30 1000B08F */  lw         $s0, 0x10($sp)
/* B4634 800C3E34 0800E003 */  jr         $ra
/* B4638 800C3E38 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800C3DD4, . - func_800C3DD4
