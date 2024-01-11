.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_RelocateInstance
/* 4CA28 8005C228 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4CA2C 8005C22C 1000B0AF */  sw         $s0, 0x10($sp)
/* 4CA30 8005C230 21808000 */  addu       $s0, $a0, $zero
/* 4CA34 8005C234 1400B1AF */  sw         $s1, 0x14($sp)
/* 4CA38 8005C238 2188A000 */  addu       $s1, $a1, $zero
/* 4CA3C 8005C23C 1800BFAF */  sw         $ra, 0x18($sp)
/* 4CA40 8005C240 9C70010C */  jal        STREAM_OffsetInstancePosition
/* 4CA44 8005C244 01000624 */   addiu     $a2, $zero, 0x1
/* 4CA48 8005C248 21200002 */  addu       $a0, $s0, $zero
/* 4CA4C 8005C24C 1000053C */  lui        $a1, (0x100008 >> 16)
/* 4CA50 8005C250 0800A534 */  ori        $a1, $a1, (0x100008 & 0xFFFF)
/* 4CA54 8005C254 A1D1000C */  jal        INSTANCE_Post
/* 4CA58 8005C258 21302002 */   addu      $a2, $s1, $zero
/* 4CA5C 8005C25C 1800BF8F */  lw         $ra, 0x18($sp)
/* 4CA60 8005C260 1400B18F */  lw         $s1, 0x14($sp)
/* 4CA64 8005C264 1000B08F */  lw         $s0, 0x10($sp)
/* 4CA68 8005C268 0800E003 */  jr         $ra
/* 4CA6C 8005C26C 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_RelocateInstance, . - STREAM_RelocateInstance
