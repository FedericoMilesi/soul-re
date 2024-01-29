# Splat Disassembly of Legacy of Kain: Soul Reaver
## About 

When I started working on the <a href="https://github.com/Gh0stBlade/KAIN2">Legacy of Kain: Soul Reaver reverse-engineering project</a>, there were some functions I couldn't decompile because I was missing certain information of them from the IDA assembly dump of the game's executable that I was using. These functions usually had MIPS code like this:

```
addiu   $sp, $sp, -0x18
sw      $s0, 0x10($sp)
addu    $s0, $a0, $zero
addu    $a0, $zero, $zero
addiu   $v1, $a1, -1
sltiu   $v0, $v1, 0x18
beq     $v0, $zero, loc_8003EA9C
sw      $ra, 0x14($sp)
lui     $v0, 0x8001
addiu   $v0, $v0, (off_800101D0 - 0x80010000)
sll     $v1, $v1, 2
addu    $v1, $v1, $v0
lw      $v0, 0($v1)
nop
jr      $v0
nop
```

From that block of code and similar others, lines like "addiu   $v0, $v0, (off_800101D0 - 0x80010000)" were troublesome because they were referencing a point in memory (off_800101D0 in the above example) containing several integer values that the debugging symbols couldn't resolve. After some research and failed decompilation attempts, I found out that, translated to C such assembly code belongs to a switch statement and that usually when switches are large enough in a function, the GCC compiler stores the case values as part of a read-only data table that the function references outside of itself.

Since I use <a href="https://decomp.me/">decomp.me</a> for function matching (measuring how accurate my C code is in regards to the MIPS assembly I'm trying to reverse), I asked on the Discord server for the site what was the best approach to decompiling these functions, and there I was suggested to use the <a href="https://github.com/ethteck/splat">splat</a> tool to do a disassemble of the game's binary file, by which I would be able to get a dump of the .rodata (read-only data). The tool (which uses <a href="https://github.com/Decompollaborate/spimdisasm">spimdisasm</a> for the disassembling process) worked succesfully to that effect, and this repo contains the resulting files with both the assembly code for the game functions and the .rodata they reference, along with the "slus_007.08.yaml" file that's required in case you want to perform the operation with splat yourself. 
