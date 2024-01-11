.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_Init
/* 30CC4 800404C4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 30CC8 800404C8 1000A427 */  addiu      $a0, $sp, 0x10
/* 30CCC 800404CC 2800B0AF */  sw         $s0, 0x28($sp)
/* 30CD0 800404D0 01001024 */  addiu      $s0, $zero, 0x1
/* 30CD4 800404D4 04000224 */  addiu      $v0, $zero, 0x4
/* 30CD8 800404D8 1400A2AF */  sw         $v0, 0x14($sp)
/* 30CDC 800404DC 0680023C */  lui        $v0, %hi(LOAD_NonBlockingFileLoad)
/* 30CE0 800404E0 EC074224 */  addiu      $v0, $v0, %lo(LOAD_NonBlockingFileLoad)
/* 30CE4 800404E4 1800A2AF */  sw         $v0, 0x18($sp)
/* 30CE8 800404E8 0680023C */  lui        $v0, %hi(LOAD_NonBlockingBufferedLoad)
/* 30CEC 800404EC 2C084224 */  addiu      $v0, $v0, %lo(LOAD_NonBlockingBufferedLoad)
/* 30CF0 800404F0 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 30CF4 800404F4 0580023C */  lui        $v0, %hi(MEMPACK_Malloc)
/* 30CF8 800404F8 04024224 */  addiu      $v0, $v0, %lo(MEMPACK_Malloc)
/* 30CFC 800404FC 2000A2AF */  sw         $v0, 0x20($sp)
/* 30D00 80040500 0580023C */  lui        $v0, %hi(MEMPACK_Free)
/* 30D04 80040504 98044224 */  addiu      $v0, $v0, %lo(MEMPACK_Free)
/* 30D08 80040508 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 30D0C 8004050C 1000B0AF */  sw         $s0, 0x10($sp)
/* 30D10 80040510 A446010C */  jal        aadGetMemorySize
/* 30D14 80040514 2400A2AF */   sw        $v0, 0x24($sp)
/* 30D18 80040518 1000A427 */  addiu      $a0, $sp, 0x10
/* 30D1C 8004051C 0D80053C */  lui        $a1, %hi(soundBuffer)
/* 30D20 80040520 AD46010C */  jal        aadInit
/* 30D24 80040524 BC75A524 */   addiu     $a1, $a1, %lo(soundBuffer)
/* 30D28 80040528 FF3F0224 */  addiu      $v0, $zero, 0x3FFF
/* 30D2C 8004052C 78BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x1B0)($gp)
/* 30D30 80040530 6F01010C */  jal        SOUND_SetMusicVolume
/* 30D34 80040534 7F000424 */   addiu     $a0, $zero, 0x7F
/* 30D38 80040538 7C01010C */  jal        SOUND_SetSfxVolume
/* 30D3C 8004053C 7F000424 */   addiu     $a0, $zero, 0x7F
/* 30D40 80040540 8901010C */  jal        SOUND_SetVoiceVolume
/* 30D44 80040544 50000424 */   addiu     $a0, $zero, 0x50
/* 30D48 80040548 88BF90A3 */  sb         $s0, %gp_rel(gameTrackerX + 0x1C0)($gp)
/* 30D4C 8004054C 89BF90A3 */  sb         $s0, %gp_rel(gameTrackerX + 0x1C1)($gp)
/* 30D50 80040550 8ABF90A3 */  sb         $s0, %gp_rel(gameTrackerX + 0x1C2)($gp)
/* 30D54 80040554 8BBF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x1C3)($gp)
/* 30D58 80040558 7902010C */  jal        SOUND_MusicInit
/* 30D5C 8004055C 00000000 */   nop
/* 30D60 80040560 3151010C */  jal        aadInitReverb
/* 30D64 80040564 00000000 */   nop
/* 30D68 80040568 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 30D6C 8004056C 2800B08F */  lw         $s0, 0x28($sp)
/* 30D70 80040570 0800E003 */  jr         $ra
/* 30D74 80040574 3000BD27 */   addiu     $sp, $sp, 0x30
.size SOUND_Init, . - SOUND_Init
