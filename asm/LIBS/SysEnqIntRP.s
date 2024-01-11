.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SysEnqIntRP
/* B8160 800C7960 C0000A24 */  addiu      $t2, $zero, 0xC0
/* B8164 800C7964 08004001 */  jr         $t2
/* B8168 800C7968 02000924 */   addiu     $t1, $zero, 0x2
/* B816C 800C796C 00000000 */  nop
.size SysEnqIntRP, . - SysEnqIntRP
