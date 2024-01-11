.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_RelocateGeneric
/* 3CC3C 8004C43C 1C00828C */  lw         $v0, 0x1C($a0)
/* 3CC40 8004C440 00000000 */  nop
/* 3CC44 8004C444 0000438C */  lw         $v1, 0x0($v0)
/* 3CC48 8004C448 00000000 */  nop
/* 3CC4C 8004C44C 02006010 */  beqz       $v1, .L8004C458
/* 3CC50 8004C450 21200000 */   addu      $a0, $zero, $zero
/* 3CC54 8004C454 21206500 */  addu       $a0, $v1, $a1
.L8004C458:
/* 3CC58 8004C458 0400438C */  lw         $v1, 0x4($v0)
/* 3CC5C 8004C45C 21300000 */  addu       $a2, $zero, $zero
/* 3CC60 8004C460 02006010 */  beqz       $v1, .L8004C46C
/* 3CC64 8004C464 000044AC */   sw        $a0, 0x0($v0)
/* 3CC68 8004C468 21306500 */  addu       $a2, $v1, $a1
.L8004C46C:
/* 3CC6C 8004C46C 0800438C */  lw         $v1, 0x8($v0)
/* 3CC70 8004C470 21200000 */  addu       $a0, $zero, $zero
/* 3CC74 8004C474 02006010 */  beqz       $v1, .L8004C480
/* 3CC78 8004C478 040046AC */   sw        $a2, 0x4($v0)
/* 3CC7C 8004C47C 21206500 */  addu       $a0, $v1, $a1
.L8004C480:
/* 3CC80 8004C480 0C00438C */  lw         $v1, 0xC($v0)
/* 3CC84 8004C484 21300000 */  addu       $a2, $zero, $zero
/* 3CC88 8004C488 02006010 */  beqz       $v1, .L8004C494
/* 3CC8C 8004C48C 080044AC */   sw        $a0, 0x8($v0)
/* 3CC90 8004C490 21306500 */  addu       $a2, $v1, $a1
.L8004C494:
/* 3CC94 8004C494 1000438C */  lw         $v1, 0x10($v0)
/* 3CC98 8004C498 21200000 */  addu       $a0, $zero, $zero
/* 3CC9C 8004C49C 02006010 */  beqz       $v1, .L8004C4A8
/* 3CCA0 8004C4A0 0C0046AC */   sw        $a2, 0xC($v0)
/* 3CCA4 8004C4A4 21206500 */  addu       $a0, $v1, $a1
.L8004C4A8:
/* 3CCA8 8004C4A8 1400438C */  lw         $v1, 0x14($v0)
/* 3CCAC 8004C4AC 21300000 */  addu       $a2, $zero, $zero
/* 3CCB0 8004C4B0 02006010 */  beqz       $v1, .L8004C4BC
/* 3CCB4 8004C4B4 100044AC */   sw        $a0, 0x10($v0)
/* 3CCB8 8004C4B8 21306500 */  addu       $a2, $v1, $a1
.L8004C4BC:
/* 3CCBC 8004C4BC 1800448C */  lw         $a0, 0x18($v0)
/* 3CCC0 8004C4C0 21180000 */  addu       $v1, $zero, $zero
/* 3CCC4 8004C4C4 02008010 */  beqz       $a0, .L8004C4D0
/* 3CCC8 8004C4C8 140046AC */   sw        $a2, 0x14($v0)
/* 3CCCC 8004C4CC 21188500 */  addu       $v1, $a0, $a1
.L8004C4D0:
/* 3CCD0 8004C4D0 0800E003 */  jr         $ra
/* 3CCD4 8004C4D4 180043AC */   sw        $v1, 0x18($v0)
.size FX_RelocateGeneric, . - FX_RelocateGeneric
