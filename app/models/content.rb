class Content < ActiveRecord::Base
  
  acts_as_commentable
  
  
  has_many :contents
  belongs_to :user
  alias_method :author, :user
  def author_id; user_id; end
  
  belongs_to :creator, :class_name => "User"
  belongs_to :theme
  belongs_to :categories
  
  validates_presence_of :title
  validates_presence_of :creator_id

end
