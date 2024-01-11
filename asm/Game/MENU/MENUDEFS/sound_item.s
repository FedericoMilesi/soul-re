.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sound_item
/* A91F0 800B89F0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A91F4 800B89F4 1800B0AF */  sw         $s0, 0x18($sp)
/* A91F8 800B89F8 21808000 */  addu       $s0, $a0, $zero
/* A91FC 800B89FC 2000B2AF */  sw         $s2, 0x20($sp)
/* A9200 800B8A00 2190A000 */  addu       $s2, $a1, $zero
/* A9204 800B8A04 1C00B1AF */  sw         $s1, 0x1C($sp)
/* A9208 800B8A08 2188C000 */  addu       $s1, $a2, $zero
/* A920C 800B8A0C 2400BFAF */  sw         $ra, 0x24($sp)
/* A9210 800B8A10 1FE2020C */  jal        get_volume
/* A9214 800B8A14 21282002 */   addu      $a1, $s1, $zero
/* A9218 800B8A18 0C80053C */  lui        $a1, %hi(do_sound_adjust)
/* A921C 800B8A1C 7489A524 */  addiu      $a1, $a1, %lo(do_sound_adjust)
/* A9220 800B8A20 0D80073C */  lui        $a3, %hi(hack_attract_movie + 0x4)
/* A9224 800B8A24 21302002 */  addu       $a2, $s1, $zero
/* A9228 800B8A28 1000B2AF */  sw         $s2, 0x10($sp)
/* A922C 800B8A2C 1400A2AF */  sw         $v0, 0x14($sp)
/* A9230 800B8A30 2000048E */  lw         $a0, 0x20($s0)
/* A9234 800B8A34 33DE020C */  jal        menu_item
/* A9238 800B8A38 C01FE724 */   addiu     $a3, $a3, %lo(hack_attract_movie + 0x4)
/* A923C 800B8A3C 2400BF8F */  lw         $ra, 0x24($sp)
/* A9240 800B8A40 2000B28F */  lw         $s2, 0x20($sp)
/* A9244 800B8A44 1C00B18F */  lw         $s1, 0x1C($sp)
/* A9248 800B8A48 1800B08F */  lw         $s0, 0x18($sp)
/* A924C 800B8A4C 0800E003 */  jr         $ra
/* A9250 800B8A50 2800BD27 */   addiu     $sp, $sp, 0x28
.size sound_item, . - sound_item
