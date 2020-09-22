class Jugador 
	attr_reader :nombre
	attr_accessor :energia
	def initialize (nombre)
					@nombre = nombre
					@energia = 100
	end

	def nombre ()
			puts @nombre
	end

	def jugada ()
	puts "ingrese accion: 1-Atacar 2-bloquear"
			accion = gets.chomp.to_i
	if accion == 1
					puts 'ataque'
			else
					puts 'bloqueo'
			end
			accion
	end
end

class Juego
	attr_accessor :jugador1, :jugador2
	def initialize (jugador1, jugador2)
			@jugador1 = jugador1
			@jugador2 = jugador2
	end

	def to_s ()
			puts "el nombre del jugador es", jugador1.nombre
	end

	def determinar_ganador (jugador1, jugador2, turno)
			if turno < 10
					puts "si viejo"
					if (@jugador1.energia <= 0 and @jugador2.energia <= 0)
							puts "Ambos jugadores perdieron toda la energia, empate"
					elsif (@jugador1.energia <= 0)
							puts "el jugador 2 gano"
					elsif (@jugador2.energia <= 0)
							puts "el jugador 1 gano"
					end
			else
					if @jugador1.energia < @jugador2.energia
							puts "Ganó el jugador2"
					elsif @jugador1.energia > @jugador2.energia
							puts "Ganó el jugador1", jugador1
					elsif @jugador1.energia == @jugador2.energia 
							puts "Hubo empate"
					end
			end

	end
def combate (jugador1, jugador2)
			turnos = Array.new(10) {|a| a +=1}
			cont = 0
			turnos.each do |turno|

					cont += 1
					if (jugador1.energia > 0 and jugador2.energia > 0)

							a = jugador1.jugada

							b = jugador2.jugada
							if (a == 1 and b == 2)
									jugador1.energia -= 10
							elsif (a == 2 and b == 1)
									jugador2.energia -= 10
							elsif (a == 1 and b == 1)
									jugador1.energia -= (jugador2.energia * 20)/100
									jugador2.energia -= (jugador1.energia * 20)/100
							end
					else
							return cont
					end
			end
			return cont
			#turno
	end

end

x = Jugador.new('player1')
y = Jugador.new('player2')
game = Juego.new(x, y)
turno_juego = game.combate(x, y)
game.determinar_ganador(x, y, turno_juego)