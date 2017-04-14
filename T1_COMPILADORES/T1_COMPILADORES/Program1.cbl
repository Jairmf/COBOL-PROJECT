       program-id. Program1 as "T1_COMPILADORES.Program1".

       environment division.
       configuration section.
       input-output section.
      *    select notas assign "C:\tuvi\notas.txt"
      *        organization is sequential.
               
           select promedio assign "C:\Users\LUIGI\Desktop\T1_COMPILADORES\promedio.dat"
               organization is sequential.
       
       data division.
      *fd notas.
             
       fd promedio.
           01 promedio-rec.
               05 nombre-pro           pic x(12).
               05 apellido-pro         pic x(12).
               05 nota-media           pic x(12).
               05 filler               pic x.
               05 cualificacion        pic x(30).
           
       working-storage section.
    
       01 notas-reg.
           05 nombre           pic x(12).
           05 apellido         pic x(12).
           
           05 calificaciones.
               10 calificacion1        pic 99.
               10 calificacion2        pic 99.
               10 calificacion3        pic 99.
               10 calificacion4        pic 99.
               10 calificacion5        pic 99.
           05 creditos.
               10 credito1             pic 9.
               10 credito2             pic 9.
               10 credito3             pic 9.
               10 credito4             pic 9.
               10 credito5             pic 9.
               
       01 area-de-trabajo.
       
           05 switches-flags           pic x.
      *        88 fin-fichero                      value 'f'.
               88 no-fin-fichero                   value 'n'.
               
           05 constantes-literales.
               10 cte-una              pic 9       value 1.
               10 cte-numero-notas     pic 99.
               10 It-insuficiente      pic x(30)   value 'Insuficiente'.
               10 It-suficiente        pic x(30)   value 'Suficiente'.
               10 It-bien              pic x(30)   value 'Bueno'.
               10 It-notable           pic x(30)   value 'Notable'.
               10 It-excelnte          pic x(30)   value 'Excelente'.
               
           05 variables-auxiliares.
               10 nota-total           pic 999v9.
               10 nota-promedio        pic 99.99.

       procedure division.
          perform inicio.
          perform valores
	      perform proceso
	      perform fin
          perform mostrar-prom
          goback.
	
       inicio.
      *     open input notas
            open output promedio
            set no-fin-fichero to true.
      *     perform leer-notas.
	
       proceso.
	        perform obtener-promedio
	        perform pasar-datos
	        perform escribir-datos.
      *     perform leer-notas.
	
       obtener-promedio.
	        compute nota-total = (calificacion1*credito1) + (calificacion2*credito2) + (calificacion3*credito3) + (calificacion4*credito4) + (calificacion5*credito5)
            compute cte-numero-notas = credito1 + credito2 + credito3 + credito4 + credito5
	        compute nota-promedio = nota-total / cte-numero-notas.

       pasar-datos.
	        move nombre			to nombre-pro
	        move apellido		to apellido-pro
	        move nota-promedio	to nota-media
	        perform dar-cualificacion.
	
       dar-cualificacion.
	        evaluate nota-promedio
		        when < 10
			        move It-insuficiente to cualificacion
		        when >= 10 and < 12
			        move It-suficiente to cualificacion
		        when >= 12 and < 14
			        move It-bien to cualificacion
		        when >= 14 and < 18
			        move It-notable to cualificacion
		        when >= 18
			        move It-excelnte to cualificacion
	        end-evaluate.
	
       fin.
            close promedio.
      *     notas
		        
      *
      *leer-notas.
      *     read notas
      *         at end set fin-fichero to true
      *     end-read.
	
       escribir-datos.
	        write promedio-rec
		        after advancing cte-una lines.
            
       valores.
            display "Cálculo de Promedio"
            display '___________________'.
            display ' '.
            display 'Ingresar nombre: '.
            accept nombre
            display 'Ingresar apellido: '.
            accept apellido
            display '___________________'.
            display 'Calificacion N° 1: '.
            accept calificacion1
            display 'Crédito N° 1: '.
            accept credito1
            display '___________________'.
            display 'Calificacion N° 2: '.
            accept calificacion2
            display 'Crédito N° 2: '.
            accept credito2
            display '___________________'.
            display 'Calificacion N° 3: '.
            accept calificacion3
            display 'Crédito N° 3: '.
            accept credito3
            display '___________________'.
            display 'Calificacion N° 4: '.
            accept calificacion4
            display 'Crédito N° 4: '.
            accept credito4
            display '___________________'.
            display 'Calificacion N° 5: '.
            accept calificacion5
            display 'Crédito N° 5: '.
            accept credito5.
            display '___________________'.
            display ' '.
               
       mostrar-prom.
           display 'Promedio total: ' nota-promedio.
           display 'Total créditos: ' cte-numero-notas.
           display ' '.
           stop "Pulse ENTER para finalizar".
           
       end program Program1.