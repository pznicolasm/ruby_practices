require 'csv' #libreria ya esta en ruby
require_relative 'contact' #llamas al otro archivo 'contact.rb'

class Agenda

  attr_accessor :contacts

  def initialize(csv_file_name = nil)
    if csv_file_name #if true
      read_in_csv_data(csv_file_name)  #funcion read mas abajo
    else
      @contacts = []
    end
  end

  def write_in_csv_data(csv_file_name)
    CSV.open("#{csv_file_name}", "wb") do |csv| #CSV clase de ruby. lo abre. wb = permiso, write binary
      @contacts.each do |row| #row = fila
        csv << row.to_csv.parse_csv #traduce eso a csv. 'parsing'
      end
    end
  end

  def read_in_csv_data(csv_file_name)
    CSV.foreach(csv_file_name, headers: true) do |row| #foreach, igual que each do pero para csv
      @contacts << Contact.new(  #toma la primera fila como encabezado
        row["first_name"],
        row["last_name"],
        row["birthday"],
        row["phone"],
        row["address"]
      )
    end
  end

end
