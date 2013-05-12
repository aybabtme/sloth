class Page < ActiveRecord::Base
  attr_accessible :image, :name

  belongs_to :prototype
  has_many :links, dependent: :destroy

  has_attached_file :image, :styles => { :xlarge => "600x600>", :large => "400x400>", :medium => "300x300>", :small => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates :prototype, presence: true

end
