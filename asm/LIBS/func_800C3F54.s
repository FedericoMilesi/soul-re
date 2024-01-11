.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3F54
/* B4754 800C3F54 4C000224 */  addiu      $v0, $zero, 0x4C
/* B4758 800C3F58 370082A0 */  sb         $v0, 0x37($a0)
/* B475C 800C3F5C 24008224 */  addiu      $v0, $a0, 0x24
/* B4760 800C3F60 2C0082AC */  sw         $v0, 0x2C($a0)
/* B4764 800C3F64 01000224 */  addiu      $v0, $zero, 0x1
/* B4768 800C3F68 240085A0 */  sb         $a1, 0x24($a0)
/* B476C 800C3F6C 0800E003 */  jr         $ra
/* B4770 800C3F70 360082A0 */   sb        $v0, 0x36($a0)
.size func_800C3F54, . - func_800C3F54
