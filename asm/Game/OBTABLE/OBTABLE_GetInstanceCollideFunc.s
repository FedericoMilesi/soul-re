.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_GetInstanceCollideFunc
/* 2E89C 8003E09C 1C00828C */  lw         $v0, 0x1C($a0)
/* 2E8A0 8003E0A0 00000000 */  nop
/* 2E8A4 8003E0A4 04004584 */  lh         $a1, 0x4($v0)
/* 2E8A8 8003E0A8 00000000 */  nop
/* 2E8AC 8003E0AC 0A00A004 */  bltz       $a1, .L8003E0D8
/* 2E8B0 8003E0B0 0480023C */   lui       $v0, %hi(GenericCollide)
/* 2E8B4 8003E0B4 0D80023C */  lui        $v0, %hi(objectFunc)
/* 2E8B8 8003E0B8 1CA34224 */  addiu      $v0, $v0, %lo(objectFunc)
/* 2E8BC 8003E0BC C0180500 */  sll        $v1, $a1, 3
/* 2E8C0 8003E0C0 21186500 */  addu       $v1, $v1, $a1
/* 2E8C4 8003E0C4 80180300 */  sll        $v1, $v1, 2
/* 2E8C8 8003E0C8 21186200 */  addu       $v1, $v1, $v0
/* 2E8CC 8003E0CC 0C00628C */  lw         $v0, 0xC($v1)
/* 2E8D0 8003E0D0 0800E003 */  jr         $ra
/* 2E8D4 8003E0D4 0C0182AC */   sw        $v0, 0x10C($a0)
.L8003E0D8:
/* 2E8D8 8003E0D8 DCE84224 */  addiu      $v0, $v0, %lo(GenericCollide)
/* 2E8DC 8003E0DC 0800E003 */  jr         $ra
/* 2E8E0 8003E0E0 0C0182AC */   sw        $v0, 0x10C($a0)
.size OBTABLE_GetInstanceCollideFunc, . - OBTABLE_GetInstanceCollideFunc
