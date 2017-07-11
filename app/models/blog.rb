class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :body, :topic_id
  
  belongs_to :topic
  has_many :comments, dependent: :destroy
  
  def self.recent
    order("created_at DESC")
  end
  
  def set_sidebar_topics
    @side_bar_topics = Topic.with_blogs
  end
end
