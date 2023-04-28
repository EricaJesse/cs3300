# spec/controllers/books_functional_spec.rb
require "rails_helper"

RSpec.describe BooksController, :type => :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    let!(:book) { Book.create(title: "Test title", author: "Test author", plot: "Test plot", rating: 5, date_completed: "2022-01-01", user: user) }
    it "returns a success response" do
      get :show, params: { id: book.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:valid_attributes) do
        {
          title: "Test title",
          author: "Test author",
          plot: "Test plot",
          rating: 5,
          date_completed: "2022-01-01"
        }
      end

      it "creates a new book" do
        expect {
          post :create, params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post :create, params: { book: valid_attributes }
        expect(response).to redirect_to(Book.last)
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) do
        {
          title: "",
          author: "Test author",
          plot: "Test plot",
          rating: 5,
          date_completed: "2022-01-01"
        }
      end

      it "does not create a new book" do
        expect {
          post :create, params: { book: invalid_attributes }
        }.to_not change(Book, :count)
      end

      it "renders the 'new' template" do
        post :create, params: { book: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
end
