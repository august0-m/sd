# ejercicio 2(b)
main:
    li a0,1
    jal ra, fibonacci
    li a1,1
    bne a1,t2,no_funciona
    
    li a0,2
    jal ra, fibonacci
    li a1,1
    bne a1,t2,no_funciona
    
    li a0,4
    jal ra, fibonacci
    li a1,3
    bne a1,t2,no_funciona
    
    li a0,7
    jal ra, fibonacci
    li a1,13
    bne t2,a1,no_funciona
    
    li a0,0
    jal ra, fibonacci
    li a1,0
    bne t2,a1,no_funciona
    
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
    
    li t1,1                     # t5 para el caso en que es 1
    beq a0,t1,caso_uno
    
    li t0,0                      # t0 fib1
    li t1,1                      # t1 fib2
    li t2, 0                     # t2 rta
    #addi t2,a0, -1              # usaria t2 para fib(n-1)
    #addi t3, a0,-2              # usaria t3 para fib(n-2)
    #add a0,t2,t3                # fib n = fib(n-1) + fib(n-2)
    jal ra,ciclo
    j fin_ciclo
    ciclo:
        add t2,t0,t1
        mv t0, t1
        mv t1,t2
        addi a0,a0,-1
        li t6,2
        blt a0,t6,fin_ciclo
        j ciclo
        
    caso_cero:
        mv t2,zero
        j fin_ciclo
        
    caso_uno:
        li t2,1
        j fin_ciclo
        
    fin_ciclo:
        lw ra,0(sp)
        addi,sp,sp,4
        ret
     

     
     
     
     
     
     
     
     
     
        