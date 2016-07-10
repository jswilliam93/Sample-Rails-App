class User
  attr_accessor :name :email

  def initialize(att ={})
    @name = att[:name]
    @email = att[:email]
  end

  def formated_email
    "#{@name}<#{@email}>"
  end
end
