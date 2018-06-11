require "rails_helper"

describe SiteController, type: :controller do
  render_views

  describe "#about" do
    it "renders successfully" do
      get :about
      expect(response).to render_template(:about)
    end
  end

  describe "#channel (for facebook)" do
    it "renders successfully" do
      get :channel
      expect(response).to have_http_status(:ok)
    end
  end

end
