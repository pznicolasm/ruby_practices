require 'csv'
require_relative 'agenda'
require_relative 'contact'

agenda = Agenda.new

ARGV.each do |csv_file_name|  
  puts "Processing #{csv_file_name}" #procesa el nombre del archivo pasado por parametro
  agenda.read_in_csv_data(csv_file_name)
end

puts "Cantidad de Contactos Agendados = #{agenda.contacts.size}"

puts "\nLista de contactos:\n"
agenda.contacts.each_with_index do |contact, index| #por cada contacto con indice
  puts "index: #{index}, #{contact}"  #lo arma como un string
end


puts "\nModificar un contacto:\n"
agenda.contacts[0].first_name = "Alan Mathison"
agenda.contacts.each_with_index do |contact, index|
  puts "index: #{index}, #{contact}"
end

puts "\nCrear un Contacto:\n"
contacto = Contact.new(
  "Richard Matthew",
  "Stallman",
  "13-03-1953",
  "2214556540",
  "Manhattan Estados Unidos"
)
agenda.contacts << contacto

agenda.contacts.each_with_index do |contact, index|
  puts "index: #{index}, #{contact}"
end

puts "\nBorrar un Contacto:\n"
agenda.contacts.delete_at(1)
agenda.contacts.each_with_index do |contact, index|
  puts "index: #{index}, #{contact}"
end

puts "\nGuardando en csv...\n"
agenda.write_in_csv_data("new_agenda.csv")
