.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BDD80
/* AE580 800BDD80 0D80023C */  lui        $v0, %hi(_padFuncPort2Info)
/* AE584 800BDD84 18E9428C */  lw         $v0, %lo(_padFuncPort2Info)($v0)
/* AE588 800BDD88 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AE58C 800BDD8C 1000B0AF */  sw         $s0, 0x10($sp)
/* AE590 800BDD90 1400BFAF */  sw         $ra, 0x14($sp)
/* AE594 800BDD94 09F84000 */  jalr       $v0
/* AE598 800BDD98 2180A000 */   addu      $s0, $a1, $zero
/* AE59C 800BDD9C 21204000 */  addu       $a0, $v0, $zero
/* AE5A0 800BDDA0 750F030C */  jal        func_800C3DD4
/* AE5A4 800BDDA4 21280002 */   addu      $a1, $s0, $zero
/* AE5A8 800BDDA8 1400BF8F */  lw         $ra, 0x14($sp)
/* AE5AC 800BDDAC 1000B08F */  lw         $s0, 0x10($sp)
/* AE5B0 800BDDB0 0800E003 */  jr         $ra
/* AE5B4 800BDDB4 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800BDD80, . - func_800BDD80
