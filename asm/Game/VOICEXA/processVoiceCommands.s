.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel processVoiceCommands
/* A75C0 800B6DC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A75C4 800B6DC4 1400B1AF */  sw         $s1, 0x14($sp)
/* A75C8 800B6DC8 21888000 */  addu       $s1, $a0, $zero
/* A75CC 800B6DCC 1800BFAF */  sw         $ra, 0x18($sp)
/* A75D0 800B6DD0 1000B0AF */  sw         $s0, 0x10($sp)
/* A75D4 800B6DD4 A8002292 */  lbu        $v0, 0xA8($s1)
/* A75D8 800B6DD8 00000000 */  nop
/* A75DC 800B6DDC 1F004010 */  beqz       $v0, .L800B6E5C
/* A75E0 800B6DE0 FFFF4224 */   addiu     $v0, $v0, -0x1
/* A75E4 800B6DE4 A7002392 */  lbu        $v1, 0xA7($s1)
/* A75E8 800B6DE8 A80022A2 */  sb         $v0, 0xA8($s1)
/* A75EC 800B6DEC FF006230 */  andi       $v0, $v1, 0xFF
/* A75F0 800B6DF0 01006324 */  addiu      $v1, $v1, 0x1
/* A75F4 800B6DF4 80100200 */  sll        $v0, $v0, 2
/* A75F8 800B6DF8 60004224 */  addiu      $v0, $v0, 0x60
/* A75FC 800B6DFC 21802202 */  addu       $s0, $s1, $v0
/* A7600 800B6E00 A70023A2 */  sb         $v1, 0xA7($s1)
/* A7604 800B6E04 FF006330 */  andi       $v1, $v1, 0xFF
/* A7608 800B6E08 10000224 */  addiu      $v0, $zero, 0x10
/* A760C 800B6E0C 02006214 */  bne        $v1, $v0, .L800B6E18
/* A7610 800B6E10 00000000 */   nop
/* A7614 800B6E14 A70020A2 */  sb         $zero, 0xA7($s1)
.L800B6E18:
/* A7618 800B6E18 00000292 */  lbu        $v0, 0x0($s0)
/* A761C 800B6E1C 00000000 */  nop
/* A7620 800B6E20 0500422C */  sltiu      $v0, $v0, 0x5
/* A7624 800B6E24 0D004010 */  beqz       $v0, .L800B6E5C
/* A7628 800B6E28 00000000 */   nop
/* A762C 800B6E2C 30A98327 */  addiu      $v1, $gp, %gp_rel(voiceCmdTbl)
/* A7630 800B6E30 00000292 */  lbu        $v0, 0x0($s0)
/* A7634 800B6E34 02000586 */  lh         $a1, 0x2($s0)
/* A7638 800B6E38 80100200 */  sll        $v0, $v0, 2
/* A763C 800B6E3C 21104300 */  addu       $v0, $v0, $v1
/* A7640 800B6E40 0000428C */  lw         $v0, 0x0($v0)
/* A7644 800B6E44 00000000 */  nop
/* A7648 800B6E48 09F84000 */  jalr       $v0
/* A764C 800B6E4C 21202002 */   addu      $a0, $s1, $zero
/* A7650 800B6E50 01000292 */  lbu        $v0, 0x1($s0)
/* A7654 800B6E54 00000000 */  nop
/* A7658 800B6E58 AA0022A2 */  sb         $v0, 0xAA($s1)
.L800B6E5C:
/* A765C 800B6E5C 1800BF8F */  lw         $ra, 0x18($sp)
/* A7660 800B6E60 1400B18F */  lw         $s1, 0x14($sp)
/* A7664 800B6E64 1000B08F */  lw         $s0, 0x10($sp)
/* A7668 800B6E68 0800E003 */  jr         $ra
/* A766C 800B6E6C 2000BD27 */   addiu     $sp, $sp, 0x20
.size processVoiceCommands, . - processVoiceCommands
