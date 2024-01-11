.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_PetrifiedEntry
/* 7C5B8 8008BDB8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7C5BC 8008BDBC 1400BFAF */  sw         $ra, 0x14($sp)
/* 7C5C0 8008BDC0 1000B0AF */  sw         $s0, 0x10($sp)
/* 7C5C4 8008BDC4 6C01908C */  lw         $s0, 0x16C($a0)
/* 7C5C8 8008BDC8 9006020C */  jal        MON_GetTime
/* 7C5CC 8008BDCC 00000000 */   nop
/* 7C5D0 8008BDD0 0000038E */  lw         $v1, 0x0($s0)
/* 7C5D4 8008BDD4 581B4224 */  addiu      $v0, $v0, 0x1B58
/* 7C5D8 8008BDD8 140102AE */  sw         $v0, 0x114($s0)
/* 7C5DC 8008BDDC 80006334 */  ori        $v1, $v1, 0x80
/* 7C5E0 8008BDE0 000003AE */  sw         $v1, 0x0($s0)
/* 7C5E4 8008BDE4 1400BF8F */  lw         $ra, 0x14($sp)
/* 7C5E8 8008BDE8 1000B08F */  lw         $s0, 0x10($sp)
/* 7C5EC 8008BDEC 0800E003 */  jr         $ra
/* 7C5F0 8008BDF0 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_PetrifiedEntry, . - MON_PetrifiedEntry
