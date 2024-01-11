.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_InterpToKeylistFrame
/* 803C8 8008FBC8 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 803CC 8008FBCC 2000B2AF */  sw         $s2, 0x20($sp)
/* 803D0 8008FBD0 21908000 */  addu       $s2, $a0, $zero
/* 803D4 8008FBD4 2800B4AF */  sw         $s4, 0x28($sp)
/* 803D8 8008FBD8 21A0A000 */  addu       $s4, $a1, $zero
/* 803DC 8008FBDC 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 803E0 8008FBE0 21A8C000 */  addu       $s5, $a2, $zero
/* 803E4 8008FBE4 3000B6AF */  sw         $s6, 0x30($sp)
/* 803E8 8008FBE8 21B0E000 */  addu       $s6, $a3, $zero
/* 803EC 8008FBEC 1800B0AF */  sw         $s0, 0x18($sp)
/* 803F0 8008FBF0 3400BFAF */  sw         $ra, 0x34($sp)
/* 803F4 8008FBF4 2400B3AF */  sw         $s3, 0x24($sp)
/* 803F8 8008FBF8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 803FC 8008FBFC 00004292 */  lbu        $v0, 0x0($s2)
/* 80400 8008FC00 4800A38F */  lw         $v1, 0x48($sp)
/* 80404 8008FC04 0F004010 */  beqz       $v0, .L8008FC44
/* 80408 8008FC08 21800000 */   addu      $s0, $zero, $zero
/* 8040C 8008FC0C 00140300 */  sll        $v0, $v1, 16
/* 80410 8008FC10 039C0200 */  sra        $s3, $v0, 16
/* 80414 8008FC14 24001124 */  addiu      $s1, $zero, 0x24
.L8008FC18:
/* 80418 8008FC18 21205102 */  addu       $a0, $s2, $s1
/* 8041C 8008FC1C 21288002 */  addu       $a1, $s4, $zero
/* 80420 8008FC20 2130A002 */  addu       $a2, $s5, $zero
/* 80424 8008FC24 2138C002 */  addu       $a3, $s6, $zero
/* 80428 8008FC28 0F40020C */  jal        G2AnimSection_InterpToKeylistFrame
/* 8042C 8008FC2C 1000B3AF */   sw        $s3, 0x10($sp)
/* 80430 8008FC30 00004292 */  lbu        $v0, 0x0($s2)
/* 80434 8008FC34 01001026 */  addiu      $s0, $s0, 0x1
/* 80438 8008FC38 2A100202 */  slt        $v0, $s0, $v0
/* 8043C 8008FC3C F6FF4014 */  bnez       $v0, .L8008FC18
/* 80440 8008FC40 30003126 */   addiu     $s1, $s1, 0x30
.L8008FC44:
/* 80444 8008FC44 3400BF8F */  lw         $ra, 0x34($sp)
/* 80448 8008FC48 3000B68F */  lw         $s6, 0x30($sp)
/* 8044C 8008FC4C 2C00B58F */  lw         $s5, 0x2C($sp)
/* 80450 8008FC50 2800B48F */  lw         $s4, 0x28($sp)
/* 80454 8008FC54 2400B38F */  lw         $s3, 0x24($sp)
/* 80458 8008FC58 2000B28F */  lw         $s2, 0x20($sp)
/* 8045C 8008FC5C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 80460 8008FC60 1800B08F */  lw         $s0, 0x18($sp)
/* 80464 8008FC64 0800E003 */  jr         $ra
/* 80468 8008FC68 3800BD27 */   addiu     $sp, $sp, 0x38
.size G2Anim_InterpToKeylistFrame, . - G2Anim_InterpToKeylistFrame
