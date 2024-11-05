# ejercicio 5(c) EvaluarPolinomio:Dado un puntero a un arreglo de enteros de 32 bits, la cantidad de elementos del arreglo y un entero x,
#evalua en x el polinomio construido usando como coeficientes los valores dentro del arreglo.
#Ejemplo: El arreglo 3 -1 5 0 2 Equivaldria al polinomio P(x)= 3 - x + 5·x^2 + 2·x^4  # (x,c,p)=c·x^p
.data
largo1:.word 5
array1: .word 0,1,2,3,4               #Equivaldria al polinomio P(x)=  x + 2·x^3 + 3·x^4 + 4·x^5
largo2: .word 10
array2: .word 0,-1,2,0,-4,0,3,-1,3,1  #Equivaldria al polinomio P(x)=  -1·x + 2·x^3 + -4·x^5 + 3·x^6 + -1·x^7 + 3·x^8 + 1·x^9
.text
main:
    
    la a0,largo2
    la a1,array2
    li a2,0
    jal ra, evaluar_polinomio
    li a1,0
    bne a0,a1,no_funciona
    
    la a0,largo1
    la a1,array1
    li a2,1
    jal ra, evaluar_polinomio
    li a1,10
    bne a0,a1,no_funciona
    
funciona:
    li a0,1983
    j funciona
no_funciona:
    li a0,-99
    j no_funciona
evaluar_polinomio:
    addi sp,sp,-4
    sw ra,0(sp)
    lw t0,0(a0)    #t0 es el largo
    mv t2,zero     #t2 es la suma
    mv t3,zero     # t3 seria contador por el que voy a potenciar
    ciclo_pol:
        beq t0,zero, fin_polinomio         #t0 longitud es cero--> termine la funcion
        lw t1,0(a1)                        # t1 el elemento en el que estoy parado
        
        addi sp,sp,-24                     # guardo los registros que no quiero que se modifiquen al salir de la funcion
        sw  t2,0(sp)
        sw  a1,4(sp)
        sw  a2,8(sp)
        sw  t0,12(sp)
        sw  a0,16(sp)
        sw  t3,20(sp)
        mv a0,t1          # en a0 tengo que poner el elmentto en el que estoy parado (t1)
        mv a1,a2          # en a1 voy a poner a x que es el elemento por el que quiero multiplicar(a2)
        mv a2,t3          # en a2 la potencia (t3)
        jal ra evaluar_monomio
        
        lw  t2,0(sp)    
        add t2,t2,a0            # restauro t2 y le sumo la rta de la funcion   
        lw  a1,4(sp)
        lw  a2,8(sp)
        lw  t0,12(sp)
        lw  a0,16(sp)
        lw  t3,20(sp)
        addi sp,sp,24
        
        addi a1,a1,4        # sumo 4 para moverme en el array
        addi t0,t0,-1       # le resto uno a la longitud
        addi t3,t3,1        # le sumo uno a cant para la potencia
        j ciclo_pol
    fin_polinomio:
        mv a0,t2        # pongo la rta(que esta en t2) en a0
        lw ra,0(sp)     # restauro sp
        addi sp,sp,4
        ret
        evaluar_monomio:               # (x(a1),c(a0),p(a2))=c·x^p
            addi sp,sp,-4
            sw ra,0(sp)
            mv t1,a1      # en t1 voy a tener x  
            mv t2,a2      # en t2 voy a tener la potencia  
            li t3,1  #uso t3 como controlador
            beq t2,zero,caso_cero  #  si potencia=0 entonces deveuelvo 1 por  C
                ciclo:
                    beq t3,t2,fin_funcion
                    mul t1,t1,a1        # multipilco t1(el acumulado de x) por x original
                    addi t2,t2,-1       # le resto 1 a t2 que es el controlador de la potencia 
                    j ciclo
                caso_cero:
                    li a1,1
                    mul a0,a1,a0        # caso cero es 1 por C
                    lw ra,0(sp)
                    addi sp,sp,4
                    ret
                fin_funcion:
                    mul a0,t1,a0        # en t1 tengo el acumulado de la potencia,lo multiplico por C(a0)
                    lw ra,0(sp)
                    addi sp,sp,4
                    ret
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        