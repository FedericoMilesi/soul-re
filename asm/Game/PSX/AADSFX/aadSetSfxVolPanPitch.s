.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadSetSfxVolPanPitch
/* 47A1C 8005721C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 47A20 80057220 1800B0AF */  sw         $s0, 0x18($sp)
/* 47A24 80057224 21808000 */  addu       $s0, $a0, $zero
/* 47A28 80057228 003C0700 */  sll        $a3, $a3, 16
/* 47A2C 8005722C 033C0700 */  sra        $a3, $a3, 16
/* 47A30 80057230 03000424 */  addiu      $a0, $zero, 0x3
/* 47A34 80057234 FF00A530 */  andi       $a1, $a1, 0xFF
/* 47A38 80057238 FF00C630 */  andi       $a2, $a2, 0xFF
/* 47A3C 8005723C 1000A7AF */  sw         $a3, 0x10($sp)
/* 47A40 80057240 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 47A44 80057244 AA5C010C */  jal        aadPutSfxCommand
/* 47A48 80057248 21380002 */   addu      $a3, $s0, $zero
/* 47A4C 8005724C 21100002 */  addu       $v0, $s0, $zero
/* 47A50 80057250 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 47A54 80057254 1800B08F */  lw         $s0, 0x18($sp)
/* 47A58 80057258 0800E003 */  jr         $ra
/* 47A5C 8005725C 2000BD27 */   addiu     $sp, $sp, 0x20
.size aadSetSfxVolPanPitch, . - aadSetSfxVolPanPitch
