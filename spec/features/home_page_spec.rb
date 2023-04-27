RSpec.feature "HomePages", type: :feature do
    scenario "The visitor should see books" do
      visit root_path
      expect(page).to have_text("Books")
    end
  end
  