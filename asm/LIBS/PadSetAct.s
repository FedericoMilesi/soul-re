.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PadSetAct
/* AE5B8 800BDDB8 0D80023C */  lui        $v0, %hi(_padFuncPort2Info)
/* AE5BC 800BDDBC 18E9428C */  lw         $v0, %lo(_padFuncPort2Info)($v0)
/* AE5C0 800BDDC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AE5C4 800BDDC4 1000B0AF */  sw         $s0, 0x10($sp)
/* AE5C8 800BDDC8 2180A000 */  addu       $s0, $a1, $zero
/* AE5CC 800BDDCC 1400B1AF */  sw         $s1, 0x14($sp)
/* AE5D0 800BDDD0 1800BFAF */  sw         $ra, 0x18($sp)
/* AE5D4 800BDDD4 09F84000 */  jalr       $v0
/* AE5D8 800BDDD8 2188C000 */   addu      $s1, $a2, $zero
/* AE5DC 800BDDDC 21204000 */  addu       $a0, $v0, $zero
/* AE5E0 800BDDE0 21280002 */  addu       $a1, $s0, $zero
/* AE5E4 800BDDE4 4A0D030C */  jal        _padSetAct
/* AE5E8 800BDDE8 21302002 */   addu      $a2, $s1, $zero
/* AE5EC 800BDDEC 1800BF8F */  lw         $ra, 0x18($sp)
/* AE5F0 800BDDF0 1400B18F */  lw         $s1, 0x14($sp)
/* AE5F4 800BDDF4 1000B08F */  lw         $s0, 0x10($sp)
/* AE5F8 800BDDF8 0800E003 */  jr         $ra
/* AE5FC 800BDDFC 2000BD27 */   addiu     $sp, $sp, 0x20
/* AE600 800BDE00 00000000 */  nop
/* AE604 800BDE04 00000000 */  nop
/* AE608 800BDE08 00000000 */  nop
.size PadSetAct, . - PadSetAct
