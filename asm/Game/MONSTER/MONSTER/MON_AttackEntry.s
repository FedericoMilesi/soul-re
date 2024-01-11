.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_AttackEntry
/* 7A3B8 80089BB8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7A3BC 80089BBC 1000B0AF */  sw         $s0, 0x10($sp)
/* 7A3C0 80089BC0 21808000 */  addu       $s0, $a0, $zero
/* 7A3C4 80089BC4 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 7A3C8 80089BC8 1800B2AF */  sw         $s2, 0x18($sp)
/* 7A3CC 80089BCC 1400B1AF */  sw         $s1, 0x14($sp)
/* 7A3D0 80089BD0 6C01118E */  lw         $s1, 0x16C($s0)
/* 7A3D4 80089BD4 00000000 */  nop
/* 7A3D8 80089BD8 B800328E */  lw         $s2, 0xB8($s1)
/* 7A3DC 80089BDC 2000023C */  lui        $v0, (0x200000 >> 16)
/* 7A3E0 80089BE0 1B004526 */  addiu      $a1, $s2, 0x1B
/* 7A3E4 80089BE4 21300000 */  addu       $a2, $zero, $zero
/* 7A3E8 80089BE8 01000724 */  addiu      $a3, $zero, 0x1
/* 7A3EC 80089BEC 6FFF010C */  jal        MON_PlayAnimFromList
/* 7A3F0 80089BF0 080122AE */   sw        $v0, 0x108($s1)
/* 7A3F4 80089BF4 9006020C */  jal        MON_GetTime
/* 7A3F8 80089BF8 21200002 */   addu      $a0, $s0, $zero
/* 7A3FC 80089BFC 0D004482 */  lb         $a0, 0xD($s2)
/* 7A400 80089C00 00000000 */  nop
/* 7A404 80089C04 40190400 */  sll        $v1, $a0, 5
/* 7A408 80089C08 21186400 */  addu       $v1, $v1, $a0
/* 7A40C 80089C0C 21104300 */  addu       $v0, $v0, $v1
/* 7A410 80089C10 140122AE */  sw         $v0, 0x114($s1)
/* 7A414 80089C14 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 7A418 80089C18 1800B28F */  lw         $s2, 0x18($sp)
/* 7A41C 80089C1C 1400B18F */  lw         $s1, 0x14($sp)
/* 7A420 80089C20 1000B08F */  lw         $s0, 0x10($sp)
/* 7A424 80089C24 0800E003 */  jr         $ra
/* 7A428 80089C28 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_AttackEntry, . - MON_AttackEntry
