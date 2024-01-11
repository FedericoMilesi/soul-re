.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ReadInitPadFlag
/* B8880 800C8080 0D80023C */  lui        $v0, %hi(_ctype_ + 0x90)
/* B8884 800C8084 8CF5428C */  lw         $v0, %lo(_ctype_ + 0x90)($v0)
/* B8888 800C8088 0800E003 */  jr         $ra
/* B888C 800C808C 00000000 */   nop
.size ReadInitPadFlag, . - ReadInitPadFlag
