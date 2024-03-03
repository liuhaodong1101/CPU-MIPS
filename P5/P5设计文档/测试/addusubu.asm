lui $a0 0xefff
ori $a1 $0 0xffff
add $a2 $a0 $a1	#a2=2147483647

lui $a3 0x8000		#a3=-2147483648

add $s0 $a2 $a3
add $s1 $a2 $a2
add $s2 $a3 $a3

sub $s3 $a2 $a3
sub $s4 $a2 $a2
sub $s5 $a3 $a3
sub $s6 $a3 $a2

sw $s0 0($0)
sw $s1 4($0)
sw $s2 8($0)
sw $s3 12($0)
sw $s4 16($0)
sw $s5 20($0)
sw $s6 24($0)
