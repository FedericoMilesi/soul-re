.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CdInit
/* AED84 800BE584 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AED88 800BE588 1000B0AF */  sw         $s0, 0x10($sp)
/* AED8C 800BE58C 04001024 */  addiu      $s0, $zero, 0x4
/* AED90 800BE590 1400BFAF */  sw         $ra, 0x14($sp)
.L800BE594:
/* AED94 800BE594 85F9020C */  jal        func_800BE614
/* AED98 800BE598 00000000 */   nop
/* AED9C 800BE59C 01000324 */  addiu      $v1, $zero, 0x1
/* AEDA0 800BE5A0 10004314 */  bne        $v0, $v1, .L800BE5E4
/* AEDA4 800BE5A4 01000224 */   addiu     $v0, $zero, 0x1
/* AEDA8 800BE5A8 0C80033C */  lui        $v1, %hi(func_800BE650)
/* AEDAC 800BE5AC 50E66324 */  addiu      $v1, $v1, %lo(func_800BE650)
/* AEDB0 800BE5B0 0D80013C */  lui        $at, %hi(CD_cbsync)
/* AEDB4 800BE5B4 84E923AC */  sw         $v1, %lo(CD_cbsync)($at)
/* AEDB8 800BE5B8 0C80033C */  lui        $v1, %hi(func_800BE678)
/* AEDBC 800BE5BC 78E66324 */  addiu      $v1, $v1, %lo(func_800BE678)
/* AEDC0 800BE5C0 0D80013C */  lui        $at, %hi(CD_cbready)
/* AEDC4 800BE5C4 88E923AC */  sw         $v1, %lo(CD_cbready)($at)
/* AEDC8 800BE5C8 0C80033C */  lui        $v1, %hi(func_800BE6A0)
/* AEDCC 800BE5CC A0E66324 */  addiu      $v1, $v1, %lo(func_800BE6A0)
/* AEDD0 800BE5D0 0D80013C */  lui        $at, %hi(CD_cbread)
/* AEDD4 800BE5D4 3CE423AC */  sw         $v1, %lo(CD_cbread)($at)
/* AEDD8 800BE5D8 0D80013C */  lui        $at, %hi(CD_read_dma_mode)
/* AEDDC 800BE5DC 81F90208 */  j          .L800BE604
/* AEDE0 800BE5E0 40E420AC */   sw        $zero, %lo(CD_read_dma_mode)($at)
.L800BE5E4:
/* AEDE4 800BE5E4 FFFF1026 */  addiu      $s0, $s0, -0x1
/* AEDE8 800BE5E8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* AEDEC 800BE5EC E9FF0216 */  bne        $s0, $v0, .L800BE594
/* AEDF0 800BE5F0 00000000 */   nop
/* AEDF4 800BE5F4 0180043C */  lui        $a0, %hi(D_800127A4)
/* AEDF8 800BE5F8 06D1010C */  jal        printf
/* AEDFC 800BE5FC A4278424 */   addiu     $a0, $a0, %lo(D_800127A4)
/* AEE00 800BE600 21100000 */  addu       $v0, $zero, $zero
.L800BE604:
/* AEE04 800BE604 1400BF8F */  lw         $ra, 0x14($sp)
/* AEE08 800BE608 1000B08F */  lw         $s0, 0x10($sp)
/* AEE0C 800BE60C 0800E003 */  jr         $ra
/* AEE10 800BE610 1800BD27 */   addiu     $sp, $sp, 0x18
.size CdInit, . - CdInit
