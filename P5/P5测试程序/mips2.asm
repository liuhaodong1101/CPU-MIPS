lui $a1, 0xffff
sw $a1, 0($zero)
lw $s1, 0($zero)
lh $s1, ($zero)
lb $s1, 0($zero)
mthi $a1
mfhi $a3
addi $a2, $a3, 100