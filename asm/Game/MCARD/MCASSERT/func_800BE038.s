.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE038
/* AE838 800BE038 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AE83C 800BE03C 1000B0AF */  sw         $s0, 0x10($sp)
/* AE840 800BE040 21808000 */  addu       $s0, $a0, $zero
/* AE844 800BE044 02000224 */  addiu      $v0, $zero, 0x2
/* AE848 800BE048 05000216 */  bne        $s0, $v0, .L800BE060
/* AE84C 800BE04C 1400BFAF */   sw        $ra, 0x14($sp)
/* AE850 800BE050 1214030C */  jal        func_800C5048
/* AE854 800BE054 00000000 */   nop
/* AE858 800BE058 25F80208 */  j          .L800BE094
/* AE85C 800BE05C 01000224 */   addiu     $v0, $zero, 0x1
.L800BE060:
/* AE860 800BE060 2514030C */  jal        func_800C5094
/* AE864 800BE064 00000000 */   nop
/* AE868 800BE068 0A004014 */  bnez       $v0, .L800BE094
/* AE86C 800BE06C 21100000 */   addu      $v0, $zero, $zero
/* AE870 800BE070 01000224 */  addiu      $v0, $zero, 0x1
/* AE874 800BE074 07000216 */  bne        $s0, $v0, .L800BE094
/* AE878 800BE078 00000000 */   nop
/* AE87C 800BE07C D613030C */  jal        func_800C4F58
/* AE880 800BE080 00000000 */   nop
/* AE884 800BE084 21184000 */  addu       $v1, $v0, $zero
/* AE888 800BE088 02006014 */  bnez       $v1, .L800BE094
/* AE88C 800BE08C 21100000 */   addu      $v0, $zero, $zero
/* AE890 800BE090 01000224 */  addiu      $v0, $zero, 0x1
.L800BE094:
/* AE894 800BE094 1400BF8F */  lw         $ra, 0x14($sp)
/* AE898 800BE098 1000B08F */  lw         $s0, 0x10($sp)
/* AE89C 800BE09C 0800E003 */  jr         $ra
/* AE8A0 800BE0A0 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800BE038, . - func_800BE038
