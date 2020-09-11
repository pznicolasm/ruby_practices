# 2.- Se quiere hacer un conversor de medidas:
# De pies a metros
# de metros a pies
# Donde m = ft / 3.2808 (m = meters, ft = feets)
# ¿Que alternativas tenemos para implementar la solución? ¿Cuál considerás mejor?
# ¡Implementala!

class Conversor
	attr_accessor :m
  def initialize
		@m = 3.2808
  end

	def topiesometros ()
		puts 'ingrese una operacion (p / m)'
		operacion = gets.chomp #saca el salto de linea '/n'
		puts 'ingrese valor'
		valor = gets.chomp.to_i #to_i = convierte a int
		if operacion == 'p'
			p = valor*@m
			puts p 
		else
			m = valor/@m
			puts m 
		end
  end
end

c = Conversor.new
c.topiesometros()

# ------------------------------------------------------------

# def conversor
# 	{ #bloque / los bloques son lo unico que no son objetos. una func adentro de otra
# 	  metros_a_pies: ->(n) { n * 3.2808 },
# 	  pies_a_metros: ->(n) { n / 3.2808 },
# 	}
#   end
  
#   def convertir_unidad(n, unidad_inicial, unidad_salida)
# 	converter = "#{unidad_inicial}a#{unidad_salida}".to_sym #to simbolo
# 	puts "#{n} #{unidad_inicial} son #{conversor[converter].(n)} #{unidad_salida}"
#   end
  
#   puts convertir_unidad(100,'pies','metros')
#   puts convertir_unidad(100,'metros','pies')