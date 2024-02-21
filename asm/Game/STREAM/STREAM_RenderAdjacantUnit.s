.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_RenderAdjacantUnit
/* 4FBC8 8005F3C8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4FBCC 8005F3CC 2400B3AF */  sw         $s3, 0x24($sp)
/* 4FBD0 8005F3D0 21988000 */  addu       $s3, $a0, $zero
/* 4FBD4 8005F3D4 1800B0AF */  sw         $s0, 0x18($sp)
/* 4FBD8 8005F3D8 2180A000 */  addu       $s0, $a1, $zero
/* 4FBDC 8005F3DC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 4FBE0 8005F3E0 2188C000 */  addu       $s1, $a2, $zero
/* 4FBE4 8005F3E4 2800BFAF */  sw         $ra, 0x28($sp)
/* 4FBE8 8005F3E8 2000B2AF */  sw         $s2, 0x20($sp)
/* 4FBEC 8005F3EC 0800248E */  lw         $a0, 0x8($s1)
/* 4FBF0 8005F3F0 B841010C */  jal        MEMPACK_MemoryValidFunc
/* 4FBF4 8005F3F4 2190E000 */   addu      $s2, $a3, $zero
/* 4FBF8 8005F3F8 17004010 */  beqz       $v0, .L8005F458
/* 4FBFC 8005F3FC 21200002 */   addu      $a0, $s0, $zero
/* 4FC00 8005F400 0800468E */  lw         $a2, 0x8($s2)
/* 4FC04 8005F404 00002296 */  lhu        $v0, 0x0($s1)
/* 4FC08 8005F408 00000000 */  nop
/* 4FC0C 8005F40C 4CBA82A7 */  sh         $v0, %gp_rel(RENDER_currentStreamUnitID)($gp)
/* 4FC10 8005F410 EE7B010C */  jal        GetFogColor
/* 4FC14 8005F414 21284002 */   addu      $a1, $s2, $zero
/* 4FC18 8005F418 FF0B0624 */  addiu      $a2, $zero, 0xBFF
/* 4FC1C 8005F41C 21386002 */  addu       $a3, $s3, $zero
/* 4FC20 8005F420 4000A48F */  lw         $a0, 0x40($sp)
/* 4FC24 8005F424 08BE858F */  lw         $a1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 4FC28 8005F428 21804000 */  addu       $s0, $v0, $zero
/* 4FC2C 8005F42C B77C010C */  jal        DrawFogRectangle
/* 4FC30 8005F430 1000B0AF */   sw        $s0, 0x10($sp)
/* 4FC34 8005F434 CDFD020C */  jal        PushMatrix
/* 4FC38 8005F438 00000000 */   nop
/* 4FC3C 8005F43C 21202002 */  addu       $a0, $s1, $zero
/* 4FC40 8005F440 21306002 */  addu       $a2, $s3, $zero
/* 4FC44 8005F444 0800458E */  lw         $a1, 0x8($s2)
/* 4FC48 8005F448 57BC000C */  jal        StreamRenderLevel
/* 4FC4C 8005F44C 21380002 */   addu      $a3, $s0, $zero
/* 4FC50 8005F450 F6FD020C */  jal        PopMatrix
/* 4FC54 8005F454 00000000 */   nop
.L8005F458:
/* 4FC58 8005F458 2800BF8F */  lw         $ra, 0x28($sp)
/* 4FC5C 8005F45C 2400B38F */  lw         $s3, 0x24($sp)
/* 4FC60 8005F460 2000B28F */  lw         $s2, 0x20($sp)
/* 4FC64 8005F464 1C00B18F */  lw         $s1, 0x1C($sp)
/* 4FC68 8005F468 1800B08F */  lw         $s0, 0x18($sp)
/* 4FC6C 8005F46C 0800E003 */  jr         $ra
/* 4FC70 8005F470 3000BD27 */   addiu     $sp, $sp, 0x30
.size STREAM_RenderAdjacantUnit, . - STREAM_RenderAdjacantUnit
