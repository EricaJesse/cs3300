require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  let(:user) { FactoryBot.create(:user) } # Assuming you have a User factory
  let(:book) { FactoryBot.create(:book, user: user) } # Assuming you have a Book factory
  let(:character) { FactoryBot.create(:character, book: book) } # Assuming you have a Character factory

  before do
    # Sign in the user
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index, params: { book_id: book.id }
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new, params: { book_id: book.id }
      expect(response).to render_template(:new)
    end
  end

  # Add more tests for the create, show, edit, update, and destroy actions
end
