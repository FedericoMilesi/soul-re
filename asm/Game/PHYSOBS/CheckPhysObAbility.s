.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckPhysObAbility
/* 596C0 80068EC0 2400868C */  lw         $a2, 0x24($a0)
/* 596C4 80068EC4 00000000 */  nop
/* 596C8 80068EC8 1900C010 */  beqz       $a2, .L80068F30
/* 596CC 80068ECC 2138A000 */   addu      $a3, $a1, $zero
/* 596D0 80068ED0 0400C394 */  lhu        $v1, 0x4($a2)
/* 596D4 80068ED4 0BB00234 */  ori        $v0, $zero, 0xB00B
/* 596D8 80068ED8 03006210 */  beq        $v1, $v0, .L80068EE8
/* 596DC 80068EDC 03000224 */   addiu     $v0, $zero, 0x3
/* 596E0 80068EE0 0800E003 */  jr         $ra
/* 596E4 80068EE4 21100000 */   addu      $v0, $zero, $zero
.L80068EE8:
/* 596E8 80068EE8 0200C394 */  lhu        $v1, 0x2($a2)
/* 596EC 80068EEC 00000000 */  nop
/* 596F0 80068EF0 0A006214 */  bne        $v1, $v0, .L80068F1C
/* 596F4 80068EF4 FFFFE330 */   andi      $v1, $a3, 0xFFFF
/* 596F8 80068EF8 6C01828C */  lw         $v0, 0x16C($a0)
/* 596FC 80068EFC 00000000 */  nop
/* 59700 80068F00 04004284 */  lh         $v0, 0x4($v0)
/* 59704 80068F04 00000000 */  nop
/* 59708 80068F08 24104300 */  and        $v0, $v0, $v1
/* 5970C 80068F0C 09004010 */  beqz       $v0, .L80068F34
/* 59710 80068F10 21100000 */   addu      $v0, $zero, $zero
/* 59714 80068F14 0800E003 */  jr         $ra
/* 59718 80068F18 01000224 */   addiu     $v0, $zero, 0x1
.L80068F1C:
/* 5971C 80068F1C 0600C394 */  lhu        $v1, 0x6($a2)
/* 59720 80068F20 00000000 */  nop
/* 59724 80068F24 24186500 */  and        $v1, $v1, $a1
/* 59728 80068F28 02006014 */  bnez       $v1, .L80068F34
/* 5972C 80068F2C 01000224 */   addiu     $v0, $zero, 0x1
.L80068F30:
/* 59730 80068F30 21100000 */  addu       $v0, $zero, $zero
.L80068F34:
/* 59734 80068F34 0800E003 */  jr         $ra
/* 59738 80068F38 00000000 */   nop
.size CheckPhysObAbility, . - CheckPhysObAbility
