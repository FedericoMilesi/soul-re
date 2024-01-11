.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800B9BC8
/* AA3C8 800B9BC8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA3CC 800B9BCC 1000B0AF */  sw         $s0, 0x10($sp)
/* AA3D0 800B9BD0 0D80103C */  lui        $s0, %hi(the_attract_movies + 0x68)
/* AA3D4 800B9BD4 14C91026 */  addiu      $s0, $s0, %lo(the_attract_movies + 0x68)
/* AA3D8 800B9BD8 1400BFAF */  sw         $ra, 0x14($sp)
/* AA3DC 800B9BDC 00000296 */  lhu        $v0, 0x0($s0)
/* AA3E0 800B9BE0 00000000 */  nop
/* AA3E4 800B9BE4 2A004014 */  bnez       $v0, .L800B9C90
/* AA3E8 800B9BE8 21100000 */   addu      $v0, $zero, $zero
/* AA3EC 800B9BEC 0D80033C */  lui        $v1, %hi(the_attract_movies + 0x10F4)
/* AA3F0 800B9BF0 A0D9638C */  lw         $v1, %lo(the_attract_movies + 0x10F4)($v1)
/* AA3F4 800B9BF4 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F8)
/* AA3F8 800B9BF8 A4D9428C */  lw         $v0, %lo(the_attract_movies + 0x10F8)($v0)
/* AA3FC 800B9BFC 3333053C */  lui        $a1, (0x33333333 >> 16)
/* AA400 800B9C00 000040A4 */  sh         $zero, 0x0($v0)
/* AA404 800B9C04 00004294 */  lhu        $v0, 0x0($v0)
/* AA408 800B9C08 3333A534 */  ori        $a1, $a1, (0x33333333 & 0xFFFF)
/* AA40C 800B9C0C 000062A4 */  sh         $v0, 0x0($v1)
/* AA410 800B9C10 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10FC)
/* AA414 800B9C14 A8D9428C */  lw         $v0, %lo(the_attract_movies + 0x10FC)($v0)
/* AA418 800B9C18 21200002 */  addu       $a0, $s0, $zero
/* AA41C 800B9C1C 000045AC */  sw         $a1, 0x0($v0)
/* AA420 800B9C20 34E8020C */  jal        func_800BA0D0
/* AA424 800B9C24 1A040524 */   addiu     $a1, $zero, 0x41A
/* AA428 800B9C28 B907030C */  jal        setjmp
/* AA42C 800B9C2C 38000426 */   addiu     $a0, $s0, 0x38
/* AA430 800B9C30 03004010 */  beqz       $v0, .L800B9C40
/* AA434 800B9C34 00000000 */   nop
/* AA438 800B9C38 28E7020C */  jal        func_800B9CA0
/* AA43C 800B9C3C 00000000 */   nop
.L800B9C40:
/* AA440 800B9C40 0D80103C */  lui        $s0, %hi(the_attract_movies + 0xA4)
/* AA444 800B9C44 50C91026 */  addiu      $s0, $s0, %lo(the_attract_movies + 0xA4)
/* AA448 800B9C48 FCFF0426 */  addiu      $a0, $s0, -0x4
/* AA44C 800B9C4C DC0F0226 */  addiu      $v0, $s0, 0xFDC
/* AA450 800B9C50 C807030C */  jal        HookEntryInt
/* AA454 800B9C54 000002AE */   sw        $v0, 0x0($s0)
/* AA458 800B9C58 01000224 */  addiu      $v0, $zero, 0x1
/* AA45C 800B9C5C CC07030C */  jal        startIntrVSync
/* AA460 800B9C60 C4FF02A6 */   sh        $v0, -0x3C($s0)
/* AA464 800B9C64 0D80033C */  lui        $v1, %hi(the_attract_movies + 0x10F0)
/* AA468 800B9C68 9CD9638C */  lw         $v1, %lo(the_attract_movies + 0x10F0)($v1)
/* AA46C 800B9C6C 1408030C */  jal        startIntrDMA
/* AA470 800B9C70 140062AC */   sw        $v0, 0x14($v1)
/* AA474 800B9C74 0D80043C */  lui        $a0, %hi(the_attract_movies + 0x10F0)
/* AA478 800B9C78 9CD9848C */  lw         $a0, %lo(the_attract_movies + 0x10F0)($a0)
/* AA47C 800B9C7C BE08030C */  jal        _96_remove
/* AA480 800B9C80 040082AC */   sw        $v0, 0x4($a0)
/* AA484 800B9C84 11FC020C */  jal        ExitCriticalSection
/* AA488 800B9C88 C4FF1026 */   addiu     $s0, $s0, -0x3C
/* AA48C 800B9C8C 21100002 */  addu       $v0, $s0, $zero
.L800B9C90:
/* AA490 800B9C90 1400BF8F */  lw         $ra, 0x14($sp)
/* AA494 800B9C94 1000B08F */  lw         $s0, 0x10($sp)
/* AA498 800B9C98 0800E003 */  jr         $ra
/* AA49C 800B9C9C 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800B9BC8, . - func_800B9BC8
