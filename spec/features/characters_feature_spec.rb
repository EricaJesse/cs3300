require 'rails_helper'

RSpec.feature "Characters", type: :feature do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:character) { create(:character, book: book) }

  before do
    login_as(user)
  end

  # Test index action
  scenario "User visits characters index page" do
    visit book_characters_path(book)
    expect(page).to have_content("Characters")
  end

  # Test new and create actions
  scenario "User creates a new character" do
    visit new_book_character_path(book)
    fill_in "Name", with: "Character Name"
    fill_in "Description", with: "Character Description"
    click_button "Create Character"
    expect(page).to have_content("Character was successfully created")
  end

  scenario "User fails to create a new character with a blank name" do
    visit new_book_character_path(book)
    fill_in "Name", with: ""
    fill_in "Description", with: "Character Description"
    click_button "Create Character"
    expect(page).to have_content("Name can't be blank")
  end

  # Test show action
  scenario "User views a character's details" do
    visit book_character_path(book, character)
    expect(page).to have_content(character.name)
    expect(page).to have_content(character.description)
  end

  # Test edit and update actions
  scenario "User edits a character" do
    visit edit_book_character_path(book, character)
    fill_in "Name", with: "Updated Character Name"
    fill_in "Description", with: "Updated Character Description"
    click_button "Update Character"
    expect(page).to have_content("Character was successfully updated")
  end

  scenario "User fails to edit a character with a blank name" do
    visit edit_book_character_path(book, character)
    fill_in "Name", with: ""
    fill_in "Description", with: "Updated Character Description"
    click_button "Update Character"
    expect(page).to have_content("Name can't be blank")
  end

  # Test destroy action
  scenario "User deletes a character" do
    visit book_characters_path(book)
    expect { click_link "Destroy" }.to change(Character, :count).by(-1)
  end
end
