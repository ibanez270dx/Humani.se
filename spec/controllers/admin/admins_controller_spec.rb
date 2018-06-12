require "rails_helper"

describe Admin::AdminsController, type: :controller do
  render_views

  let(:admin) { create :admin }

  before do
    create_list :admin, 2
  end

  describe "index" do
    it "requires an admin to be logged in" do
      get :index
      expect(response).to redirect_to admin_login_path
    end

    it "shows a list of admins" do
      sign_in admin
      get :index
      expect(response).to render_template(:index)
      assert_select "tbody tr", 3
    end
  end

  describe "new" do
    it "returns a new admin" do
      sign_in admin
      get :new
      expect(assigns(:admin).new_record?).to be true
      expect(response).to render_template(:new)
    end
  end

  describe "create" do
    let(:params) { {
      name: (name = Faker::Name.name),
      username: Faker::Internet.user_name(name),
      password: (password = Faker::Internet.password),
      password_confirmation: password
    } }

    it "creates an admin" do
      sign_in admin
      expect {
        process :create, method: :post, params: { admin: params }
        expect(response).to redirect_to admin_admins_path
      }.to change {
        Admin.count
      }.by(1)
    end
  end

  describe "edit" do
    it "loads an admin" do
      sign_in admin
      get :edit, params: { id: admin.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "update" do
    let(:params) { {
      password: (password = Faker::Internet.password),
      password_confirmation: password
    } }

    it "updates an admin" do
      sign_in admin
      expect{
        process :update, method: :post, params: { id: admin.id, admin: params }
        expect(response).to redirect_to admin_admins_path
      }.to change{ admin.reload.password_digest }
    end
  end

  describe "destroy" do
    it "destroys an admin" do
      sign_in admin
      process :destroy, method: :delete, params: { id: admin.id }
      expect(assigns(:admin).persisted?).to be false
      expect(response).to redirect_to admin_admins_path
    end
  end
end
