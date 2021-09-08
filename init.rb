require_relative './lib/library'
require 'date'

@loans = []

def print_available_books(books)
  if books.empty?
    puts "There are currently no books available to borrow."
  else 
    puts "AVAILABLE BOOKS"
    puts "-" * 79
    books.each_with_index do |book, index|
      print "#{index + 1} - Author: #{book[:author]}, Book Title: #{book[:title]}, Year Published: #{book[:year_published]}\n"
    end
    puts "-" * 79
  end
end

def borrow_book(books)
  puts "Please enter the number of the book you wish to borrow: "
  user_choice = gets.chomp.to_i

  user_choice = user_choice - 1
  @loans << books[user_choice]
  books.delete(books[user_choice])
  date_borrowed = Date.today.strftime('%d %b, %Y')
  due_back = (Date.today + 21).strftime('%d %b, %Y')

  puts "Your borrowed book(s):"
  puts "-" * 79
  @loans.each_with_index do |book, index|
    print "#{index + 1} - '#{book[:title]}' on #{date_borrowed}.  Your load period ends: #{due_back}\n"
  end
  puts "-" * 79
end

def print_book_loans
  if @loans.empty?
    puts "You currently have no books on loan."
  else   
    puts "BOOKS I HAVE ON LOAN:"
    puts "-" * 79
    @loans.each_with_index do |book, index|
      print "#{index + 1} - Author: #{book[:author]}, Book Title: #{book[:title]}, Year Published: #{book[:year_published]}\n"
    end
    puts "-" * 79
  end
end

def return_book(books)
  if @loans.empty?
    puts "You currently have no books on loan."
  else 
    print_book_loans
    puts "Please choose the number of the book to be returned:"
    user_choice = gets.chomp.to_i
    puts "-" * 79
    return_book = @loans[user_choice - 1]
    books << return_book
    puts "Returning #{return_book[:title]}."
    @loans.delete(return_book)
    puts "-" * 79
  end
end

def menu
  my = Library.new
  books = my.books
  loop do
    puts "Please choose action - ('quit' to exit)"
    puts "-" * 79
    puts "list - list all books"
    puts "borrow - borrow a book"
    puts "return - return a book"
    puts "loans - view your current loans" 
    puts "-" * 79
    answer = gets.chomp.downcase
    case answer
    when "list"
      print_available_books(books)
    when "borrow"
      borrow_book(books)
    when "return"
      return_book(books)
    when "loans"
      print_book_loans
    when 'quit', 'exit'
      puts "Thank you for visiting the library"
      print_book_loans
      break
    else
      puts "Please choose an option from the menu or 'quit'"
    end
  end
end

menu






