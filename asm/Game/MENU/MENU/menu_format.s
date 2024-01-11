.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_format
/* A7F44 800B7744 0000838C */  lw         $v1, 0x0($a0)
/* A7F48 800B7748 00000000 */  nop
/* A7F4C 800B774C C0100300 */  sll        $v0, $v1, 3
/* A7F50 800B7750 21104300 */  addu       $v0, $v0, $v1
/* A7F54 800B7754 80100200 */  sll        $v0, $v0, 2
/* A7F58 800B7758 E8FF4224 */  addiu      $v0, $v0, -0x18
/* A7F5C 800B775C 21208200 */  addu       $a0, $a0, $v0
/* A7F60 800B7760 080086AC */  sw         $a2, 0x8($a0)
/* A7F64 800B7764 1000A88F */  lw         $t0, 0x10($sp)
/* A7F68 800B7768 1400A28F */  lw         $v0, 0x14($sp)
/* A7F6C 800B776C 1800A38F */  lw         $v1, 0x18($sp)
/* A7F70 800B7770 1C00A68F */  lw         $a2, 0x1C($sp)
/* A7F74 800B7774 08008424 */  addiu      $a0, $a0, 0x8
/* A7F78 800B7778 040087AC */  sw         $a3, 0x4($a0)
/* A7F7C 800B777C 140085AC */  sw         $a1, 0x14($a0)
/* A7F80 800B7780 080082AC */  sw         $v0, 0x8($a0)
/* A7F84 800B7784 0C0083AC */  sw         $v1, 0xC($a0)
/* A7F88 800B7788 100088AC */  sw         $t0, 0x10($a0)
/* A7F8C 800B778C 0800E003 */  jr         $ra
/* A7F90 800B7790 180086AC */   sw        $a2, 0x18($a0)
.size menu_format, . - menu_format
