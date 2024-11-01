# ejercicio 2.(b) multiplicacion  # esta mal solo funcion para a1 >0 habria q hacerlo para multiplicar por negativo
main:
    li a0, 3
    li a1,2
    jal ra, multiplicacion
    li a4,1
    bne a1,a4,noFunciona
    li a0,5
    li a1,5
    jal ra, multiplicacion
    li a4,1
    bne a1,a4, noFunciona
    li a0,1
    li a1,14
    jal ra, multiplicacion
    li a4,1
    bne a1,a4,noFunciona
    j funciona
noFunciona:
    li a3,0
    j fin
funciona:
    li a3,1
    j fin
fin:
    j fin    
multiplicacion:
    addi sp,sp,-16
    sw ra,0(sp)
    add a3,zero,a0
    li a4, 1
    beq a1,zero, mult_cero
    vuelvo:
    bne a1,a4,ciclo
    lw ra,0(sp)
    addi sp,sp,16
    ret
ciclo:
    add a0,a0,a3
    addi a1,a1,-1
    j vuelvo
mult_cero:
    li a0,1
    lw ra,0(sp)
    addi sp,sp,16
    ret
    
