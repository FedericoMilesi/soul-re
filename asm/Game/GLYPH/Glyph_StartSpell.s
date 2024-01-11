.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Glyph_StartSpell
/* 6C3A0 8007BBA0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6C3A4 8007BBA4 1000BFAF */  sw         $ra, 0x10($sp)
/* 6C3A8 8007BBA8 FFFFA324 */  addiu      $v1, $a1, -0x1
/* 6C3AC 8007BBAC 0700622C */  sltiu      $v0, $v1, 0x7
/* 6C3B0 8007BBB0 1D004010 */  beqz       $v0, .L8007BC28
/* 6C3B4 8007BBB4 21300000 */   addu      $a2, $zero, $zero
/* 6C3B8 8007BBB8 0180023C */  lui        $v0, %hi(jtbl_80011DD8)
/* 6C3BC 8007BBBC D81D4224 */  addiu      $v0, $v0, %lo(jtbl_80011DD8)
/* 6C3C0 8007BBC0 80180300 */  sll        $v1, $v1, 2
/* 6C3C4 8007BBC4 21186200 */  addu       $v1, $v1, $v0
/* 6C3C8 8007BBC8 0000628C */  lw         $v0, 0x0($v1)
/* 6C3CC 8007BBCC 00000000 */  nop
/* 6C3D0 8007BBD0 08004000 */  jr         $v0
/* 6C3D4 8007BBD4 00000000 */   nop
jlabel .L8007BBD8
/* 6C3D8 8007BBD8 0800063C */  lui        $a2, (0x80006 >> 16)
/* 6C3DC 8007BBDC 0AEF0108 */  j          .L8007BC28
/* 6C3E0 8007BBE0 0600C634 */   ori       $a2, $a2, (0x80006 & 0xFFFF)
jlabel .L8007BBE4
/* 6C3E4 8007BBE4 0800063C */  lui        $a2, (0x80004 >> 16)
/* 6C3E8 8007BBE8 0AEF0108 */  j          .L8007BC28
/* 6C3EC 8007BBEC 0400C634 */   ori       $a2, $a2, (0x80004 & 0xFFFF)
jlabel .L8007BBF0
/* 6C3F0 8007BBF0 0800063C */  lui        $a2, (0x80005 >> 16)
/* 6C3F4 8007BBF4 0AEF0108 */  j          .L8007BC28
/* 6C3F8 8007BBF8 0500C634 */   ori       $a2, $a2, (0x80005 & 0xFFFF)
jlabel .L8007BBFC
/* 6C3FC 8007BBFC 0800063C */  lui        $a2, (0x80002 >> 16)
/* 6C400 8007BC00 0AEF0108 */  j          .L8007BC28
/* 6C404 8007BC04 0200C634 */   ori       $a2, $a2, (0x80002 & 0xFFFF)
jlabel .L8007BC08
/* 6C408 8007BC08 0800063C */  lui        $a2, (0x80001 >> 16)
/* 6C40C 8007BC0C 0AEF0108 */  j          .L8007BC28
/* 6C410 8007BC10 0100C634 */   ori       $a2, $a2, (0x80001 & 0xFFFF)
jlabel .L8007BC14
/* 6C414 8007BC14 0800063C */  lui        $a2, (0x80003 >> 16)
/* 6C418 8007BC18 0AEF0108 */  j          .L8007BC28
/* 6C41C 8007BC1C 0300C634 */   ori       $a2, $a2, (0x80003 & 0xFFFF)
jlabel .L8007BC20
/* 6C420 8007BC20 0800063C */  lui        $a2, (0x80007 >> 16)
/* 6C424 8007BC24 0700C634 */  ori        $a2, $a2, (0x80007 & 0xFFFF)
.L8007BC28:
/* 6C428 8007BC28 2128C000 */  addu       $a1, $a2, $zero
/* 6C42C 8007BC2C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6C430 8007BC30 A1D1000C */  jal        INSTANCE_Post
/* 6C434 8007BC34 21300000 */   addu      $a2, $zero, $zero
/* 6C438 8007BC38 1000BF8F */  lw         $ra, 0x10($sp)
/* 6C43C 8007BC3C 00000000 */  nop
/* 6C440 8007BC40 0800E003 */  jr         $ra
/* 6C444 8007BC44 1800BD27 */   addiu     $sp, $sp, 0x18
.size Glyph_StartSpell, . - Glyph_StartSpell
