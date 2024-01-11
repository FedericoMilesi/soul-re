.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3004
/* B3804 800C3004 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B3808 800C3008 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B380C 800C300C 00000000 */  nop
.L800C3010:
/* B3810 800C3010 04006294 */  lhu        $v0, 0x4($v1)
/* B3814 800C3014 00000000 */  nop
/* B3818 800C3018 02004230 */  andi       $v0, $v0, 0x2
/* B381C 800C301C FCFF4010 */  beqz       $v0, .L800C3010
/* B3820 800C3020 00000000 */   nop
/* B3824 800C3024 0800E003 */  jr         $ra
/* B3828 800C3028 00000000 */   nop
/* B382C 800C302C 00000000 */  nop
/* B3830 800C3030 00000000 */  nop
/* B3834 800C3034 00000000 */  nop
.size func_800C3004, . - func_800C3004
