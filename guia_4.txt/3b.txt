main: 
    li a0,3        
    li a1,10
    li a2,-5 
    li a3,2 
    li a4,5 
    li a5,-1 
    jal ra,FUNCION 
    li a2,1 
    bne a0,a2,noFunciona 
funciona:
    li a1,1
    j fin 
noFunciona: 
    li a1,0 
fin: 
    j fin

FUNCION: 
    addi sp,sp,-12 
    sw a2,(0)sp 
    sw s0,(4)sp 
    sw ra,(8)sp 
    li s0,1 
    mv a2,a4 
    jal ra,FUNCIONAUX 
    bne a0,s0,return 
    lw a0,(0)sp 
    mv a1,a3 
    mv a2,a5 
    jal ra,FUNCIONAUX 
    bne a0,s0,return 
    lw s0,(4)sp 
    lw ra,(8)sp 
    addi sp,sp, 12 
return:
    ret

FUNCIONAUX: 
    addi sp,sp,-4 
    sw ra,(0)sp 
    sub a3, a2,a0 
    blt a3, zero,afuera 
    sub a5, a2,a1 
    bgt a5, zero,afuera 
adentro: 
    li a0,1 
    j terminar 
afuera: 
    li a0,0 
terminar: 
    lw ra,(0)sp 
    addi sp,sp,4 
    ret