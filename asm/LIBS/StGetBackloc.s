.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StGetBackloc
/* B25D0 800C1DD0 0E80023C */  lui        $v0, %hi(StMode)
/* B25D4 800C1DD4 B8FD428C */  lw         $v0, %lo(StMode)($v0)
/* B25D8 800C1DD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B25DC 800C1DDC 1000B0AF */  sw         $s0, 0x10($sp)
/* B25E0 800C1DE0 21808000 */  addu       $s0, $a0, $zero
/* B25E4 800C1DE4 0B004014 */  bnez       $v0, .L800C1E14
/* B25E8 800C1DE8 1400BFAF */   sw        $ra, 0x14($sp)
/* B25EC 800C1DEC 0E80043C */  lui        $a0, %hi(StStartFrame + 0x4)
/* B25F0 800C1DF0 56FC020C */  jal        CdPosToInt
/* B25F4 800C1DF4 48FD8424 */   addiu     $a0, $a0, %lo(StStartFrame + 0x4)
/* B25F8 800C1DF8 01004424 */  addiu      $a0, $v0, 0x1
/* B25FC 800C1DFC 15FC020C */  jal        CdIntToPos
/* B2600 800C1E00 21280002 */   addu      $a1, $s0, $zero
/* B2604 800C1E04 0E80023C */  lui        $v0, %hi(StStartFrame + 0x8)
/* B2608 800C1E08 4CFD428C */  lw         $v0, %lo(StStartFrame + 0x8)($v0)
/* B260C 800C1E0C 86070308 */  j          .L800C1E18
/* B2610 800C1E10 00000000 */   nop
.L800C1E14:
/* B2614 800C1E14 FFFF0224 */  addiu      $v0, $zero, -0x1
.L800C1E18:
/* B2618 800C1E18 1400BF8F */  lw         $ra, 0x14($sp)
/* B261C 800C1E1C 1000B08F */  lw         $s0, 0x10($sp)
/* B2620 800C1E20 0800E003 */  jr         $ra
/* B2624 800C1E24 1800BD27 */   addiu     $sp, $sp, 0x18
/* B2628 800C1E28 00000000 */  nop
/* B262C 800C1E2C 00000000 */  nop
/* B2630 800C1E30 00000000 */  nop
.size StGetBackloc, . - StGetBackloc
