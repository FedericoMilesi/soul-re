.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3E3C
/* B463C 800C3E3C 2000838C */  lw         $v1, 0x20($a0)
/* B4640 800C3E40 4D000224 */  addiu      $v0, $zero, 0x4D
/* B4644 800C3E44 370082A0 */  sb         $v0, 0x37($a0)
/* B4648 800C3E48 06000224 */  addiu      $v0, $zero, 0x6
/* B464C 800C3E4C 360082A0 */  sb         $v0, 0x36($a0)
/* B4650 800C3E50 0800E003 */  jr         $ra
/* B4654 800C3E54 2C0083AC */   sw        $v1, 0x2C($a0)
.size func_800C3E3C, . - func_800C3E3C
