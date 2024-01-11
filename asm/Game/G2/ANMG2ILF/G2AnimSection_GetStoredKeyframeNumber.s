.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_GetStoredKeyframeNumber
/* 8081C 8009001C 2400828C */  lw         $v0, 0x24($a0)
/* 80820 80090020 06008384 */  lh         $v1, 0x6($a0)
/* 80824 80090024 01004290 */  lbu        $v0, 0x1($v0)
/* 80828 80090028 00000000 */  nop
/* 8082C 8009002C 1A006200 */  div        $zero, $v1, $v0
/* 80830 80090030 12100000 */  mflo       $v0
/* 80834 80090034 0800E003 */  jr         $ra
/* 80838 80090038 00000000 */   nop
.size G2AnimSection_GetStoredKeyframeNumber, . - G2AnimSection_GetStoredKeyframeNumber
