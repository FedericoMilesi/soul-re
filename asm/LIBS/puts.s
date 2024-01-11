.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel puts
/* B0E64 800C0664 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B0E68 800C0668 1000B0AF */  sw         $s0, 0x10($sp)
/* B0E6C 800C066C 21808000 */  addu       $s0, $a0, $zero
/* B0E70 800C0670 06000016 */  bnez       $s0, .L800C068C
/* B0E74 800C0674 1400BFAF */   sw        $ra, 0x14($sp)
/* B0E78 800C0678 0180103C */  lui        $s0, %hi(D_800129B4)
/* B0E7C 800C067C A3010308 */  j          .L800C068C
/* B0E80 800C0680 B4291026 */   addiu     $s0, $s0, %lo(D_800129B4)
.L800C0684:
/* B0E84 800C0684 F41C030C */  jal        _putchar
/* B0E88 800C0688 03260400 */   sra       $a0, $a0, 24
.L800C068C:
/* B0E8C 800C068C 00000492 */  lbu        $a0, 0x0($s0)
/* B0E90 800C0690 00000000 */  nop
/* B0E94 800C0694 00260400 */  sll        $a0, $a0, 24
/* B0E98 800C0698 FAFF8014 */  bnez       $a0, .L800C0684
/* B0E9C 800C069C 01001026 */   addiu     $s0, $s0, 0x1
/* B0EA0 800C06A0 331D030C */  jal        _putchar_flash
/* B0EA4 800C06A4 00000000 */   nop
/* B0EA8 800C06A8 1400BF8F */  lw         $ra, 0x14($sp)
/* B0EAC 800C06AC 1000B08F */  lw         $s0, 0x10($sp)
/* B0EB0 800C06B0 0800E003 */  jr         $ra
/* B0EB4 800C06B4 1800BD27 */   addiu     $sp, $sp, 0x18
/* B0EB8 800C06B8 00000000 */  nop
/* B0EBC 800C06BC 00000000 */  nop
/* B0EC0 800C06C0 00000000 */  nop
.size puts, . - puts
