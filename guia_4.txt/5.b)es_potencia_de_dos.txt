# ejercicio 5(b) EsPotenciaDeDos EsPotenciaDeDos(x) = 1 si ?k ? N 2^k = x, 0 sino
main:
    li a0, 2         # 2^1
    jal ra, funcion
    li a1,1
    bne a1,a0,fin
    
    li a0, 4         # 2^2
    jal ra, funcion
    li a1,1
    bne a1,a0,fin
    
    li a0, 3         # 2^1
    jal ra, funcion
    li a1,0
    bne a1,a0,fin
    
    li a0, 10         # 2^3
    jal ra, funcion
    li a1,0
    bne a1,a0,fin
    
    li a0, 16        # 2^4
    jal ra, funcion
    li a1,2
    beq a1,a0,fin
    
    li a0, 33        # 2^5
    jal ra, funcion
    li a1,0
    bne a1,a0,fin
    
    li a0, 64        # 2^6
    jal ra, funcion
    li a1,1
    bne a1,a0,fin
    
    li a0, 129       # 2^7
    jal ra, funcion
    li a1,0
    bne a1,a0,fin
    
    li a0, 256       # 2^8
    jal ra, funcion
    li a1,1
    bne a1,a0,fin
    
    li a0, 510       # 2^9
    jal ra, funcion
    li a1,0
    bne a1,a0,fin
    
    li a0, 1024      # 2^10
    jal ra, funcion
    li a1,1
    bne a1,a0,fin

fin_bueno:
    li a0,1983
    j fin_bueno
fin:
    li a0,99
    j fin
    
funcion:
    addi sp,sp,-16
    sw ra,0(sp)
    mv t0,a0
    li a0,2
    li a1,2
    beq a0,t0,fin_funcion
    bgt a0,t0,fin_funcion_no_da
    ciclo:
        jal ra, multiplicacion
        slli a1,a1,1
        blt a0,t0,ciclo
        beq a0,t0,fin_funcion
        bgt a0,t0,fin_funcion_no_da
    multiplicacion:                       # tengo 3 casos en multiplicacion, mult positiva, negativa y por cero, los separo
        addi sp,sp,-16
        sw ra,0(sp)
        add a3,zero,a0
        li a4, 1                         # a4 lo voy a usar para "controlar" los ciclos
        mult_positiva:
            bne a1,a4,ciclo_positivo    # hasta que a1 no sea = 1, sigo
            j fin_multiplicacion
            ciclo_positivo:
                add a0,a0,a3               
                addi a1,a1,-1        
                j mult_positiva
            fin_multiplicacion:
                lw ra,0(sp)
                addi sp,sp,16
                ret
    fin_funcion:
        li a0,1
        lw ra,0(sp)
        addi sp,sp,16
        ret
    fin_funcion_no_da:
        li a0,0
        lw ra,0(sp)
        addi sp,sp,16
        ret
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        