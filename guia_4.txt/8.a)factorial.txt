#Ejercicio8 
#Programe en lenguaje ensamblador de RISC-V las siguientes funciones recursivas y al menos 2 casos de test que compruebe el funcionamiento de cada una de ellas.
#Se debe usar la convencion de llamada de RISC-V. 
#Factorial: fact(x) = |      1     si x=0 
#                     | x·fact(x-1) sino        ##  x·fact(x-1) es literalmente lo mismo que el factorial de x, supongo que es una ayuda para pensarlo recursivamente
main:
    li a0,0
    jal ra, factorial
    li a1,1
    bne a0,a1,no_funciona
    
    li a0,5
    jal ra, factorial
    li a1,120
    bne a0,a1,no_funciona
fin_bueno:
    li a0,1983
fin:
    j fin
no_funciona:
    li a0,-98312
    j fin
    
    
factorial:
    addi sp,sp,-16
    sw ra,0(sp)
    sw a0,4(sp)
    
    beq a0,zero,caso_cero  #caso base
    
    addi a0,a0,-1
    jal ra, factorial
   
    mv a1,a0
    lw a0,4(sp)
    mul a0,a0,a1
    
    j epilogo
    caso_cero:
        li a0,1   
    epilogo:
        lw ra,0(sp)
        addi sp,sp,16
        ret
    

     
     
     
     
     