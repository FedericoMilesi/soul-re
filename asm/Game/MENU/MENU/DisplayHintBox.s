.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DisplayHintBox
/* A81C8 800B79C8 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* A81CC 800B79CC 4C00BFAF */  sw         $ra, 0x4C($sp)
/* A81D0 800B79D0 4800B0AF */  sw         $s0, 0x48($sp)
/* A81D4 800B79D4 21800000 */  addu       $s0, $zero, $zero
/* A81D8 800B79D8 43200400 */  sra        $a0, $a0, 1
/* A81DC 800B79DC FB000224 */  addiu      $v0, $zero, 0xFB
/* A81E0 800B79E0 23104400 */  subu       $v0, $v0, $a0
/* A81E4 800B79E4 05018424 */  addiu      $a0, $a0, 0x105
/* A81E8 800B79E8 3800A2AF */  sw         $v0, 0x38($sp)
/* A81EC 800B79EC FFFFA224 */  addiu      $v0, $a1, -0x1
/* A81F0 800B79F0 0D00A524 */  addiu      $a1, $a1, 0xD
/* A81F4 800B79F4 3C00A4AF */  sw         $a0, 0x3C($sp)
/* A81F8 800B79F8 4000A2AF */  sw         $v0, 0x40($sp)
/* A81FC 800B79FC 4400A5AF */  sw         $a1, 0x44($sp)
.L800B7A00:
/* A8200 800B7A00 3800A48F */  lw         $a0, 0x38($sp)
/* A8204 800B7A04 4000A58F */  lw         $a1, 0x40($sp)
/* A8208 800B7A08 4400A88F */  lw         $t0, 0x44($sp)
/* A820C 800B7A0C 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* A8210 800B7A10 1000A4AF */  sw         $a0, 0x10($sp)
/* A8214 800B7A14 2110A000 */  addu       $v0, $a1, $zero
/* A8218 800B7A18 F2FF8424 */  addiu      $a0, $a0, -0xE
/* A821C 800B7A1C 2128A800 */  addu       $a1, $a1, $t0
/* A8220 800B7A20 1400A2AF */  sw         $v0, 0x14($sp)
/* A8224 800B7A24 3C00A28F */  lw         $v0, 0x3C($sp)
/* A8228 800B7A28 43280500 */  sra        $a1, $a1, 1
/* A822C 800B7A2C 1800A2AF */  sw         $v0, 0x18($sp)
/* A8230 800B7A30 9CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* A8234 800B7A34 21300001 */  addu       $a2, $t0, $zero
/* A8238 800B7A38 2000A0AF */  sw         $zero, 0x20($sp)
/* A823C 800B7A3C 2400A0AF */  sw         $zero, 0x24($sp)
/* A8240 800B7A40 2800A0AF */  sw         $zero, 0x28($sp)
/* A8244 800B7A44 2C00A0AF */  sw         $zero, 0x2C($sp)
/* A8248 800B7A48 3000A3AF */  sw         $v1, 0x30($sp)
/* A824C 800B7A4C 1C00A6AF */  sw         $a2, 0x1C($sp)
/* A8250 800B7A50 04004224 */  addiu      $v0, $v0, 0x4
/* A8254 800B7A54 3400A2AF */  sw         $v0, 0x34($sp)
/* A8258 800B7A58 3800A68F */  lw         $a2, 0x38($sp)
/* A825C 800B7A5C 2FAB000C */  jal        DRAW_TranslucentQuad
/* A8260 800B7A60 21380001 */   addu      $a3, $t0, $zero
/* A8264 800B7A64 3C00A28F */  lw         $v0, 0x3C($sp)
/* A8268 800B7A68 00000000 */  nop
/* A826C 800B7A6C 1000A2AF */  sw         $v0, 0x10($sp)
/* A8270 800B7A70 4000A28F */  lw         $v0, 0x40($sp)
/* A8274 800B7A74 00000000 */  nop
/* A8278 800B7A78 1400A2AF */  sw         $v0, 0x14($sp)
/* A827C 800B7A7C 3C00A28F */  lw         $v0, 0x3C($sp)
/* A8280 800B7A80 08BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x40)($gp)
/* A8284 800B7A84 0E004224 */  addiu      $v0, $v0, 0xE
/* A8288 800B7A88 1800A2AF */  sw         $v0, 0x18($sp)
/* A828C 800B7A8C 4000A38F */  lw         $v1, 0x40($sp)
/* A8290 800B7A90 4400A58F */  lw         $a1, 0x44($sp)
/* A8294 800B7A94 9CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* A8298 800B7A98 2000A0AF */  sw         $zero, 0x20($sp)
/* A829C 800B7A9C 2400A0AF */  sw         $zero, 0x24($sp)
/* A82A0 800B7AA0 2800A0AF */  sw         $zero, 0x28($sp)
/* A82A4 800B7AA4 2C00A0AF */  sw         $zero, 0x2C($sp)
/* A82A8 800B7AA8 3000A4AF */  sw         $a0, 0x30($sp)
/* A82AC 800B7AAC 04004224 */  addiu      $v0, $v0, 0x4
/* A82B0 800B7AB0 21186500 */  addu       $v1, $v1, $a1
/* A82B4 800B7AB4 43180300 */  sra        $v1, $v1, 1
/* A82B8 800B7AB8 3400A2AF */  sw         $v0, 0x34($sp)
/* A82BC 800B7ABC 1C00A3AF */  sw         $v1, 0x1C($sp)
/* A82C0 800B7AC0 3800A48F */  lw         $a0, 0x38($sp)
/* A82C4 800B7AC4 4000A58F */  lw         $a1, 0x40($sp)
/* A82C8 800B7AC8 3C00A68F */  lw         $a2, 0x3C($sp)
/* A82CC 800B7ACC 4400A78F */  lw         $a3, 0x44($sp)
/* A82D0 800B7AD0 2FAB000C */  jal        DRAW_TranslucentQuad
/* A82D4 800B7AD4 01001026 */   addiu     $s0, $s0, 0x1
/* A82D8 800B7AD8 0200022A */  slti       $v0, $s0, 0x2
/* A82DC 800B7ADC C8FF4014 */  bnez       $v0, .L800B7A00
/* A82E0 800B7AE0 00000000 */   nop
/* A82E4 800B7AE4 4C00BF8F */  lw         $ra, 0x4C($sp)
/* A82E8 800B7AE8 4800B08F */  lw         $s0, 0x48($sp)
/* A82EC 800B7AEC 0800E003 */  jr         $ra
/* A82F0 800B7AF0 5000BD27 */   addiu     $sp, $sp, 0x50
.size DisplayHintBox, . - DisplayHintBox
