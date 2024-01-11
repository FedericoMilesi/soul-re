.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ratan2
/* AD498 800BCC98 21300000 */  addu       $a2, $zero, $zero
/* AD49C 800BCC9C 0300A104 */  bgez       $a1, .L800BCCAC
/* AD4A0 800BCCA0 21380000 */   addu      $a3, $zero, $zero
/* AD4A4 800BCCA4 01000624 */  addiu      $a2, $zero, 0x1
/* AD4A8 800BCCA8 23280500 */  negu       $a1, $a1
.L800BCCAC:
/* AD4AC 800BCCAC 03008104 */  bgez       $a0, .L800BCCBC
/* AD4B0 800BCCB0 00000000 */   nop
/* AD4B4 800BCCB4 01000724 */  addiu      $a3, $zero, 0x1
/* AD4B8 800BCCB8 23200400 */  negu       $a0, $a0
.L800BCCBC:
/* AD4BC 800BCCBC 0400A014 */  bnez       $a1, .L800BCCD0
/* AD4C0 800BCCC0 2A108500 */   slt       $v0, $a0, $a1
/* AD4C4 800BCCC4 4F008010 */  beqz       $a0, .L800BCE04
/* AD4C8 800BCCC8 21100000 */   addu      $v0, $zero, $zero
/* AD4CC 800BCCCC 2A108500 */  slt        $v0, $a0, $a1
.L800BCCD0:
/* AD4D0 800BCCD0 23004010 */  beqz       $v0, .L800BCD60
/* AD4D4 800BCCD4 E07F023C */   lui       $v0, (0x7FE00000 >> 16)
/* AD4D8 800BCCD8 24108200 */  and        $v0, $a0, $v0
/* AD4DC 800BCCDC 0E004010 */  beqz       $v0, .L800BCD18
/* AD4E0 800BCCE0 83120500 */   sra       $v0, $a1, 10
/* AD4E4 800BCCE4 1A008200 */  div        $zero, $a0, $v0
/* AD4E8 800BCCE8 02004014 */  bnez       $v0, .L800BCCF4
/* AD4EC 800BCCEC 00000000 */   nop
/* AD4F0 800BCCF0 0D000700 */  break      7
.L800BCCF4:
/* AD4F4 800BCCF4 FFFF0124 */  addiu      $at, $zero, -0x1
/* AD4F8 800BCCF8 04004114 */  bne        $v0, $at, .L800BCD0C
/* AD4FC 800BCCFC 0080013C */   lui       $at, (0x80000000 >> 16)
/* AD500 800BCD00 02008114 */  bne        $a0, $at, .L800BCD0C
/* AD504 800BCD04 00000000 */   nop
/* AD508 800BCD08 0D000600 */  break      6
.L800BCD0C:
/* AD50C 800BCD0C 12200000 */  mflo       $a0
/* AD510 800BCD10 53F30208 */  j          .L800BCD4C
/* AD514 800BCD14 40100400 */   sll       $v0, $a0, 1
.L800BCD18:
/* AD518 800BCD18 80120400 */  sll        $v0, $a0, 10
/* AD51C 800BCD1C 1A004500 */  div        $zero, $v0, $a1
/* AD520 800BCD20 0200A014 */  bnez       $a1, .L800BCD2C
/* AD524 800BCD24 00000000 */   nop
/* AD528 800BCD28 0D000700 */  break      7
.L800BCD2C:
/* AD52C 800BCD2C FFFF0124 */  addiu      $at, $zero, -0x1
/* AD530 800BCD30 0400A114 */  bne        $a1, $at, .L800BCD44
/* AD534 800BCD34 0080013C */   lui       $at, (0x80000000 >> 16)
/* AD538 800BCD38 02004114 */  bne        $v0, $at, .L800BCD44
/* AD53C 800BCD3C 00000000 */   nop
/* AD540 800BCD40 0D000600 */  break      6
.L800BCD44:
/* AD544 800BCD44 12200000 */  mflo       $a0
/* AD548 800BCD48 40100400 */  sll        $v0, $a0, 1
.L800BCD4C:
/* AD54C 800BCD4C 0D80033C */  lui        $v1, %hi(ratan_tbl)
/* AD550 800BCD50 21186200 */  addu       $v1, $v1, $v0
/* AD554 800BCD54 7CDB6384 */  lh         $v1, %lo(ratan_tbl)($v1)
/* AD558 800BCD58 7AF30208 */  j          .L800BCDE8
/* AD55C 800BCD5C 00000000 */   nop
.L800BCD60:
/* AD560 800BCD60 2410A200 */  and        $v0, $a1, $v0
/* AD564 800BCD64 0E004010 */  beqz       $v0, .L800BCDA0
/* AD568 800BCD68 83120400 */   sra       $v0, $a0, 10
/* AD56C 800BCD6C 1A00A200 */  div        $zero, $a1, $v0
/* AD570 800BCD70 02004014 */  bnez       $v0, .L800BCD7C
/* AD574 800BCD74 00000000 */   nop
/* AD578 800BCD78 0D000700 */  break      7
.L800BCD7C:
/* AD57C 800BCD7C FFFF0124 */  addiu      $at, $zero, -0x1
/* AD580 800BCD80 04004114 */  bne        $v0, $at, .L800BCD94
/* AD584 800BCD84 0080013C */   lui       $at, (0x80000000 >> 16)
/* AD588 800BCD88 0200A114 */  bne        $a1, $at, .L800BCD94
/* AD58C 800BCD8C 00000000 */   nop
/* AD590 800BCD90 0D000600 */  break      6
.L800BCD94:
/* AD594 800BCD94 12200000 */  mflo       $a0
/* AD598 800BCD98 75F30208 */  j          .L800BCDD4
/* AD59C 800BCD9C 40100400 */   sll       $v0, $a0, 1
.L800BCDA0:
/* AD5A0 800BCDA0 80120500 */  sll        $v0, $a1, 10
/* AD5A4 800BCDA4 1A004400 */  div        $zero, $v0, $a0
/* AD5A8 800BCDA8 02008014 */  bnez       $a0, .L800BCDB4
/* AD5AC 800BCDAC 00000000 */   nop
/* AD5B0 800BCDB0 0D000700 */  break      7
.L800BCDB4:
/* AD5B4 800BCDB4 FFFF0124 */  addiu      $at, $zero, -0x1
/* AD5B8 800BCDB8 04008114 */  bne        $a0, $at, .L800BCDCC
/* AD5BC 800BCDBC 0080013C */   lui       $at, (0x80000000 >> 16)
/* AD5C0 800BCDC0 02004114 */  bne        $v0, $at, .L800BCDCC
/* AD5C4 800BCDC4 00000000 */   nop
/* AD5C8 800BCDC8 0D000600 */  break      6
.L800BCDCC:
/* AD5CC 800BCDCC 12200000 */  mflo       $a0
/* AD5D0 800BCDD0 40100400 */  sll        $v0, $a0, 1
.L800BCDD4:
/* AD5D4 800BCDD4 0D80033C */  lui        $v1, %hi(ratan_tbl)
/* AD5D8 800BCDD8 21186200 */  addu       $v1, $v1, $v0
/* AD5DC 800BCDDC 7CDB6384 */  lh         $v1, %lo(ratan_tbl)($v1)
/* AD5E0 800BCDE0 00040224 */  addiu      $v0, $zero, 0x400
/* AD5E4 800BCDE4 23184300 */  subu       $v1, $v0, $v1
.L800BCDE8:
/* AD5E8 800BCDE8 0200C010 */  beqz       $a2, .L800BCDF4
/* AD5EC 800BCDEC 00080224 */   addiu     $v0, $zero, 0x800
/* AD5F0 800BCDF0 23184300 */  subu       $v1, $v0, $v1
.L800BCDF4:
/* AD5F4 800BCDF4 0300E010 */  beqz       $a3, .L800BCE04
/* AD5F8 800BCDF8 21106000 */   addu      $v0, $v1, $zero
/* AD5FC 800BCDFC 23180300 */  negu       $v1, $v1
/* AD600 800BCE00 21106000 */  addu       $v0, $v1, $zero
.L800BCE04:
/* AD604 800BCE04 0800E003 */  jr         $ra
/* AD608 800BCE08 00000000 */   nop
/* AD60C 800BCE0C 00000000 */  nop
/* AD610 800BCE10 00000000 */  nop
/* AD614 800BCE14 00000000 */  nop
.size ratan2, . - ratan2
