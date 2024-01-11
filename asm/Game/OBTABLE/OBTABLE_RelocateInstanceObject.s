.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_RelocateInstanceObject
/* 2EDA8 8003E5A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2EDAC 8003E5AC 1000BFAF */  sw         $ra, 0x10($sp)
/* 2EDB0 8003E5B0 1C00828C */  lw         $v0, 0x1C($a0)
/* 2EDB4 8003E5B4 00000000 */  nop
/* 2EDB8 8003E5B8 04004684 */  lh         $a2, 0x4($v0)
/* 2EDBC 8003E5BC 00000000 */  nop
/* 2EDC0 8003E5C0 0C00C004 */  bltz       $a2, .L8003E5F4
/* 2EDC4 8003E5C4 0D80033C */   lui       $v1, %hi(objectFunc)
/* 2EDC8 8003E5C8 1CA36324 */  addiu      $v1, $v1, %lo(objectFunc)
/* 2EDCC 8003E5CC C0100600 */  sll        $v0, $a2, 3
/* 2EDD0 8003E5D0 21104600 */  addu       $v0, $v0, $a2
/* 2EDD4 8003E5D4 80100200 */  sll        $v0, $v0, 2
/* 2EDD8 8003E5D8 21104300 */  addu       $v0, $v0, $v1
/* 2EDDC 8003E5DC 2000428C */  lw         $v0, 0x20($v0)
/* 2EDE0 8003E5E0 00000000 */  nop
/* 2EDE4 8003E5E4 03004010 */  beqz       $v0, .L8003E5F4
/* 2EDE8 8003E5E8 00000000 */   nop
/* 2EDEC 8003E5EC 09F84000 */  jalr       $v0
/* 2EDF0 8003E5F0 00000000 */   nop
.L8003E5F4:
/* 2EDF4 8003E5F4 1000BF8F */  lw         $ra, 0x10($sp)
/* 2EDF8 8003E5F8 00000000 */  nop
/* 2EDFC 8003E5FC 0800E003 */  jr         $ra
/* 2EE00 8003E600 1800BD27 */   addiu     $sp, $sp, 0x18
.size OBTABLE_RelocateInstanceObject, . - OBTABLE_RelocateInstanceObject
