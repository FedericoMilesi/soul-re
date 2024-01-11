.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3F20
/* B4720 800C3F20 43000224 */  addiu      $v0, $zero, 0x43
/* B4724 800C3F24 370082A0 */  sb         $v0, 0x37($a0)
/* B4728 800C3F28 24008224 */  addiu      $v0, $a0, 0x24
/* B472C 800C3F2C 2C0082AC */  sw         $v0, 0x2C($a0)
/* B4730 800C3F30 01000224 */  addiu      $v0, $zero, 0x1
/* B4734 800C3F34 240085A0 */  sb         $a1, 0x24($a0)
/* B4738 800C3F38 0800E003 */  jr         $ra
/* B473C 800C3F3C 360082A0 */   sb        $v0, 0x36($a0)
.size func_800C3F20, . - func_800C3F20
