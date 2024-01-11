.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetObjectBreakOffData
/* 62064 80071864 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 62068 80071868 1000B0AF */  sw         $s0, 0x10($sp)
/* 6206C 8007186C 4000B08F */  lw         $s0, 0x40($sp)
/* 62070 80071870 1400B1AF */  sw         $s1, 0x14($sp)
/* 62074 80071874 4400B18F */  lw         $s1, 0x44($sp)
/* 62078 80071878 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6207C 8007187C 21988000 */  addu       $s3, $a0, $zero
/* 62080 80071880 2000B4AF */  sw         $s4, 0x20($sp)
/* 62084 80071884 21A0A000 */  addu       $s4, $a1, $zero
/* 62088 80071888 2400B5AF */  sw         $s5, 0x24($sp)
/* 6208C 8007188C 21A8C000 */  addu       $s5, $a2, $zero
/* 62090 80071890 2800B6AF */  sw         $s6, 0x28($sp)
/* 62094 80071894 21B0E000 */  addu       $s6, $a3, $zero
/* 62098 80071898 1800B2AF */  sw         $s2, 0x18($sp)
/* 6209C 8007189C 4800B28F */  lw         $s2, 0x48($sp)
/* 620A0 800718A0 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 620A4 800718A4 6DC3010C */  jal        CIRC_Alloc
/* 620A8 800718A8 10000424 */   addiu     $a0, $zero, 0x10
/* 620AC 800718AC 000053AC */  sw         $s3, 0x0($v0)
/* 620B0 800718B0 040054A4 */  sh         $s4, 0x4($v0)
/* 620B4 800718B4 060055A4 */  sh         $s5, 0x6($v0)
/* 620B8 800718B8 080056A4 */  sh         $s6, 0x8($v0)
/* 620BC 800718BC 0A0050A4 */  sh         $s0, 0xA($v0)
/* 620C0 800718C0 0C0051A4 */  sh         $s1, 0xC($v0)
/* 620C4 800718C4 0E0052A4 */  sh         $s2, 0xE($v0)
/* 620C8 800718C8 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 620CC 800718CC 2800B68F */  lw         $s6, 0x28($sp)
/* 620D0 800718D0 2400B58F */  lw         $s5, 0x24($sp)
/* 620D4 800718D4 2000B48F */  lw         $s4, 0x20($sp)
/* 620D8 800718D8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 620DC 800718DC 1800B28F */  lw         $s2, 0x18($sp)
/* 620E0 800718E0 1400B18F */  lw         $s1, 0x14($sp)
/* 620E4 800718E4 1000B08F */  lw         $s0, 0x10($sp)
/* 620E8 800718E8 0800E003 */  jr         $ra
/* 620EC 800718EC 3000BD27 */   addiu     $sp, $sp, 0x30
.size SetObjectBreakOffData, . - SetObjectBreakOffData
