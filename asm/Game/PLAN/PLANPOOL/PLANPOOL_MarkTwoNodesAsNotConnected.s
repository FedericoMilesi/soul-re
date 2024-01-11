.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_MarkTwoNodesAsNotConnected
/* 8A094 80099894 2328A600 */  subu       $a1, $a1, $a2
/* 8A098 80099898 C0100500 */  sll        $v0, $a1, 3
/* 8A09C 8009989C 21104500 */  addu       $v0, $v0, $a1
/* 8A0A0 800998A0 80190200 */  sll        $v1, $v0, 6
/* 8A0A4 800998A4 21104300 */  addu       $v0, $v0, $v1
/* 8A0A8 800998A8 C0100200 */  sll        $v0, $v0, 3
/* 8A0AC 800998AC 21104500 */  addu       $v0, $v0, $a1
/* 8A0B0 800998B0 C01B0200 */  sll        $v1, $v0, 15
/* 8A0B4 800998B4 21104300 */  addu       $v0, $v0, $v1
/* 8A0B8 800998B8 C0100200 */  sll        $v0, $v0, 3
/* 8A0BC 800998BC 21104500 */  addu       $v0, $v0, $a1
/* 8A0C0 800998C0 23100200 */  negu       $v0, $v0
/* 8A0C4 800998C4 83100200 */  sra        $v0, $v0, 2
/* 8A0C8 800998C8 01000524 */  addiu      $a1, $zero, 0x1
/* 8A0CC 800998CC 04284500 */  sllv       $a1, $a1, $v0
/* 8A0D0 800998D0 0800838C */  lw         $v1, 0x8($a0)
/* 8A0D4 800998D4 0C00828C */  lw         $v0, 0xC($a0)
/* 8A0D8 800998D8 25186500 */  or         $v1, $v1, $a1
/* 8A0DC 800998DC 27280500 */  nor        $a1, $zero, $a1
/* 8A0E0 800998E0 24104500 */  and        $v0, $v0, $a1
/* 8A0E4 800998E4 080083AC */  sw         $v1, 0x8($a0)
/* 8A0E8 800998E8 0800E003 */  jr         $ra
/* 8A0EC 800998EC 0C0082AC */   sw        $v0, 0xC($a0)
.size PLANPOOL_MarkTwoNodesAsNotConnected, . - PLANPOOL_MarkTwoNodesAsNotConnected
