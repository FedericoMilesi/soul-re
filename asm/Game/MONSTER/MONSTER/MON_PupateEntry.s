.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_PupateEntry
/* 7C038 8008B838 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7C03C 8008B83C 1800BFAF */  sw         $ra, 0x18($sp)
/* 7C040 8008B840 1400B1AF */  sw         $s1, 0x14($sp)
/* 7C044 8008B844 1000B0AF */  sw         $s0, 0x10($sp)
/* 7C048 8008B848 1400828C */  lw         $v0, 0x14($a0)
/* 7C04C 8008B84C 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 7C050 8008B850 00084234 */  ori        $v0, $v0, 0x800
/* 7C054 8008B854 140082AC */  sw         $v0, 0x14($a0)
/* 7C058 8008B858 1800828C */  lw         $v0, 0x18($a0)
/* 7C05C 8008B85C 6C01918C */  lw         $s1, 0x16C($a0)
/* 7C060 8008B860 25104300 */  or         $v0, $v0, $v1
/* 7C064 8008B864 9006020C */  jal        MON_GetTime
/* 7C068 8008B868 180082AC */   sw        $v0, 0x18($a0)
/* 7C06C 8008B86C 3AF2020C */  jal        func_800BC8E8
/* 7C070 8008B870 21804000 */   addu      $s0, $v0, $zero
/* 7C074 8008B874 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 7C078 8008B878 D0074224 */  addiu      $v0, $v0, 0x7D0
/* 7C07C 8008B87C 21800202 */  addu       $s0, $s0, $v0
/* 7C080 8008B880 1C0130AE */  sw         $s0, 0x11C($s1)
/* 7C084 8008B884 1800BF8F */  lw         $ra, 0x18($sp)
/* 7C088 8008B888 1400B18F */  lw         $s1, 0x14($sp)
/* 7C08C 8008B88C 1000B08F */  lw         $s0, 0x10($sp)
/* 7C090 8008B890 0800E003 */  jr         $ra
/* 7C094 8008B894 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_PupateEntry, . - MON_PupateEntry
