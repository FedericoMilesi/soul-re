.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceSwitchAnimationAlpha
/* 62814 80072014 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 62818 80072018 3800A28F */  lw         $v0, 0x38($sp)
/* 6281C 8007201C 3C00A38F */  lw         $v1, 0x3C($sp)
/* 62820 80072020 1800B0AF */  sw         $s0, 0x18($sp)
/* 62824 80072024 4000B08F */  lw         $s0, 0x40($sp)
/* 62828 80072028 2000BFAF */  sw         $ra, 0x20($sp)
/* 6282C 8007202C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 62830 80072030 1400A3AF */  sw         $v1, 0x14($sp)
/* 62834 80072034 FF00A330 */  andi       $v1, $a1, 0xFF
/* 62838 80072038 1000A2AF */  sw         $v0, 0x10($sp)
/* 6283C 8007203C 40100300 */  sll        $v0, $v1, 1
/* 62840 80072040 21104300 */  addu       $v0, $v0, $v1
/* 62844 80072044 00110200 */  sll        $v0, $v0, 4
/* 62848 80072048 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 6284C 8007204C C8C7010C */  jal        G2EmulationInstanceSwitchAnimation
/* 62850 80072050 21888200 */   addu      $s1, $a0, $v0
/* 62854 80072054 80801000 */  sll        $s0, $s0, 2
/* 62858 80072058 B8A48227 */  addiu      $v0, $gp, %gp_rel(G2AlphaTables)
/* 6285C 8007205C 21800202 */  addu       $s0, $s0, $v0
/* 62860 80072060 0000058E */  lw         $a1, 0x0($s0)
/* 62864 80072064 4240020C */  jal        G2AnimSection_SetAlphaTable
/* 62868 80072068 21202002 */   addu      $a0, $s1, $zero
/* 6286C 8007206C 2000BF8F */  lw         $ra, 0x20($sp)
/* 62870 80072070 1C00B18F */  lw         $s1, 0x1C($sp)
/* 62874 80072074 1800B08F */  lw         $s0, 0x18($sp)
/* 62878 80072078 0800E003 */  jr         $ra
/* 6287C 8007207C 2800BD27 */   addiu     $sp, $sp, 0x28
.size G2EmulationInstanceSwitchAnimationAlpha, . - G2EmulationInstanceSwitchAnimationAlpha
