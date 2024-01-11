.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025DB8
/* 165B8 80025DB8 DC0088AD */  sw         $t0, 0xDC($t4)
/* 165BC 80025DBC E00089AD */  sw         $t1, 0xE0($t4)
/* 165C0 80025DC0 E4008AAD */  sw         $t2, 0xE4($t4)
/* 165C4 80025DC4 E8008BAD */  sw         $t3, 0xE8($t4)
/* 165C8 80025DC8 EC008EAD */  sw         $t6, 0xEC($t4)
/* 165CC 80025DCC F00085AD */  sw         $a1, 0xF0($t4)
/* 165D0 80025DD0 F40086AD */  sw         $a2, 0xF4($t4)
/* 165D4 80025DD4 F8009FAD */  sw         $ra, 0xF8($t4)
/* 165D8 80025DD8 21200001 */  addu       $a0, $t0, $zero
/* 165DC 80025DDC 21288002 */  addu       $a1, $s4, $zero
/* 165E0 80025DE0 2430C000 */  and        $a2, $a2, $zero
/* 165E4 80025DE4 2DB2000C */  jal        DRAW_Zclip_subdiv
/* 165E8 80025DE8 00000000 */   nop
/* 165EC 80025DEC 801F0C3C */  lui        $t4, (0x1F8000F8 >> 16)
/* 165F0 80025DF0 DC00888D */  lw         $t0, (0x1F8000DC & 0xFFFF)($t4)
/* 165F4 80025DF4 E000898D */  lw         $t1, (0x1F8000E0 & 0xFFFF)($t4)
/* 165F8 80025DF8 E4008A8D */  lw         $t2, (0x1F8000E4 & 0xFFFF)($t4)
/* 165FC 80025DFC E8008B8D */  lw         $t3, (0x1F8000E8 & 0xFFFF)($t4)
/* 16600 80025E00 EC008E8D */  lw         $t6, (0x1F8000EC & 0xFFFF)($t4)
/* 16604 80025E04 F000858D */  lw         $a1, (0x1F8000F0 & 0xFFFF)($t4)
/* 16608 80025E08 F400868D */  lw         $a2, (0x1F8000F4 & 0xFFFF)($t4)
/* 1660C 80025E0C F8009F8D */  lw         $ra, (0x1F8000F8 & 0xFFFF)($t4)
/* 16610 80025E10 04004010 */  beqz       $v0, .L80025E24
/* 16614 80025E14 00000000 */   nop
/* 16618 80025E18 21404000 */  addu       $t0, $v0, $zero
/* 1661C 80025E1C 0800E003 */  jr         $ra
/* 16620 80025E20 24104000 */   and       $v0, $v0, $zero
.L80025E24:
/* 16624 80025E24 0800E003 */  jr         $ra
/* 16628 80025E28 01000238 */   xori      $v0, $zero, 0x1
.size func_80025DB8, . - func_80025DB8
