.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_Reactivate
/* 22A70 80032270 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 22A74 80032274 FEFF0224 */  addiu      $v0, $zero, -0x2
/* 22A78 80032278 1000BFAF */  sw         $ra, 0x10($sp)
/* 22A7C 8003227C 1800838C */  lw         $v1, 0x18($a0)
/* 22A80 80032280 1400858C */  lw         $a1, 0x14($a0)
/* 22A84 80032284 1C00868C */  lw         $a2, 0x1C($a0)
/* 22A88 80032288 24186200 */  and        $v1, $v1, $v0
/* 22A8C 8003228C 0400023C */  lui        $v0, (0x40000 >> 16)
/* 22A90 80032290 2410A200 */  and        $v0, $a1, $v0
/* 22A94 80032294 09004010 */  beqz       $v0, .L800322BC
/* 22A98 80032298 180083AC */   sw        $v1, 0x18($a0)
/* 22A9C 8003229C FBFF023C */  lui        $v0, (0xFFFBFFFF >> 16)
/* 22AA0 800322A0 FFFF4234 */  ori        $v0, $v0, (0xFFFBFFFF & 0xFFFF)
/* 22AA4 800322A4 2410A200 */  and        $v0, $a1, $v0
/* 22AA8 800322A8 140082AC */  sw         $v0, 0x14($a0)
/* 22AAC 800322AC 21106000 */  addu       $v0, $v1, $zero
/* 22AB0 800322B0 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 22AB4 800322B4 B2C80008 */  j          .L800322C8
/* 22AB8 800322B8 25104300 */   or        $v0, $v0, $v1
.L800322BC:
/* 22ABC 800322BC FFDF023C */  lui        $v0, (0xDFFFFFFF >> 16)
/* 22AC0 800322C0 FFFF4234 */  ori        $v0, $v0, (0xDFFFFFFF & 0xFFFF)
/* 22AC4 800322C4 24106200 */  and        $v0, $v1, $v0
.L800322C8:
/* 22AC8 800322C8 180082AC */  sw         $v0, 0x18($a0)
/* 22ACC 800322CC 1000C28C */  lw         $v0, 0x10($a2)
/* 22AD0 800322D0 00000000 */  nop
/* 22AD4 800322D4 08004010 */  beqz       $v0, .L800322F8
/* 22AD8 800322D8 0040033C */   lui       $v1, (0x40000000 >> 16)
/* 22ADC 800322DC 2C00C28C */  lw         $v0, 0x2C($a2)
/* 22AE0 800322E0 00000000 */  nop
/* 22AE4 800322E4 24104300 */  and        $v0, $v0, $v1
/* 22AE8 800322E8 03004014 */  bnez       $v0, .L800322F8
/* 22AEC 800322EC 00000000 */   nop
/* 22AF0 800322F0 644B020C */  jal        G2Anim_Restore
/* 22AF4 800322F4 C8018424 */   addiu     $a0, $a0, 0x1C8
.L800322F8:
/* 22AF8 800322F8 1000BF8F */  lw         $ra, 0x10($sp)
/* 22AFC 800322FC 00000000 */  nop
/* 22B00 80032300 0800E003 */  jr         $ra
/* 22B04 80032304 1800BD27 */   addiu     $sp, $sp, 0x18
.size INSTANCE_Reactivate, . - INSTANCE_Reactivate
