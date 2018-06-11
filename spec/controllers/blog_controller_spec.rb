require "rails_helper"

describe BlogController, type: :controller do
  render_views

  let(:post) { create :post, :published }

  before do
    create_list :post, 3, :published
    create_list :post, 2
    expect(Post.unscoped.count).to eql 5
  end

  describe "#index" do
    it "only displays published posts" do
      get :index
      assert_select "article.post", 3
      expect(response).to render_template(:index)
    end
  end

  describe "#show" do
    it "renders successfully" do
      get :show, params: { slug: post.slug }
      assert_select "article.related-posts a", 3
      expect(response).to render_template(:show)
    end
  end

end
