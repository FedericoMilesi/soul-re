.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_RelocateCamera
/* E464 8001DC64 0400838C */  lw         $v1, 0x4($a0)
/* E468 8001DC68 00000000 */  nop
/* E46C 8001DC6C 02006010 */  beqz       $v1, .L8001DC78
/* E470 8001DC70 21100000 */   addu      $v0, $zero, $zero
/* E474 8001DC74 21106500 */  addu       $v0, $v1, $a1
.L8001DC78:
/* E478 8001DC78 0800E003 */  jr         $ra
/* E47C 8001DC7C 040082AC */   sw        $v0, 0x4($a0)
.size SIGNAL_RelocateCamera, . - SIGNAL_RelocateCamera
