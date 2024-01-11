.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetExternalForce
/* 8ACB8 8009A4B8 002C0500 */  sll        $a1, $a1, 16
/* 8ACBC 8009A4BC 032C0500 */  sra        $a1, $a1, 16
/* 8ACC0 8009A4C0 00340600 */  sll        $a2, $a2, 16
/* 8ACC4 8009A4C4 03340600 */  sra        $a2, $a2, 16
/* 8ACC8 8009A4C8 003C0700 */  sll        $a3, $a3, 16
/* 8ACCC 8009A4CC 040085AC */  sw         $a1, 0x4($a0)
/* 8ACD0 8009A4D0 080086AC */  sw         $a2, 0x8($a0)
/* 8ACD4 8009A4D4 1000A28F */  lw         $v0, 0x10($sp)
/* 8ACD8 8009A4D8 1400A38F */  lw         $v1, 0x14($sp)
/* 8ACDC 8009A4DC 033C0700 */  sra        $a3, $a3, 16
/* 8ACE0 8009A4E0 0C0087AC */  sw         $a3, 0xC($a0)
/* 8ACE4 8009A4E4 00140200 */  sll        $v0, $v0, 16
/* 8ACE8 8009A4E8 03140200 */  sra        $v0, $v0, 16
/* 8ACEC 8009A4EC 100083A4 */  sh         $v1, 0x10($a0)
/* 8ACF0 8009A4F0 0800E003 */  jr         $ra
/* 8ACF4 8009A4F4 000082AC */   sw        $v0, 0x0($a0)
.size SetExternalForce, . - SetExternalForce
