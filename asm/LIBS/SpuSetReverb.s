.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuSetReverb
/* B07F0 800BFFF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B07F4 800BFFF4 1000B0AF */  sw         $s0, 0x10($sp)
/* B07F8 800BFFF8 21808000 */  addu       $s0, $a0, $zero
/* B07FC 800BFFFC 06000012 */  beqz       $s0, .L800C0018
/* B0800 800C0000 1400BFAF */   sw        $ra, 0x14($sp)
/* B0804 800C0004 01000224 */  addiu      $v0, $zero, 0x1
/* B0808 800C0008 0B000212 */  beq        $s0, $v0, .L800C0038
/* B080C 800C000C 00000000 */   nop
/* B0810 800C0010 29000308 */  j          .L800C00A4
/* B0814 800C0014 00000000 */   nop
.L800C0018:
/* B0818 800C0018 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B081C 800C001C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B0820 800C0020 00000000 */  nop
/* B0824 800C0024 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B0828 800C0028 0D80013C */  lui        $at, %hi(_spu_rev_flag)
/* B082C 800C002C F0EC20AC */  sw         $zero, %lo(_spu_rev_flag)($at)
/* B0830 800C0030 28000308 */  j          .L800C00A0
/* B0834 800C0034 7FFF4230 */   andi      $v0, $v0, 0xFF7F
.L800C0038:
/* B0838 800C0038 0D80023C */  lui        $v0, %hi(_spu_rev_reserve_wa)
/* B083C 800C003C F4EC428C */  lw         $v0, %lo(_spu_rev_reserve_wa)($v0)
/* B0840 800C0040 00000000 */  nop
/* B0844 800C0044 0F005010 */  beq        $v0, $s0, .L800C0084
/* B0848 800C0048 00000000 */   nop
/* B084C 800C004C 0D80043C */  lui        $a0, %hi(_spu_rev_offsetaddr)
/* B0850 800C0050 F8EC848C */  lw         $a0, %lo(_spu_rev_offsetaddr)($a0)
/* B0854 800C0054 DC1A030C */  jal        _SpuIsInAllocateArea_
/* B0858 800C0058 00000000 */   nop
/* B085C 800C005C 09004010 */  beqz       $v0, .L800C0084
/* B0860 800C0060 00000000 */   nop
/* B0864 800C0064 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B0868 800C0068 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B086C 800C006C 00000000 */  nop
/* B0870 800C0070 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B0874 800C0074 0D80013C */  lui        $at, %hi(_spu_rev_flag)
/* B0878 800C0078 F0EC20AC */  sw         $zero, %lo(_spu_rev_flag)($at)
/* B087C 800C007C 28000308 */  j          .L800C00A0
/* B0880 800C0080 7FFF4230 */   andi      $v0, $v0, 0xFF7F
.L800C0084:
/* B0884 800C0084 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B0888 800C0088 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B088C 800C008C 00000000 */  nop
/* B0890 800C0090 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B0894 800C0094 0D80013C */  lui        $at, %hi(_spu_rev_flag)
/* B0898 800C0098 F0EC30AC */  sw         $s0, %lo(_spu_rev_flag)($at)
/* B089C 800C009C 80004234 */  ori        $v0, $v0, 0x80
.L800C00A0:
/* B08A0 800C00A0 AA0162A4 */  sh         $v0, 0x1AA($v1)
.L800C00A4:
/* B08A4 800C00A4 0D80023C */  lui        $v0, %hi(_spu_rev_flag)
/* B08A8 800C00A8 F0EC428C */  lw         $v0, %lo(_spu_rev_flag)($v0)
/* B08AC 800C00AC 1400BF8F */  lw         $ra, 0x14($sp)
/* B08B0 800C00B0 1000B08F */  lw         $s0, 0x10($sp)
/* B08B4 800C00B4 0800E003 */  jr         $ra
/* B08B8 800C00B8 1800BD27 */   addiu     $sp, $sp, 0x18
/* B08BC 800C00BC 00000000 */  nop
.size SpuSetReverb, . - SpuSetReverb
