.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuSetTransferStartAddr
/* B0164 800BF964 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B0168 800BF968 21288000 */  addu       $a1, $a0, $zero
/* B016C 800BF96C 0700023C */  lui        $v0, (0x7EFE8 >> 16)
/* B0170 800BF970 E8EF4234 */  ori        $v0, $v0, (0x7EFE8 & 0xFFFF)
/* B0174 800BF974 F0EFA324 */  addiu      $v1, $a1, -0x1010
/* B0178 800BF978 2B104300 */  sltu       $v0, $v0, $v1
/* B017C 800BF97C 0B004014 */  bnez       $v0, .L800BF9AC
/* B0180 800BF980 1000BFAF */   sw        $ra, 0x10($sp)
/* B0184 800BF984 331A030C */  jal        _spu_FsetRXXa
/* B0188 800BF988 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B018C 800BF98C 0D80013C */  lui        $at, %hi(_spu_tsa)
/* B0190 800BF990 74ED22A4 */  sh         $v0, %lo(_spu_tsa)($at)
/* B0194 800BF994 0D80033C */  lui        $v1, %hi(_spu_tsa)
/* B0198 800BF998 74ED6394 */  lhu        $v1, %lo(_spu_tsa)($v1)
/* B019C 800BF99C 0D80023C */  lui        $v0, %hi(_spu_mem_mode_plus)
/* B01A0 800BF9A0 84ED428C */  lw         $v0, %lo(_spu_mem_mode_plus)($v0)
/* B01A4 800BF9A4 6CFE0208 */  j          .L800BF9B0
/* B01A8 800BF9A8 04104300 */   sllv      $v0, $v1, $v0
.L800BF9AC:
/* B01AC 800BF9AC 21100000 */  addu       $v0, $zero, $zero
.L800BF9B0:
/* B01B0 800BF9B0 1000BF8F */  lw         $ra, 0x10($sp)
/* B01B4 800BF9B4 1800BD27 */  addiu      $sp, $sp, 0x18
/* B01B8 800BF9B8 0800E003 */  jr         $ra
/* B01BC 800BF9BC 00000000 */   nop
/* B01C0 800BF9C0 00000000 */  nop
.size SpuSetTransferStartAddr, . - SpuSetTransferStartAddr
