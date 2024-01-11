.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysicsDefaultLinkedMoveResponse
/* 65658 80074E58 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6565C 80074E5C 1000B0AF */  sw         $s0, 0x10($sp)
/* 65660 80074E60 21808000 */  addu       $s0, $a0, $zero
/* 65664 80074E64 1400B1AF */  sw         $s1, 0x14($sp)
/* 65668 80074E68 2188A000 */  addu       $s1, $a1, $zero
/* 6566C 80074E6C 1800BFAF */  sw         $ra, 0x18($sp)
/* 65670 80074E70 5C000296 */  lhu        $v0, 0x5C($s0)
/* 65674 80074E74 08002396 */  lhu        $v1, 0x8($s1)
/* 65678 80074E78 00000000 */  nop
/* 6567C 80074E7C 21104300 */  addu       $v0, $v0, $v1
/* 65680 80074E80 5C0002A6 */  sh         $v0, 0x5C($s0)
/* 65684 80074E84 5E000296 */  lhu        $v0, 0x5E($s0)
/* 65688 80074E88 0A002396 */  lhu        $v1, 0xA($s1)
/* 6568C 80074E8C 00000000 */  nop
/* 65690 80074E90 21104300 */  addu       $v0, $v0, $v1
/* 65694 80074E94 5E0002A6 */  sh         $v0, 0x5E($s0)
/* 65698 80074E98 60000296 */  lhu        $v0, 0x60($s0)
/* 6569C 80074E9C 0C002396 */  lhu        $v1, 0xC($s1)
/* 656A0 80074EA0 00000000 */  nop
/* 656A4 80074EA4 21104300 */  addu       $v0, $v0, $v1
/* 656A8 80074EA8 0300C010 */  beqz       $a2, .L80074EB8
/* 656AC 80074EAC 600002A6 */   sh        $v0, 0x60($s0)
/* 656B0 80074EB0 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 656B4 80074EB4 08002526 */   addiu     $a1, $s1, 0x8
.L80074EB8:
/* 656B8 80074EB8 78000296 */  lhu        $v0, 0x78($s0)
/* 656BC 80074EBC 14002396 */  lhu        $v1, 0x14($s1)
/* 656C0 80074EC0 00000000 */  nop
/* 656C4 80074EC4 21104300 */  addu       $v0, $v0, $v1
/* 656C8 80074EC8 780002A6 */  sh         $v0, 0x78($s0)
/* 656CC 80074ECC 1800BF8F */  lw         $ra, 0x18($sp)
/* 656D0 80074ED0 1400B18F */  lw         $s1, 0x14($sp)
/* 656D4 80074ED4 1000B08F */  lw         $s0, 0x10($sp)
/* 656D8 80074ED8 0800E003 */  jr         $ra
/* 656DC 80074EDC 2000BD27 */   addiu     $sp, $sp, 0x20
.size PhysicsDefaultLinkedMoveResponse, . - PhysicsDefaultLinkedMoveResponse
