# spec/features/books_feature_spec.rb
require "rails_helper"

RSpec.feature "Books", type: :feature do
  context "Update book" do
    let(:book) { Book.create(title: "Test title", author: "Test author", plot: "Test plot", rating: 5, date_completed: "2022-01-01") }
    before(:each) do
      visit edit_book_path(book)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Plot", with: "New plot content"
      end
      click_button "Update Book"
      expect(page).to have_content("Book was successfully updated")
    end

    scenario "should fail when title is blank" do
      within("form") do
        fill_in "Title", with: ""
      end
      click_button "Update Book"
      expect(page).to have_content("Title can't be blank")
    end
  end

  context "Create book" do
    before(:each) do
      visit new_book_path
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Title", with: "New Book Title"
        fill_in "Author", with: "New Book Author"
        fill_in "Plot", with: "New Book Plot"
        fill_in "Rating", with: 5
        fill_in "Date completed", with: "2022-02-01"
      end
      click_button "Create Book"
      expect(page).to have_content("Book was successfully created")
    end

    scenario "should fail when description is blank" do
      within("form") do
        fill_in "Title", with: "New Book Title"
        fill_in "Author", with: "New Book Author"
        fill_in "Plot", with: ""
        fill_in "Rating", with: 5
        fill_in "Date completed", with: "2022-02-01"
      end
      click_button "Create Book"
      expect(page).to have_content("Plot can't be blank")
    end

    scenario "should fail when title is blank" do
      within("form") do
        fill_in "Title", with: ""
        fill_in "Author", with: "New Book Author"
        fill_in "Plot", with: "New Book Plot"
        fill_in "Rating", with: 5
        fill_in "Date completed", with: "2022-02-01"
      end
      click_button "Create Book"
      expect(page).to have_content("Title can't be blank")
    end
  end
end
