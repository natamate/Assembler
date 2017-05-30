#int max(int a,int b,int c){
#	if(a > b){
#		if(a>c){
#			return a;}
#		return c;}
#	if (c > b)
#		return c;
#	return b;
#	}

#znajduje max z 3 liczb
    .text
	.type max, @function
	.global max
	
max:
    push %rbp	
    movq %rsp, %rbp
    cmpl %esi, %edi # b > a
    jl GBA
    cmpl %edi, %edx
    jl RA
    jmp RC
    
GBA:
    cmpl %esi, %edx # b > c
    jl RB
    jmp RC
    
RA:
    movl %edi, %eax
    jmp END
    
RB:
    movl %esi, %eax
    jmp END

RC:
    movl %edx, %eax
    jmp END
    
END:
    popq %rbp
    ret

