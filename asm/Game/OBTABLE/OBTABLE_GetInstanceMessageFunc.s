.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_GetInstanceMessageFunc
/* 2E9B4 8003E1B4 1C00828C */  lw         $v0, 0x1C($a0)
/* 2E9B8 8003E1B8 00000000 */  nop
/* 2E9BC 8003E1BC 04004584 */  lh         $a1, 0x4($v0)
/* 2E9C0 8003E1C0 00000000 */  nop
/* 2E9C4 8003E1C4 0A00A004 */  bltz       $a1, .L8003E1F0
/* 2E9C8 8003E1C8 0480023C */   lui       $v0, %hi(GenericMessage)
/* 2E9CC 8003E1CC 0D80023C */  lui        $v0, %hi(objectFunc)
/* 2E9D0 8003E1D0 1CA34224 */  addiu      $v0, $v0, %lo(objectFunc)
/* 2E9D4 8003E1D4 C0180500 */  sll        $v1, $a1, 3
/* 2E9D8 8003E1D8 21186500 */  addu       $v1, $v1, $a1
/* 2E9DC 8003E1DC 80180300 */  sll        $v1, $v1, 2
/* 2E9E0 8003E1E0 21186200 */  addu       $v1, $v1, $v0
/* 2E9E4 8003E1E4 1400628C */  lw         $v0, 0x14($v1)
/* 2E9E8 8003E1E8 0800E003 */  jr         $ra
/* 2E9EC 8003E1EC 1C0182AC */   sw        $v0, 0x11C($a0)
.L8003E1F0:
/* 2E9F0 8003E1F0 B0EA4224 */  addiu      $v0, $v0, %lo(GenericMessage)
/* 2E9F4 8003E1F4 0800E003 */  jr         $ra
/* 2E9F8 8003E1F8 1C0182AC */   sw        $v0, 0x11C($a0)
.size OBTABLE_GetInstanceMessageFunc, . - OBTABLE_GetInstanceMessageFunc
