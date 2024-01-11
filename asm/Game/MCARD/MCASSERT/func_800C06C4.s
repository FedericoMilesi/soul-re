.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C06C4
/* B0EC4 800C06C4 02000224 */  addiu      $v0, $zero, 0x2
/* B0EC8 800C06C8 0400A010 */  beqz       $a1, .L800C06DC
/* B0ECC 800C06CC 030082A0 */   sb        $v0, 0x3($a0)
/* B0ED0 800C06D0 00E6023C */  lui        $v0, (0xE6000001 >> 16)
/* B0ED4 800C06D4 B8010308 */  j          .L800C06E0
/* B0ED8 800C06D8 01004234 */   ori       $v0, $v0, (0xE6000001 & 0xFFFF)
.L800C06DC:
/* B0EDC 800C06DC 00E6023C */  lui        $v0, (0xE6000000 >> 16)
.L800C06E0:
/* B0EE0 800C06E0 040082AC */  sw         $v0, 0x4($a0)
/* B0EE4 800C06E4 0800E003 */  jr         $ra
/* B0EE8 800C06E8 080080AC */   sw        $zero, 0x8($a0)
/* B0EEC 800C06EC 00000000 */  nop
/* B0EF0 800C06F0 00000000 */  nop
.size func_800C06C4, . - func_800C06C4
