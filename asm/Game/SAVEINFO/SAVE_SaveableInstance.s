.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_SaveableInstance
/* A5D40 800B5540 1800878C */  lw         $a3, 0x18($a0)
/* A5D44 800B5544 0200023C */  lui        $v0, (0x20000 >> 16)
/* A5D48 800B5548 2410E200 */  and        $v0, $a3, $v0
/* A5D4C 800B554C 20004014 */  bnez       $v0, .L800B55D0
/* A5D50 800B5550 21280000 */   addu      $a1, $zero, $zero
/* A5D54 800B5554 1C00838C */  lw         $v1, 0x1C($a0)
/* A5D58 800B5558 00000000 */  nop
/* A5D5C 800B555C 1C006010 */  beqz       $v1, .L800B55D0
/* A5D60 800B5560 0800023C */   lui       $v0, (0x80000 >> 16)
/* A5D64 800B5564 2C00668C */  lw         $a2, 0x2C($v1)
/* A5D68 800B5568 00000000 */  nop
/* A5D6C 800B556C 2410C200 */  and        $v0, $a2, $v0
/* A5D70 800B5570 05004014 */  bnez       $v0, .L800B5588
/* A5D74 800B5574 00000000 */   nop
/* A5D78 800B5578 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* A5D7C 800B557C 00000000 */  nop
/* A5D80 800B5580 03008214 */  bne        $a0, $v0, .L800B5590
/* A5D84 800B5584 0400023C */   lui       $v0, (0x40000 >> 16)
.L800B5588:
/* A5D88 800B5588 74D50208 */  j          .L800B55D0
/* A5D8C 800B558C 01000524 */   addiu     $a1, $zero, 0x1
.L800B5590:
/* A5D90 800B5590 2410C200 */  and        $v0, $a2, $v0
/* A5D94 800B5594 08004010 */  beqz       $v0, .L800B55B8
/* A5D98 800B5598 00000000 */   nop
/* A5D9C 800B559C 0000628C */  lw         $v0, 0x0($v1)
/* A5DA0 800B55A0 01000524 */  addiu      $a1, $zero, 0x1
/* A5DA4 800B55A4 24104500 */  and        $v0, $v0, $a1
/* A5DA8 800B55A8 09004010 */  beqz       $v0, .L800B55D0
/* A5DAC 800B55AC 0800E230 */   andi      $v0, $a3, 0x8
/* A5DB0 800B55B0 74D50208 */  j          .L800B55D0
/* A5DB4 800B55B4 2B280200 */   sltu      $a1, $zero, $v0
.L800B55B8:
/* A5DB8 800B55B8 1400828C */  lw         $v0, 0x14($a0)
/* A5DBC 800B55BC 1000033C */  lui        $v1, (0x100000 >> 16)
/* A5DC0 800B55C0 24104300 */  and        $v0, $v0, $v1
/* A5DC4 800B55C4 02004014 */  bnez       $v0, .L800B55D0
/* A5DC8 800B55C8 00000000 */   nop
/* A5DCC 800B55CC 03000524 */  addiu      $a1, $zero, 0x3
.L800B55D0:
/* A5DD0 800B55D0 1C00828C */  lw         $v0, 0x1C($a0)
/* A5DD4 800B55D4 00000000 */  nop
/* A5DD8 800B55D8 2C00428C */  lw         $v0, 0x2C($v0)
/* A5DDC 800B55DC 1000033C */  lui        $v1, (0x100000 >> 16)
/* A5DE0 800B55E0 24104300 */  and        $v0, $v0, $v1
/* A5DE4 800B55E4 02004010 */  beqz       $v0, .L800B55F0
/* A5DE8 800B55E8 01000224 */   addiu     $v0, $zero, 0x1
/* A5DEC 800B55EC 21280000 */  addu       $a1, $zero, $zero
.L800B55F0:
/* A5DF0 800B55F0 0C00A214 */  bne        $a1, $v0, .L800B5624
/* A5DF4 800B55F4 00000000 */   nop
/* A5DF8 800B55F8 3800838C */  lw         $v1, 0x38($a0)
/* A5DFC 800B55FC 3400828C */  lw         $v0, 0x34($a0)
/* A5E00 800B5600 00000000 */  nop
/* A5E04 800B5604 07006214 */  bne        $v1, $v0, .L800B5624
/* A5E08 800B5608 00000000 */   nop
/* A5E0C 800B560C 3C00828C */  lw         $v0, 0x3C($a0)
/* A5E10 800B5610 00000000 */  nop
/* A5E14 800B5614 00204228 */  slti       $v0, $v0, 0x2000
/* A5E18 800B5618 02004010 */  beqz       $v0, .L800B5624
/* A5E1C 800B561C 00000000 */   nop
/* A5E20 800B5620 02000524 */  addiu      $a1, $zero, 0x2
.L800B5624:
/* A5E24 800B5624 0800E003 */  jr         $ra
/* A5E28 800B5628 2110A000 */   addu      $v0, $a1, $zero
.size SAVE_SaveableInstance, . - SAVE_SaveableInstance
