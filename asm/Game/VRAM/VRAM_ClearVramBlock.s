.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_ClearVramBlock
/* 6423C 80073A3C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 64240 80073A40 1000B0AF */  sw         $s0, 0x10($sp)
/* 64244 80073A44 21808000 */  addu       $s0, $a0, $zero
/* 64248 80073A48 05000012 */  beqz       $s0, .L80073A60
/* 6424C 80073A4C 1400BFAF */   sw        $ra, 0x14($sp)
/* 64250 80073A50 A6CC010C */  jal        VRAM_DeleteUsedBlock
/* 64254 80073A54 00000000 */   nop
/* 64258 80073A58 5BCC010C */  jal        VRAM_InsertFreeBlock
/* 6425C 80073A5C 21200002 */   addu      $a0, $s0, $zero
.L80073A60:
/* 64260 80073A60 1400BF8F */  lw         $ra, 0x14($sp)
/* 64264 80073A64 1000B08F */  lw         $s0, 0x10($sp)
/* 64268 80073A68 0800E003 */  jr         $ra
/* 6426C 80073A6C 1800BD27 */   addiu     $sp, $sp, 0x18
.size VRAM_ClearVramBlock, . - VRAM_ClearVramBlock
