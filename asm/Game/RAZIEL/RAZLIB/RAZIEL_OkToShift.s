.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_OkToShift
/* 96054 800A5854 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 96058 800A5858 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 9605C 800A585C 02000224 */  addiu      $v0, $zero, 0x2
/* 96060 800A5860 1C006214 */  bne        $v1, $v0, .L800A58D4
/* 96064 800A5864 1000BFAF */   sw        $ra, 0x10($sp)
/* 96068 800A5868 0492020C */  jal        GetMaxHealth
/* 9606C 800A586C 00000000 */   nop
/* 96070 800A5870 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 96074 800A5874 00000000 */  nop
/* 96078 800A5878 17006214 */  bne        $v1, $v0, .L800A58D8
/* 9607C 800A587C 21100000 */   addu      $v0, $zero, $zero
/* 96080 800A5880 38FA838F */  lw         $v1, %gp_rel(Raziel + 0x408)($gp)
/* 96084 800A5884 00000000 */  nop
/* 96088 800A5888 40006230 */  andi       $v0, $v1, 0x40
/* 9608C 800A588C 0C004010 */  beqz       $v0, .L800A58C0
/* 96090 800A5890 00000000 */   nop
/* 96094 800A5894 10006230 */  andi       $v0, $v1, 0x10
/* 96098 800A5898 0F004014 */  bnez       $v0, .L800A58D8
/* 9609C 800A589C 01000224 */   addiu     $v0, $zero, 0x1
/* 960A0 800A58A0 0D80043C */  lui        $a0, %hi(ZoneDelta + 0xC)
/* 960A4 800A58A4 C3B5000C */  jal        FONT_Print
/* 960A8 800A58A8 241D8424 */   addiu     $a0, $a0, %lo(ZoneDelta + 0xC)
/* 960AC 800A58AC 0D80043C */  lui        $a0, %hi(ZoneDelta + 0x48)
/* 960B0 800A58B0 C3B5000C */  jal        FONT_Print
/* 960B4 800A58B4 601D8424 */   addiu     $a0, $a0, %lo(ZoneDelta + 0x48)
/* 960B8 800A58B8 36960208 */  j          .L800A58D8
/* 960BC 800A58BC 21100000 */   addu      $v0, $zero, $zero
.L800A58C0:
/* 960C0 800A58C0 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 960C4 800A58C4 00000000 */  nop
/* 960C8 800A58C8 40004230 */  andi       $v0, $v0, 0x40
/* 960CC 800A58CC 36960208 */  j          .L800A58D8
/* 960D0 800A58D0 2B100200 */   sltu      $v0, $zero, $v0
.L800A58D4:
/* 960D4 800A58D4 01000224 */  addiu      $v0, $zero, 0x1
.L800A58D8:
/* 960D8 800A58D8 1000BF8F */  lw         $ra, 0x10($sp)
/* 960DC 800A58DC 00000000 */  nop
/* 960E0 800A58E0 0800E003 */  jr         $ra
/* 960E4 800A58E4 1800BD27 */   addiu     $sp, $sp, 0x18
.size RAZIEL_OkToShift, . - RAZIEL_OkToShift
