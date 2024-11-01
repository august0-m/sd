# ejercicio 2(b)
main:
    li a0,2
    jal ra, fibonacci
    li a1,1
    bne a0,a1,no_funciona
    li a0, 1
    j fin
no_funciona:
    li a0,-1
    j fin
fin:
    j fin
fibonacci:
    addi sp,sp,-4
    sw ra,0(sp)
    
    beq a0,zero,caso_cero
    
    li t1,1             # t5 para el caso en que es 1
    beq a0,t5,caso_uno
    
    li t0,0             # t0 para el acumulador
    addi t2,a0, -1  # usaria t2 para fib(n-1)
    addi t3, a0,-2  # usaria t3 para fib(n-2)
    add a0,t2,t3    # fib n = fib(n-1) + fib(n-2)
    jal ra,ciclo
    j fin_ciclo
    ciclo:
        add t0,t2,t3
        addi a0,a0,-1
        j fibonacci
        
    caso_cero:
        j fin_ciclo
        
    caso_uno:
        j fin_ciclo
        
    fin_ciclo:
        lw ra,0(sp)
        addi,sp,sp,4
        ret