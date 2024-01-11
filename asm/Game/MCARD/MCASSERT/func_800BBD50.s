.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BBD50
/* AC550 800BBD50 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* AC554 800BBD54 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* AC558 800BBD58 00000000 */  nop
/* AC55C 800BBD5C 000044AC */  sw         $a0, 0x0($v0)
/* AC560 800BBD60 02160400 */  srl        $v0, $a0, 24
/* AC564 800BBD64 0E80013C */  lui        $at, %hi(gMemcard + 0x58)
/* AC568 800BBD68 21082200 */  addu       $at, $at, $v0
/* AC56C 800BBD6C 0800E003 */  jr         $ra
/* AC570 800BBD70 60BD24A0 */   sb        $a0, %lo(gMemcard + 0x58)($at)
.size func_800BBD50, . - func_800BBD50
