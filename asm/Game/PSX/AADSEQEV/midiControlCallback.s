.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiControlCallback
/* 4660C 80055E0C D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 46610 80055E10 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46614 80055E14 1000BFAF */  sw         $ra, 0x10($sp)
/* 46618 80055E18 F81B438C */  lw         $v1, 0x1BF8($v0)
/* 4661C 80055E1C 00000000 */  nop
/* 46620 80055E20 07006010 */  beqz       $v1, .L80055E40
/* 46624 80055E24 21388000 */   addu      $a3, $a0, $zero
/* 46628 80055E28 0500E690 */  lbu        $a2, 0x5($a3)
/* 4662C 80055E2C 001C448C */  lw         $a0, 0x1C00($v0)
/* 46630 80055E30 3F05A590 */  lbu        $a1, 0x53F($a1)
/* 46634 80055E34 0700E790 */  lbu        $a3, 0x7($a3)
/* 46638 80055E38 09F86000 */  jalr       $v1
/* 4663C 80055E3C 0F00C630 */   andi      $a2, $a2, 0xF
.L80055E40:
/* 46640 80055E40 1000BF8F */  lw         $ra, 0x10($sp)
/* 46644 80055E44 00000000 */  nop
/* 46648 80055E48 0800E003 */  jr         $ra
/* 4664C 80055E4C 1800BD27 */   addiu     $sp, $sp, 0x18
.size midiControlCallback, . - midiControlCallback
