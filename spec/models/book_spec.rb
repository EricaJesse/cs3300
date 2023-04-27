require "rails_helper"

describe "Book Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating book" do
      book = Book.new(author: "Author Name")
      expect(book.valid?).to eq(false)
    end
    it "should not be able to save book when title missing" do
      book = Book.new(author: "Author Name")
      expect(book.save).to eq(false)
    end
    it "should be able to save book when have author and title" do
      book = Book.new(title: "Title", author: "Author Name")
      expect(book.save).to eq(true)
    end
  end
end

describe "Book Attribute Requirements on Edit", :type => :model do
  context "Edit book" do  
    before (:each) do
      @book = Book.create(title: "Title", author: "Author Name")
    end
    it "ensures the title is present when editing book" do
      @book.update(:title => "New Title")
      expect(@book.title == "New Title")
    end
  end
end
