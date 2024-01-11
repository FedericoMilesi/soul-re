.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sprintf
/* 64C68 80074468 0400A5AF */  sw         $a1, 0x4($sp)
/* 64C6C 8007446C 0800A6AF */  sw         $a2, 0x8($sp)
/* 64C70 80074470 0C00A7AF */  sw         $a3, 0xC($sp)
/* 64C74 80074474 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 64C78 80074478 2000A627 */  addiu      $a2, $sp, 0x20
/* 64C7C 8007447C 1000BFAF */  sw         $ra, 0x10($sp)
/* 64C80 80074480 26D1010C */  jal        vsprintf
/* 64C84 80074484 1C00A5AF */   sw        $a1, 0x1C($sp)
/* 64C88 80074488 1000BF8F */  lw         $ra, 0x10($sp)
/* 64C8C 8007448C 00000000 */  nop
/* 64C90 80074490 0800E003 */  jr         $ra
/* 64C94 80074494 1800BD27 */   addiu     $sp, $sp, 0x18
.size sprintf, . - sprintf
