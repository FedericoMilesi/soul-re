.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetEngageEvent
/* A4144 800B3944 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A4148 800B3948 0F008010 */  beqz       $a0, .L800B3988
/* A414C 800B394C 1000BFAF */   sw        $ra, 0x10($sp)
/* A4150 800B3950 92D1000C */  jal        INSTANCE_Query
/* A4154 800B3954 02000524 */   addiu     $a1, $zero, 0x2
/* A4158 800B3958 21184000 */  addu       $v1, $v0, $zero
/* A415C 800B395C 08006230 */  andi       $v0, $v1, 0x8
/* A4160 800B3960 0A004014 */  bnez       $v0, .L800B398C
/* A4164 800B3964 0002023C */   lui       $v0, (0x2000000 >> 16)
/* A4168 800B3968 01006230 */  andi       $v0, $v1, 0x1
/* A416C 800B396C 03004010 */  beqz       $v0, .L800B397C
/* A4170 800B3970 0002023C */   lui       $v0, (0x2000004 >> 16)
/* A4174 800B3974 63CE0208 */  j          .L800B398C
/* A4178 800B3978 01004234 */   ori       $v0, $v0, (0x2000001 & 0xFFFF)
.L800B397C:
/* A417C 800B397C 02006330 */  andi       $v1, $v1, 0x2
/* A4180 800B3980 02006014 */  bnez       $v1, .L800B398C
/* A4184 800B3984 04004234 */   ori       $v0, $v0, (0x2000004 & 0xFFFF)
.L800B3988:
/* A4188 800B3988 21100000 */  addu       $v0, $zero, $zero
.L800B398C:
/* A418C 800B398C 1000BF8F */  lw         $ra, 0x10($sp)
/* A4190 800B3990 00000000 */  nop
/* A4194 800B3994 0800E003 */  jr         $ra
/* A4198 800B3998 1800BD27 */   addiu     $sp, $sp, 0x18
.size GetEngageEvent, . - GetEngageEvent
