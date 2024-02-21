.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel localstr_set_language
/* A7E3C 800B763C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A7E40 800B7640 0D80043C */  lui        $a0, %hi(D_800D1EE8)
/* A7E44 800B7644 E81E8424 */  addiu      $a0, $a0, %lo(D_800D1EE8)
/* A7E48 800B7648 1000BFAF */  sw         $ra, 0x10($sp)
/* A7E4C 800B764C 58DE000C */  jal        LOAD_ReadFileFromCD
/* A7E50 800B7650 06000524 */   addiu     $a1, $zero, 0x6
/* A7E54 800B7654 21204000 */  addu       $a0, $v0, $zero
/* A7E58 800B7658 44A984AF */  sw         $a0, %gp_rel(LocalizationTable)($gp)
/* A7E5C 800B765C 17008010 */  beqz       $a0, .L800B76BC
/* A7E60 800B7660 10008624 */   addiu     $a2, $a0, 0x10
/* A7E64 800B7664 0800828C */  lw         $v0, 0x8($a0)
/* A7E68 800B7668 0C00838C */  lw         $v1, 0xC($a0)
/* A7E6C 800B766C 48A986AF */  sw         $a2, %gp_rel(LocalStrings)($gp)
/* A7E70 800B7670 21108200 */  addu       $v0, $a0, $v0
/* A7E74 800B7674 4CA982AF */  sw         $v0, %gp_rel(voiceList)($gp)
/* A7E78 800B7678 0B006018 */  blez       $v1, .L800B76A8
/* A7E7C 800B767C 21280000 */   addu      $a1, $zero, $zero
/* A7E80 800B7680 2118C000 */  addu       $v1, $a2, $zero
.L800B7684:
/* A7E84 800B7684 0000628C */  lw         $v0, 0x0($v1)
/* A7E88 800B7688 0100A524 */  addiu      $a1, $a1, 0x1
/* A7E8C 800B768C 21104400 */  addu       $v0, $v0, $a0
/* A7E90 800B7690 000062AC */  sw         $v0, 0x0($v1)
/* A7E94 800B7694 0C00828C */  lw         $v0, 0xC($a0)
/* A7E98 800B7698 00000000 */  nop
/* A7E9C 800B769C 2A10A200 */  slt        $v0, $a1, $v0
/* A7EA0 800B76A0 F8FF4014 */  bnez       $v0, .L800B7684
/* A7EA4 800B76A4 04006324 */   addiu     $v1, $v1, 0x4
.L800B76A8:
/* A7EA8 800B76A8 44A9828F */  lw         $v0, %gp_rel(LocalizationTable)($gp)
/* A7EAC 800B76AC 00000000 */  nop
/* A7EB0 800B76B0 0000428C */  lw         $v0, 0x0($v0)
/* A7EB4 800B76B4 00000000 */  nop
/* A7EB8 800B76B8 180082AF */  sw         $v0, %gp_rel(the_language)($gp)
.L800B76BC:
/* A7EBC 800B76BC 1000BF8F */  lw         $ra, 0x10($sp)
/* A7EC0 800B76C0 00000000 */  nop
/* A7EC4 800B76C4 0800E003 */  jr         $ra
/* A7EC8 800B76C8 1800BD27 */   addiu     $sp, $sp, 0x18
.size localstr_set_language, . - localstr_set_language
