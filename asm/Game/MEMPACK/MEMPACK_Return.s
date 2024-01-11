.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_Return
/* 40C14 80050414 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 40C18 80050418 83280500 */  sra        $a1, $a1, 2
/* 40C1C 8005041C 80280500 */  sll        $a1, $a1, 2
/* 40C20 80050420 0800A228 */  slti       $v0, $a1, 0x8
/* 40C24 80050424 18004014 */  bnez       $v0, .L80050488
/* 40C28 80050428 1000BFAF */   sw        $ra, 0x10($sp)
/* 40C2C 8005042C F8FF8424 */  addiu      $a0, $a0, -0x8
/* 40C30 80050430 0400828C */  lw         $v0, 0x4($a0)
/* 40C34 80050434 00000000 */  nop
/* 40C38 80050438 23104500 */  subu       $v0, $v0, $a1
/* 40C3C 8005043C 040082AC */  sw         $v0, 0x4($a0)
/* 40C40 80050440 F8C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 40C44 80050444 00000000 */  nop
/* 40C48 80050448 23104500 */  subu       $v0, $v0, $a1
/* 40C4C 8005044C F8C682AF */  sw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 40C50 80050450 0400828C */  lw         $v0, 0x4($a0)
/* 40C54 80050454 00000000 */  nop
/* 40C58 80050458 21208200 */  addu       $a0, $a0, $v0
/* 40C5C 8005045C DEBA0234 */  ori        $v0, $zero, 0xBADE
/* 40C60 80050460 000082A4 */  sh         $v0, 0x0($a0)
/* 40C64 80050464 020080A0 */  sb         $zero, 0x2($a0)
/* 40C68 80050468 030080A0 */  sb         $zero, 0x3($a0)
/* 40C6C 8005046C 040085AC */  sw         $a1, 0x4($a0)
/* 40C70 80050470 FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 40C74 80050474 21288500 */  addu       $a1, $a0, $a1
/* 40C78 80050478 0300A210 */  beq        $a1, $v0, .L80050488
/* 40C7C 8005047C 00000000 */   nop
/* 40C80 80050480 F340010C */  jal        MEMORY_MergeAddresses
/* 40C84 80050484 00000000 */   nop
.L80050488:
/* 40C88 80050488 1000BF8F */  lw         $ra, 0x10($sp)
/* 40C8C 8005048C 00000000 */  nop
/* 40C90 80050490 0800E003 */  jr         $ra
/* 40C94 80050494 1800BD27 */   addiu     $sp, $sp, 0x18
.size MEMPACK_Return, . - MEMPACK_Return
