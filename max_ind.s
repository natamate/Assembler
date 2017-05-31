# zwroc indeks maksymalnej wartosci, 0 w przypadku jej wielokrotnego wytapienia

.text
.type max_ind, @function
.global max_ind

# a jest w %rdi
# b jest w %rsi
# c jest w %rdx
# d jest w %rcx

max_ind:
    mov %rdi, %rax
    cmp %rsi, %rax
    jg RAXGreater
    mov %rsi, %rax
RAXGreater:
    cmp %rdx, %rax
    jg RAXGreater2
    mov %rdx, %rax
RAXGreater2:
    cmp %rcx, %rax
    jg RAXGreater3
    mov %rcx, %rax
RAXGreater3:

    mov $0, %r8
    cmp %rdi, %rax
    jne label
    inc %r8
label:
    cmp %rsi, %rax
    jne label1
    inc %r8
label1:
    cmp %rdx, %rax
    jne label2
    inc %r8
label2:
    cmp %rcx, %rax
    jne label3
    inc %r8
label3:
    cmp $2, %r8
    jl end 
    mov $0, %rax
end:
    ret
