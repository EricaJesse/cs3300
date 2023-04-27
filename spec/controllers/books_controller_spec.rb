require 'rails_helper'

# Change this BooksController to your project
RSpec.describe BooksController, type: :controller do

    login_user

    # This should return the minimal set of attributes required to create a valid
    # Book. As you add validations to Book, be sure to adjust the attributes here as well.
    let(:valid_attributes) {
        { :title => "Test title!", :description => "This is a test description", :rating => 5 }
    }

    let(:valid_session) { {} }

    describe "GET #index" do
        it "returns a success response" do
            Book.create! valid_attributes
            get :index, params: {}, session: valid_session
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
            # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end
end
