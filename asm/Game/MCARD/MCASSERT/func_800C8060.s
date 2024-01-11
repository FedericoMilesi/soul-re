.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C8060
/* B8860 800C8060 A0000A24 */  addiu      $t2, $zero, 0xA0
/* B8864 800C8064 08004001 */  jr         $t2
/* B8868 800C8068 44000924 */   addiu     $t1, $zero, 0x44
/* B886C 800C806C 00000000 */  nop
glabel func_800C8070
/* B8870 800C8070 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B8874 800C8074 08004001 */  jr         $t2
/* B8878 800C8078 42000924 */   addiu     $t1, $zero, 0x42
/* B887C 800C807C 00000000 */  nop
/* B8880 800C8080 0D80023C */  lui        $v0, %hi(_ctype_ + 0x90)
/* B8884 800C8084 8CF5428C */  lw         $v0, %lo(_ctype_ + 0x90)($v0)
/* B8888 800C8088 0800E003 */  jr         $ra
/* B888C 800C808C 00000000 */   nop
.size func_800C8060, . - func_800C8060
