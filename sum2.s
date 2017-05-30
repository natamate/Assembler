#extern int sum2(int a, int b){
#	int result = 0;
#	for(int i = a; i <= b; i++){
#		result += i;
#	}
#return result;
#}
#zwraca sume od pierwszego argumentu do drugiego
.text
	.type sum2, @function
	.global sum2
sum2:
    cmp %edi,%esi
    jl ERROR
    movl %edi,%eax
loop:
    cmpl %edi, %esi
    jle END
    inc %edi
    add %edi,%eax
    jmp loop
ERROR:
    movl $0,%eax
END:
    ret