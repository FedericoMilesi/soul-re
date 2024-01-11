.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3FB4
/* B47B4 800C3FB4 4B000224 */  addiu      $v0, $zero, 0x4B
/* B47B8 800C3FB8 370082A0 */  sb         $v0, 0x37($a0)
/* B47BC 800C3FBC 2C0080AC */  sw         $zero, 0x2C($a0)
/* B47C0 800C3FC0 0800E003 */  jr         $ra
/* B47C4 800C3FC4 360080A0 */   sb        $zero, 0x36($a0)
/* B47C8 800C3FC8 00000000 */  nop
.size func_800C3FB4, . - func_800C3FB4
