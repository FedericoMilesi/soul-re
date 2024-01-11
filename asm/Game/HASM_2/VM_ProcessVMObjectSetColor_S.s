.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VM_ProcessVMObjectSetColor_S
/* 69150 80078950 801F023C */  lui        $v0, (0x1F800024 >> 16)
/* 69154 80078954 00005FAC */  sw         $ra, (0x1F800000 & 0xFFFF)($v0)
/* 69158 80078958 040050AC */  sw         $s0, (0x1F800004 & 0xFFFF)($v0)
/* 6915C 8007895C 080051AC */  sw         $s1, (0x1F800008 & 0xFFFF)($v0)
/* 69160 80078960 0C0052AC */  sw         $s2, (0x1F80000C & 0xFFFF)($v0)
/* 69164 80078964 100053AC */  sw         $s3, (0x1F800010 & 0xFFFF)($v0)
/* 69168 80078968 140054AC */  sw         $s4, (0x1F800014 & 0xFFFF)($v0)
/* 6916C 8007896C 180055AC */  sw         $s5, (0x1F800018 & 0xFFFF)($v0)
/* 69170 80078970 1C0056AC */  sw         $s6, (0x1F80001C & 0xFFFF)($v0)
/* 69174 80078974 200057AC */  sw         $s7, (0x1F800020 & 0xFFFF)($v0)
/* 69178 80078978 24005EAC */  sw         $fp, (0x1F800024 & 0xFFFF)($v0)
/* 6917C 8007897C 2180A000 */  addu       $s0, $a1, $zero
/* 69180 80078980 21B88000 */  addu       $s7, $a0, $zero
/* 69184 80078984 0000128E */  lw         $s2, 0x0($s0)
/* 69188 80078988 0C00138E */  lw         $s3, 0xC($s0)
/* 6918C 8007898C 16E1010C */  jal        func_80078458
/* 69190 80078990 00000000 */   nop
/* 69194 80078994 801F023C */  lui        $v0, (0x1F800018 >> 16)
/* 69198 80078998 00005F8C */  lw         $ra, (0x1F800000 & 0xFFFF)($v0)
/* 6919C 8007899C 0400508C */  lw         $s0, (0x1F800004 & 0xFFFF)($v0)
/* 691A0 800789A0 0800518C */  lw         $s1, (0x1F800008 & 0xFFFF)($v0)
/* 691A4 800789A4 0C00528C */  lw         $s2, (0x1F80000C & 0xFFFF)($v0)
/* 691A8 800789A8 1000538C */  lw         $s3, (0x1F800010 & 0xFFFF)($v0)
/* 691AC 800789AC 1400548C */  lw         $s4, (0x1F800014 & 0xFFFF)($v0)
/* 691B0 800789B0 1C00568C */  lw         $s6, (0x1F80001C & 0xFFFF)($v0)
/* 691B4 800789B4 2000578C */  lw         $s7, (0x1F800020 & 0xFFFF)($v0)
/* 691B8 800789B8 24005E8C */  lw         $fp, (0x1F800024 & 0xFFFF)($v0)
/* 691BC 800789BC 0800E003 */  jr         $ra
/* 691C0 800789C0 1800558C */   lw        $s5, (0x1F800018 & 0xFFFF)($v0)
.size VM_ProcessVMObjectSetColor_S, . - VM_ProcessVMObjectSetColor_S
