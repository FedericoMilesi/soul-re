.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Glyph_DoFX
/* 6C958 8007C158 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6C95C 8007C15C 3ABF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x172)($gp)
/* 6C960 8007C160 06000224 */  addiu      $v0, $zero, 0x6
/* 6C964 8007C164 24006210 */  beq        $v1, $v0, .L8007C1F8
/* 6C968 8007C168 1000BFAF */   sw        $ra, 0x10($sp)
/* 6C96C 8007C16C 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 6C970 8007C170 1000033C */  lui        $v1, (0x100000 >> 16)
/* 6C974 8007C174 24104300 */  and        $v0, $v0, $v1
/* 6C978 8007C178 1F004014 */  bnez       $v0, .L8007C1F8
/* 6C97C 8007C17C 00000000 */   nop
/* 6C980 8007C180 F0A48587 */  lh         $a1, %gp_rel(fx_going)($gp)
/* 6C984 8007C184 00000000 */  nop
/* 6C988 8007C188 1B00A010 */  beqz       $a1, .L8007C1F8
/* 6C98C 8007C18C 00000000 */   nop
/* 6C990 8007C190 12EF010C */  jal        Glyph_Broadcast
/* 6C994 8007C194 00000000 */   nop
/* 6C998 8007C198 F4A4828F */  lw         $v0, %gp_rel(fx_blastring)($gp)
/* 6C99C 8007C19C 00000000 */  nop
/* 6C9A0 8007C1A0 3C00438C */  lw         $v1, 0x3C($v0)
/* 6C9A4 8007C1A4 00000000 */  nop
/* 6C9A8 8007C1A8 21206000 */  addu       $a0, $v1, $zero
/* 6C9AC 8007C1AC E8EC828F */  lw         $v0, %gp_rel(blast_range)($gp)
/* 6C9B0 8007C1B0 ECEC83AF */  sw         $v1, %gp_rel(fx_radius_old)($gp)
/* 6C9B4 8007C1B4 2A104400 */  slt        $v0, $v0, $a0
/* 6C9B8 8007C1B8 03004010 */  beqz       $v0, .L8007C1C8
/* 6C9BC 8007C1BC 00000000 */   nop
/* 6C9C0 8007C1C0 51F0010C */  jal        Glyph_EndFX
/* 6C9C4 8007C1C4 00000000 */   nop
.L8007C1C8:
/* 6C9C8 8007C1C8 F0A48387 */  lh         $v1, %gp_rel(fx_going)($gp)
/* 6C9CC 8007C1CC 05000224 */  addiu      $v0, $zero, 0x5
/* 6C9D0 8007C1D0 09006214 */  bne        $v1, $v0, .L8007C1F8
/* 6C9D4 8007C1D4 00000000 */   nop
/* 6C9D8 8007C1D8 F4A4828F */  lw         $v0, %gp_rel(fx_blastring)($gp)
/* 6C9DC 8007C1DC 00000000 */  nop
/* 6C9E0 8007C1E0 5C00438C */  lw         $v1, 0x5C($v0)
/* 6C9E4 8007C1E4 6400448C */  lw         $a0, 0x64($v0)
/* 6C9E8 8007C1E8 C4FF6324 */  addiu      $v1, $v1, -0x3C
/* 6C9EC 8007C1EC 3C008424 */  addiu      $a0, $a0, 0x3C
/* 6C9F0 8007C1F0 5C0043AC */  sw         $v1, 0x5C($v0)
/* 6C9F4 8007C1F4 640044AC */  sw         $a0, 0x64($v0)
.L8007C1F8:
/* 6C9F8 8007C1F8 1000BF8F */  lw         $ra, 0x10($sp)
/* 6C9FC 8007C1FC 00000000 */  nop
/* 6CA00 8007C200 0800E003 */  jr         $ra
/* 6CA04 8007C204 1800BD27 */   addiu     $sp, $sp, 0x18
.size Glyph_DoFX, . - Glyph_DoFX
