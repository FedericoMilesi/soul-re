.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel ExitCriticalSection
/* AF844 800BF044 02000424 */  addiu      $a0, $zero, 0x2
/* AF848 800BF048 0C000000 */  syscall    0 # handwritten instruction
/* AF84C 800BF04C 0800E003 */  jr         $ra
/* AF850 800BF050 00000000 */   nop
.size ExitCriticalSection, . - ExitCriticalSection
