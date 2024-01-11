.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_GetInstanceQueryFunc
/* 2E96C 8003E16C 1C00828C */  lw         $v0, 0x1C($a0)
/* 2E970 8003E170 00000000 */  nop
/* 2E974 8003E174 04004584 */  lh         $a1, 0x4($v0)
/* 2E978 8003E178 00000000 */  nop
/* 2E97C 8003E17C 0A00A004 */  bltz       $a1, .L8003E1A8
/* 2E980 8003E180 0480023C */   lui       $v0, %hi(GenericQuery)
/* 2E984 8003E184 0D80023C */  lui        $v0, %hi(objectFunc)
/* 2E988 8003E188 1CA34224 */  addiu      $v0, $v0, %lo(objectFunc)
/* 2E98C 8003E18C C0180500 */  sll        $v1, $a1, 3
/* 2E990 8003E190 21186500 */  addu       $v1, $v1, $a1
/* 2E994 8003E194 80180300 */  sll        $v1, $v1, 2
/* 2E998 8003E198 21186200 */  addu       $v1, $v1, $v0
/* 2E99C 8003E19C 1000628C */  lw         $v0, 0x10($v1)
/* 2E9A0 8003E1A0 0800E003 */  jr         $ra
/* 2E9A4 8003E1A4 180182AC */   sw        $v0, 0x118($a0)
.L8003E1A8:
/* 2E9A8 8003E1A8 38E94224 */  addiu      $v0, $v0, %lo(GenericQuery)
/* 2E9AC 8003E1AC 0800E003 */  jr         $ra
/* 2E9B0 8003E1B0 180182AC */   sw        $v0, 0x118($a0)
.size OBTABLE_GetInstanceQueryFunc, . - OBTABLE_GetInstanceQueryFunc
