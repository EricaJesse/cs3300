require 'rails_helper'

# Change this BooksController to your project
RSpec.describe BooksController, type: :controller do
  let(:user) { create(:user) }

  # This should return the minimal set of attributes required to create a valid
  # Book. As you add validations to Book, be sure to adjust the attributes here as well.
  let!(:book) { Book.create(title: "Test title", author: "Test author", plot: "Test plot", rating: 5, date_completed: "2022-01-01", user: user) }

  let(:valid_session) { {} }

  describe "GET #index" do
    before do
      sign_in user
    end

    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful # be_successful expects a HTTP Status code of 200
      # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
    end
  end
end
