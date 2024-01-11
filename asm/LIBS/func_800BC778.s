.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BC778
/* ACF78 800BC778 0010033C */  lui        $v1, (0x10000007 >> 16)
/* ACF7C 800BC77C 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* ACF80 800BC780 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* ACF84 800BC784 07006334 */  ori        $v1, $v1, (0x10000007 & 0xFFFF)
/* ACF88 800BC788 000043AC */  sw         $v1, 0x0($v0)
/* ACF8C 800BC78C 0D80053C */  lui        $a1, %hi(GEnv + 0x104)
/* ACF90 800BC790 10DBA58C */  lw         $a1, %lo(GEnv + 0x104)($a1)
/* ACF94 800BC794 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* ACF98 800BC798 0000A28C */  lw         $v0, 0x0($a1)
/* ACF9C 800BC79C FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* ACFA0 800BC7A0 24104300 */  and        $v0, $v0, $v1
/* ACFA4 800BC7A4 02000324 */  addiu      $v1, $zero, 0x2
/* ACFA8 800BC7A8 0F004310 */  beq        $v0, $v1, .L800BC7E8
/* ACFAC 800BC7AC 00E1033C */   lui       $v1, (0xE1001000 >> 16)
/* ACFB0 800BC7B0 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* ACFB4 800BC7B4 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* ACFB8 800BC7B8 00000000 */  nop
/* ACFBC 800BC7BC 0000428C */  lw         $v0, 0x0($v0)
/* ACFC0 800BC7C0 00106334 */  ori        $v1, $v1, (0xE1001000 & 0xFFFF)
/* ACFC4 800BC7C4 FF3F4230 */  andi       $v0, $v0, 0x3FFF
/* ACFC8 800BC7C8 25104300 */  or         $v0, $v0, $v1
/* ACFCC 800BC7CC 0000A2AC */  sw         $v0, 0x0($a1)
/* ACFD0 800BC7D0 0D80033C */  lui        $v1, %hi(GEnv + 0x104)
/* ACFD4 800BC7D4 10DB638C */  lw         $v1, %lo(GEnv + 0x104)($v1)
/* ACFD8 800BC7D8 21100000 */  addu       $v0, $zero, $zero
/* ACFDC 800BC7DC 0000638C */  lw         $v1, 0x0($v1)
/* ACFE0 800BC7E0 04F20208 */  j          .L800BC810
/* ACFE4 800BC7E4 00000000 */   nop
.L800BC7E8:
/* ACFE8 800BC7E8 08008230 */  andi       $v0, $a0, 0x8
/* ACFEC 800BC7EC 07004010 */  beqz       $v0, .L800BC80C
/* ACFF0 800BC7F0 0009043C */   lui       $a0, (0x9000001 >> 16)
/* ACFF4 800BC7F4 01008434 */  ori        $a0, $a0, (0x9000001 & 0xFFFF)
/* ACFF8 800BC7F8 0D80033C */  lui        $v1, %hi(GEnv + 0x108)
/* ACFFC 800BC7FC 14DB638C */  lw         $v1, %lo(GEnv + 0x108)($v1)
/* AD000 800BC800 02000224 */  addiu      $v0, $zero, 0x2
/* AD004 800BC804 04F20208 */  j          .L800BC810
/* AD008 800BC808 000064AC */   sw        $a0, 0x0($v1)
.L800BC80C:
/* AD00C 800BC80C 01000224 */  addiu      $v0, $zero, 0x1
.L800BC810:
/* AD010 800BC810 0800E003 */  jr         $ra
/* AD014 800BC814 00000000 */   nop
.size func_800BC778, . - func_800BC778
