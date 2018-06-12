require "rails_helper"

describe Admin::BaseController, type: :controller do
  render_views

  let(:password) { Faker::Internet.password }
  let(:admin) { create :admin, password: password }

  describe "#login" do
    it "can GET the login form" do
      get :login
      expect(response).to render_template(:login)
    end

    it "requires valid authentication" do
      post :login, params: { admin: { username: admin.username, password: "" } }
      expect(response).to render_template(:login)
    end

    it "can authenticate" do
      post :login, params: { admin: { username: admin.username, password: password } }
      expect(response).to redirect_to admin_root_path
    end
  end

end
