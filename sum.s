#int int sum(int a,int b, intc){
#	return a+b+c;
#} 
#sumuje 3 liczby

.text
	.type sum, @function
	.global sum
	
sum:
    pushq %rbp
    movq %rsp, %rbp
    movl %edi, %eax
    addl %esi, %eax
    addl %edx, %eax
    
    popq %rbp
    ret
    