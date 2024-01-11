.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel RotTrans
/* ADA60 800BD260 000080C8 */  lwc2       $0, 0x0($a0)
/* ADA64 800BD264 040081C8 */  lwc2       $1, 0x4($a0)
/* ADA68 800BD268 00000000 */  nop
/* ADA6C 800BD26C 1200484A */  MVMVA      1, 0, 0, 0, 0
/* ADA70 800BD270 0000B9E8 */  swc2       $25, 0x0($a1)
/* ADA74 800BD274 0400BAE8 */  swc2       $26, 0x4($a1) # handwritten instruction
/* ADA78 800BD278 0800BBE8 */  swc2       $27, 0x8($a1) # handwritten instruction
/* ADA7C 800BD27C 00F84248 */  cfc2       $v0, $31 # handwritten instruction
/* ADA80 800BD280 0800E003 */  jr         $ra
/* ADA84 800BD284 0000C2AC */   sw        $v0, 0x0($a2)
/* ADA88 800BD288 00000000 */  nop
/* ADA8C 800BD28C 00000000 */  nop
.size RotTrans, . - RotTrans
