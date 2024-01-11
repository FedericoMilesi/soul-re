.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeliverEvent
/* B5EB4 800C56B4 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B5EB8 800C56B8 08004001 */  jr         $t2
/* B5EBC 800C56BC 07000924 */   addiu     $t1, $zero, 0x7
/* B5EC0 800C56C0 00000000 */  nop
/* B5EC4 800C56C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B5EC8 800C56C8 1000B0AF */  sw         $s0, 0x10($sp)
/* B5ECC 800C56CC 0D80103C */  lui        $s0, %hi(CD_intstr + 0x29C)
/* B5ED0 800C56D0 C4EC1026 */  addiu      $s0, $s0, %lo(CD_intstr + 0x29C)
/* B5ED4 800C56D4 1400BFAF */  sw         $ra, 0x14($sp)
/* B5ED8 800C56D8 0000048E */  lw         $a0, 0x0($s0)
/* B5EDC 800C56DC 46F8020C */  jal        CdSyncCallback
/* B5EE0 800C56E0 D8FF1026 */   addiu     $s0, $s0, -0x28
/* B5EE4 800C56E4 240000AE */  sw         $zero, 0x24($s0)
/* B5EE8 800C56E8 1400BF8F */  lw         $ra, 0x14($sp)
/* B5EEC 800C56EC 1000B08F */  lw         $s0, 0x10($sp)
/* B5EF0 800C56F0 0800E003 */  jr         $ra
/* B5EF4 800C56F4 1800BD27 */   addiu     $sp, $sp, 0x18
.size DeliverEvent, . - DeliverEvent
