.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuWrite
/* B01C4 800BF9C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B01C8 800BF9C8 1000B0AF */  sw         $s0, 0x10($sp)
/* B01CC 800BF9CC 2180A000 */  addu       $s0, $a1, $zero
/* B01D0 800BF9D0 0700023C */  lui        $v0, (0x7EFF0 >> 16)
/* B01D4 800BF9D4 F0EF4234 */  ori        $v0, $v0, (0x7EFF0 & 0xFFFF)
/* B01D8 800BF9D8 2B105000 */  sltu       $v0, $v0, $s0
/* B01DC 800BF9DC 03004010 */  beqz       $v0, .L800BF9EC
/* B01E0 800BF9E0 1400BFAF */   sw        $ra, 0x14($sp)
/* B01E4 800BF9E4 0700103C */  lui        $s0, (0x7EFF0 >> 16)
/* B01E8 800BF9E8 F0EF1036 */  ori        $s0, $s0, (0x7EFF0 & 0xFFFF)
.L800BF9EC:
/* B01EC 800BF9EC E819030C */  jal        _spu_Fw
/* B01F0 800BF9F0 21280002 */   addu      $a1, $s0, $zero
/* B01F4 800BF9F4 0D80023C */  lui        $v0, %hi(_spu_transferCallback)
/* B01F8 800BF9F8 94ED428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
/* B01FC 800BF9FC 00000000 */  nop
/* B0200 800BFA00 03004014 */  bnez       $v0, .L800BFA10
/* B0204 800BFA04 21100002 */   addu      $v0, $s0, $zero
/* B0208 800BFA08 0D80013C */  lui        $at, %hi(_spu_inTransfer)
/* B020C 800BFA0C 90ED20AC */  sw         $zero, %lo(_spu_inTransfer)($at)
.L800BFA10:
/* B0210 800BFA10 1400BF8F */  lw         $ra, 0x14($sp)
/* B0214 800BFA14 1000B08F */  lw         $s0, 0x10($sp)
/* B0218 800BFA18 0800E003 */  jr         $ra
/* B021C 800BFA1C 1800BD27 */   addiu     $sp, $sp, 0x18
/* B0220 800BFA20 00000000 */  nop
.size SpuWrite, . - SpuWrite
