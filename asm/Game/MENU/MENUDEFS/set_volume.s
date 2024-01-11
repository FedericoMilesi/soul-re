.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set_volume
/* A90E8 800B88E8 6666033C */  lui        $v1, (0x66666667 >> 16)
/* A90EC 800B88EC 67666334 */  ori        $v1, $v1, (0x66666667 & 0xFFFF)
/* A90F0 800B88F0 C0110500 */  sll        $v0, $a1, 7
/* A90F4 800B88F4 23104500 */  subu       $v0, $v0, $a1
/* A90F8 800B88F8 09004224 */  addiu      $v0, $v0, 0x9
/* A90FC 800B88FC 18004300 */  mult       $v0, $v1
/* A9100 800B8900 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A9104 800B8904 21308000 */  addu       $a2, $a0, $zero
/* A9108 800B8908 C3170200 */  sra        $v0, $v0, 31
/* A910C 800B890C 10380000 */  mfhi       $a3
/* A9110 800B8910 83180700 */  sra        $v1, $a3, 2
/* A9114 800B8914 23206200 */  subu       $a0, $v1, $v0
/* A9118 800B8918 01000224 */  addiu      $v0, $zero, 0x1
/* A911C 800B891C 0B00C210 */  beq        $a2, $v0, .L800B894C
/* A9120 800B8920 1000BFAF */   sw        $ra, 0x10($sp)
/* A9124 800B8924 0500C010 */  beqz       $a2, .L800B893C
/* A9128 800B8928 02000224 */   addiu     $v0, $zero, 0x2
/* A912C 800B892C 0B00C210 */  beq        $a2, $v0, .L800B895C
/* A9130 800B8930 00000000 */   nop
/* A9134 800B8934 59E20208 */  j          .L800B8964
/* A9138 800B8938 00000000 */   nop
.L800B893C:
/* A913C 800B893C 7C01010C */  jal        SOUND_SetSfxVolume
/* A9140 800B8940 00000000 */   nop
/* A9144 800B8944 59E20208 */  j          .L800B8964
/* A9148 800B8948 00000000 */   nop
.L800B894C:
/* A914C 800B894C 6F01010C */  jal        SOUND_SetMusicVolume
/* A9150 800B8950 00000000 */   nop
/* A9154 800B8954 59E20208 */  j          .L800B8964
/* A9158 800B8958 00000000 */   nop
.L800B895C:
/* A915C 800B895C 8901010C */  jal        SOUND_SetVoiceVolume
/* A9160 800B8960 00000000 */   nop
.L800B8964:
/* A9164 800B8964 1000BF8F */  lw         $ra, 0x10($sp)
/* A9168 800B8968 00000000 */  nop
/* A916C 800B896C 0800E003 */  jr         $ra
/* A9170 800B8970 1800BD27 */   addiu     $sp, $sp, 0x18
.size set_volume, . - set_volume
