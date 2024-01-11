.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3F40
/* B4740 800C3F40 45000224 */  addiu      $v0, $zero, 0x45
/* B4744 800C3F44 370082A0 */  sb         $v0, 0x37($a0)
/* B4748 800C3F48 2C0080AC */  sw         $zero, 0x2C($a0)
/* B474C 800C3F4C 0800E003 */  jr         $ra
/* B4750 800C3F50 360080A0 */   sb        $zero, 0x36($a0)
.size func_800C3F40, . - func_800C3F40
