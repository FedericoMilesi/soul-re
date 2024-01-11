.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDampingPhysics
/* 8AA68 8009A268 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8AA6C 8009A26C 1800BFAF */  sw         $ra, 0x18($sp)
/* 8AA70 8009A270 7401828C */  lw         $v0, 0x174($a0)
/* 8AA74 8009A274 00000000 */  nop
/* 8AA78 8009A278 18004500 */  mult       $v0, $a1
/* 8AA7C 8009A27C 12180000 */  mflo       $v1
/* 8AA80 8009A280 02006104 */  bgez       $v1, .L8009A28C
/* 8AA84 8009A284 00000000 */   nop
/* 8AA88 8009A288 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8009A28C:
/* 8AA8C 8009A28C 7801828C */  lw         $v0, 0x178($a0)
/* 8AA90 8009A290 00000000 */  nop
/* 8AA94 8009A294 18004500 */  mult       $v0, $a1
/* 8AA98 8009A298 03130300 */  sra        $v0, $v1, 12
/* 8AA9C 8009A29C 23100200 */  negu       $v0, $v0
/* 8AAA0 8009A2A0 12300000 */  mflo       $a2
/* 8AAA4 8009A2A4 0200C104 */  bgez       $a2, .L8009A2B0
/* 8AAA8 8009A2A8 800182AC */   sw        $v0, 0x180($a0)
/* 8AAAC 8009A2AC FF0FC624 */  addiu      $a2, $a2, 0xFFF
.L8009A2B0:
/* 8AAB0 8009A2B0 7C01828C */  lw         $v0, 0x17C($a0)
/* 8AAB4 8009A2B4 00000000 */  nop
/* 8AAB8 8009A2B8 18004500 */  mult       $v0, $a1
/* 8AABC 8009A2BC 03130600 */  sra        $v0, $a2, 12
/* 8AAC0 8009A2C0 23100200 */  negu       $v0, $v0
/* 8AAC4 8009A2C4 12280000 */  mflo       $a1
/* 8AAC8 8009A2C8 0200A104 */  bgez       $a1, .L8009A2D4
/* 8AACC 8009A2CC 840182AC */   sw        $v0, 0x184($a0)
/* 8AAD0 8009A2D0 FF0FA524 */  addiu      $a1, $a1, 0xFFF
.L8009A2D4:
/* 8AAD4 8009A2D4 03130500 */  sra        $v0, $a1, 12
/* 8AAD8 8009A2D8 80018584 */  lh         $a1, 0x180($a0)
/* 8AADC 8009A2DC 84018684 */  lh         $a2, 0x184($a0)
/* 8AAE0 8009A2E0 23100200 */  negu       $v0, $v0
/* 8AAE4 8009A2E4 880182AC */  sw         $v0, 0x188($a0)
/* 8AAE8 8009A2E8 88018784 */  lh         $a3, 0x188($a0)
/* 8AAEC 8009A2EC F0F5848F */  lw         $a0, %gp_rel(ExternalForces)($gp)
/* 8AAF0 8009A2F0 00100224 */  addiu      $v0, $zero, 0x1000
/* 8AAF4 8009A2F4 1000A0AF */  sw         $zero, 0x10($sp)
/* 8AAF8 8009A2F8 2E69020C */  jal        SetExternalForce
/* 8AAFC 8009A2FC 1400A2AF */   sw        $v0, 0x14($sp)
/* 8AB00 8009A300 1800BF8F */  lw         $ra, 0x18($sp)
/* 8AB04 8009A304 00000000 */  nop
/* 8AB08 8009A308 0800E003 */  jr         $ra
/* 8AB0C 8009A30C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetDampingPhysics, . - SetDampingPhysics
