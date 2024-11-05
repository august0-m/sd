# ejercicio 5(a) inv(x) = -x #tengo que invertir los bits y sumar uno
main:
    li a1,1
    jal ra, invertir
    add a3,a2,a1
    bne a3,zero, no_funciona
    
    li a1,4
    jal ra, invertir
    add a3,a2,a1
    bne a3,zero, no_funciona
    
    li a1,-9
    jal ra, invertir
    add a3,a2,a1
    bne a3,zero, no_funciona
    
    li a1,0
    jal ra, invertir
    add a3,a2,a1
    bne a3,zero, no_funciona
    
    li a0,1
    j fin
no_funciona:
    li a0,-1
    j fin
fin:
    j fin
invertir:
    addi,sp,sp,-4
    sw ra,0(sp)
    not a2,a1
    addi a2,a2,1
    lw ra,0(sp)
    ret