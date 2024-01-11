.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BDA4C
/* AE24C 800BDA4C 21280000 */  addu       $a1, $zero, $zero
/* AE250 800BDA50 10000624 */  addiu      $a2, $zero, 0x10
/* AE254 800BDA54 0E80033C */  lui        $v1, %hi(GsOUT_PACKET_P_dup1 + 0xA0)
/* AE258 800BDA58 08D76324 */  addiu      $v1, $v1, %lo(GsOUT_PACKET_P_dup1 + 0xA0)
.L800BDA5C:
/* AE25C 800BDA5C 07008310 */  beq        $a0, $v1, .L800BDA7C
/* AE260 800BDA60 2110C000 */   addu      $v0, $a2, $zero
/* AE264 800BDA64 1000C624 */  addiu      $a2, $a2, 0x10
/* AE268 800BDA68 0100A524 */  addiu      $a1, $a1, 0x1
/* AE26C 800BDA6C 0200A228 */  slti       $v0, $a1, 0x2
/* AE270 800BDA70 FAFF4014 */  bnez       $v0, .L800BDA5C
/* AE274 800BDA74 F0006324 */   addiu     $v1, $v1, 0xF0
/* AE278 800BDA78 FF000224 */  addiu      $v0, $zero, 0xFF
.L800BDA7C:
/* AE27C 800BDA7C 0800E003 */  jr         $ra
/* AE280 800BDA80 00000000 */   nop
.size func_800BDA4C, . - func_800BDA4C
