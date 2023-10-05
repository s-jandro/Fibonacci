## Fibonacci.asm

# SECCION DE INSTRUCCIONES (.text)
.text
.globl __start

__start:
la $a0, Fiboprt #la cargar una direccion, leer la posicion de memoria, $ a0 es registro  
li $v0, 4 #carga inmediata, recibe el 4 en complemento a 2
syscall # llamada a rutina de sistema
li $v0, 5 
syscall
addi $t8,$v0,0         # valor de teclado en $t8, 
li $t0,0
li $t1,1	

la $a0,Fibost1
li $v0,4    #imprime un srtring
syscall               # "La serie Fibonacci de "
addi $a0,$t8,0
li $v0,1
syscall               # n
la $a0,Fibost2
li $v0,4 
syscall               # " terminos es: "
li $a0,1
li $v0,1
syscall               # 1, ...
la $a0,coma
li $v0,4
syscall
      li   $t4,2
      beq  $t8,$0,fin # preguntar si t8 es 0 
      bltz $t8,fin #si es negativo fin
loop: add  $t2,$t0,$t1  # fibonacci
      addi $a0,$t2,0  
      li $v0,1
      syscall
      beq $t4,$t8,fin
      la $a0,coma
      li $v0,4
      syscall
      addi $t4,$t4,1
      addi $t0,$t1,0
      addi $t1,$t2,0
      
      j loop

fin:  
      la $a0,endl
      li $v0,4
      syscall
      li $v0,10
      syscall

# SECCION DE VARIABLES EN MEMORIA (.data)
.data
Fiboprt: .asciiz "Ingresar n:"  #se cra una posicion de memoria ni bien empieza
Fibost1: .asciiz "La serie Fibonacci de "
Fibost2: .asciiz " terminos es: "
coma:    .asciiz ", "
endl:    .asciiz "\n"