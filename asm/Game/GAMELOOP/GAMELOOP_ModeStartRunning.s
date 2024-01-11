.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_ModeStartRunning
/* 213FC 80030BFC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 21400 80030C00 3ABF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x172)($gp)
/* 21404 80030C04 04000224 */  addiu      $v0, $zero, 0x4
/* 21408 80030C08 04006210 */  beq        $v1, $v0, .L80030C1C
/* 2140C 80030C0C 1000BFAF */   sw        $ra, 0x10($sp)
/* 21410 80030C10 06000224 */  addiu      $v0, $zero, 0x6
/* 21414 80030C14 0D006214 */  bne        $v1, $v0, .L80030C4C
/* 21418 80030C18 00000000 */   nop
.L80030C1C:
/* 2141C 80030C1C 994D000C */  jal        DEBUG_ExitMenus
/* 21420 80030C20 00000000 */   nop
/* 21424 80030C24 3ABF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x172)($gp)
/* 21428 80030C28 06000224 */  addiu      $v0, $zero, 0x6
/* 2142C 80030C2C 07006214 */  bne        $v1, $v0, .L80030C4C
/* 21430 80030C30 0D80023C */   lui       $v0, %hi(standardMenu)
/* 21434 80030C34 90804224 */  addiu      $v0, $v0, %lo(standardMenu)
/* 21438 80030C38 0C8A82AF */  sw         $v0, %gp_rel(currentMenu)($gp)
/* 2143C 80030C3C 9D01010C */  jal        SOUND_ResumeAllSound
/* 21440 80030C40 00000000 */   nop
/* 21444 80030C44 8BDC020C */  jal        VOICEXA_Resume
/* 21448 80030C48 00000000 */   nop
.L80030C4C:
/* 2144C 80030C4C 08BF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x140)($gp)
/* 21450 80030C50 0008023C */  lui        $v0, (0x8000000 >> 16)
/* 21454 80030C54 24106200 */  and        $v0, $v1, $v0
/* 21458 80030C58 07004010 */  beqz       $v0, .L80030C78
/* 2145C 80030C5C FFF7023C */   lui       $v0, (0xF7FFFFFF >> 16)
/* 21460 80030C60 FFFF4234 */  ori        $v0, $v0, (0xF7FFFFFF & 0xFFFF)
/* 21464 80030C64 24106200 */  and        $v0, $v1, $v0
/* 21468 80030C68 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 2146C 80030C6C A4BF80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x1DC)($gp)
/* 21470 80030C70 0FE9020C */  jal        DrawSync
/* 21474 80030C74 21200000 */   addu      $a0, $zero, $zero
.L80030C78:
/* 21478 80030C78 FFEF033C */  lui        $v1, (0xEFFFFFFF >> 16)
/* 2147C 80030C7C 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 21480 80030C80 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 21484 80030C84 FFFF6334 */  ori        $v1, $v1, (0xEFFFFFFF & 0xFFFF)
/* 21488 80030C88 3ABF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x172)($gp)
/* 2148C 80030C8C 24104300 */  and        $v0, $v0, $v1
/* 21490 80030C90 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 21494 80030C94 1400828C */  lw         $v0, 0x14($a0)
/* 21498 80030C98 FFFE0324 */  addiu      $v1, $zero, -0x101
/* 2149C 80030C9C 24104300 */  and        $v0, $v0, $v1
/* 214A0 80030CA0 140082AC */  sw         $v0, 0x14($a0)
/* 214A4 80030CA4 3ABF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x172)($gp)
/* 214A8 80030CA8 3EC8000C */  jal        GAMEPAD_RestoreControllers
/* 214AC 80030CAC 00000000 */   nop
/* 214B0 80030CB0 1000053C */  lui        $a1, (0x10000A >> 16)
/* 214B4 80030CB4 0A00A534 */  ori        $a1, $a1, (0x10000A & 0xFFFF)
/* 214B8 80030CB8 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 214BC 80030CBC A1D1000C */  jal        INSTANCE_Post
/* 214C0 80030CC0 21300000 */   addu      $a2, $zero, $zero
/* 214C4 80030CC4 1000BF8F */  lw         $ra, 0x10($sp)
/* 214C8 80030CC8 00000000 */  nop
/* 214CC 80030CCC 0800E003 */  jr         $ra
/* 214D0 80030CD0 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_ModeStartRunning, . - GAMELOOP_ModeStartRunning
