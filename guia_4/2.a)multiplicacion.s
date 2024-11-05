# ejercicio 2.(a) multiplicacion  mult(x,y)= x?y (x,y ? Z) #no se si los la manera de testearlo es la correcta
main:
    li a0, 3
    li a1,0
    jal ra, multiplicacion
    li t0,0
    blt a0,t0,noFunciona        # por el que multiplico (x) luego de la multiplicacion, no puede ser menor que por el numero que multiplico (y), a menos que y sea negativo 
    
    li a0,5
    li a1,5
    jal ra, multiplicacion
    li t0,1
    blt a0,t0, noFunciona
    
    li a0,1
    li a1,14
    jal ra, multiplicacion
    li t0,14
    blt a0,t0,noFunciona
    
    li a0,1
    li a1,-1
    jal ra, multiplicacion
    li t0,-1
    blt a0,t0,noFunciona
    
    li a0,5
    li a1,-1
    jal ra, multiplicacion
    li t0,-5
    blt a0,t0,noFunciona
    
    li a0,-1
    li a1,5
    jal ra, multiplicacion
    li t0,-5
    blt a0,t0,noFunciona
    
    j funciona
noFunciona:
    li a3,-1
    j fin
funciona:
    li a3,1
    j fin
fin:
    j fin    
multiplicacion:                       # tengo 3 casos en multiplicacion, mult positiva, negativa y por cero, los separo
    addi sp,sp,-16
    sw ra,0(sp)
    add a3,zero,a0
    li a4, 1                         # a4 lo voy a usar para "controlar" los ciclos
    blt zero,a1,mult_positiva
    blt a1,zero,mult_negativa
    blt a0,zero,mult_negativa_aux
    beq a1,zero, mult_cero
    mult_positiva:
        bne a1,a4,ciclo_positivo    # hasta que a1 no sea = 1, sigo
        j fin_multiplicacion
    ciclo_positivo:
        add a0,a0,a3               #  hago el numero(a0) y lo sumo hasta que a1= 1, multiplicar por 1 es igual que el numero (a0), porque no empiezo desde cero sino que desde ese numero
        addi a1,a1,-1        
        j mult_positiva
    mult_negativa:
        sub a0,a0,a3                # al multiplicar negativamente, tambien arranco desde a0, por lo que vuelvo al ciclo 2 veces mas que en mult positiva, una para estar en cero, y otra para multiplicar por -1, por eso a4 es 1
        addi a1,a1,+1
        j vuelvo_negativo
    vuelvo_negativo:
        bne a1,a4,mult_negativa
        j fin_multiplicacion
    mult_negativa_aux:
        mv t0,a0
        mv t1,a1
        mv a0,t1
        mv t1,t0
        j mult_negativa
    mult_cero:
        mv a0,zero
    fin_multiplicacion:
        lw ra,0(sp)
        addi sp,sp,16
        ret
    

        
        
        
     
     
     
     
     
     
     
     
     
     
     
     
        