.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE6A0
/* AEEA0 800BE6A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AEEA4 800BE6A4 1000BFAF */  sw         $ra, 0x10($sp)
/* AEEA8 800BE6A8 00F0043C */  lui        $a0, (0xF0000003 >> 16)
/* AEEAC 800BE6AC 03008434 */  ori        $a0, $a0, (0xF0000003 & 0xFFFF)
/* AEEB0 800BE6B0 AD15030C */  jal        DeliverEvent
/* AEEB4 800BE6B4 40000524 */   addiu     $a1, $zero, 0x40
/* AEEB8 800BE6B8 1000BF8F */  lw         $ra, 0x10($sp)
/* AEEBC 800BE6BC 1800BD27 */  addiu      $sp, $sp, 0x18
/* AEEC0 800BE6C0 0800E003 */  jr         $ra
/* AEEC4 800BE6C4 00000000 */   nop
/* AEEC8 800BE6C8 00000000 */  nop
/* AEECC 800BE6CC 00000000 */  nop
/* AEED0 800BE6D0 00000000 */  nop
.size func_800BE6A0, . - func_800BE6A0
