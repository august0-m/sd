# ejercicio 5(c) EvaluarMonomio (x,c,p)=c?x^p
main:
    li a0,1
    li a1,2
    li a2,0
    jal ra, evaluar_monomio
    li a1,1
    bne a0,a1,no_funciona
    
    li a0,3
    li a1,2
    li a2,5
    jal ra, evaluar_monomio
    li a1,96
    bne a0,a1,no_funciona
    
    li a0,5
    li a1,3
    li a2,9
    jal ra, evaluar_monomio
    li a1,98415
    bne a0,a1,no_funciona
    
    li a0,0
    li a1,2
    li a2,2
    jal ra, evaluar_monomio
    li a1,0
    bne a0,a1,no_funciona
    
    li a0,-1
    li a1,2
    li a2,2
    jal ra, evaluar_monomio
    li a1,-4
    bne a0,a1,no_funciona
    
    li a0,1
    li a1,-2
    li a2,2
    jal ra, evaluar_monomio
    li a1,4
    bne a0,a1,no_funciona
    
funciona:
    li a0,1983
    j funciona
no_funciona:
    li a0,-99
    j no_funciona

evaluar_monomio:                        # (x(a0),c(a1),p(a2))=c·x^p
    addi sp,sp,-4
    sw ra,0(sp)
    mv t1,a1
    mv t2,a2
    li t3,1  #uso t3 como controlador
    beq t2,zero,caso_cero  #  si potencia=0 entonces deveuelvo 1
    ciclo:
        beq t3,t2,fin_funcion
        mul t1,t1,a1
        addi t2,t2,-1
        j ciclo
    caso_cero:
        li a1,1
        mul a0,a1,a0
        lw ra,0(sp)
        addi sp,sp,4
        ret
    fin_funcion:
        mul a0,t1,a0
        lw ra,0(sp)
        addi sp,sp,4
        ret
        
        
        
        
        
        
        
        