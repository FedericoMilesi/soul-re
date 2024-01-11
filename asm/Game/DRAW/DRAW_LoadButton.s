.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DRAW_LoadButton
/* 1B708 8002AF08 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 1B70C 8002AF0C 2400B1AF */  sw         $s1, 0x24($sp)
/* 1B710 8002AF10 2188A000 */  addu       $s1, $a1, $zero
/* 1B714 8002AF14 2000B0AF */  sw         $s0, 0x20($sp)
/* 1B718 8002AF18 08009024 */  addiu      $s0, $a0, 0x8
/* 1B71C 8002AF1C 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 1B720 8002AF20 21980000 */  addu       $s3, $zero, $zero
/* 1B724 8002AF24 2800B2AF */  sw         $s2, 0x28($sp)
/* 1B728 8002AF28 21906002 */  addu       $s2, $s3, $zero
/* 1B72C 8002AF2C 3000B4AF */  sw         $s4, 0x30($sp)
/* 1B730 8002AF30 3400BFAF */  sw         $ra, 0x34($sp)
/* 1B734 8002AF34 0C0020AE */  sw         $zero, 0xC($s1)
/* 1B738 8002AF38 FCFF038E */  lw         $v1, -0x4($s0)
/* 1B73C 8002AF3C 08000224 */  addiu      $v0, $zero, 0x8
/* 1B740 8002AF40 07006214 */  bne        $v1, $v0, .L8002AF60
/* 1B744 8002AF44 21A06002 */   addu      $s4, $s3, $zero
/* 1B748 8002AF48 02000224 */  addiu      $v0, $zero, 0x2
/* 1B74C 8002AF4C 0C0022AE */  sw         $v0, 0xC($s1)
/* 1B750 8002AF50 10001224 */  addiu      $s2, $zero, 0x10
/* 1B754 8002AF54 01001424 */  addiu      $s4, $zero, 0x1
/* 1B758 8002AF58 0C001326 */  addiu      $s3, $s0, 0xC
/* 1B75C 8002AF5C 2C001026 */  addiu      $s0, $s0, 0x2C
.L8002AF60:
/* 1B760 8002AF60 08000296 */  lhu        $v0, 0x8($s0)
/* 1B764 8002AF64 00000000 */  nop
/* 1B768 8002AF68 040022A6 */  sh         $v0, 0x4($s1)
/* 1B76C 8002AF6C 0A000296 */  lhu        $v0, 0xA($s0)
/* 1B770 8002AF70 04002386 */  lh         $v1, 0x4($s1)
/* 1B774 8002AF74 060022A6 */  sh         $v0, 0x6($s1)
/* 1B778 8002AF78 00141200 */  sll        $v0, $s2, 16
/* 1B77C 8002AF7C 03140200 */  sra        $v0, $v0, 16
/* 1B780 8002AF80 2A104300 */  slt        $v0, $v0, $v1
/* 1B784 8002AF84 04002396 */  lhu        $v1, 0x4($s1)
/* 1B788 8002AF88 02004010 */  beqz       $v0, .L8002AF94
/* 1B78C 8002AF8C 21304002 */   addu      $a2, $s2, $zero
/* 1B790 8002AF90 21306000 */  addu       $a2, $v1, $zero
.L8002AF94:
/* 1B794 8002AF94 1800A427 */  addiu      $a0, $sp, 0x18
/* 1B798 8002AF98 1A00A527 */  addiu      $a1, $sp, 0x1A
/* 1B79C 8002AF9C 04000224 */  addiu      $v0, $zero, 0x4
/* 1B7A0 8002AFA0 1C00A6A7 */  sh         $a2, 0x1C($sp)
/* 1B7A4 8002AFA4 00340600 */  sll        $a2, $a2, 16
/* 1B7A8 8002AFA8 06002796 */  lhu        $a3, 0x6($s1)
/* 1B7AC 8002AFAC 03340600 */  sra        $a2, $a2, 16
/* 1B7B0 8002AFB0 2138F400 */  addu       $a3, $a3, $s4
/* 1B7B4 8002AFB4 1E00A7A7 */  sh         $a3, 0x1E($sp)
/* 1B7B8 8002AFB8 003C0700 */  sll        $a3, $a3, 16
/* 1B7BC 8002AFBC 033C0700 */  sra        $a3, $a3, 16
/* 1B7C0 8002AFC0 1000A2AF */  sw         $v0, 0x10($sp)
/* 1B7C4 8002AFC4 80CD010C */  jal        VRAM_CheckVramSlot
/* 1B7C8 8002AFC8 1400A0AF */   sw        $zero, 0x14($sp)
/* 1B7CC 8002AFCC 02000424 */  addiu      $a0, $zero, 0x2
/* 1B7D0 8002AFD0 080022AE */  sw         $v0, 0x8($s1)
/* 1B7D4 8002AFD4 0C002296 */  lhu        $v0, 0xC($s1)
/* 1B7D8 8002AFD8 1A00A597 */  lhu        $a1, 0x1A($sp)
/* 1B7DC 8002AFDC 1800A397 */  lhu        $v1, 0x18($sp)
/* 1B7E0 8002AFE0 23208200 */  subu       $a0, $a0, $v0
/* 1B7E4 8002AFE4 03008430 */  andi       $a0, $a0, 0x3
/* 1B7E8 8002AFE8 C0210400 */  sll        $a0, $a0, 7
/* 1B7EC 8002AFEC 0001A230 */  andi       $v0, $a1, 0x100
/* 1B7F0 8002AFF0 00140200 */  sll        $v0, $v0, 16
/* 1B7F4 8002AFF4 03150200 */  sra        $v0, $v0, 20
/* 1B7F8 8002AFF8 25208200 */  or         $a0, $a0, $v0
/* 1B7FC 8002AFFC FF036330 */  andi       $v1, $v1, 0x3FF
/* 1B800 8002B000 82190300 */  srl        $v1, $v1, 6
/* 1B804 8002B004 25208300 */  or         $a0, $a0, $v1
/* 1B808 8002B008 0002A530 */  andi       $a1, $a1, 0x200
/* 1B80C 8002B00C 80280500 */  sll        $a1, $a1, 2
/* 1B810 8002B010 0800228E */  lw         $v0, 0x8($s1)
/* 1B814 8002B014 25208500 */  or         $a0, $a0, $a1
/* 1B818 8002B018 000024A6 */  sh         $a0, 0x0($s1)
/* 1B81C 8002B01C 180051AC */  sw         $s1, 0x18($v0)
/* 1B820 8002B020 04002296 */  lhu        $v0, 0x4($s1)
/* 1B824 8002B024 1800A427 */  addiu      $a0, $sp, 0x18
/* 1B828 8002B028 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 1B82C 8002B02C 06002296 */  lhu        $v0, 0x6($s1)
/* 1B830 8002B030 0C000526 */  addiu      $a1, $s0, 0xC
/* 1B834 8002B034 94E9020C */  jal        func_800BA650
/* 1B838 8002B038 1E00A2A7 */   sh        $v0, 0x1E($sp)
/* 1B83C 8002B03C 10006012 */  beqz       $s3, .L8002B080
/* 1B840 8002B040 1800A427 */   addiu     $a0, $sp, 0x18
/* 1B844 8002B044 1A00A297 */  lhu        $v0, 0x1A($sp)
/* 1B848 8002B048 06002396 */  lhu        $v1, 0x6($s1)
/* 1B84C 8002B04C 21286002 */  addu       $a1, $s3, $zero
/* 1B850 8002B050 1C00B2A7 */  sh         $s2, 0x1C($sp)
/* 1B854 8002B054 1E00B4A7 */  sh         $s4, 0x1E($sp)
/* 1B858 8002B058 21104300 */  addu       $v0, $v0, $v1
/* 1B85C 8002B05C 94E9020C */  jal        func_800BA650
/* 1B860 8002B060 1A00A2A7 */   sh        $v0, 0x1A($sp)
/* 1B864 8002B064 1A00A397 */  lhu        $v1, 0x1A($sp)
/* 1B868 8002B068 1800A297 */  lhu        $v0, 0x18($sp)
/* 1B86C 8002B06C 80190300 */  sll        $v1, $v1, 6
/* 1B870 8002B070 02110200 */  srl        $v0, $v0, 4
/* 1B874 8002B074 3F004230 */  andi       $v0, $v0, 0x3F
/* 1B878 8002B078 25186200 */  or         $v1, $v1, $v0
/* 1B87C 8002B07C 020023A6 */  sh         $v1, 0x2($s1)
.L8002B080:
/* 1B880 8002B080 0FE9020C */  jal        func_800BA43C
/* 1B884 8002B084 21200000 */   addu      $a0, $zero, $zero
/* 1B888 8002B088 3400BF8F */  lw         $ra, 0x34($sp)
/* 1B88C 8002B08C 3000B48F */  lw         $s4, 0x30($sp)
/* 1B890 8002B090 2C00B38F */  lw         $s3, 0x2C($sp)
/* 1B894 8002B094 2800B28F */  lw         $s2, 0x28($sp)
/* 1B898 8002B098 2400B18F */  lw         $s1, 0x24($sp)
/* 1B89C 8002B09C 2000B08F */  lw         $s0, 0x20($sp)
/* 1B8A0 8002B0A0 0800E003 */  jr         $ra
/* 1B8A4 8002B0A4 3800BD27 */   addiu     $sp, $sp, 0x38
.size DRAW_LoadButton, . - DRAW_LoadButton
