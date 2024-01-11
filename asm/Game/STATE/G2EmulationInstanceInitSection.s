.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceInitSection
/* 63178 80072978 FF00A530 */  andi       $a1, $a1, 0xFF
/* 6317C 8007297C 40100500 */  sll        $v0, $a1, 1
/* 63180 80072980 21104500 */  addu       $v0, $v0, $a1
/* 63184 80072984 00110200 */  sll        $v0, $v0, 4
/* 63188 80072988 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 6318C 8007298C 21208200 */  addu       $a0, $a0, $v0
/* 63190 80072990 1C0086AC */  sw         $a2, 0x1C($a0)
/* 63194 80072994 0800E003 */  jr         $ra
/* 63198 80072998 200087AC */   sw        $a3, 0x20($a0)
.size G2EmulationInstanceInitSection, . - G2EmulationInstanceInitSection
