.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_BufferIntro
/* A61EC 800B59EC 44A8828F */  lw         $v0, %gp_rel(numbufferedIntros)($gp)
/* A61F0 800B59F0 00000000 */  nop
/* A61F4 800B59F4 40004228 */  slti       $v0, $v0, 0x40
/* A61F8 800B59F8 1A004010 */  beqz       $v0, .L800B5A64
/* A61FC 800B59FC 21280000 */   addu      $a1, $zero, $zero
/* A6200 800B5A00 ECFD8327 */  addiu      $v1, $gp, %gp_rel(bufferSavedIntroArray)
.L800B5A04:
/* A6204 800B5A04 0000628C */  lw         $v0, 0x0($v1)
/* A6208 800B5A08 00000000 */  nop
/* A620C 800B5A0C 06004410 */  beq        $v0, $a0, .L800B5A28
/* A6210 800B5A10 40000224 */   addiu     $v0, $zero, 0x40
/* A6214 800B5A14 0100A524 */  addiu      $a1, $a1, 0x1
/* A6218 800B5A18 4000A228 */  slti       $v0, $a1, 0x40
/* A621C 800B5A1C F9FF4014 */  bnez       $v0, .L800B5A04
/* A6220 800B5A20 04006324 */   addiu     $v1, $v1, 0x4
/* A6224 800B5A24 40000224 */  addiu      $v0, $zero, 0x40
.L800B5A28:
/* A6228 800B5A28 0E00A214 */  bne        $a1, $v0, .L800B5A64
/* A622C 800B5A2C 21280000 */   addu      $a1, $zero, $zero
/* A6230 800B5A30 44A8828F */  lw         $v0, %gp_rel(numbufferedIntros)($gp)
/* A6234 800B5A34 ECFD8327 */  addiu      $v1, $gp, %gp_rel(bufferSavedIntroArray)
/* A6238 800B5A38 01004224 */  addiu      $v0, $v0, 0x1
/* A623C 800B5A3C 44A882AF */  sw         $v0, %gp_rel(numbufferedIntros)($gp)
.L800B5A40:
/* A6240 800B5A40 0000628C */  lw         $v0, 0x0($v1)
/* A6244 800B5A44 00000000 */  nop
/* A6248 800B5A48 03004014 */  bnez       $v0, .L800B5A58
/* A624C 800B5A4C 0100A524 */   addiu     $a1, $a1, 0x1
/* A6250 800B5A50 0800E003 */  jr         $ra
/* A6254 800B5A54 000064AC */   sw        $a0, 0x0($v1)
.L800B5A58:
/* A6258 800B5A58 4000A228 */  slti       $v0, $a1, 0x40
/* A625C 800B5A5C F8FF4014 */  bnez       $v0, .L800B5A40
/* A6260 800B5A60 04006324 */   addiu     $v1, $v1, 0x4
.L800B5A64:
/* A6264 800B5A64 0800E003 */  jr         $ra
/* A6268 800B5A68 00000000 */   nop
.size SAVE_BufferIntro, . - SAVE_BufferIntro
