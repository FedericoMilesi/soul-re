.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_FleeEntry
/* 7ADB0 8008A5B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7ADB4 8008A5B4 FEFF073C */  lui        $a3, (0xFFFEFFFF >> 16)
/* 7ADB8 8008A5B8 FFFFE734 */  ori        $a3, $a3, (0xFFFEFFFF & 0xFFFF)
/* 7ADBC 8008A5BC FDFF063C */  lui        $a2, (0xFFFDFFFF >> 16)
/* 7ADC0 8008A5C0 1000BFAF */  sw         $ra, 0x10($sp)
/* 7ADC4 8008A5C4 6C01858C */  lw         $a1, 0x16C($a0)
/* 7ADC8 8008A5C8 FFFFC634 */  ori        $a2, $a2, (0xFFFDFFFF & 0xFFFF)
/* 7ADCC 8008A5CC 0000A28C */  lw         $v0, 0x0($a1)
/* 7ADD0 8008A5D0 04000324 */  addiu      $v1, $zero, 0x4
/* 7ADD4 8008A5D4 0801A3AC */  sw         $v1, 0x108($a1)
/* 7ADD8 8008A5D8 00104234 */  ori        $v0, $v0, 0x1000
/* 7ADDC 8008A5DC 24104700 */  and        $v0, $v0, $a3
/* 7ADE0 8008A5E0 24104600 */  and        $v0, $v0, $a2
/* 7ADE4 8008A5E4 0000A2AC */  sw         $v0, 0x0($a1)
/* 7ADE8 8008A5E8 03000524 */  addiu      $a1, $zero, 0x3
/* 7ADEC 8008A5EC B6FF010C */  jal        MON_PlayAnim
/* 7ADF0 8008A5F0 02000624 */   addiu     $a2, $zero, 0x2
/* 7ADF4 8008A5F4 1000BF8F */  lw         $ra, 0x10($sp)
/* 7ADF8 8008A5F8 00000000 */  nop
/* 7ADFC 8008A5FC 0800E003 */  jr         $ra
/* 7AE00 8008A600 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_FleeEntry, . - MON_FleeEntry
