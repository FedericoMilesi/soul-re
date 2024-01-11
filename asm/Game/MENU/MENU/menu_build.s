.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_build
/* A8170 800B7970 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8174 800B7974 1400BFAF */  sw         $ra, 0x14($sp)
/* A8178 800B7978 1000B0AF */  sw         $s0, 0x10($sp)
/* A817C 800B797C 0000838C */  lw         $v1, 0x0($a0)
/* A8180 800B7980 040080AC */  sw         $zero, 0x4($a0)
/* A8184 800B7984 080080AC */  sw         $zero, 0x8($a0)
/* A8188 800B7988 C0100300 */  sll        $v0, $v1, 3
/* A818C 800B798C 21104300 */  addu       $v0, $v0, $v1
/* A8190 800B7990 80100200 */  sll        $v0, $v0, 2
/* A8194 800B7994 0C004224 */  addiu      $v0, $v0, 0xC
/* A8198 800B7998 21108200 */  addu       $v0, $a0, $v0
/* A819C 800B799C DCFF5024 */  addiu      $s0, $v0, -0x24
/* A81A0 800B79A0 DCFF428C */  lw         $v0, -0x24($v0)
/* A81A4 800B79A4 8403848C */  lw         $a0, 0x384($a0)
/* A81A8 800B79A8 0400058E */  lw         $a1, 0x4($s0)
/* A81AC 800B79AC 09F84000 */  jalr       $v0
/* A81B0 800B79B0 00000000 */   nop
/* A81B4 800B79B4 040002AE */  sw         $v0, 0x4($s0)
/* A81B8 800B79B8 1400BF8F */  lw         $ra, 0x14($sp)
/* A81BC 800B79BC 1000B08F */  lw         $s0, 0x10($sp)
/* A81C0 800B79C0 0800E003 */  jr         $ra
/* A81C4 800B79C4 1800BD27 */   addiu     $sp, $sp, 0x18
.size menu_build, . - menu_build
