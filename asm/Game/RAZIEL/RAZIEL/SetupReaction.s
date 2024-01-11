.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetupReaction
/* A419C 800B399C C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A41A0 800B39A0 3000B2AF */  sw         $s2, 0x30($sp)
/* A41A4 800B39A4 21908000 */  addu       $s2, $a0, $zero
/* A41A8 800B39A8 2120A000 */  addu       $a0, $a1, $zero
/* A41AC 800B39AC 3800BFAF */  sw         $ra, 0x38($sp)
/* A41B0 800B39B0 3400B3AF */  sw         $s3, 0x34($sp)
/* A41B4 800B39B4 2C00B1AF */  sw         $s1, 0x2C($sp)
/* A41B8 800B39B8 2800B0AF */  sw         $s0, 0x28($sp)
/* A41BC 800B39BC 780140AE */  sw         $zero, 0x178($s2)
/* A41C0 800B39C0 740140AE */  sw         $zero, 0x174($s2)
/* A41C4 800B39C4 51CE020C */  jal        GetEngageEvent
/* A41C8 800B39C8 AC0144AE */   sw        $a0, 0x1AC($s2)
/* A41CC 800B39CC 0002033C */  lui        $v1, (0x2000001 >> 16)
/* A41D0 800B39D0 01006334 */  ori        $v1, $v1, (0x2000001 & 0xFFFF)
/* A41D4 800B39D4 60005386 */  lh         $s3, 0x60($s2)
/* A41D8 800B39D8 23004310 */  beq        $v0, $v1, .L800B3A68
/* A41DC 800B39DC 90010424 */   addiu     $a0, $zero, 0x190
/* A41E0 800B39E0 00FF0524 */  addiu      $a1, $zero, -0x100
/* A41E4 800B39E4 90000624 */  addiu      $a2, $zero, 0x90
/* A41E8 800B39E8 21380000 */  addu       $a3, $zero, $zero
/* A41EC 800B39EC 3CFF0224 */  addiu      $v0, $zero, -0xC4
/* A41F0 800B39F0 1000A2AF */  sw         $v0, 0x10($sp)
/* A41F4 800B39F4 F2010224 */  addiu      $v0, $zero, 0x1F2
/* A41F8 800B39F8 D0F99127 */  addiu      $s1, $gp, %gp_rel(Raziel + 0x3A0)
/* A41FC 800B39FC 1400A2AF */  sw         $v0, 0x14($sp)
/* A4200 800B3A00 D8F98227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x3A8)
/* A4204 800B3A04 F0F99027 */  addiu      $s0, $gp, %gp_rel(Raziel + 0x3C0)
/* A4208 800B3A08 1800B1AF */  sw         $s1, 0x18($sp)
/* A420C 800B3A0C 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A4210 800B3A10 6EC4010C */  jal        SetPhysicsEdgeData
/* A4214 800B3A14 2000B0AF */   sw        $s0, 0x20($sp)
/* A4218 800B3A18 21204002 */  addu       $a0, $s2, $zero
/* A421C 800B3A1C 21304000 */  addu       $a2, $v0, $zero
/* A4220 800B3A20 C0FC858F */  lw         $a1, %gp_rel(gameTracker)($gp)
/* A4224 800B3A24 C4D5010C */  jal        PhysicsCheckEdgeGrabbing
/* A4228 800B3A28 01000724 */   addiu     $a3, $zero, 0x1
/* A422C 800B3A2C 21200000 */  addu       $a0, $zero, $zero
/* A4230 800B3A30 21288000 */  addu       $a1, $a0, $zero
/* A4234 800B3A34 21308000 */  addu       $a2, $a0, $zero
/* A4238 800B3A38 21388000 */  addu       $a3, $a0, $zero
/* A423C 800B3A3C 73FF0224 */  addiu      $v0, $zero, -0x8D
/* A4240 800B3A40 1000A2AF */  sw         $v0, 0x10($sp)
/* A4244 800B3A44 1400A0AF */  sw         $zero, 0x14($sp)
/* A4248 800B3A48 1800B1AF */  sw         $s1, 0x18($sp)
/* A424C 800B3A4C 1C00A0AF */  sw         $zero, 0x1C($sp)
/* A4250 800B3A50 6EC4010C */  jal        SetPhysicsEdgeData
/* A4254 800B3A54 2000B0AF */   sw        $s0, 0x20($sp)
/* A4258 800B3A58 21204002 */  addu       $a0, $s2, $zero
/* A425C 800B3A5C 21284000 */  addu       $a1, $v0, $zero
/* A4260 800B3A60 72D7010C */  jal        PhysicsDefaultEdgeGrabResponse
/* A4264 800B3A64 01000624 */   addiu     $a2, $zero, 0x1
.L800B3A68:
/* A4268 800B3A68 21106002 */  addu       $v0, $s3, $zero
/* A426C 800B3A6C 600053A6 */  sh         $s3, 0x60($s2)
/* A4270 800B3A70 3800BF8F */  lw         $ra, 0x38($sp)
/* A4274 800B3A74 3400B38F */  lw         $s3, 0x34($sp)
/* A4278 800B3A78 3000B28F */  lw         $s2, 0x30($sp)
/* A427C 800B3A7C 2C00B18F */  lw         $s1, 0x2C($sp)
/* A4280 800B3A80 2800B08F */  lw         $s0, 0x28($sp)
/* A4284 800B3A84 0800E003 */  jr         $ra
/* A4288 800B3A88 4000BD27 */   addiu     $sp, $sp, 0x40
.size SetupReaction, . - SetupReaction
