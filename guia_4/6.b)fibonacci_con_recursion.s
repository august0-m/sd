#Recursion
#Ejercicio 6 
#Los siguientes programas fueron escritos por 2 programadores sin comunicarse.
#Programador A escribio las funciones recursivas etiquetadas como FUNCION, mientras que Programador B escribio sus casos de test.
#Las funciones debisn utilizar la convencion de llamada estandar, ya que luego se agregarian al resto del codigo de la empresa donde ambos trabajan. 
#Aunque A dice haber cumplido con esto, al evaluar, todos los test fallan. 
# Para cada programa: 

#Comentar los casos de test y explicar que se esta evaluando.

#Comentar el codigo de la funcion, explicar su funcionamiento y darle un nombre descriptivo

#Marcar el prologo y epilogo de la funcion. 

#Indicar el Caso Base y la definicion recursiva de la funcion. 

#Encontrar los errores causados por no seguir la convencion o hacer mal uso del stack. Justificar. 

#Arreglar la funcion y comprobar el funcionamiento en el emulador Ripes

#Para un caso de test, realizar un grafico del flujo que realiza el programa.                # q es un grafico de flujo???????????????

# Ejercicio B
# viendo los casos de test supongo que la funcion tiene que devolver fibonacci de f(a0+1)
# porque tengo
#f(4)=5  y fib(5)=5            # es cambiando los casos bases, fib(0)=1
#f(5)= 8 y fib(6)=8
#f(6)=13 y fib(7)=13
main:                                                                       
    li a0,4
    jal ra,FUNCION
    li a1,5 
    bne a0,a1,noFunciona 
    
    li a0,5 
    jal ra,FUNCION
    li a1,8  
    bne a0,a1,noFunciona 
    
    li a0,6 
    jal ra,FUNCION
    li a1,13 
    bne a0,a1,noFunciona 
    

    
funciona: 
    li a1,1983 
    j fin 
noFunciona: 
    li a1,-990 
fin: 
    j fin  
    
#FUNCION:                     #fibonacci recursivo            codigo original
#    addi sp,sp,-8 
#    sw a0,(0)sp 
#    sw ra,(4)sp 
#    li a1,1                             #aca creo que es el principal error, porque luego cuando este sumando add a0,a1,a0 voy a siempre sumar 1 enves del resultado que tenga de a1
#    beq a0,zero,casoBase0 
#    beq a0,a1,casoBase1 
#    addi a0,a0,-1 
#    jal FUNCION         
#    mv a1,a0 
#    lw a0,(0)sp 
#    addi a0,a0,-2 
#    jal FUNCION 
#    add a0,a1,a0 
#    j prologo 
#    casoBase0: 
#        li a0,1                   #aca tambien porque si a0=cero,aca la estoy cargando como 1, pero cuando salto a prologo resaturo a0 entonces voy a devolver cero      
#        j prologo 
#    casoBase1: 
#        li a0,1 
#    prologo: 
#    lw ra,(4)sp                 # aca tambien porq no restaura a0
#    addi sp,sp,8 
#   ret


FUNCION:                 
    addi sp,sp,-12 
    sw a0,(0)sp 
    sw ra,(4)sp 
    
    li t1,1                 # uso t1 para comparar, asi no modifico los valores a0 y a1 que estoy usando de retorno                   
    beq a0,zero,casoBase0 
    beq a0,t1,casoBase1 
    
    addi a0,a0,-1              #1er paso recursivo fib(n-1)
    jal FUNCION         
    mv a1,a0                   #guardo en a1 la rta de fib(n-1)
    sw a1,8(sp)
    
    lw a0,(0)sp           # agarro a0 "original"
    addi a0,a0,-2          # 2 paso fib(n-2)
    jal FUNCION 
    
    lw a1,8(sp)
    add a0,a1,a0          # sumo a0(rta de fib(n-2))+a12(rta de fib(n-1))
    j epilogo 
    casoBase0:
        li a0,1                     
        j epilogo 
    casoBase1: 
        li a0,1 
    epilogo: 
        lw ra,(4)sp               
        addi sp,sp,12 
        ret
