.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Hide
/* 7B750 8008AF50 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7B754 8008AF54 1400B1AF */  sw         $s1, 0x14($sp)
/* 7B758 8008AF58 21888000 */  addu       $s1, $a0, $zero
/* 7B75C 8008AF5C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 7B760 8008AF60 1800B2AF */  sw         $s2, 0x18($sp)
/* 7B764 8008AF64 1000B0AF */  sw         $s0, 0x10($sp)
/* 7B768 8008AF68 6C01308E */  lw         $s0, 0x16C($s1)
/* 7B76C 8008AF6C 00000000 */  nop
/* 7B770 8008AF70 0000048E */  lw         $a0, 0x0($s0)
/* 7B774 8008AF74 C400128E */  lw         $s2, 0xC4($s0)
/* 7B778 8008AF78 04008230 */  andi       $v0, $a0, 0x4
/* 7B77C 8008AF7C 3B004014 */  bnez       $v0, .L8008B06C
/* 7B780 8008AF80 00000000 */   nop
/* 7B784 8008AF84 39004012 */  beqz       $s2, .L8008B06C
/* 7B788 8008AF88 08000224 */   addiu     $v0, $zero, 0x8
/* 7B78C 8008AF8C 5A010392 */  lbu        $v1, 0x15A($s0)
/* 7B790 8008AF90 00000000 */  nop
/* 7B794 8008AF94 13006210 */  beq        $v1, $v0, .L8008AFE4
/* 7B798 8008AF98 09006228 */   slti      $v0, $v1, 0x9
/* 7B79C 8008AF9C 05004010 */  beqz       $v0, .L8008AFB4
/* 7B7A0 8008AFA0 04000224 */   addiu     $v0, $zero, 0x4
/* 7B7A4 8008AFA4 08006210 */  beq        $v1, $v0, .L8008AFC8
/* 7B7A8 8008AFA8 21202002 */   addu      $a0, $s1, $zero
/* 7B7AC 8008AFAC 192C0208 */  j          .L8008B064
/* 7B7B0 8008AFB0 01000524 */   addiu     $a1, $zero, 0x1
.L8008AFB4:
/* 7B7B4 8008AFB4 09000224 */  addiu      $v0, $zero, 0x9
/* 7B7B8 8008AFB8 08006210 */  beq        $v1, $v0, .L8008AFDC
/* 7B7BC 8008AFBC 21202002 */   addu      $a0, $s1, $zero
/* 7B7C0 8008AFC0 192C0208 */  j          .L8008B064
/* 7B7C4 8008AFC4 01000524 */   addiu     $a1, $zero, 0x1
.L8008AFC8:
/* 7B7C8 8008AFC8 5C010592 */  lbu        $a1, 0x15C($s0)
/* 7B7CC 8008AFCC D804020C */  jal        MON_ChangeBehavior
/* 7B7D0 8008AFD0 21202002 */   addu      $a0, $s1, $zero
/* 7B7D4 8008AFD4 1B2C0208 */  j          .L8008B06C
/* 7B7D8 8008AFD8 00000000 */   nop
.L8008AFDC:
/* 7B7DC 8008AFDC 192C0208 */  j          .L8008B064
/* 7B7E0 8008AFE0 13000524 */   addiu     $a1, $zero, 0x13
.L8008AFE4:
/* 7B7E4 8008AFE4 0040023C */  lui        $v0, (0x40000000 >> 16)
/* 7B7E8 8008AFE8 24108200 */  and        $v0, $a0, $v0
/* 7B7EC 8008AFEC 1F004014 */  bnez       $v0, .L8008B06C
/* 7B7F0 8008AFF0 00000000 */   nop
/* 7B7F4 8008AFF4 460C020C */  jal        MON_ShouldIAmbushEnemy
/* 7B7F8 8008AFF8 21202002 */   addu      $a0, $s1, $zero
/* 7B7FC 8008AFFC 1B004010 */  beqz       $v0, .L8008B06C
/* 7B800 8008B000 00000000 */   nop
/* 7B804 8008B004 57010382 */  lb         $v1, 0x157($s0)
/* 7B808 8008B008 00000000 */  nop
/* 7B80C 8008B00C 09006014 */  bnez       $v1, .L8008B034
/* 7B810 8008B010 01000224 */   addiu     $v0, $zero, 0x1
/* 7B814 8008B014 21202002 */  addu       $a0, $s1, $zero
/* 7B818 8008B018 0400458E */  lw         $a1, 0x4($s2)
/* 7B81C 8008B01C 00100624 */  addiu      $a2, $zero, 0x1000
/* 7B820 8008B020 6604020C */  jal        MON_TurnToPosition
/* 7B824 8008B024 5C00A524 */   addiu     $a1, $a1, 0x5C
/* 7B828 8008B028 21202002 */  addu       $a0, $s1, $zero
/* 7B82C 8008B02C 192C0208 */  j          .L8008B064
/* 7B830 8008B030 15000524 */   addiu     $a1, $zero, 0x15
.L8008B034:
/* 7B834 8008B034 03006214 */  bne        $v1, $v0, .L8008B044
/* 7B838 8008B038 21202002 */   addu      $a0, $s1, $zero
/* 7B83C 8008B03C 122C0208 */  j          .L8008B048
/* 7B840 8008B040 28000524 */   addiu     $a1, $zero, 0x28
.L8008B044:
/* 7B844 8008B044 29000524 */  addiu      $a1, $zero, 0x29
.L8008B048:
/* 7B848 8008B048 B6FF010C */  jal        MON_PlayAnim
/* 7B84C 8008B04C 01000624 */   addiu     $a2, $zero, 0x1
/* 7B850 8008B050 0000028E */  lw         $v0, 0x0($s0)
/* 7B854 8008B054 0040033C */  lui        $v1, (0x40000000 >> 16)
/* 7B858 8008B058 25104300 */  or         $v0, $v0, $v1
/* 7B85C 8008B05C 1B2C0208 */  j          .L8008B06C
/* 7B860 8008B060 000002AE */   sw        $v0, 0x0($s0)
.L8008B064:
/* 7B864 8008B064 91FE010C */  jal        MON_SwitchState
/* 7B868 8008B068 00000000 */   nop
.L8008B06C:
/* 7B86C 8008B06C 1800228E */  lw         $v0, 0x18($s1)
/* 7B870 8008B070 00000000 */  nop
/* 7B874 8008B074 10004230 */  andi       $v0, $v0, 0x10
/* 7B878 8008B078 0C004010 */  beqz       $v0, .L8008B0AC
/* 7B87C 8008B07C 0040033C */   lui       $v1, (0x40000000 >> 16)
/* 7B880 8008B080 0000028E */  lw         $v0, 0x0($s0)
/* 7B884 8008B084 00000000 */  nop
/* 7B888 8008B088 24104300 */  and        $v0, $v0, $v1
/* 7B88C 8008B08C 05004010 */  beqz       $v0, .L8008B0A4
/* 7B890 8008B090 21202002 */   addu      $a0, $s1, $zero
/* 7B894 8008B094 91FE010C */  jal        MON_SwitchState
/* 7B898 8008B098 0D000524 */   addiu     $a1, $zero, 0xD
/* 7B89C 8008B09C 2B2C0208 */  j          .L8008B0AC
/* 7B8A0 8008B0A0 00000000 */   nop
.L8008B0A4:
/* 7B8A4 8008B0A4 3403020C */  jal        MON_PlayRandomIdle
/* 7B8A8 8008B0A8 01000524 */   addiu     $a1, $zero, 0x1
.L8008B0AC:
/* 7B8AC 8008B0AC 0917020C */  jal        MON_DefaultQueueHandler
/* 7B8B0 8008B0B0 21202002 */   addu      $a0, $s1, $zero
/* 7B8B4 8008B0B4 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 7B8B8 8008B0B8 1800B28F */  lw         $s2, 0x18($sp)
/* 7B8BC 8008B0BC 1400B18F */  lw         $s1, 0x14($sp)
/* 7B8C0 8008B0C0 1000B08F */  lw         $s0, 0x10($sp)
/* 7B8C4 8008B0C4 0800E003 */  jr         $ra
/* 7B8C8 8008B0C8 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_Hide, . - MON_Hide
