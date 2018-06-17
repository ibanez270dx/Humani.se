require "rails_helper"

describe Admin::PostsController, type: :controller do
  render_views

  let(:admin) { create :admin }
  let(:post) { create :post }

  before do
    create_list :post, 3
  end

  describe "index" do
    it "requires an admin to be logged in" do
      get :index
      expect(response).to redirect_to admin_login_path
    end

    it "shows a list of posts" do
      sign_in admin
      get :index
      expect(response).to render_template(:index)
      assert_select "tbody tr", 3
    end
  end

  describe "new" do
    it "returns a new post" do
      sign_in admin
      get :new
      expect(assigns(:post).new_record?).to be true
      expect(response).to render_template(:new)
    end
  end

  describe "create" do
    let(:params) { build(:post).attributes.reject{ |k, v| v.nil? } }

    it "creates an post" do
      sign_in admin
      expect {
        process :create, method: :post, params: { post: params }
        expect(response).to redirect_to admin_posts_path
      }.to change {
        Post.unscoped.count
      }.by(1)
    end
  end

  describe "edit" do
    it "loads a post" do
      sign_in admin
      get :edit, params: { id: post.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "update" do
    let(:params) { { body: Faker::Hipster.paragraphs(3).join("\n\n") } }

    before do
      sign_in admin
    end

    it "updates a post" do
      expect{
        process :update, method: :post, params: { id: post.id, post: params }
        expect(response).to redirect_to edit_admin_post_path(post.id)
      }.to change{ post.reload.body }
    end

    it "publishes a post" do
      expect{
        process :update, method: :post, params: { id: post.id, post: params.merge!("enabled": "1") }
        expect(response).to redirect_to edit_admin_post_path(post.id)
      }.to change{ post.reload.published_at? }
    end
  end

  describe "destroy" do
    it "destroys a post" do
      sign_in admin
      process :destroy, method: :delete, params: { id: post.id }
      expect(assigns(:post).persisted?).to be false
      expect(response).to redirect_to admin_posts_path
    end
  end
end
