.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel get_volume
/* A907C 800B887C 0400A014 */  bnez       $a1, .L800B8890
/* A9080 800B8880 0281033C */   lui       $v1, (0x81020409 >> 16)
/* A9084 800B8884 B801868C */  lw         $a2, 0x1B8($a0)
/* A9088 800B8888 30E20208 */  j          .L800B88C0
/* A908C 800B888C 09046334 */   ori       $v1, $v1, (0x81020409 & 0xFFFF)
.L800B8890:
/* A9090 800B8890 01000224 */  addiu      $v0, $zero, 0x1
/* A9094 800B8894 0400A214 */  bne        $a1, $v0, .L800B88A8
/* A9098 800B8898 09046334 */   ori       $v1, $v1, (0x81020409 & 0xFFFF)
/* A909C 800B889C B401868C */  lw         $a2, 0x1B4($a0)
/* A90A0 800B88A0 30E20208 */  j          .L800B88C0
/* A90A4 800B88A4 00000000 */   nop
.L800B88A8:
/* A90A8 800B88A8 02000224 */  addiu      $v0, $zero, 0x2
/* A90AC 800B88AC 0200A214 */  bne        $a1, $v0, .L800B88B8
/* A90B0 800B88B0 03000624 */   addiu     $a2, $zero, 0x3
/* A90B4 800B88B4 BC01868C */  lw         $a2, 0x1BC($a0)
.L800B88B8:
/* A90B8 800B88B8 0281033C */  lui        $v1, (0x81020409 >> 16)
/* A90BC 800B88BC 09046334 */  ori        $v1, $v1, (0x81020409 & 0xFFFF)
.L800B88C0:
/* A90C0 800B88C0 80100600 */  sll        $v0, $a2, 2
/* A90C4 800B88C4 21104600 */  addu       $v0, $v0, $a2
/* A90C8 800B88C8 40100200 */  sll        $v0, $v0, 1
/* A90CC 800B88CC 18004300 */  mult       $v0, $v1
/* A90D0 800B88D0 10380000 */  mfhi       $a3
/* A90D4 800B88D4 2118E200 */  addu       $v1, $a3, $v0
/* A90D8 800B88D8 83190300 */  sra        $v1, $v1, 6
/* A90DC 800B88DC C3170200 */  sra        $v0, $v0, 31
/* A90E0 800B88E0 0800E003 */  jr         $ra
/* A90E4 800B88E4 23106200 */   subu      $v0, $v1, $v0
.size get_volume, . - get_volume
