class Library

  def initialize
    @books = [
      { :author => "Chinua Achebe", :title => "Things Fall Apart", :year_published => 1958 },
      { :author => "George Orwell", :title => "1984", :year_published => 1949 },
      { :author => "Chimamanda Ngozi Adichie", :title => "Half of a Yellow Sun", :year_published => 2006 }
    ]
  end

  def books
    @books
  end
end