class Post < ActiveRecord::Base

  belongs_to :author, class_name: 'Admin'
  
  validates :title, presence: true
  validates :url_title, uniqueness: true
  validates :body, presence: true
  validates :abstract, presence: true

  before_save :update_url_title
  
  scope :enabled, where(enabled: true)
  
  # Publish post when it's enabled
  def enabled=(check)
    self.published_at ||= Time.now if check == "1"
    self[:enabled] = check
  end
  
  # Autogenerate and/or parameterize url title
  def update_url_title
    self.url_title = (url_title.blank? ? title : url_title).gsub('\'','').parameterize
  end
  
end
