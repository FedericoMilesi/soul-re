.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C23C0
/* B2BC0 800C23C0 0D80033C */  lui        $v1, %hi(_padFixResult + 0x8)
/* B2BC4 800C23C4 64E9638C */  lw         $v1, %lo(_padFixResult + 0x8)($v1)
/* B2BC8 800C23C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B2BCC 800C23CC 1000BFAF */  sw         $ra, 0x10($sp)
/* B2BD0 800C23D0 0400628C */  lw         $v0, 0x4($v1)
/* B2BD4 800C23D4 00000000 */  nop
/* B2BD8 800C23D8 01004230 */  andi       $v0, $v0, 0x1
/* B2BDC 800C23DC 0E004010 */  beqz       $v0, .L800C2418
/* B2BE0 800C23E0 21100000 */   addu      $v0, $zero, $zero
/* B2BE4 800C23E4 0000628C */  lw         $v0, 0x0($v1)
/* B2BE8 800C23E8 00000000 */  nop
/* B2BEC 800C23EC 01004230 */  andi       $v0, $v0, 0x1
/* B2BF0 800C23F0 09004010 */  beqz       $v0, .L800C2418
/* B2BF4 800C23F4 21100000 */   addu      $v0, $zero, $zero
/* B2BF8 800C23F8 0D80023C */  lui        $v0, %hi(_padFuncIntGun)
/* B2BFC 800C23FC 2CE9428C */  lw         $v0, %lo(_padFuncIntGun)($v0)
/* B2C00 800C2400 00000000 */  nop
/* B2C04 800C2404 03004010 */  beqz       $v0, .L800C2414
/* B2C08 800C2408 00000000 */   nop
/* B2C0C 800C240C 09F84000 */  jalr       $v0
/* B2C10 800C2410 00000000 */   nop
.L800C2414:
/* B2C14 800C2414 01000224 */  addiu      $v0, $zero, 0x1
.L800C2418:
/* B2C18 800C2418 1000BF8F */  lw         $ra, 0x10($sp)
/* B2C1C 800C241C 1800BD27 */  addiu      $sp, $sp, 0x18
/* B2C20 800C2420 0800E003 */  jr         $ra
/* B2C24 800C2424 00000000 */   nop
.size func_800C23C0, . - func_800C23C0
