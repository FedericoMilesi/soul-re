.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800B6AA0
/* A72A0 800B6AA0 0D80083C */  lui        $t0, %hi(__initialised)
/* A72A4 800B6AA4 50C8088D */  lw         $t0, %lo(__initialised)($t0)
/* A72A8 800B6AA8 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* A72AC 800B6AAC 0400B0AF */  sw         $s0, 0x4($sp)
/* A72B0 800B6AB0 0800B1AF */  sw         $s1, 0x8($sp)
/* A72B4 800B6AB4 0C00BFAF */  sw         $ra, 0xC($sp)
/* A72B8 800B6AB8 03000015 */  bnez       $t0, .L800B6AC8
/* A72BC 800B6ABC 01000824 */   addiu     $t0, $zero, 0x1
/* A72C0 800B6AC0 0D80013C */  lui        $at, %hi(__initialised)
/* A72C4 800B6AC4 50C828AC */  sw         $t0, %lo(__initialised)($at)
.L800B6AC8:
/* A72C8 800B6AC8 0C00BF8F */  lw         $ra, 0xC($sp)
/* A72CC 800B6ACC 0800B18F */  lw         $s1, 0x8($sp)
/* A72D0 800B6AD0 0400B08F */  lw         $s0, 0x4($sp)
/* A72D4 800B6AD4 1000BD27 */  addiu      $sp, $sp, 0x10
/* A72D8 800B6AD8 0800E003 */  jr         $ra
/* A72DC 800B6ADC 00000000 */   nop
.size func_800B6AA0, . - func_800B6AA0
