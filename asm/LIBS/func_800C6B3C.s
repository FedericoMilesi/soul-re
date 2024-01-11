.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800C6B3C
/* B733C 800C6B3C 040041AF */  sw         $at, 0x4($k0) # handwritten instruction
/* B7340 800C6B40 080042AF */  sw         $v0, 0x8($k0) # handwritten instruction
/* B7344 800C6B44 0C0043AF */  sw         $v1, 0xC($k0) # handwritten instruction
/* B7348 800C6B48 7C005FAF */  sw         $ra, 0x7C($k0) # handwritten instruction
/* B734C 800C6B4C 00700340 */  mfc0       $v1, $14 # handwritten instruction
/* B7350 800C6B50 00000000 */  nop
glabel D_800C6B54
/* B7354 800C6B54 040041AF */  sw         $at, 0x4($k0) # handwritten instruction
/* B7358 800C6B58 080042AF */  sw         $v0, 0x8($k0) # handwritten instruction
/* B735C 800C6B5C 00680240 */  mfc0       $v0, $13 # handwritten instruction
/* B7360 800C6B60 0C0043AF */  sw         $v1, 0xC($k0) # handwritten instruction
/* B7364 800C6B64 00700340 */  mfc0       $v1, $14 # handwritten instruction
/* B7368 800C6B68 7C005FAF */  sw         $ra, 0x7C($k0) # handwritten instruction
glabel D_800C6B6C
/* B736C 800C6B6C 00000000 */  nop
.size func_800C6B3C, . - func_800C6B3C
