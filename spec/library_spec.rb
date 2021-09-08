require 'library'

describe Library do
  let(:borrow) { Library.new }

  it "shows all available books" do 
    expect(borrow.books).to eq([
      { :author => "Chinua Achebe", :title => "Things Fall Apart", :year_published => 1958 },
      { :author => "George Orwell", :title => "1984", :year_published => 1949 },
      { :author => "Chimamanda Ngozi Adichie", :title => "Half of a Yellow Sun", :year_published => 2006 }
    ])
  end

  it "stores books in an array" do
    expect(borrow.books).to be_an_instance_of(Array)
  end
end