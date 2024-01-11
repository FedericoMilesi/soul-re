.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysicsSetVelFromZRot
/* 682D8 80077AD8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 682DC 80077ADC 1800B2AF */  sw         $s2, 0x18($sp)
/* 682E0 80077AE0 21908000 */  addu       $s2, $a0, $zero
/* 682E4 80077AE4 1000B0AF */  sw         $s0, 0x10($sp)
/* 682E8 80077AE8 00840500 */  sll        $s0, $a1, 16
/* 682EC 80077AEC 03841000 */  sra        $s0, $s0, 16
/* 682F0 80077AF0 00FC1026 */  addiu      $s0, $s0, -0x400
/* 682F4 80077AF4 21200002 */  addu       $a0, $s0, $zero
/* 682F8 80077AF8 1400B1AF */  sw         $s1, 0x14($sp)
/* 682FC 80077AFC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 68300 80077B00 DCE4010C */  jal        func_80079370
/* 68304 80077B04 2188C000 */   addu      $s1, $a2, $zero
/* 68308 80077B08 18005100 */  mult       $v0, $s1
/* 6830C 80077B0C 21200002 */  addu       $a0, $s0, $zero
/* 68310 80077B10 12180000 */  mflo       $v1
/* 68314 80077B14 03130300 */  sra        $v0, $v1, 12
/* 68318 80077B18 D0E4010C */  jal        func_80079340
/* 6831C 80077B1C 740142AE */   sw        $v0, 0x174($s2)
/* 68320 80077B20 18005100 */  mult       $v0, $s1
/* 68324 80077B24 12180000 */  mflo       $v1
/* 68328 80077B28 03130300 */  sra        $v0, $v1, 12
/* 6832C 80077B2C 780142AE */  sw         $v0, 0x178($s2)
/* 68330 80077B30 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 68334 80077B34 1800B28F */  lw         $s2, 0x18($sp)
/* 68338 80077B38 1400B18F */  lw         $s1, 0x14($sp)
/* 6833C 80077B3C 1000B08F */  lw         $s0, 0x10($sp)
/* 68340 80077B40 0800E003 */  jr         $ra
/* 68344 80077B44 2000BD27 */   addiu     $sp, $sp, 0x20
.size PhysicsSetVelFromZRot, . - PhysicsSetVelFromZRot
