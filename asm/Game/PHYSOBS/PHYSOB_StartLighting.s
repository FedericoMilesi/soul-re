.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_StartLighting
/* 5B594 8006AD94 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5B598 8006AD98 1000BFAF */  sw         $ra, 0x10($sp)
/* 5B59C 8006AD9C 6C01868C */  lw         $a2, 0x16C($a0)
/* 5B5A0 8006ADA0 00000000 */  nop
/* 5B5A4 8006ADA4 3400C284 */  lh         $v0, 0x34($a2)
/* 5B5A8 8006ADA8 3400C394 */  lhu        $v1, 0x34($a2)
/* 5B5AC 8006ADAC 03004104 */  bgez       $v0, .L8006ADBC
/* 5B5B0 8006ADB0 2138A000 */   addu      $a3, $a1, $zero
/* 5B5B4 8006ADB4 23100300 */  negu       $v0, $v1
/* 5B5B8 8006ADB8 3400C2A4 */  sh         $v0, 0x34($a2)
.L8006ADBC:
/* 5B5BC 8006ADBC 0100033C */  lui        $v1, (0x18000 >> 16)
/* 5B5C0 8006ADC0 0000C28C */  lw         $v0, 0x0($a2)
/* 5B5C4 8006ADC4 00806334 */  ori        $v1, $v1, (0x18000 & 0xFFFF)
/* 5B5C8 8006ADC8 25104300 */  or         $v0, $v0, $v1
/* 5B5CC 8006ADCC 0800E010 */  beqz       $a3, .L8006ADF0
/* 5B5D0 8006ADD0 0000C2AC */   sw        $v0, 0x0($a2)
/* 5B5D4 8006ADD4 D4BD84AF */  sw         $a0, %gp_rel(gameTrackerX + 0xC)($gp)
/* 5B5D8 8006ADD8 D4BD8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX + 0xC)
/* 5B5DC 8006ADDC 0400A010 */  beqz       $a1, .L8006ADF0
/* 5B5E0 8006ADE0 00000000 */   nop
/* 5B5E4 8006ADE4 3400C684 */  lh         $a2, 0x34($a2)
/* 5B5E8 8006ADE8 02AB010C */  jal        PHYSOB_SetLightTable
/* 5B5EC 8006ADEC 2120E000 */   addu      $a0, $a3, $zero
.L8006ADF0:
/* 5B5F0 8006ADF0 1000BF8F */  lw         $ra, 0x10($sp)
/* 5B5F4 8006ADF4 00000000 */  nop
/* 5B5F8 8006ADF8 0800E003 */  jr         $ra
/* 5B5FC 8006ADFC 1800BD27 */   addiu     $sp, $sp, 0x18
.size PHYSOB_StartLighting, . - PHYSOB_StartLighting
