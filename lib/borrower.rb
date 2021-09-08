require_relative 'books'

class Borrower
  attr_reader :first_name, :last_name, :address

  def initialize(first_name, last_name, address)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @address = address
  end  

  def my_loans(loan)
  end
end