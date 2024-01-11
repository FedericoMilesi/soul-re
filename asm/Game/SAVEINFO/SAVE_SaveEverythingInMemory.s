.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_SaveEverythingInMemory
/* A7040 800B6840 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* A7044 800B6844 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A7048 800B6848 1C00BFAF */  sw         $ra, 0x1C($sp)
/* A704C 800B684C 1800B2AF */  sw         $s2, 0x18($sp)
/* A7050 800B6850 1400B1AF */  sw         $s1, 0x14($sp)
/* A7054 800B6854 1000B0AF */  sw         $s0, 0x10($sp)
/* A7058 800B6858 0400508C */  lw         $s0, 0x4($v0)
/* A705C 800B685C 00000000 */  nop
/* A7060 800B6860 0C000012 */  beqz       $s0, .L800B6894
/* A7064 800B6864 21880000 */   addu      $s1, $zero, $zero
.L800B6868:
/* A7068 800B6868 3800048E */  lw         $a0, 0x38($s0)
/* A706C 800B686C 0800118E */  lw         $s1, 0x8($s0)
/* A7070 800B6870 1C66010C */  jal        STREAM_GetLevelWithID
/* A7074 800B6874 00000000 */   nop
/* A7078 800B6878 03004010 */  beqz       $v0, .L800B6888
/* A707C 800B687C 21200002 */   addu      $a0, $s0, $zero
/* A7080 800B6880 2BD8020C */  jal        SAVE_Instance
/* A7084 800B6884 21284000 */   addu      $a1, $v0, $zero
.L800B6888:
/* A7088 800B6888 21802002 */  addu       $s0, $s1, $zero
/* A708C 800B688C F6FF0016 */  bnez       $s0, .L800B6868
/* A7090 800B6890 21880000 */   addu      $s1, $zero, $zero
.L800B6894:
/* A7094 800B6894 02001224 */  addiu      $s2, $zero, 0x2
/* A7098 800B6898 3CC79027 */  addiu      $s0, $gp, %gp_rel(StreamTracker)
.L800B689C:
/* A709C 800B689C 04000286 */  lh         $v0, 0x4($s0)
/* A70A0 800B68A0 00000000 */  nop
/* A70A4 800B68A4 09005214 */  bne        $v0, $s2, .L800B68CC
/* A70A8 800B68A8 00000000 */   nop
/* A70AC 800B68AC 0000048E */  lw         $a0, 0x0($s0)
/* A70B0 800B68B0 0800058E */  lw         $a1, 0x8($s0)
/* A70B4 800B68B4 FC9D010C */  jal        EVENT_SaveEventsFromLevel
/* A70B8 800B68B8 00000000 */   nop
/* A70BC 800B68BC 0000048E */  lw         $a0, 0x0($s0)
/* A70C0 800B68C0 0800058E */  lw         $a1, 0x8($s0)
/* A70C4 800B68C4 99D7020C */  jal        SAVE_CreatedSavedLevel
/* A70C8 800B68C8 00000000 */   nop
.L800B68CC:
/* A70CC 800B68CC 01003126 */  addiu      $s1, $s1, 0x1
/* A70D0 800B68D0 1000222A */  slti       $v0, $s1, 0x10
/* A70D4 800B68D4 F1FF4014 */  bnez       $v0, .L800B689C
/* A70D8 800B68D8 40001026 */   addiu     $s0, $s0, 0x40
/* A70DC 800B68DC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* A70E0 800B68E0 1800B28F */  lw         $s2, 0x18($sp)
/* A70E4 800B68E4 1400B18F */  lw         $s1, 0x14($sp)
/* A70E8 800B68E8 1000B08F */  lw         $s0, 0x10($sp)
/* A70EC 800B68EC 0800E003 */  jr         $ra
/* A70F0 800B68F0 2000BD27 */   addiu     $sp, $sp, 0x20
.size SAVE_SaveEverythingInMemory, . - SAVE_SaveEverythingInMemory
