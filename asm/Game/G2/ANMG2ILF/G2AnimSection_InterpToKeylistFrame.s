.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_InterpToKeylistFrame
/* 8083C 8009003C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 80840 80090040 1800BFAF */  sw         $ra, 0x18($sp)
/* 80844 80090044 0100A290 */  lbu        $v0, 0x1($a1)
/* 80848 80090048 00000000 */  nop
/* 8084C 8009004C 1800E200 */  mult       $a3, $v0
/* 80850 80090050 3000A287 */  lh         $v0, 0x30($sp)
/* 80854 80090054 00000000 */  nop
/* 80858 80090058 1000A2AF */  sw         $v0, 0x10($sp)
/* 8085C 8009005C 12180000 */  mflo       $v1
/* 80860 80090060 003C0300 */  sll        $a3, $v1, 16
/* 80864 80090064 8748020C */  jal        G2AnimSection_InterpToKeylistAtTime
/* 80868 80090068 033C0700 */   sra       $a3, $a3, 16
/* 8086C 8009006C 1800BF8F */  lw         $ra, 0x18($sp)
/* 80870 80090070 00000000 */  nop
/* 80874 80090074 0800E003 */  jr         $ra
/* 80878 80090078 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2AnimSection_InterpToKeylistFrame, . - G2AnimSection_InterpToKeylistFrame
