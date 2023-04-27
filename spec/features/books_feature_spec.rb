# spec/features/books_feature_spec.rb
require "rails_helper"

RSpec.feature "Books", type: :feature do
  context "Login" do
    scenario "should sign up" do
      visit root_path
      click_link 'Sign up'
      within("form") do
        fill_in "Email", with: "testing@test.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Sign up"
      end
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end

    scenario "should log in" do
      user = FactoryBot.create(:user)
      login_as(user)
      visit root_path
      expect(page).to have_content("Logged in")
    end
  end

  context "Create book" do
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
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

    scenario "should fail when plot is blank" do
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

  context "Update book" do
    let(:book) { Book.create(title: "Test title", author: "Test author", plot: "Test plot", rating: 5, date_completed: "2022-01-01") }
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
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
end
