#extern int is_outside(int x, int a, int b){
#	int pommax = a;
#	if(b > a){
#	pommax = b;
#	b = a;
#	}else{
#	pommax = a;
#	}
#	if (x < b) return -1;
#	if (pommax < x) return 1;
#	return 0;
#}
#   Funkcja zwraca:
#   1 jeżeli x>max(a,b)
#   -1 jeżeli x<min(a,b)
#   0 jeżeli x>=min(a,b) & x<=max(a,b) (czyli po prostu w innym wypadku)

.text
	.type is_outside, @function
	.global is_outside

is_outside:

    cmp %esi,%edx           # cmp a,b => a < b
    jle saveminmax
    
    movl %esi,%eax          # %eax = b = max(a,b)
                            # %edx = min(a,b) = q
                            
saveminmax:
    movl %edx,%eax          # %eax = b = max(a,b)
    movl %esi,%edx          # %edx = %esi = a
 
# w %eax jest max zas w %edx min zas w %edi jest x 
    
    cmp %eax,%edi
    jg ret1
    cmp %edi,%edx
    jg retm1
    
#return 0;    
    movl $0,%eax
    jmp END
#return 1;
ret1:
    movl $1,%eax
    jmp END
# return -1;
retm1:
    movl $-1,%eax
    jmp END

END:
    ret