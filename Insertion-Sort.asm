# Codigo ensamblador del "Insertion-Sort" sobre el simulador MARS 4.2 http://courses.missouristate.edu/KenVollmar/MARS/MARS_4_2_Aug_2011/Mars_4_2.jar
# Implementado por @MaoAiz
# Mauricio Aizaga
# Est. Ingenieria de Sistemas y Computacion UTP
# Junio de 2012

#Nota: El algoritmo se muestra con un vector inicializado de ejemplo: int v[6] = {5,4,8,1,10,2}


.data
arr:.word   0 : 6         # "array" of words to contain fib values
size: .word  6             # size of "array" (agrees with array declaration)
.text
      la   $s0, arr        # load address of array
      la   $s5, size        # load address of size variable
      lw   $s5, 0($s5)      # load array size
      
      li   $t8, 4		# 4 para corriemientos por byte
      
      #inicializar vector v -> $s0 // ejemplo v[6] = {5,4,8,1,10,2}
      li   $s2, 5  	#5
      sw   $s2, 0($s0)         
      li   $s2, 4	#4
      sw   $s2, 4($s0) 
      li   $s2, 8  	#8
      sw   $s2, 8($s0)
      li   $s2, 1       #1
      sw   $s2, 12($s0)
      li   $s2, 10	#10
      sw   $s2, 16($s0)
      li   $s2, 2	#2  
      sw   $s2, 20($s0)
      #finaliza inicializacion del vector. OJO! si se ponen mas datos, sumar 4 a cada constante del sw
      
      
      
      #empieza el Insertion-Sort
      addiu $s3, $zero, 1	# s3=i
for:  slt $t1, $s3, $s5		# if(i<n) t1=1 else t1=0
      beq $t1, $zero, end_for	# if(t1==0) goto:end_for1
      add $s4, $zero, $s3	# s4=j;  //=> j=i
      mul $t2,$s4,$t8		# t2 = j*4
      add $t3,$s0,$t2		# t3 = address: a+j*4
      lw  $s1, 0($t3)		# t3=aux; //=> aux=a[j]
while:slt $t4,$zero,$s4		# if(0<j) ? t4=1 : t4=0;
      beq $t4,$zero,end_while	# if(t4==0) goto:end_while
      sub $t6,$s4,1		# s5 = j-1
      mul $t2, $t6,$t8		# t2= (j-1)*4
      add $t5,$s0,$t2		# t5 = address: a+(j-1)*4      
      lw $t5, 0($t5)		# t5=a[j-1]
      slt $t4,$s1,$t5		# if(aux<a[j-1]) ? t4=1 :t4=0
      beq $t4,$zero,end_while	# if(t4==0) goto:end_while
      mul $t2,$s4,$t8		# t2 = j*4
      add $t3,$s0,$t2		# t3 = address: a+j*4
      sw $t5, 0($t3)		# a[j] = a[j-1]
      sub $s4,$s4,1		# j--
      j while			# continue with the while
end_while:mul $t2,$s4,$t8	# t2 = j*4
      add $t3,$s0,$t2		# t3 = address: a+j*4
      sw $s1,0($t3)		#a[j]=aux;
      add $s3,$s3,1		# t3 = address: a+j*4
      j for
end_for:add $t1,$t2,$t3
      #finaliza el Insertion-Sort
