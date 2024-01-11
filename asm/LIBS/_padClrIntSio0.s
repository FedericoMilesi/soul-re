.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _padClrIntSio0
/* B3774 800C2F74 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B3778 800C2F78 0D80033C */  lui        $v1, %hi(_padFixResult + 0x8)
/* B377C 800C2F7C 64E9638C */  lw         $v1, %lo(_padFixResult + 0x8)($v1)
/* B3780 800C2F80 0D80043C */  lui        $a0, %hi(_padFixResult + 0xC)
/* B3784 800C2F84 68E9848C */  lw         $a0, %lo(_padFixResult + 0xC)($a0)
/* B3788 800C2F88 7FFF0224 */  addiu      $v0, $zero, -0x81
/* B378C 800C2F8C 1000BFAF */  sw         $ra, 0x10($sp)
/* B3790 800C2F90 000062AC */  sw         $v0, 0x0($v1)
/* B3794 800C2F94 04008294 */  lhu        $v0, 0x4($a0)
/* B3798 800C2F98 00000000 */  nop
/* B379C 800C2F9C 80004230 */  andi       $v0, $v0, 0x80
/* B37A0 800C2FA0 0D004010 */  beqz       $v0, .L800C2FD8
/* B37A4 800C2FA4 00000000 */   nop
.L800C2FA8:
/* B37A8 800C2FA8 641E030C */  jal        chkRC2wait
/* B37AC 800C2FAC 00000000 */   nop
/* B37B0 800C2FB0 10004014 */  bnez       $v0, .L800C2FF4
/* B37B4 800C2FB4 21100000 */   addu      $v0, $zero, $zero
/* B37B8 800C2FB8 0D80023C */  lui        $v0, %hi(_padFixResult + 0xC)
/* B37BC 800C2FBC 68E9428C */  lw         $v0, %lo(_padFixResult + 0xC)($v0)
/* B37C0 800C2FC0 00000000 */  nop
/* B37C4 800C2FC4 04004294 */  lhu        $v0, 0x4($v0)
/* B37C8 800C2FC8 00000000 */  nop
/* B37CC 800C2FCC 80004230 */  andi       $v0, $v0, 0x80
/* B37D0 800C2FD0 F5FF4014 */  bnez       $v0, .L800C2FA8
/* B37D4 800C2FD4 00000000 */   nop
.L800C2FD8:
/* B37D8 800C2FD8 0D80043C */  lui        $a0, %hi(_padFixResult + 0xC)
/* B37DC 800C2FDC 68E9848C */  lw         $a0, %lo(_padFixResult + 0xC)($a0)
/* B37E0 800C2FE0 00000000 */  nop
/* B37E4 800C2FE4 0A008394 */  lhu        $v1, 0xA($a0)
/* B37E8 800C2FE8 01000224 */  addiu      $v0, $zero, 0x1
/* B37EC 800C2FEC 10006334 */  ori        $v1, $v1, 0x10
/* B37F0 800C2FF0 0A0083A4 */  sh         $v1, 0xA($a0)
.L800C2FF4:
/* B37F4 800C2FF4 1000BF8F */  lw         $ra, 0x10($sp)
/* B37F8 800C2FF8 1800BD27 */  addiu      $sp, $sp, 0x18
/* B37FC 800C2FFC 0800E003 */  jr         $ra
/* B3800 800C3000 00000000 */   nop
.size _padClrIntSio0, . - _padClrIntSio0
