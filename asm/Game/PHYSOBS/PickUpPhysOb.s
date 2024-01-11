.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PickUpPhysOb
/* 5B02C 8006A82C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 5B030 8006A830 1400B1AF */  sw         $s1, 0x14($sp)
/* 5B034 8006A834 21888000 */  addu       $s1, $a0, $zero
/* 5B038 8006A838 1800B2AF */  sw         $s2, 0x18($sp)
/* 5B03C 8006A83C 2190A000 */  addu       $s2, $a1, $zero
/* 5B040 8006A840 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 5B044 8006A844 2198C000 */  addu       $s3, $a2, $zero
/* 5B048 8006A848 2000B4AF */  sw         $s4, 0x20($sp)
/* 5B04C 8006A84C 2400BFAF */  sw         $ra, 0x24($sp)
/* 5B050 8006A850 1000B0AF */  sw         $s0, 0x10($sp)
/* 5B054 8006A854 4801228E */  lw         $v0, 0x148($s1)
/* 5B058 8006A858 6C01308E */  lw         $s0, 0x16C($s1)
/* 5B05C 8006A85C 2A004014 */  bnez       $v0, .L8006A908
/* 5B060 8006A860 21A0E000 */   addu      $s4, $a3, $zero
/* 5B064 8006A864 0000028E */  lw         $v0, 0x0($s0)
/* 5B068 8006A868 0002033C */  lui        $v1, (0x2000000 >> 16)
/* 5B06C 8006A86C 24104300 */  and        $v0, $v0, $v1
/* 5B070 8006A870 26004014 */  bnez       $v0, .L8006A90C
/* 5B074 8006A874 01000224 */   addiu     $v0, $zero, 0x1
/* 5B078 8006A878 21202002 */  addu       $a0, $s1, $zero
/* 5B07C 8006A87C EBB7010C */  jal        TurnOffCollisionPhysOb
/* 5B080 8006A880 07000524 */   addiu     $a1, $zero, 0x7
/* 5B084 8006A884 21202002 */  addu       $a0, $s1, $zero
/* 5B088 8006A888 21286002 */  addu       $a1, $s3, $zero
/* 5B08C 8006A88C A5A9010C */  jal        CanBePickedUp
/* 5B090 8006A890 21308002 */   addu      $a2, $s4, $zero
/* 5B094 8006A894 1C004010 */  beqz       $v0, .L8006A908
/* 5B098 8006A898 9FFF033C */   lui       $v1, (0xFF9FFFFF >> 16)
/* 5B09C 8006A89C FFFF6334 */  ori        $v1, $v1, (0xFF9FFFFF & 0xFFFF)
/* 5B0A0 8006A8A0 21202002 */  addu       $a0, $s1, $zero
/* 5B0A4 8006A8A4 0000028E */  lw         $v0, 0x0($s0)
/* 5B0A8 8006A8A8 20000524 */  addiu      $a1, $zero, 0x20
/* 5B0AC 8006A8AC 240012A6 */  sh         $s2, 0x24($s0)
/* 5B0B0 8006A8B0 260000A6 */  sh         $zero, 0x26($s0)
/* 5B0B4 8006A8B4 080013AE */  sw         $s3, 0x8($s0)
/* 5B0B8 8006A8B8 0C0014A6 */  sh         $s4, 0xC($s0)
/* 5B0BC 8006A8BC 24104300 */  and        $v0, $v0, $v1
/* 5B0C0 8006A8C0 00404234 */  ori        $v0, $v0, 0x4000
/* 5B0C4 8006A8C4 B0A3010C */  jal        CheckPhysObAbility
/* 5B0C8 8006A8C8 000002AE */   sw        $v0, 0x0($s0)
/* 5B0CC 8006A8CC 0C004010 */  beqz       $v0, .L8006A900
/* 5B0D0 8006A8D0 0100033C */   lui       $v1, (0x10000 >> 16)
/* 5B0D4 8006A8D4 0000028E */  lw         $v0, 0x0($s0)
/* 5B0D8 8006A8D8 00000000 */  nop
/* 5B0DC 8006A8DC 24104300 */  and        $v0, $v0, $v1
/* 5B0E0 8006A8E0 0A004010 */  beqz       $v0, .L8006A90C
/* 5B0E4 8006A8E4 21100000 */   addu      $v0, $zero, $zero
/* 5B0E8 8006A8E8 A7B7010C */  jal        PhysObGetLight
/* 5B0EC 8006A8EC 21202002 */   addu      $a0, $s1, $zero
/* 5B0F0 8006A8F0 03004010 */  beqz       $v0, .L8006A900
/* 5B0F4 8006A8F4 21202002 */   addu      $a0, $s1, $zero
/* 5B0F8 8006A8F8 65AB010C */  jal        PHYSOB_StartLighting
/* 5B0FC 8006A8FC 21284000 */   addu      $a1, $v0, $zero
.L8006A900:
/* 5B100 8006A900 43AA0108 */  j          .L8006A90C
/* 5B104 8006A904 21100000 */   addu      $v0, $zero, $zero
.L8006A908:
/* 5B108 8006A908 01000224 */  addiu      $v0, $zero, 0x1
.L8006A90C:
/* 5B10C 8006A90C 2400BF8F */  lw         $ra, 0x24($sp)
/* 5B110 8006A910 2000B48F */  lw         $s4, 0x20($sp)
/* 5B114 8006A914 1C00B38F */  lw         $s3, 0x1C($sp)
/* 5B118 8006A918 1800B28F */  lw         $s2, 0x18($sp)
/* 5B11C 8006A91C 1400B18F */  lw         $s1, 0x14($sp)
/* 5B120 8006A920 1000B08F */  lw         $s0, 0x10($sp)
/* 5B124 8006A924 0800E003 */  jr         $ra
/* 5B128 8006A928 2800BD27 */   addiu     $sp, $sp, 0x28
.size PickUpPhysOb, . - PickUpPhysOb
