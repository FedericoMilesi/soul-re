.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_Process
/* 20DC8 800305C8 56948287 */  lh         $v0, %gp_rel(gEndGameNow)($gp)
/* 20DCC 800305CC C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 20DD0 800305D0 3400B5AF */  sw         $s5, 0x34($sp)
/* 20DD4 800305D4 21A88000 */  addu       $s5, $a0, $zero
/* 20DD8 800305D8 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 20DDC 800305DC 3800B6AF */  sw         $s6, 0x38($sp)
/* 20DE0 800305E0 3000B4AF */  sw         $s4, 0x30($sp)
/* 20DE4 800305E4 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 20DE8 800305E8 2800B2AF */  sw         $s2, 0x28($sp)
/* 20DEC 800305EC 2400B1AF */  sw         $s1, 0x24($sp)
/* 20DF0 800305F0 06004010 */  beqz       $v0, .L8003060C
/* 20DF4 800305F4 2000B0AF */   sw        $s0, 0x20($sp)
/* 20DF8 800305F8 2051000C */  jal        DEBUG_ExitGame
/* 20DFC 800305FC 00000000 */   nop
/* 20E00 80030600 03000224 */  addiu      $v0, $zero, 0x3
/* 20E04 80030604 F5C20008 */  j          .L80030BD4
/* 20E08 80030608 6C01A2A6 */   sh        $v0, 0x16C($s5)
.L8003060C:
/* 20E0C 8003060C F1C0000C */  jal        GAMELOOP_DoTimeProcess
/* 20E10 80030610 00000000 */   nop
/* 20E14 80030614 3ABF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x172)($gp)
/* 20E18 80030618 06000224 */  addiu      $v0, $zero, 0x6
/* 20E1C 8003061C 2D006210 */  beq        $v1, $v0, .L800306D4
/* 20E20 80030620 1000033C */   lui       $v1, (0x100000 >> 16)
/* 20E24 80030624 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 20E28 80030628 00000000 */  nop
/* 20E2C 8003062C 24104300 */  and        $v0, $v0, $v1
/* 20E30 80030630 28004014 */  bnez       $v0, .L800306D4
/* 20E34 80030634 00000000 */   nop
/* 20E38 80030638 2772010C */  jal        MORPH_UpdateTimeMult
/* 20E3C 8003063C 00000000 */   nop
/* 20E40 80030640 6EB7000C */  jal        GAMELOOP_CalcGameTime
/* 20E44 80030644 00000000 */   nop
/* 20E48 80030648 0A00A286 */  lh         $v0, 0xA($s5)
/* 20E4C 8003064C 00000000 */  nop
/* 20E50 80030650 07004010 */  beqz       $v0, .L80030670
/* 20E54 80030654 00000000 */   nop
/* 20E58 80030658 3402A28E */  lw         $v0, 0x234($s5)
/* 20E5C 8003065C 3C02A38E */  lw         $v1, 0x23C($s5)
/* 20E60 80030660 00000000 */  nop
/* 20E64 80030664 21104300 */  addu       $v0, $v0, $v1
/* 20E68 80030668 B5C10008 */  j          .L800306D4
/* 20E6C 8003066C 3402A2AE */   sw        $v0, 0x234($s5)
.L80030670:
/* 20E70 80030670 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 20E74 80030674 00000000 */  nop
/* 20E78 80030678 0A004010 */  beqz       $v0, .L800306A4
/* 20E7C 8003067C 01001024 */   addiu     $s0, $zero, 0x1
/* 20E80 80030680 3800448C */  lw         $a0, 0x38($v0)
/* 20E84 80030684 1C66010C */  jal        STREAM_GetLevelWithID
/* 20E88 80030688 00000000 */   nop
/* 20E8C 8003068C 05004010 */  beqz       $v0, .L800306A4
/* 20E90 80030690 00000000 */   nop
/* 20E94 80030694 CC00428C */  lw         $v0, 0xCC($v0)
/* 20E98 80030698 00000000 */  nop
/* 20E9C 8003069C 00204230 */  andi       $v0, $v0, 0x2000
/* 20EA0 800306A0 2B805000 */  sltu       $s0, $v0, $s0
.L800306A4:
/* 20EA4 800306A4 06000012 */  beqz       $s0, .L800306C0
/* 20EA8 800306A8 00000000 */   nop
/* 20EAC 800306AC 3802A28E */  lw         $v0, 0x238($s5)
/* 20EB0 800306B0 3C02A38E */  lw         $v1, 0x23C($s5)
/* 20EB4 800306B4 00000000 */  nop
/* 20EB8 800306B8 21104300 */  addu       $v0, $v0, $v1
/* 20EBC 800306BC 3802A2AE */  sw         $v0, 0x238($s5)
.L800306C0:
/* 20EC0 800306C0 3002A28E */  lw         $v0, 0x230($s5)
/* 20EC4 800306C4 3C02A38E */  lw         $v1, 0x23C($s5)
/* 20EC8 800306C8 00000000 */  nop
/* 20ECC 800306CC 21104300 */  addu       $v0, $v0, $v1
/* 20ED0 800306D0 3002A2AE */  sw         $v0, 0x230($s5)
.L800306D4:
/* 20ED4 800306D4 6BC3000C */  jal        GAMELOOP_ChangeMode
/* 20ED8 800306D8 D200A0A6 */   sh        $zero, 0xD2($s5)
/* 20EDC 800306DC 24C0000C */  jal        ResetPrimPool
/* 20EE0 800306E0 00000000 */   nop
/* 20EE4 800306E4 9800A426 */  addiu      $a0, $s5, 0x98
/* 20EE8 800306E8 21280000 */  addu       $a1, $zero, $zero
/* 20EEC 800306EC 2EF2020C */  jal        func_800BC8B8
/* 20EF0 800306F0 28000624 */   addiu     $a2, $zero, 0x28
/* 20EF4 800306F4 3ABF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x172)($gp)
/* 20EF8 800306F8 06000224 */  addiu      $v0, $zero, 0x6
/* 20EFC 800306FC 0F016210 */  beq        $v1, $v0, .L80030B3C
/* 20F00 80030700 1000033C */   lui       $v1, (0x100000 >> 16)
/* 20F04 80030704 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 20F08 80030708 00000000 */  nop
/* 20F0C 8003070C 24104300 */  and        $v0, $v0, $v1
/* 20F10 80030710 4C004014 */  bnez       $v0, .L80030844
/* 20F14 80030714 01000224 */   addiu     $v0, $zero, 0x1
/* 20F18 80030718 44BF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x17C)($gp)
/* 20F1C 8003071C 00000000 */  nop
/* 20F20 80030720 07006214 */  bne        $v1, $v0, .L80030740
/* 20F24 80030724 0004053C */   lui       $a1, (0x4000006 >> 16)
/* 20F28 80030728 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 20F2C 8003072C 0600A534 */  ori        $a1, $a1, (0x4000006 & 0xFFFF)
/* 20F30 80030730 A1D1000C */  jal        INSTANCE_Post
/* 20F34 80030734 21300000 */   addu      $a2, $zero, $zero
/* 20F38 80030738 826A010C */  jal        STREAM_MoveIntoNewStreamUnit
/* 20F3C 8003073C 00000000 */   nop
.L80030740:
/* 20F40 80030740 D8A4828F */  lw         $v0, %gp_rel(VRAM_NeedToUpdateMorph)($gp)
/* 20F44 80030744 00000000 */  nop
/* 20F48 80030748 08004010 */  beqz       $v0, .L8003076C
/* 20F4C 8003074C 00000000 */   nop
/* 20F50 80030750 6D80010C */  jal        STREAM_IsCdBusy
/* 20F54 80030754 21200000 */   addu      $a0, $zero, $zero
/* 20F58 80030758 04004014 */  bnez       $v0, .L8003076C
/* 20F5C 8003075C 00000000 */   nop
/* 20F60 80030760 02D1010C */  jal        VRAM_UpdateMorphPalettes
/* 20F64 80030764 00000000 */   nop
/* 20F68 80030768 D8A480AF */  sw         $zero, %gp_rel(VRAM_NeedToUpdateMorph)($gp)
.L8003076C:
/* 20F6C 8003076C 0800A286 */  lh         $v0, 0x8($s5)
/* 20F70 80030770 00000000 */  nop
/* 20F74 80030774 E8034228 */  slti       $v0, $v0, 0x3E8
/* 20F78 80030778 03004010 */  beqz       $v0, .L80030788
/* 20F7C 8003077C 00000000 */   nop
/* 20F80 80030780 C978010C */  jal        MORPH_Continue
/* 20F84 80030784 00000000 */   nop
.L80030788:
/* 20F88 80030788 4401A38E */  lw         $v1, 0x144($s5)
/* 20F8C 8003078C 0800023C */  lui        $v0, (0x80000 >> 16)
/* 20F90 80030790 24106200 */  and        $v0, $v1, $v0
/* 20F94 80030794 05004010 */  beqz       $v0, .L800307AC
/* 20F98 80030798 F7FF023C */   lui       $v0, (0xFFF7FFFF >> 16)
/* 20F9C 8003079C FFFF4234 */  ori        $v0, $v0, (0xFFF7FFFF & 0xFFFF)
/* 20FA0 800307A0 24106200 */  and        $v0, $v1, $v0
/* 20FA4 800307A4 0ED2020C */  jal        UNDERWORLD_StartProcess
/* 20FA8 800307A8 4401A2AE */   sw        $v0, 0x144($s5)
.L800307AC:
/* 20FAC 800307AC FF84010C */  jal        EVENT_DoProcess
/* 20FB0 800307B0 21880000 */   addu      $s1, $zero, $zero
/* 20FB4 800307B4 3CC79027 */  addiu      $s0, $gp, %gp_rel(StreamTracker)
/* 20FB8 800307B8 21900002 */  addu       $s2, $s0, $zero
.L800307BC:
/* 20FBC 800307BC 04000386 */  lh         $v1, 0x4($s0)
/* 20FC0 800307C0 02000224 */  addiu      $v0, $zero, 0x2
/* 20FC4 800307C4 18006214 */  bne        $v1, $v0, .L80030828
/* 20FC8 800307C8 00000000 */   nop
/* 20FCC 800307CC 0800028E */  lw         $v0, 0x8($s0)
/* 20FD0 800307D0 00000000 */  nop
/* 20FD4 800307D4 DC00428C */  lw         $v0, 0xDC($v0)
/* 20FD8 800307D8 00000000 */  nop
/* 20FDC 800307DC 10004010 */  beqz       $v0, .L80030820
/* 20FE0 800307E0 00000000 */   nop
/* 20FE4 800307E4 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 20FE8 800307E8 00000000 */  nop
/* 20FEC 800307EC 00014230 */  andi       $v0, $v0, 0x100
/* 20FF0 800307F0 06004010 */  beqz       $v0, .L8003080C
/* 20FF4 800307F4 00000000 */   nop
/* 20FF8 800307F8 0D80043C */  lui        $a0, %hi(fontsObject + 0x7C)
/* 20FFC 800307FC 90078424 */  addiu      $a0, $a0, %lo(fontsObject + 0x7C)
/* 21000 80030800 48C78527 */  addiu      $a1, $gp, %gp_rel(StreamTracker + 0xC)
/* 21004 80030804 C3B5000C */  jal        FONT_Print
/* 21008 80030808 21282502 */   addu      $a1, $s1, $a1
.L8003080C:
/* 2100C 8003080C 0800058E */  lw         $a1, 0x8($s0)
/* 21010 80030810 00000000 */  nop
/* 21014 80030814 DC00A48C */  lw         $a0, 0xDC($a1)
/* 21018 80030818 6786010C */  jal        EVENT_ProcessEvents
/* 2101C 8003081C 00000000 */   nop
.L80030820:
/* 21020 80030820 0985010C */  jal        EVENT_BSPProcess
/* 21024 80030824 21200002 */   addu      $a0, $s0, $zero
.L80030828:
/* 21028 80030828 40001026 */  addiu      $s0, $s0, 0x40
/* 2102C 8003082C 00044226 */  addiu      $v0, $s2, 0x400
/* 21030 80030830 2A100202 */  slt        $v0, $s0, $v0
/* 21034 80030834 E1FF4014 */  bnez       $v0, .L800307BC
/* 21038 80030838 40003126 */   addiu     $s1, $s1, 0x40
/* 2103C 8003083C 1A83010C */  jal        EVENT_ResetAllOneTimeVariables
/* 21040 80030840 00000000 */   nop
.L80030844:
/* 21044 80030844 DC83010C */  jal        EVENT_ProcessHints
/* 21048 80030848 21900000 */   addu      $s2, $zero, $zero
/* 2104C 8003084C 21A04002 */  addu       $s4, $s2, $zero
/* 21050 80030850 3CC79627 */  addiu      $s6, $gp, %gp_rel(StreamTracker)
/* 21054 80030854 2198C002 */  addu       $s3, $s6, $zero
.L80030858:
/* 21058 80030858 04006386 */  lh         $v1, 0x4($s3)
/* 2105C 8003085C 02000224 */  addiu      $v0, $zero, 0x2
/* 21060 80030860 27006214 */  bne        $v1, $v0, .L80030900
/* 21064 80030864 2120C002 */   addu      $a0, $s6, $zero
/* 21068 80030868 0800628E */  lw         $v0, 0x8($s3)
/* 2106C 8003086C 00000000 */  nop
/* 21070 80030870 E800428C */  lw         $v0, 0xE8($v0)
/* 21074 80030874 00000000 */  nop
/* 21078 80030878 21004018 */  blez       $v0, .L80030900
/* 2107C 8003087C 21800000 */   addu      $s0, $zero, $zero
/* 21080 80030880 21880002 */  addu       $s1, $s0, $zero
.L80030884:
/* 21084 80030884 21108402 */  addu       $v0, $s4, $a0
/* 21088 80030888 0800428C */  lw         $v0, 0x8($v0)
/* 2108C 8003088C 00000000 */  nop
/* 21090 80030890 EC00428C */  lw         $v0, 0xEC($v0)
/* 21094 80030894 00000000 */  nop
/* 21098 80030898 21305100 */  addu       $a2, $v0, $s1
/* 2109C 8003089C 0E00C010 */  beqz       $a2, .L800308D8
/* 210A0 800308A0 00000000 */   nop
/* 210A4 800308A4 0000C28C */  lw         $v0, 0x0($a2)
/* 210A8 800308A8 00000000 */  nop
/* 210AC 800308AC 0A004010 */  beqz       $v0, .L800308D8
/* 210B0 800308B0 0800C524 */   addiu     $a1, $a2, 0x8
/* 210B4 800308B4 2000C28C */  lw         $v0, 0x20($a2)
/* 210B8 800308B8 1400A0AF */  sw         $zero, 0x14($sp)
/* 210BC 800308BC 1800A0AF */  sw         $zero, 0x18($sp)
/* 210C0 800308C0 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 210C4 800308C4 1000A2AF */  sw         $v0, 0x10($sp)
/* 210C8 800308C8 0000C48C */  lw         $a0, 0x0($a2)
/* 210CC 800308CC 1C00C78C */  lw         $a3, 0x1C($a2)
/* 210D0 800308D0 3CFB000C */  jal        SOUND_ProcessInstanceSounds
/* 210D4 800308D4 1400C624 */   addiu     $a2, $a2, 0x14
.L800308D8:
/* 210D8 800308D8 3CC78427 */  addiu      $a0, $gp, %gp_rel(StreamTracker)
/* 210DC 800308DC 80111200 */  sll        $v0, $s2, 6
/* 210E0 800308E0 21104400 */  addu       $v0, $v0, $a0
/* 210E4 800308E4 0800428C */  lw         $v0, 0x8($v0)
/* 210E8 800308E8 00000000 */  nop
/* 210EC 800308EC E800428C */  lw         $v0, 0xE8($v0)
/* 210F0 800308F0 01001026 */  addiu      $s0, $s0, 0x1
/* 210F4 800308F4 2A100202 */  slt        $v0, $s0, $v0
/* 210F8 800308F8 E2FF4014 */  bnez       $v0, .L80030884
/* 210FC 800308FC 24003126 */   addiu     $s1, $s1, 0x24
.L80030900:
/* 21100 80030900 40009426 */  addiu      $s4, $s4, 0x40
/* 21104 80030904 01005226 */  addiu      $s2, $s2, 0x1
/* 21108 80030908 1000422A */  slti       $v0, $s2, 0x10
/* 2110C 8003090C D2FF4014 */  bnez       $v0, .L80030858
/* 21110 80030910 40007326 */   addiu     $s3, $s3, 0x40
/* 21114 80030914 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 21118 80030918 1000103C */  lui        $s0, (0x100000 >> 16)
/* 2111C 8003091C 24105000 */  and        $v0, $v0, $s0
/* 21120 80030920 04004014 */  bnez       $v0, .L80030934
/* 21124 80030924 00000000 */   nop
/* 21128 80030928 20BA848F */  lw         $a0, %gp_rel(instanceList)($gp)
/* 2112C 8003092C AAD4000C */  jal        INSTANCE_SpatialRelationships
/* 21130 80030930 00000000 */   nop
.L80030934:
/* 21134 80030934 3400A48E */  lw         $a0, 0x34($s5)
/* 21138 80030938 8ACD000C */  jal        INSTANCE_ProcessFunctions
/* 2113C 8003093C 00000000 */   nop
/* 21140 80030940 3400A48E */  lw         $a0, 0x34($s5)
/* 21144 80030944 AFCA000C */  jal        INSTANCE_CleanUpInstanceList
/* 21148 80030948 21280000 */   addu      $a1, $zero, $zero
/* 2114C 8003094C D1C8000C */  jal        INSTANCE_DeactivateFarInstances
/* 21150 80030950 2120A002 */   addu      $a0, $s5, $zero
/* 21154 80030954 E3FC010C */  jal        MONAPI_ProcessGenerator
/* 21158 80030958 00000000 */   nop
/* 2115C 8003095C 90AC828F */  lw         $v0, %gp_rel(theCamera)($gp)
/* 21160 80030960 94AC838F */  lw         $v1, %gp_rel(theCamera + 0x4)($gp)
/* 21164 80030964 54BA8827 */  addiu      $t0, $gp, %gp_rel(StackSave)
/* 21168 80030968 801F013C */  lui        $at, (0x1F800000 >> 16)
/* 2116C 8003096C 000022AC */  sw         $v0, (0x1F800000 & 0xFFFF)($at)
/* 21170 80030970 801F013C */  lui        $at, (0x1F800004 >> 16)
/* 21174 80030974 040023AC */  sw         $v1, (0x1F800004 & 0xFFFF)($at)
/* 21178 80030978 00001DAD */  sw         $sp, 0x0($t0)
/* 2117C 8003097C 801F0C3C */  lui        $t4, (0x1F8003F0 >> 16)
/* 21180 80030980 F0038C35 */  ori        $t4, $t4, (0x1F8003F0 & 0xFFFF)
/* 21184 80030984 21E88001 */  addu       $sp, $t4, $zero
/* 21188 80030988 3400A28E */  lw         $v0, 0x34($s5)
/* 2118C 8003098C 00000000 */  nop
/* 21190 80030990 0400448C */  lw         $a0, 0x4($v0)
/* 21194 80030994 B453020C */  jal        G2Instance_BuildTransformsForList
/* 21198 80030998 00000000 */   nop
/* 2119C 8003099C 54BA8827 */  addiu      $t0, $gp, %gp_rel(StackSave)
/* 211A0 800309A0 00001D8D */  lw         $sp, 0x0($t0)
/* 211A4 800309A4 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 211A8 800309A8 00000000 */  nop
/* 211AC 800309AC 24105000 */  and        $v0, $v0, $s0
/* 211B0 800309B0 31004014 */  bnez       $v0, .L80030A78
/* 211B4 800309B4 00000000 */   nop
/* 211B8 800309B8 00001DAD */  sw         $sp, 0x0($t0)
/* 211BC 800309BC 801F0C3C */  lui        $t4, (0x1F8003F0 >> 16)
/* 211C0 800309C0 F0038C35 */  ori        $t4, $t4, (0x1F8003F0 & 0xFFFF)
/* 211C4 800309C4 21E88001 */  addu       $sp, $t4, $zero
/* 211C8 800309C8 58BA848F */  lw         $a0, %gp_rel(fxTracker)($gp)
/* 211CC 800309CC 4713010C */  jal        FX_ProcessList
/* 211D0 800309D0 00000000 */   nop
/* 211D4 800309D4 54BA8827 */  addiu      $t0, $gp, %gp_rel(StackSave)
/* 211D8 800309D8 00001D8D */  lw         $sp, 0x0($t0)
/* 211DC 800309DC 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 211E0 800309E0 00000000 */  nop
/* 211E4 800309E4 24105000 */  and        $v0, $v0, $s0
/* 211E8 800309E8 23004014 */  bnez       $v0, .L80030A78
/* 211EC 800309EC 00000000 */   nop
/* 211F0 800309F0 093F010C */  jal        VM_Tick
/* 211F4 800309F4 00010424 */   addiu     $a0, $zero, 0x100
/* 211F8 800309F8 C400A28E */  lw         $v0, 0xC4($s5)
/* 211FC 800309FC 0100033C */  lui        $v1, (0x10000 >> 16)
/* 21200 80030A00 24104300 */  and        $v0, $v0, $v1
/* 21204 80030A04 06004010 */  beqz       $v0, .L80030A20
/* 21208 80030A08 21900000 */   addu      $s2, $zero, $zero
/* 2120C 80030A0C E2BF8587 */  lh         $a1, %gp_rel(gameTrackerX + 0x21A)($gp)
/* 21210 80030A10 0D80043C */  lui        $a0, %hi(fontsObject + 0x90)
/* 21214 80030A14 C3B5000C */  jal        FONT_Print
/* 21218 80030A18 A4078424 */   addiu     $a0, $a0, %lo(fontsObject + 0x90)
/* 2121C 80030A1C 21900000 */  addu       $s2, $zero, $zero
.L80030A20:
/* 21220 80030A20 02001124 */  addiu      $s1, $zero, 0x2
/* 21224 80030A24 3CC79027 */  addiu      $s0, $gp, %gp_rel(StreamTracker)
.L80030A28:
/* 21228 80030A28 04000286 */  lh         $v0, 0x4($s0)
/* 2122C 80030A2C 00000000 */  nop
/* 21230 80030A30 05005114 */  bne        $v0, $s1, .L80030A48
/* 21234 80030A34 00000000 */   nop
/* 21238 80030A38 0800048E */  lw         $a0, 0x8($s0)
/* 2123C 80030A3C 90AC8527 */  addiu      $a1, $gp, %gp_rel(theCamera)
/* 21240 80030A40 71E2010C */  jal        func_800789C4
/* 21244 80030A44 00000000 */   nop
.L80030A48:
/* 21248 80030A48 01005226 */  addiu      $s2, $s2, 0x1
/* 2124C 80030A4C 1000422A */  slti       $v0, $s2, 0x10
/* 21250 80030A50 F5FF4014 */  bnez       $v0, .L80030A28
/* 21254 80030A54 40001026 */   addiu     $s0, $s0, 0x40
/* 21258 80030A58 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 2125C 80030A5C 1000033C */  lui        $v1, (0x100000 >> 16)
/* 21260 80030A60 24104300 */  and        $v0, $v0, $v1
/* 21264 80030A64 04004014 */  bnez       $v0, .L80030A78
/* 21268 80030A68 00000000 */   nop
/* 2126C 80030A6C F4BD858F */  lw         $a1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 21270 80030A70 B460020C */  jal        PLANAPI_UpdatePlanningDatabase
/* 21274 80030A74 2120A002 */   addu      $a0, $s5, $zero
.L80030A78:
/* 21278 80030A78 114D000C */  jal        DEBUG_Process
/* 2127C 80030A7C 2120A002 */   addu      $a0, $s5, $zero
/* 21280 80030A80 3400A48E */  lw         $a0, 0x34($s5)
/* 21284 80030A84 8B89000C */  jal        COLLIDE_InstanceList
/* 21288 80030A88 00000000 */   nop
/* 2128C 80030A8C 3400A48E */  lw         $a0, 0x34($s5)
/* 21290 80030A90 C092000C */  jal        COLLIDE_InstanceListTerrain
/* 21294 80030A94 00000000 */   nop
/* 21298 80030A98 20BA848F */  lw         $a0, %gp_rel(instanceList)($gp)
/* 2129C 80030A9C 32CD000C */  jal        INSTANCE_AdditionalCollideFunctions
/* 212A0 80030AA0 00000000 */   nop
/* 212A4 80030AA4 20BA848F */  lw         $a0, %gp_rel(instanceList)($gp)
/* 212A8 80030AA8 A392000C */  jal        COLLIDE_InstanceListWithSignals
/* 212AC 80030AAC 00000000 */   nop
/* 212B0 80030AB0 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 212B4 80030AB4 1000033C */  lui        $v1, (0x100000 >> 16)
/* 212B8 80030AB8 24104300 */  and        $v0, $v0, $v1
/* 212BC 80030ABC 06004014 */  bnez       $v0, .L80030AD8
/* 212C0 80030AC0 00000000 */   nop
/* 212C4 80030AC4 ABDB000C */  jal        LIGHT_CalcShadowPositions
/* 212C8 80030AC8 2120A002 */   addu      $a0, $s5, $zero
/* 212CC 80030ACC 3400A48E */  lw         $a0, 0x34($s5)
/* 212D0 80030AD0 AFCA000C */  jal        INSTANCE_CleanUpInstanceList
/* 212D4 80030AD4 10000524 */   addiu     $a1, $zero, 0x10
.L80030AD8:
/* 212D8 80030AD8 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 212DC 80030ADC 1B6E000C */  jal        CAMERA_Process
/* 212E0 80030AE0 00000000 */   nop
/* 212E4 80030AE4 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 212E8 80030AE8 16EA000C */  jal        PIPE3D_CalculateWCTransform
/* 212EC 80030AEC 00000000 */   nop
/* 212F0 80030AF0 00AD828F */  lw         $v0, %gp_rel(theCamera + 0x70)($gp)
/* 212F4 80030AF4 00000000 */  nop
/* 212F8 80030AF8 120040A4 */  sh         $zero, 0x12($v0)
/* 212FC 80030AFC 04AD848F */  lw         $a0, %gp_rel(theCamera + 0x74)($gp)
/* 21300 80030B00 00AD858F */  lw         $a1, %gp_rel(theCamera + 0x70)($gp)
/* 21304 80030B04 F5EA000C */  jal        PIPE3D_InvertTransform
/* 21308 80030B08 00000000 */   nop
/* 2130C 80030B0C 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 21310 80030B10 7853000C */  jal        CAMERA_CalcVVClipInfo
/* 21314 80030B14 00000000 */   nop
/* 21318 80030B18 6E01A286 */  lh         $v0, 0x16E($s5)
/* 2131C 80030B1C 00000000 */  nop
/* 21320 80030B20 02004010 */  beqz       $v0, .L80030B2C
/* 21324 80030B24 00000000 */   nop
/* 21328 80030B28 6E01A0A6 */  sh         $zero, 0x16E($s5)
.L80030B2C:
/* 2132C 80030B2C 9BD6020C */  jal        SAVE_IntroduceBufferIntros
/* 21330 80030B30 00000000 */   nop
/* 21334 80030B34 E3C20008 */  j          .L80030B8C
/* 21338 80030B38 00000000 */   nop
.L80030B3C:
/* 2133C 80030B3C 90AC828F */  lw         $v0, %gp_rel(theCamera)($gp)
/* 21340 80030B40 94AC838F */  lw         $v1, %gp_rel(theCamera + 0x4)($gp)
/* 21344 80030B44 54BA8827 */  addiu      $t0, $gp, %gp_rel(StackSave)
/* 21348 80030B48 801F013C */  lui        $at, (0x1F800000 >> 16)
/* 2134C 80030B4C 000022AC */  sw         $v0, (0x1F800000 & 0xFFFF)($at)
/* 21350 80030B50 801F013C */  lui        $at, (0x1F800004 >> 16)
/* 21354 80030B54 040023AC */  sw         $v1, (0x1F800004 & 0xFFFF)($at)
/* 21358 80030B58 00001DAD */  sw         $sp, 0x0($t0)
/* 2135C 80030B5C 801F0C3C */  lui        $t4, (0x1F8003F0 >> 16)
/* 21360 80030B60 F0038C35 */  ori        $t4, $t4, (0x1F8003F0 & 0xFFFF)
/* 21364 80030B64 21E88001 */  addu       $sp, $t4, $zero
/* 21368 80030B68 3400A28E */  lw         $v0, 0x34($s5)
/* 2136C 80030B6C 00000000 */  nop
/* 21370 80030B70 0400448C */  lw         $a0, 0x4($v0)
/* 21374 80030B74 B453020C */  jal        G2Instance_BuildTransformsForList
/* 21378 80030B78 00000000 */   nop
/* 2137C 80030B7C 54BA8827 */  addiu      $t0, $gp, %gp_rel(StackSave)
/* 21380 80030B80 00001D8D */  lw         $sp, 0x0($t0)
/* 21384 80030B84 114D000C */  jal        DEBUG_Process
/* 21388 80030B88 2120A002 */   addu      $a0, $s5, $zero
.L80030B8C:
/* 2138C 80030B8C 6C01A286 */  lh         $v0, 0x16C($s5)
/* 21390 80030B90 00000000 */  nop
/* 21394 80030B94 05004014 */  bnez       $v0, .L80030BAC
/* 21398 80030B98 00000000 */   nop
/* 2139C 80030B9C D7BD000C */  jal        GAMELOOP_DisplayFrame
/* 213A0 80030BA0 2120A002 */   addu      $a0, $s5, $zero
/* 213A4 80030BA4 EEC20008 */  j          .L80030BB8
/* 213A8 80030BA8 FFF7023C */   lui       $v0, (0xF7FFFFFF >> 16)
.L80030BAC:
/* 213AC 80030BAC DAC0000C */  jal        ResetDrawPage
/* 213B0 80030BB0 00000000 */   nop
/* 213B4 80030BB4 FFF7023C */  lui        $v0, (0xF7FFFFFF >> 16)
.L80030BB8:
/* 213B8 80030BB8 FFFF4234 */  ori        $v0, $v0, (0xF7FFFFFF & 0xFFFF)
/* 213BC 80030BBC 2C01A38E */  lw         $v1, 0x12C($s5)
/* 213C0 80030BC0 C000A48E */  lw         $a0, 0xC0($s5)
/* 213C4 80030BC4 01006324 */  addiu      $v1, $v1, 0x1
/* 213C8 80030BC8 24208200 */  and        $a0, $a0, $v0
/* 213CC 80030BCC 2C01A3AE */  sw         $v1, 0x12C($s5)
/* 213D0 80030BD0 C000A4AE */  sw         $a0, 0xC0($s5)
.L80030BD4:
/* 213D4 80030BD4 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 213D8 80030BD8 3800B68F */  lw         $s6, 0x38($sp)
/* 213DC 80030BDC 3400B58F */  lw         $s5, 0x34($sp)
/* 213E0 80030BE0 3000B48F */  lw         $s4, 0x30($sp)
/* 213E4 80030BE4 2C00B38F */  lw         $s3, 0x2C($sp)
/* 213E8 80030BE8 2800B28F */  lw         $s2, 0x28($sp)
/* 213EC 80030BEC 2400B18F */  lw         $s1, 0x24($sp)
/* 213F0 80030BF0 2000B08F */  lw         $s0, 0x20($sp)
/* 213F4 80030BF4 0800E003 */  jr         $ra
/* 213F8 80030BF8 4000BD27 */   addiu     $sp, $sp, 0x40
.size GAMELOOP_Process, . - GAMELOOP_Process
