.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3F94
/* B4794 800C3F94 47000224 */  addiu      $v0, $zero, 0x47
/* B4798 800C3F98 370082A0 */  sb         $v0, 0x37($a0)
/* B479C 800C3F9C 24008224 */  addiu      $v0, $a0, 0x24
/* B47A0 800C3FA0 2C0082AC */  sw         $v0, 0x2C($a0)
/* B47A4 800C3FA4 01000224 */  addiu      $v0, $zero, 0x1
/* B47A8 800C3FA8 240085A0 */  sb         $a1, 0x24($a0)
/* B47AC 800C3FAC 0800E003 */  jr         $ra
/* B47B0 800C3FB0 360082A0 */   sb        $v0, 0x36($a0)
.size func_800C3F94, . - func_800C3F94
