class Contact
  attr_accessor :first_name, :last_name, :birthday, :phone, :address #getter y setter

  def initialize(first_name, last_name, birthday, phone, address)
    @first_name = first_name
    @last_name = last_name
    @phone = phone
    @address = address
    @birthday = birthday
  end

  def to_s
    "Firstname: #{@first_name}, " +
    "Lastname: #{@last_name}, " +
    "Birth: #{@birthday} "
  end

  def to_csv #imprime el valor de la variable. incrusta.
    "#{@first_name},#{@last_name},#{@birthday},#{@phone},#{@address}"
  end

end
