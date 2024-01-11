.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BreakDraw
/* B0DD0 800C05D0 0D80043C */  lui        $a0, %hi(CD_read_dma_mode + 0x344)
/* B0DD4 800C05D4 84E7848C */  lw         $a0, %lo(CD_read_dma_mode + 0x344)($a0)
/* B0DD8 800C05D8 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* B0DDC 800C05DC 0000828C */  lw         $v0, 0x0($a0)
/* B0DE0 800C05E0 0001033C */  lui        $v1, (0x1000000 >> 16)
/* B0DE4 800C05E4 24104300 */  and        $v0, $v0, $v1
/* B0DE8 800C05E8 1C004010 */  beqz       $v0, .L800C065C
/* B0DEC 800C05EC 21100000 */   addu      $v0, $zero, $zero
/* B0DF0 800C05F0 0000828C */  lw         $v0, 0x0($a0)
/* B0DF4 800C05F4 04000324 */  addiu      $v1, $zero, 0x4
/* B0DF8 800C05F8 00074230 */  andi       $v0, $v0, 0x700
/* B0DFC 800C05FC 02120200 */  srl        $v0, $v0, 8
/* B0E00 800C0600 16004314 */  bne        $v0, $v1, .L800C065C
/* B0E04 800C0604 FFFF0224 */   addiu     $v0, $zero, -0x1
/* B0E08 800C0608 FFFE033C */  lui        $v1, (0xFEFFFFFF >> 16)
/* B0E0C 800C060C 0000828C */  lw         $v0, 0x0($a0)
/* B0E10 800C0610 FFFF6334 */  ori        $v1, $v1, (0xFEFFFFFF & 0xFFFF)
/* B0E14 800C0614 24104300 */  and        $v0, $v0, $v1
/* B0E18 800C0618 000082AC */  sw         $v0, 0x0($a0)
/* B0E1C 800C061C 0D80023C */  lui        $v0, %hi(CD_read_dma_mode + 0x344)
/* B0E20 800C0620 84E7428C */  lw         $v0, %lo(CD_read_dma_mode + 0x344)($v0)
/* B0E24 800C0624 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x33C)
/* B0E28 800C0628 7CE7638C */  lw         $v1, %lo(CD_read_dma_mode + 0x33C)($v1)
/* B0E2C 800C062C 0000428C */  lw         $v0, 0x0($v0)
/* B0E30 800C0630 00000000 */  nop
/* B0E34 800C0634 0000A2AF */  sw         $v0, 0x0($sp)
/* B0E38 800C0638 0000628C */  lw         $v0, 0x0($v1)
/* B0E3C 800C063C FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* B0E40 800C0640 0000A2AF */  sw         $v0, 0x0($sp)
/* B0E44 800C0644 0000A28F */  lw         $v0, 0x0($sp)
/* B0E48 800C0648 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* B0E4C 800C064C 24104300 */  and        $v0, $v0, $v1
/* B0E50 800C0650 02004310 */  beq        $v0, $v1, .L800C065C
/* B0E54 800C0654 21100000 */   addu      $v0, $zero, $zero
/* B0E58 800C0658 0000A28F */  lw         $v0, 0x0($sp)
.L800C065C:
/* B0E5C 800C065C 0800E003 */  jr         $ra
/* B0E60 800C0660 0800BD27 */   addiu     $sp, $sp, 0x8
.size BreakDraw, . - BreakDraw
