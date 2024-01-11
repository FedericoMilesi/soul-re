.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3F74
/* B4774 800C3F74 46000224 */  addiu      $v0, $zero, 0x46
/* B4778 800C3F78 370082A0 */  sb         $v0, 0x37($a0)
/* B477C 800C3F7C 24008224 */  addiu      $v0, $a0, 0x24
/* B4780 800C3F80 2C0082AC */  sw         $v0, 0x2C($a0)
/* B4784 800C3F84 01000224 */  addiu      $v0, $zero, 0x1
/* B4788 800C3F88 240085A0 */  sb         $a1, 0x24($a0)
/* B478C 800C3F8C 0800E003 */  jr         $ra
/* B4790 800C3F90 360082A0 */   sb        $v0, 0x36($a0)
.size func_800C3F74, . - func_800C3F74
