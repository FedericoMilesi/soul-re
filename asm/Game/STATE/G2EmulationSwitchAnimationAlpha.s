.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationSwitchAnimationAlpha
/* 628C4 800720C4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 628C8 800720C8 3800A28F */  lw         $v0, 0x38($sp)
/* 628CC 800720CC 3C00A38F */  lw         $v1, 0x3C($sp)
/* 628D0 800720D0 1800B0AF */  sw         $s0, 0x18($sp)
/* 628D4 800720D4 4000B08F */  lw         $s0, 0x40($sp)
/* 628D8 800720D8 2000BFAF */  sw         $ra, 0x20($sp)
/* 628DC 800720DC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 628E0 800720E0 0000918C */  lw         $s1, 0x0($a0)
/* 628E4 800720E4 1400A3AF */  sw         $v1, 0x14($sp)
/* 628E8 800720E8 FF00A330 */  andi       $v1, $a1, 0xFF
/* 628EC 800720EC 1000A2AF */  sw         $v0, 0x10($sp)
/* 628F0 800720F0 40100300 */  sll        $v0, $v1, 1
/* 628F4 800720F4 21104300 */  addu       $v0, $v0, $v1
/* 628F8 800720F8 00110200 */  sll        $v0, $v0, 4
/* 628FC 800720FC EC014224 */  addiu      $v0, $v0, 0x1EC
/* 62900 80072100 0000848C */  lw         $a0, 0x0($a0)
/* 62904 80072104 C8C7010C */  jal        G2EmulationInstanceSwitchAnimation
/* 62908 80072108 21882202 */   addu      $s1, $s1, $v0
/* 6290C 8007210C 80801000 */  sll        $s0, $s0, 2
/* 62910 80072110 B8A48227 */  addiu      $v0, $gp, %gp_rel(G2AlphaTables)
/* 62914 80072114 21800202 */  addu       $s0, $s0, $v0
/* 62918 80072118 0000058E */  lw         $a1, 0x0($s0)
/* 6291C 8007211C 4240020C */  jal        G2AnimSection_SetAlphaTable
/* 62920 80072120 21202002 */   addu      $a0, $s1, $zero
/* 62924 80072124 2000BF8F */  lw         $ra, 0x20($sp)
/* 62928 80072128 1C00B18F */  lw         $s1, 0x1C($sp)
/* 6292C 8007212C 1800B08F */  lw         $s0, 0x18($sp)
/* 62930 80072130 0800E003 */  jr         $ra
/* 62934 80072134 2800BD27 */   addiu     $sp, $sp, 0x28
.size G2EmulationSwitchAnimationAlpha, . - G2EmulationSwitchAnimationAlpha
