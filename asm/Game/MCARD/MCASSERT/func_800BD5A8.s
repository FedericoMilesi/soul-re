.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD5A8
/* ADDA8 800BD5A8 49008290 */  lbu        $v0, 0x49($a0)
/* ADDAC 800BD5AC 00000000 */  nop
/* ADDB0 800BD5B0 15004010 */  beqz       $v0, .L800BD608
/* ADDB4 800BD5B4 00000000 */   nop
/* ADDB8 800BD5B8 5D008324 */  addiu      $v1, $a0, 0x5D
/* ADDBC 800BD5BC FF000524 */  addiu      $a1, $zero, 0xFF
/* ADDC0 800BD5C0 05000224 */  addiu      $v0, $zero, 0x5
/* ADDC4 800BD5C4 490080A0 */  sb         $zero, 0x49($a0)
/* ADDC8 800BD5C8 460080A0 */  sb         $zero, 0x46($a0)
/* ADDCC 800BD5CC E60080A4 */  sh         $zero, 0xE6($a0)
/* ADDD0 800BD5D0 140080AC */  sw         $zero, 0x14($a0)
/* ADDD4 800BD5D4 180080AC */  sw         $zero, 0x18($a0)
/* ADDD8 800BD5D8 E30080A0 */  sb         $zero, 0xE3($a0)
/* ADDDC 800BD5DC E40080A0 */  sb         $zero, 0xE4($a0)
/* ADDE0 800BD5E0 E60080A4 */  sh         $zero, 0xE6($a0)
/* ADDE4 800BD5E4 E90080A0 */  sb         $zero, 0xE9($a0)
/* ADDE8 800BD5E8 EA0080A0 */  sb         $zero, 0xEA($a0)
/* ADDEC 800BD5EC 000080AC */  sw         $zero, 0x0($a0)
/* ADDF0 800BD5F0 040080AC */  sw         $zero, 0x4($a0)
/* ADDF4 800BD5F4 080080AC */  sw         $zero, 0x8($a0)
.L800BD5F8:
/* ADDF8 800BD5F8 000065A0 */  sb         $a1, 0x0($v1)
/* ADDFC 800BD5FC FFFF4224 */  addiu      $v0, $v0, -0x1
/* ADE00 800BD600 FDFF4104 */  bgez       $v0, .L800BD5F8
/* ADE04 800BD604 01006324 */   addiu     $v1, $v1, 0x1
.L800BD608:
/* ADE08 800BD608 0800E003 */  jr         $ra
/* ADE0C 800BD60C 00000000 */   nop
.size func_800BD5A8, . - func_800BD5A8
