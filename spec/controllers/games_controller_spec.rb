require "rails_helper"

RSpec.describe GamesController, :type => :controller do

  before(:each) do
    request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = create(:user)
    sign_in @current_user
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all games of current user" do
      game1 = create(:game, user: @current_user)
      game2 = create(:game, user: @current_user)
      get :index

      expect(assigns(:games)).to match_array([game1, game2])
    end
  end
end
