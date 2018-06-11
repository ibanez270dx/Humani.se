class Post < ActiveRecord::Base
  default_scope { where(enabled: true).order(published_at: :desc) }

  belongs_to :author, class_name: "Admin"

  before_validation :update_slug

  validates :author, presence: true
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :body, presence: true
  validates :abstract, presence: true

  # Publish post when it's enabled
  def enabled=(check)
    self.published_at ||= Time.now if check == "1"
    self[:enabled] = check
  end

private

  # Autogenerate and/or parameterize slug
  def update_slug
    self[:slug] = (slug&.presence || title&.presence)&.parameterize
  end

end
