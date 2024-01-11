.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HealthCheckForLowHealth
/* 9550C 800A4D0C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 95510 800A4D10 1000BFAF */  sw         $ra, 0x10($sp)
/* 95514 800A4D14 9266010C */  jal        STREAM_IsMorphInProgress
/* 95518 800A4D18 00000000 */   nop
/* 9551C 800A4D1C 12004014 */  bnez       $v0, .L800A4D68
/* 95520 800A4D20 01000224 */   addiu     $v0, $zero, 0x1
/* 95524 800A4D24 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 95528 800A4D28 00000000 */  nop
/* 9552C 800A4D2C 08006214 */  bne        $v1, $v0, .L800A4D50
/* 95530 800A4D30 0100023C */   lui       $v0, (0x18703 >> 16)
/* 95534 800A4D34 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 95538 800A4D38 03874234 */  ori        $v0, $v0, (0x18703 & 0xFFFF)
/* 9553C 800A4D3C 2A104300 */  slt        $v0, $v0, $v1
/* 95540 800A4D40 09004014 */  bnez       $v0, .L800A4D68
/* 95544 800A4D44 21100000 */   addu      $v0, $zero, $zero
/* 95548 800A4D48 5A930208 */  j          .L800A4D68
/* 9554C 800A4D4C 01000224 */   addiu     $v0, $zero, 0x1
.L800A4D50:
/* 95550 800A4D50 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 95554 800A4D54 00000000 */  nop
/* 95558 800A4D58 64006328 */  slti       $v1, $v1, 0x64
/* 9555C 800A4D5C 02006014 */  bnez       $v1, .L800A4D68
/* 95560 800A4D60 01000224 */   addiu     $v0, $zero, 0x1
/* 95564 800A4D64 21100000 */  addu       $v0, $zero, $zero
.L800A4D68:
/* 95568 800A4D68 1000BF8F */  lw         $ra, 0x10($sp)
/* 9556C 800A4D6C 00000000 */  nop
/* 95570 800A4D70 0800E003 */  jr         $ra
/* 95574 800A4D74 1800BD27 */   addiu     $sp, $sp, 0x18
.size HealthCheckForLowHealth, . - HealthCheckForLowHealth
