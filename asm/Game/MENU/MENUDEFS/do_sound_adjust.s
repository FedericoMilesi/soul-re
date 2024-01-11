.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel do_sound_adjust
/* A9174 800B8974 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A9178 800B8978 1000B0AF */  sw         $s0, 0x10($sp)
/* A917C 800B897C 2180A000 */  addu       $s0, $a1, $zero
/* A9180 800B8980 1400B1AF */  sw         $s1, 0x14($sp)
/* A9184 800B8984 1800BFAF */  sw         $ra, 0x18($sp)
/* A9188 800B8988 1FE2020C */  jal        get_volume
/* A918C 800B898C 2188C000 */   addu      $s1, $a2, $zero
/* A9190 800B8990 21284000 */  addu       $a1, $v0, $zero
/* A9194 800B8994 03000224 */  addiu      $v0, $zero, 0x3
/* A9198 800B8998 05002212 */  beq        $s1, $v0, .L800B89B0
/* A919C 800B899C 04000224 */   addiu     $v0, $zero, 0x4
/* A91A0 800B89A0 07002212 */  beq        $s1, $v0, .L800B89C0
/* A91A4 800B89A4 21100000 */   addu      $v0, $zero, $zero
/* A91A8 800B89A8 77E20208 */  j          .L800B89DC
/* A91AC 800B89AC 00000000 */   nop
.L800B89B0:
/* A91B0 800B89B0 0900A018 */  blez       $a1, .L800B89D8
/* A91B4 800B89B4 21200002 */   addu      $a0, $s0, $zero
/* A91B8 800B89B8 74E20208 */  j          .L800B89D0
/* A91BC 800B89BC FFFFA524 */   addiu     $a1, $a1, -0x1
.L800B89C0:
/* A91C0 800B89C0 0A00A228 */  slti       $v0, $a1, 0xA
/* A91C4 800B89C4 04004010 */  beqz       $v0, .L800B89D8
/* A91C8 800B89C8 21200002 */   addu      $a0, $s0, $zero
/* A91CC 800B89CC 0100A524 */  addiu      $a1, $a1, 0x1
.L800B89D0:
/* A91D0 800B89D0 3AE2020C */  jal        set_volume
/* A91D4 800B89D4 00000000 */   nop
.L800B89D8:
/* A91D8 800B89D8 01000224 */  addiu      $v0, $zero, 0x1
.L800B89DC:
/* A91DC 800B89DC 1800BF8F */  lw         $ra, 0x18($sp)
/* A91E0 800B89E0 1400B18F */  lw         $s1, 0x14($sp)
/* A91E4 800B89E4 1000B08F */  lw         $s0, 0x10($sp)
/* A91E8 800B89E8 0800E003 */  jr         $ra
/* A91EC 800B89EC 2000BD27 */   addiu     $sp, $sp, 0x20
.size do_sound_adjust, . - do_sound_adjust
