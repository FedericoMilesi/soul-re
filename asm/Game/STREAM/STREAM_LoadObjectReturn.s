.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_LoadObjectReturn
/* 49440 80058C40 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 49444 80058C44 5000B0AF */  sw         $s0, 0x50($sp)
/* 49448 80058C48 21808000 */  addu       $s0, $a0, $zero
/* 4944C 80058C4C 5400B1AF */  sw         $s1, 0x54($sp)
/* 49450 80058C50 2188A000 */  addu       $s1, $a1, $zero
/* 49454 80058C54 5800BFAF */  sw         $ra, 0x58($sp)
/* 49458 80058C58 EBF4020C */  jal        func_800BD3AC
/* 4945C 80058C5C 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 49460 80058C60 5890828F */  lw         $v0, %gp_rel(gameTimer)($gp)
/* 49464 80058C64 0000028E */  lw         $v0, 0x0($s0)
/* 49468 80058C68 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 4946C 80058C6C 24104300 */  and        $v0, $v0, $v1
/* 49470 80058C70 0B004010 */  beqz       $v0, .L80058CA0
/* 49474 80058C74 00000000 */   nop
/* 49478 80058C78 3C00058E */  lw         $a1, 0x3C($s0)
/* 4947C 80058C7C 00000000 */  nop
/* 49480 80058C80 0700A010 */  beqz       $a1, .L80058CA0
/* 49484 80058C84 00000000 */   nop
/* 49488 80058C88 4000048E */  lw         $a0, 0x40($s0)
/* 4948C 80058C8C 00000000 */  nop
/* 49490 80058C90 03008010 */  beqz       $a0, .L80058CA0
/* 49494 80058C94 00000000 */   nop
/* 49498 80058C98 E9F2010C */  jal        RELMOD_InitModulePointers
/* 4949C 80058C9C 00000000 */   nop
.L80058CA0:
/* 494A0 80058CA0 5B71010C */  jal        STREAM_PackVRAMObject
/* 494A4 80058CA4 21202002 */   addu      $a0, $s1, $zero
/* 494A8 80058CA8 81F9000C */  jal        OBTABLE_InitAnimPointers
/* 494AC 80058CAC 21202002 */   addu      $a0, $s1, $zero
/* 494B0 80058CB0 7FF8000C */  jal        OBTABLE_InitObjectWithID
/* 494B4 80058CB4 21200002 */   addu      $a0, $s0, $zero
/* 494B8 80058CB8 2C00028E */  lw         $v0, 0x2C($s0)
/* 494BC 80058CBC 8000033C */  lui        $v1, (0x800000 >> 16)
/* 494C0 80058CC0 24104300 */  and        $v0, $v0, $v1
/* 494C4 80058CC4 0F004010 */  beqz       $v0, .L80058D04
/* 494C8 80058CC8 1000A427 */   addiu     $a0, $sp, 0x10
/* 494CC 80058CCC 0D80053C */  lui        $a1, %hi(WarpRoomArray + 0x178)
/* 494D0 80058CD0 1018A524 */  addiu      $a1, $a1, %lo(WarpRoomArray + 0x178)
/* 494D4 80058CD4 21302002 */  addu       $a2, $s1, $zero
/* 494D8 80058CD8 1AD1010C */  jal        sprintf
/* 494DC 80058CDC 21382002 */   addu      $a3, $s1, $zero
/* 494E0 80058CE0 060000A6 */  sh         $zero, 0x6($s0)
/* 494E4 80058CE4 1FE0000C */  jal        LOAD_DoesFileExist
/* 494E8 80058CE8 1000A427 */   addiu     $a0, $sp, 0x10
/* 494EC 80058CEC 05004010 */  beqz       $v0, .L80058D04
/* 494F0 80058CF0 21202002 */   addu      $a0, $s1, $zero
/* 494F4 80058CF4 21280000 */  addu       $a1, $zero, $zero
/* 494F8 80058CF8 BF4A010C */  jal        aadLoadDynamicSfx
/* 494FC 80058CFC 2130A000 */   addu      $a2, $a1, $zero
/* 49500 80058D00 060002A6 */  sh         $v0, 0x6($s0)
.L80058D04:
/* 49504 80058D04 1800228E */  lw         $v0, 0x18($s1)
/* 49508 80058D08 00000000 */  nop
/* 4950C 80058D0C 02004014 */  bnez       $v0, .L80058D18
/* 49510 80058D10 04000224 */   addiu     $v0, $zero, 0x4
/* 49514 80058D14 02000224 */  addiu      $v0, $zero, 0x2
.L80058D18:
/* 49518 80058D18 140022A6 */  sh         $v0, 0x14($s1)
/* 4951C 80058D1C 5800BF8F */  lw         $ra, 0x58($sp)
/* 49520 80058D20 5400B18F */  lw         $s1, 0x54($sp)
/* 49524 80058D24 5000B08F */  lw         $s0, 0x50($sp)
/* 49528 80058D28 0800E003 */  jr         $ra
/* 4952C 80058D2C 6000BD27 */   addiu     $sp, $sp, 0x60
.size STREAM_LoadObjectReturn, . - STREAM_LoadObjectReturn
