.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_GetInstanceProcessFunc
/* 2E924 8003E124 1C00828C */  lw         $v0, 0x1C($a0)
/* 2E928 8003E128 00000000 */  nop
/* 2E92C 8003E12C 04004584 */  lh         $a1, 0x4($v0)
/* 2E930 8003E130 00000000 */  nop
/* 2E934 8003E134 0A00A004 */  bltz       $a1, .L8003E160
/* 2E938 8003E138 0480023C */   lui       $v0, %hi(GenericProcess)
/* 2E93C 8003E13C 0D80023C */  lui        $v0, %hi(objectFunc)
/* 2E940 8003E140 1CA34224 */  addiu      $v0, $v0, %lo(objectFunc)
/* 2E944 8003E144 C0180500 */  sll        $v1, $a1, 3
/* 2E948 8003E148 21186500 */  addu       $v1, $v1, $a1
/* 2E94C 8003E14C 80180300 */  sll        $v1, $v1, 2
/* 2E950 8003E150 21186200 */  addu       $v1, $v1, $v0
/* 2E954 8003E154 0800628C */  lw         $v0, 0x8($v1)
/* 2E958 8003E158 0800E003 */  jr         $ra
/* 2E95C 8003E15C 080182AC */   sw        $v0, 0x108($a0)
.L8003E160:
/* 2E960 8003E160 E4E84224 */  addiu      $v0, $v0, %lo(GenericProcess)
/* 2E964 8003E164 0800E003 */  jr         $ra
/* 2E968 8003E168 080182AC */   sw        $v0, 0x108($a0)
.size OBTABLE_GetInstanceProcessFunc, . - OBTABLE_GetInstanceProcessFunc
