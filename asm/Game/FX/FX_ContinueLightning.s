.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_ContinueLightning
/* 3AFD0 8004A7D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3AFD4 8004A7D4 1000BFAF */  sw         $ra, 0x10($sp)
/* 3AFD8 8004A7D8 10008294 */  lhu        $v0, 0x10($a0)
/* 3AFDC 8004A7DC 12008394 */  lhu        $v1, 0x12($a0)
/* 3AFE0 8004A7E0 00000000 */  nop
/* 3AFE4 8004A7E4 21104300 */  addu       $v0, $v0, $v1
/* 3AFE8 8004A7E8 100082A4 */  sh         $v0, 0x10($a0)
/* 3AFEC 8004A7EC 0E008284 */  lh         $v0, 0xE($a0)
/* 3AFF0 8004A7F0 0E008394 */  lhu        $v1, 0xE($a0)
/* 3AFF4 8004A7F4 0A004018 */  blez       $v0, .L8004A820
/* 3AFF8 8004A7F8 00000000 */   nop
/* 3AFFC 8004A7FC C0C38297 */  lhu        $v0, %gp_rel(FX_Frames)($gp)
/* 3B000 8004A800 00000000 */  nop
/* 3B004 8004A804 23106200 */  subu       $v0, $v1, $v0
/* 3B008 8004A808 0E0082A4 */  sh         $v0, 0xE($a0)
/* 3B00C 8004A80C 00140200 */  sll        $v0, $v0, 16
/* 3B010 8004A810 0300401C */  bgtz       $v0, .L8004A820
/* 3B014 8004A814 00000000 */   nop
/* 3B018 8004A818 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 3B01C 8004A81C 00000000 */   nop
.L8004A820:
/* 3B020 8004A820 1000BF8F */  lw         $ra, 0x10($sp)
/* 3B024 8004A824 00000000 */  nop
/* 3B028 8004A828 0800E003 */  jr         $ra
/* 3B02C 8004A82C 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_ContinueLightning, . - FX_ContinueLightning
