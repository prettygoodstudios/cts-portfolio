class Portfolio < ApplicationRecord
  includes Placeholder
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
  has_many :techonologies
  accepts_nested_attributes_for :techonologies, reject_if: lambda { |attrs| attrs['name'].blank?}
  validates_presence_of :title, :body
  
  def self.angular
    where(subtitle: 'Angular')
  end
  def self.by_position
    order("position ASC")
  end
  scope :ruby_on_rails, -> {where(subtitle: 'Ruby on Rails')}
end
