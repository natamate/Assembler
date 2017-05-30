#int maxdiff(int a,int b,int c,int d){
#	min = a; //uzyj %eax
#	if (min > b) min = b;
#	if (min > c) min = c;
#	if (min > d) min = d;
#	
#	if (b > a) a = b;
#	if (c > a) a = c;
#	if (d > a) a = d;
#	a -= min;
#	return a;
#	}	
# znajduje róznice najwieksze i najmniejszej z 4 liczb


.text
	.type diffmax, @function
	.global diffmax
	
diffmax:
    pushq %rbp
    movq %rsp, %rbp
    cmpl %edi, %esi # b > a
    jg GBA
    jmp GAB
    
GBA:
    movl %esi, %eax
    jmp CEaxWithC
    
GAB:
    movl %esi, %eax
    jmp CEaxWithC

CEaxWithC:
    cmpl %edx, %eax # eax > c
    jg CEaxWithD
    movl %edx, %eax
   
CEaxWithD:
    cmpl %ecx, %eax # eax > d
    jg FindDiff
    movl %ecx, %eax
    jmp FindDiff

FindDiff:
    cmpl %edi, %esi # b > a
    jg LAB
    jmp LBA
LAB:
    jmp CmpC
LBA:
    movl %esi, %edi
    jmp CmpC
CmpC:
    cmpl %edx, %esi # %esi > c
    jg LCESI
    jmp CmpD
LCESI:
    movl %edx,%esi
    jmp CmpD
    
CmpD:
    cmpl %ecx,%esi # %esi > d
    jg LDESI
    jmp Roz
LDESI:
    movl %ecx,%esi
    jmp Roz
Roz:
    neg %esi
    add %esi,%eax
END:    
    popq %rbp
    ret