.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_push
/* A7FB8 800B77B8 0000838C */  lw         $v1, 0x0($a0)
/* A7FBC 800B77BC 00000000 */  nop
/* A7FC0 800B77C0 C0100300 */  sll        $v0, $v1, 3
/* A7FC4 800B77C4 21104300 */  addu       $v0, $v0, $v1
/* A7FC8 800B77C8 01006324 */  addiu      $v1, $v1, 0x1
/* A7FCC 800B77CC 80100200 */  sll        $v0, $v0, 2
/* A7FD0 800B77D0 0C004224 */  addiu      $v0, $v0, 0xC
/* A7FD4 800B77D4 000083AC */  sw         $v1, 0x0($a0)
/* A7FD8 800B77D8 21208200 */  addu       $a0, $a0, $v0
/* A7FDC 800B77DC FFFF0224 */  addiu      $v0, $zero, -0x1
/* A7FE0 800B77E0 000085AC */  sw         $a1, 0x0($a0)
/* A7FE4 800B77E4 040082AC */  sw         $v0, 0x4($a0)
/* A7FE8 800B77E8 E4FF868C */  lw         $a2, -0x1C($a0)
/* A7FEC 800B77EC E8FF878C */  lw         $a3, -0x18($a0)
/* A7FF0 800B77F0 ECFF888C */  lw         $t0, -0x14($a0)
/* A7FF4 800B77F4 F0FF898C */  lw         $t1, -0x10($a0)
/* A7FF8 800B77F8 080086AC */  sw         $a2, 0x8($a0)
/* A7FFC 800B77FC 0C0087AC */  sw         $a3, 0xC($a0)
/* A8000 800B7800 100088AC */  sw         $t0, 0x10($a0)
/* A8004 800B7804 140089AC */  sw         $t1, 0x14($a0)
/* A8008 800B7808 F4FF868C */  lw         $a2, -0xC($a0)
/* A800C 800B780C F8FF878C */  lw         $a3, -0x8($a0)
/* A8010 800B7810 FCFF888C */  lw         $t0, -0x4($a0)
/* A8014 800B7814 180086AC */  sw         $a2, 0x18($a0)
/* A8018 800B7818 1C0087AC */  sw         $a3, 0x1C($a0)
/* A801C 800B781C 200088AC */  sw         $t0, 0x20($a0)
/* A8020 800B7820 0800E003 */  jr         $ra
/* A8024 800B7824 00000000 */   nop
.size menu_push, . - menu_push
